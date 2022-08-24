package com.ibini.my_books.postImg.controller;

import com.ibini.my_books.postImg.domain.PostImg;
import com.ibini.my_books.postImg.service.PostImgService;
import com.ibini.my_books.util.FileUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller // Model에 뷰를 넘겨줌
@Log4j2
@RequiredArgsConstructor // 의존성주입
@RequestMapping("post_img")
public class PostImgController {

    private final PostImgService postImgService;

    private static final String UPLOAD_PATH = "E:\\sl_test\\upload";

    // 이미지 업로드 화면 요청
    @GetMapping("/write")
    public String postWriteForm(){
        log.info("PostController /post/write  GET 요청!!");
        return "upload/upload-form";
    }

    // 이미지 업로드 등록 요청
    @PostMapping("/write")
    @ResponseBody // 비동기니까
    public String getFiles(
            @RequestParam("files") List<MultipartFile> fileList) {

        log.info("controller request /upload/form POST - {}", fileList);

        log.info("/upload POST - {}", fileList);
//리스트에담아서 서비스에보냄 서비스에서반복문돌려서 맵퍼에다집어넣는다
        for (MultipartFile file: fileList) {
        PostImg postImg = new PostImg();
            postImg.setPostNo(1L);
            postImg.setFileName(file.getOriginalFilename());
            log.info("file-name: {}", file.getName());
            log.info("file-origin-name: {}", file.getOriginalFilename());
            log.info("file-size: {}KB", (double) file.getSize() / 1024);
            log.info("file-type: {}", file.getContentType());
            System.out.println("=============================================");

            FileUtils.uploadFile(file, UPLOAD_PATH);
        }

//        return new ResponseEntity<>(files, HttpStatus.OK);
        return "redirect:/post_img/write";
    }

}
