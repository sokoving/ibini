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
        postImg.setFileName("333kjkj_kjkjk_상어.jpg");
        postImg.setAccount("ibini");
        postImg.setPostNo(2L);
        postImg.setOriginalFileName("상어2.jpg");

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
    @Test
    @DisplayName("썸네일이 true인 postImg 객체 리스트를 조회한다")
    void findThumbsTest(){
        List<PostImg> thumbs = mapper.findThumbs();
        for (PostImg thumb : thumbs) {
            System.out.println(thumb);
        }
    }
    //
//    boolean (String fileName);
    @Test
    @DisplayName("fileName 으로 postImg DB에서 삭제")
    void removeByNameTest(){
        String fileName = "2222kjkj_kjkjk_상어.jpg";
        boolean flag = mapper.removeByName(fileName);
        assertTrue(flag);
    }

    @Test
    @DisplayName("post_no으로 postImg DB에서 삭제")
    void removeByPostNoTest(){
        Long postNo = 1L;
        boolean flag = mapper.removeByPostNo(postNo);
        assertTrue(flag);
    }
    @Test
    @DisplayName("postNo 값이 있고 thumbnail이 true인 PostImg를 DB에 저장")
    void addFileTest2(){
        PostImg pi = new PostImg();
        pi.setFileName("testtesttest");
        pi.setPostNo(32L);
        pi.setAccount("2208260002");
        pi.setOriginalFileName("test");
        pi.setThumbnail("true");

        mapper.addFile(pi);
    }
    @Test
    @DisplayName("postNo 값이 있고 thumbnail이 null인 PostImg를 DB에 저장")
    void addFileTest3(){
        PostImg pi = new PostImg();
        pi.setFileName("testtesttesttest");
        pi.setPostNo(32L);
        pi.setAccount("2208260002");
        pi.setOriginalFileName("testtest");

        mapper.addFile(pi);
    }

//    @Test
//    @DisplayName("썸네일이 있으면 수정하고 없으면 추가한다")
//    void mergeThumbTest(){
//        PostImg p = new PostImg();
//        p.setPostNo(35L);
//        p.setAccount("2208260002");
//        p.setFileName("mergeTest Name");
//        p.setOriginalFileName("originat_merge_test_name");
//
//        boolean flag = mapper.mergeThumb(p);
//        assertTrue(flag);
//
//    }
}