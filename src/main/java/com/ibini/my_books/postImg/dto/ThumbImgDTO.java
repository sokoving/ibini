package com.ibini.my_books.postImg.dto;

import com.ibini.my_books.postImg.domain.PostImg;
import lombok.*;

@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ThumbImgDTO  {

    private String thumbFileName;        // 이미지 풀경로
    private String[] fileNames;         //   첨부파일 풀경로 배열
    private Long postNo;            // 이미지가 속한 포스트 번호
    private String account;         // 이미지 올린 계정명
    private String thumbOriginalFileName;    // 이미지 원래 이름
    


//    ThumbImgDto 중 썸네일 PostImg를 추출하는 메서드
    public PostImg extractThumb(){
        PostImg pi = new PostImg();
        pi.setThumbnail("true");
        pi.setFileName(this.thumbFileName);
        pi.setPostNo(this.postNo);
        pi.setAccount(this.account);
        pi.setOriginalFileName(this.thumbOriginalFileName);

        return pi;
    }

//
//    public PostImg[] extractImg(){
//
//    }

//    public String extractOriginatFileName(){
//
//    }
}