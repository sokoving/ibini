package com.ibini.my_books.common.paging;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

@ToString
@Getter
@AllArgsConstructor
// 페이지 정보
public class Page {
    
    private int pageNum; // 페이지 번호
    private int amount;  // 한 페이지당 배치할 게시물 수

    public Page() {
        this.pageNum = 1;
        this.amount = 5;
    }

    public void setPageNum(int pageNum) {
        if (pageNum <= 0 || pageNum > Integer.MAX_VALUE) {
            this.pageNum = 1;
            return;
        }
        this.pageNum = pageNum;
    }

    public void setAmount(int amount) {
        if (amount < 2 || amount > 100) {
            this.amount = 2;
            return;
        }
        this.amount = amount;
    }

//    limit의 첫 번째 파라메터(가져오기 시작할 포스트 순서)
    public int getStart(){
        return (pageNum-1)*amount;
    }
}
