package com.ibini.my_books.postImg.dto;

import com.ibini.my_books.postImg.domain.PostImg;
import com.ibini.my_books.util.FileUtils;
import lombok.*;

import java.util.ArrayList;
import java.util.List;

@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ThumbImgDTO {

    private String thumbFileName;        // 이미지 풀경로
    private Long postNo;            // 이미지가 속한 포스트 번호
    private String account;         // 이미지 올린 계정명
    private String thumbOriginalFileName;    // 이미지 원래 이름

    private List<String> fileNames;   // 첨부파일들의 이름 목록


    //    ThumbImgDto 중 썸네일 PostImg를 추출하는 메서드
    public PostImg extractThumb() {
        PostImg pi = new PostImg();
        pi.setThumbnail("true");
        pi.setFileName(this.thumbFileName);
        pi.setPostNo(this.postNo);
        pi.setAccount(this.account);
        pi.setOriginalFileName(FileUtils.extractOriginFileName(thumbFileName));
        System.out.println("DTO extractThumb pi = " + pi);

        return pi;
    }


    public List<PostImg> extractImg() {
        List<PostImg> piList = new ArrayList<>();

        List<String> fnList = this.fileNames;
        for (String s : fnList) {
            PostImg pi = new PostImg();
            pi.setFileName(s);
            pi.setPostNo(this.postNo);
            pi.setAccount(this.account);
            pi.setOriginalFileName(FileUtils.extractOriginFileName(s));

            piList.add(pi);
            System.out.println("DTO extractImg pi = " + pi);
        }

        System.out.println("DTO piList = " + piList);
        return piList;
    }


}