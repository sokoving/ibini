package com.ibini.my_books.util;

import java.util.HashMap;
import java.util.Map;


public class PublishStatusUtil {

    // 키 : publish_status 값, 값 : 연재 상태
    //0:연재중 , 1: 휴재, 2: 완결
    public static final Map<Integer, String> publishStatusMap;

    static {
        publishStatusMap = new HashMap<>();
        publishStatusMap.put(0, "미분류");
        publishStatusMap.put(1, "연재");
        publishStatusMap.put(2, "휴재");
        publishStatusMap.put(3, "완결");
    }

}
