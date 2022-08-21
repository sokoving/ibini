package com.ibini.my_books.util;

import java.util.HashMap;
import java.util.Map;


public class EpIdUtil {

    // 키 : ep_id 값, 값 : 회차를 다르게 부를 이름
    // 0:회차, 1:페이지, 2:권
    public static final Map<Integer, String> EP_ID_MAP;
    public static final Map<String, String> EP_NAME_MAP;

    static {
        EP_ID_MAP = new HashMap<>();
        EP_ID_MAP.put(0, "회차");
        EP_ID_MAP.put(1, "페이지");
        EP_ID_MAP.put(2, "권수");

        EP_NAME_MAP = new HashMap<>();
        EP_NAME_MAP.put("회차", "회");
        EP_NAME_MAP.put("페이지", "p");
        EP_NAME_MAP.put("권수", "권");
    }

}
