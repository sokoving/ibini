package com.ibini.my_books.postImg.repository;

import com.ibini.my_books.postImg.domain.PostImg;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class PostImgMapperTest {

    @Autowired
    PostImgMapper mapper;

    @Test
    @DisplayName("파일추가")
    void addFile() {
        PostImg postImg = new PostImg();
        postImg.setFileName("1111kjkj_kjkjk_상어.jpg");
        postImg.setAccount("asdf");
        postImg.setPostNo(1L);
        postImg.setOriginalFileName("상어.jpg");

        mapper.addFile(postImg);
    }

    @Test
    @DisplayName("파일경로들을 조회한다.")
    void findFileNamesTest() {
        //given
        Long postNo = 1L;

        //when
        List<String> fileNames = mapper.findFileNames(postNo);

        //then
        for (String fileName : fileNames) {
            System.out.println(fileName);
        }
//        assertEquals(2, fileNames.size());
    }

    @Test
    @DisplayName("포스트 번호로 postImg 객체 리스트를 반환한다")
    void findFilesTest(){
        Long postNo = 1L;

        List<PostImg> fileList = mapper.findFiles(postNo);
        for (PostImg postImg : fileList) {
            System.out.println(postImg);
        }
    }

}