package com.ibini.my_books.member.common.paging;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;
import org.springframework.data.relational.core.sql.In;

@ToString @Getter
@AllArgsConstructor
// 페이지 정보 클래스
public class Page {

    private int pageNum; // 페이지 번호
    private int amount;  // 한 페이지당 배치할 게시물 수

    public Page() {
        this.pageNum = 1;
        this.amount = 10;
    }

    public void setPageNum(int pageNum) {
        if (pageNum <= 0 || pageNum > Integer.MAX_VALUE) {
            this.pageNum = 1;
            return;
        }
        this.pageNum = pageNum;
    }

    public void setAmount(int amount) {
        if (amount < 10 || amount > 100) {
            this.amount = 10;
            return;
        }
        this.amount = amount;
    }
}