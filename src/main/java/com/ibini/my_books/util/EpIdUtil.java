package com.ibini.my_books.util;

import java.util.HashMap;
import java.util.Map;


public class EpIdUtil {

    // 키 : ep_id 값, 값 : 회차를 다르게 부를 이름
    // 0:회차, 1:페이지, 2:권
    public static final Map<Integer, String> EpIdMap;

    static {
        EpIdMap = new HashMap<>();
        EpIdMap.put(0, "회차");
        EpIdMap.put(1, "페이지");
        EpIdMap.put(2, "권");
    }

}
