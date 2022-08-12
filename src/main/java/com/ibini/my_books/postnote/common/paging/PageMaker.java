package com.ibini.my_books.postnote.common.paging;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
public class PageMaker {

    private static final int PAGE_COUNT = 10;

    private int beginPage, endPage;

    private boolean prev,next;

    private Page page;

    private int totalCount;

    private int finalPage;

    public PageMaker(Page page, int totalCount) {
        this.page = page;
        this.totalCount = totalCount;
        makePageInfo();
    }

    // 페이지 정보 생성
    private void makePageInfo() {
        this.endPage = (int) (Math.ceil(page.getPageNum() / (double) PAGE_COUNT) * PAGE_COUNT);
        this.beginPage = endPage - PAGE_COUNT + 1;

        int realEnd = (int) Math.ceil((double)totalCount / page.getAmount());

        this.finalPage = realEnd;

        if (realEnd < endPage) {
            this.endPage = realEnd;
        }

        this.prev = beginPage > 1;
        this.next = endPage < realEnd;
    }
}
