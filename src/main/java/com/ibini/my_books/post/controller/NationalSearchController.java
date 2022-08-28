package com.ibini.my_books.post.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.net.HttpURLConnection;
import java.net.URL;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/api")
public class NationalSearchController {

    private String key = "4d558d393158f70a939dc6c9f6fd608fa97e902d5f35e1f2c937bd025387bdc5";

    @GetMapping("/findtitle")
    public String findData(Model model){

        StringBuffer result = new StringBuffer();

        try {
            URL url = new URL("https://www.nl.go.kr/seoji/SearchApi.do?cert_key="
                    + key + "&result_style=json&page_no=1&page_size=10&title=전지적독자시점");

            HttpURLConnection urlCon = (HttpURLConnection) url.openConnection();
            urlCon.setRequestMethod("GET");
            int responseCode = urlCon.getResponseCode();
            model.addAttribute("api", responseCode);
//            BufferedReader rd;
//
//            if (urlCon.getResponseCode() >= 200 && urlCon.getResponseCode() <= 300) {
//                rd = new BufferedReader(new InputStreamReader(urlCon.getInputStream(), "UTF-8"));
//            } else {
//                rd = new BufferedReader(new InputStreamReader(urlCon.getErrorStream()));
//            }
//            String line;
//            while ((line = rd.readLine()) != null) {
//                result.append(line + "\n");
//            }
//            model.addAttribute("api", result);
//            rd.close();
//            urlCon.disconnect();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "api/findtitle";

    }


}
