package com.ibini.my_books.common.paging;

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
        System.out.println("make Page Info 호출");
        // 1. endPage 계산
        // 올림 처리 (현재 위치한 페이지번호 / 한 화면에 배치할 페이지 수) * 한 화면에 배치할 페이지 수
        this.endPage = (int) (Math.ceil(page.getPageNum() / (double) PAGE_COUNT) * PAGE_COUNT);

        // 2. beginPage 계산
        this.beginPage = endPage - PAGE_COUNT + 1;

        // 마지막 구간 끝페이지 보정 공식 :
        int realEnd = (int)Math.ceil((double) totalCount / page.getAmount());
        this.finalPage = realEnd;

        // 그러면 끝페이지 보정은 언제 일어나야 하는가
        // 마지막 페이지 구간에서 일어날 수도 있고, 아닐 수도 있다
        if (realEnd < endPage) {
            this.endPage = realEnd;
        }

        // 이전 버튼 활성화 여부
        this.prev = beginPage > 1;

        // 다음 버튼 활성화 여부
        this.next = endPage < realEnd;
    }
}
