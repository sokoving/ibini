package com.ibini.my_books.postImg.service;

import com.ibini.my_books.postImg.domain.PostImg;
import com.ibini.my_books.postImg.dto.ThumbImgDTO;
import com.ibini.my_books.postImg.repository.PostImgMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor
public class PostImgService {

    private final PostImgMapper repository;

    // DB에 이미지 경로 하나 저장
    public boolean saveService(PostImg postImg) {
        log.info("PostImgService saveService Call - {}", postImg);
        return repository.addFile(postImg);
    }

    // post 등록 시 썸네일과 첨부파일을 나눠서 각각 DB에 저장
    @Transactional
    public void postRegService(ThumbImgDTO thumbImgDTO) {
        log.info("PostImgService postRegService CALL - {}", thumbImgDTO);

        //        썸네일 저장
        if (thumbImgDTO.getThumbFileName() != null) {
            repository.addFile(thumbImgDTO.extractThumb());
        }
//        첨부파일 저장
        if (thumbImgDTO.getFileNames() != null) {
            List<PostImg> piList = thumbImgDTO.extractImg();
            System.out.println("IMG service piList = " + piList);
            for (PostImg pi : piList) {
                System.out.println("IMG service pi = " + pi);
                repository.addFile(pi);
            }
        }
    }

    // 게시글 수정 시 이미지 수정 처리
    @Transactional
    public void modifyService(ThumbImgDTO thumbImgDTO) {
        log.info("PostImgService modifyService call!! - {}", thumbImgDTO);

        // 이전 포스트 첨부 이미지 전부 삭제
        if(repository.findFileNames(thumbImgDTO.getPostNo()).size() != 0) {
            log.info("remove By PostNo Call");
            repository.removeByPostNo(thumbImgDTO.getPostNo());
        }
//            새로 이미지 등록 처리
        postRegService(thumbImgDTO);
    }

    // 게시물에 붙어있는 첨부파일경로명 전부 조회
    public List<String> getFiles(Long postNo) {
        return repository.findFileNames(postNo);
    }

    // 게시물 번호로 PostImg 객체 리스트 전부 조회
    public List<PostImg> getPostImgList(Long postNo) {
        return repository.findFiles(postNo);
    }

    // 썸네일 리스트 조회
    public List<PostImg> getThumbs() {
        return repository.findThumbs();
    }

    // fileName으로 postImg DB에서 삭제
    public boolean removeByName(String fileName) {
        return repository.removeByName(fileName);
    }

    // post_no으로 postImg DB에서 삭제
    public boolean removeByPostNo(Long postNo) {
        return repository.removeByPostNo(postNo);
    }

}
