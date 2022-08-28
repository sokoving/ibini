package com.ibini.my_books.postImg.dto;

import com.ibini.my_books.postImg.domain.PostImg;
import lombok.*;

import java.util.Date;

@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ThumbImgDTO  {

    private String thumbFileName;        // 이미지 풀경로
    private Long postNo;            // 이미지가 속한 포스트 번호
    private String account;         // 이미지 올린 계정명
    private String thumbOriginalFileName;    // 이미지 원래 이름


//    ThumbImgDto를 PostImg로 변환하는 메서드
    public PostImg convertToPostImg(){
        PostImg pi = new PostImg();
        pi.setThumbnail("true");
        pi.setFileName(this.thumbFileName);
        pi.setPostNo(this.postNo);
        pi.setAccount(this.account);
        pi.setOriginalFileName(this.thumbOriginalFileName);

        return pi;
    }
}