package com.ibini.my_books.postnote.dto;

import com.ibini.my_books.postnote.domain.PostMark;
import com.ibini.my_books.postnote.service.PostMarkService;
import com.ibini.my_books.postnote.service.PostMemoService;

import java.util.Arrays;
import java.util.List;

public class Practice {

//    위 2개 객체와
//    이전 메시지의 PostMarkVO 객체
//
//    그리고 for문 2번을 사용하여
//    console 창에 아래와 같은 로그가 찍히도록 구현해보자.
//    a
//        11
//        22
//        33
//    b
//       11
//       22
//       33
//    c
//       11
//       22
//       33


    public static void main(String[] args) {


        PostMarkVo postMarkVo = new PostMarkVo();
        MyPageMark myPageMark = new MyPageMark();

        List<String> postNoList = Arrays.asList("a", "b", "c");
        List<String> markNoList = Arrays.asList("11", "22", "33");
//        List<PostMark> markList = postMarkService.findAll2()


        List<String> List = new java.util.ArrayList<>(java.util.List.of());

        for (String p : postNoList) {
            List.add(p);
//            System.out.println(p);
            List.add(String.valueOf(markNoList));
        }
        System.out.println(List);

    }
}
