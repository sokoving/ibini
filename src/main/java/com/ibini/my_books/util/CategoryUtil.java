package com.ibini.my_books.util;

import java.util.HashMap;
import java.util.Map;

public class CategoryUtil {

    public static final Map<Integer, String> CATEGORY_MAP;

    static {
        CATEGORY_MAP = new HashMap<>();
        CATEGORY_MAP.put(0, "미분류" );
        CATEGORY_MAP.put(1, "웹소설" );
        CATEGORY_MAP.put(2, "웹툰" );
        CATEGORY_MAP.put(3, "e-book" );
        CATEGORY_MAP.put(4, "도서" );
        CATEGORY_MAP.put(5, "만화책" );

    }
}
