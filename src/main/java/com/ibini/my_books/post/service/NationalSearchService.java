package com.ibini.my_books.post.service;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Log4j2
public class NationalSearchService {

    private static String KEY = "4d558d393158f70a939dc6c9f6fd608fa97e902d5f35e1f2c937bd025387bdc5";

    public ArrayList<Map<String, Object>> findFirstPage(String searchTitle) {
        // JSON 받기
        StringBuffer result = new StringBuffer();
        log.info("NationalSearchService searchTitle - {}", searchTitle);

        // JSP로 넘겨줄 List
        ArrayList<Map<String, Object>> infoList = new ArrayList<>();

        try{
            URL url = new URL("https://www.nl.go.kr/seoji/SearchApi.do?cert_key=" + KEY
                    + "&result_style=json&page_no=1&page_size=30" +
                    "&title=" + searchTitle);
            log.info("url -{}", url);

            HttpURLConnection urlCon = (HttpURLConnection) url.openConnection();
            urlCon.setRequestMethod("GET");
            int responseCode = urlCon.getResponseCode();

            Map<String, List<String>> headerFields = urlCon.getHeaderFields();
//            log.info("headerFields - {}", headerFields);
            BufferedReader rd;

            if (responseCode >= 200 && responseCode <= 300) {
                rd = new BufferedReader(new InputStreamReader(urlCon.getInputStream(), "UTF-8"));
            } else {
                rd = new BufferedReader(new InputStreamReader(urlCon.getErrorStream()));
            }


            String line;
            while ((line = rd.readLine()) != null) {
                result.append(line + "\n");
            }
//            log.info("result - {}", result.toString());

            rd.close();
            urlCon.disconnect();
//            return result;

            // JSon 받은 걸로 특정 조건 DATA 가져오기
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result.toString());

            JsonObject object = element.getAsJsonObject();

            // json array - docs
            JsonArray docs = object.getAsJsonArray("docs");
//            log.info("docs - {}", docs);



            // map 여러개 생성해서 infoList에 넘겨주기
            Map<String, Object> infoMap = null;

            for (int i = 0; i < docs.size(); i++) {
                log.info("i - {}", i);
                // 반복문이 돌때마다 map정보 추가해주기
                infoMap = new HashMap<>();

                JsonObject obj = docs.get(i).getAsJsonObject();
                String title = obj.get("TITLE").getAsString();
                String author = obj.get("AUTHOR").getAsString();
                infoMap.put("num", i);
                infoMap.put("title", title);
//                log.info("title - {}", title);
                infoMap.put("author", author);
//                log.info("author - {}", author);
                infoList.add(infoMap);
//                log.info("map - {}", infoMap);
//                log.info("info - {}", infoList);
            }
            log.info("infoList - {}", infoList);

            return infoList;


        } catch (Exception e) {
            e.printStackTrace();
        }
        return infoList;
    }
}
