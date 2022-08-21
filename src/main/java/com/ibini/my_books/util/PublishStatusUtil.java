package com.ibini.my_books.util;

import java.util.HashMap;
import java.util.Map;


public class PublishStatusUtil {

    // 키 : publish_status 값, 값 : 연재 상태
    //0:연재중 , 1: 휴재, 2: 완결
    public static final Map<Integer, String> PUBLISH_STATUS_MAP;

    static {
        PUBLISH_STATUS_MAP = new HashMap<>();
        PUBLISH_STATUS_MAP.put(0, "미분류");
        PUBLISH_STATUS_MAP.put(1, "연재");
        PUBLISH_STATUS_MAP.put(2, "휴재");
        PUBLISH_STATUS_MAP.put(3, "완결");
    }

}
