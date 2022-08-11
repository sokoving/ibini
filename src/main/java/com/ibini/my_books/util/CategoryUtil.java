package com.ibini.my_books.util;

import java.util.HashMap;
import java.util.Map;

public class CategoryUtil {

    private static final Map<Integer, String> CATEGORYUTILMAP;

    static {
        CATEGORYUTILMAP = new HashMap<>();
        CATEGORYUTILMAP.put(0, "미분류" );
        CATEGORYUTILMAP.put(1, "웹소설" );
        CATEGORYUTILMAP.put(2, "웹툰" );
        CATEGORYUTILMAP.put(3, "e-book" );
        CATEGORYUTILMAP.put(4, "도서" );
        CATEGORYUTILMAP.put(5, "만화책" );

    }
}
