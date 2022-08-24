package com.ibini.my_books.post.dto;

import com.ibini.my_books.util.CommonUtil;
import lombok.*;

import java.util.Date;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class FormattingDateDTO {
    private String postRegDate;
    private String postUpdateDate;

    public void setDateDTO(Date regDate, Date updateDate){
        this.postRegDate = CommonUtil.changeDate(regDate);
        this.postUpdateDate = CommonUtil.changeDate(updateDate);
    }
}
