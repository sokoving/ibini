package com.ibini.my_books.post.controller;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/api")
public class NationalSearchController {

    private String key = "4d558d393158f70a939dc6c9f6fd608fa97e902d5f35e1f2c937bd025387bdc5";

    @GetMapping("/findtitle")
    public String findData(String SearchTitle, Model model){
        // JSON 받기
        StringBuffer result = new StringBuffer();

        try {

            URL url
                    = new URL("https://www.nl.go.kr/seoji/SearchApi.do?cert_key=" + key
                    + "&result_style=json&page_no=1&page_size=10" +
                    "&title=%EC%A0%84%EC%A7%80%EC%A0%81%EB%8F%85%EC%9E%90%EC%8B%9C%EC%A0%90");


//            URL url = new URL("https://www.nl.go.kr/seoji/SearchApi.do?cert_key="
//                    + key + "&result_style=json&page_no=1&page_size=10&title=전지적독자시점");

            HttpURLConnection urlCon = (HttpURLConnection) url.openConnection();
            urlCon.setRequestMethod("GET");
            int responseCode = urlCon.getResponseCode();

            Map<String, List<String>> headerFields = urlCon.getHeaderFields();
            log.info("headerFields - {}", headerFields);
            BufferedReader rd;

            if (responseCode >= 200 && responseCode <= 300) {
                rd = new BufferedReader(new InputStreamReader(urlCon.getInputStream(), "UTF-8"));
            } else {
                rd = new BufferedReader(new InputStreamReader(urlCon.getErrorStream()));
            }
            log.info("rd -{}", rd.toString());

            String line;
            while ((line = rd.readLine()) != null) {
                result.append(line + "\n");
            }
//            log.info("result - {}", result);
            model.addAttribute("api", result);

            rd.close();
            urlCon.disconnect();

            
            // JSon 받은 걸로 특정 조건 DATA 가져오기
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result.toString());

            JsonObject object = element.getAsJsonObject();

            // json array - docs
            JsonArray docs = object.getAsJsonArray("docs");
            log.info("docs - {}", docs);


            // JSP로 넘겨줄 List
            ArrayList<Map<String, Object>> infoList = new ArrayList<>();
            Map<String, Object> infoMap = new HashMap<>();

            for (int i = 0; i < docs.size(); i++) {
                JsonObject obj = docs.get(i).getAsJsonObject();
                String title = obj.get("TITLE").getAsString();
                String author = obj.get("AUTHOR").getAsString();

                infoMap.put("title", title);
                log.info("title - {}", title);
                infoMap.put("author", author);
                log.info("author - {}", author);
                infoList.add(infoMap);
                log.info("i - {}", i);
                log.info("infoList - {}", infoList);
            }
            log.info("info - {}", infoList);

            model.addAttribute("info", infoList);
            // json 문자열을


        } catch (Exception e) {
            e.printStackTrace();
        }

        return "api/findtitle";

    }


}
