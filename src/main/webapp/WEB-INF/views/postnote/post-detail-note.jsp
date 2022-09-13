<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


    <!-- MARK/MEMO 영역 도입부 -->
    <div id="postnote">

        <!-- MARK / MEMO 탭 버튼 영역 -->
        <div class="title-wrapper flex">
            <div class="half selected" name="mark" onclick="btnTitle_onclick(this)">MARK</div>
            <div class="half" name="memo" onclick="btnTitle_onclick(this)">MEMO</div>
        </div>

        <!-- MARK / MEMO 데이터 입력 영역 -->
        <div class="submit-wrapper">
            <div name="mark">
                <div class="episode-no">
                    <label for="episode-no">회차
                        <!-- <input type="number" id="episode-no" name="episodeNo" min="1" max="9999999999" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"> -->
                        <input type="text" id="episode-no" name="episodeNo" maxlength="9" autocomplete="off" placeholder="회차를 입력하세요 " oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" />
                    </label>
                </div>
                <div class="text-area">
                    <textarea id="mark-content" class="w100" cols="20" rows="5" maxlength="300" placeholder="새로운 글을 입력하세요." onkeyup="textArea_onkeyup_down(this)" onkeydown="textArea_onkeyup_down(this)" spellcheck="false"></textarea>
                </div>
                <div class="submit-area">
                    <div class="info">
                        <span class="text-length">0/300</span>
                    </div>
                    <div class="button">
                        <button type="button" name="mark" onclick="btnAdd_onclick(this)">등록</button>
                    </div>
                </div>
            </div>
            <div class="hidden" name="memo">
                <div class="text-area">
                    <textarea id="memo-content" class="w100" cols="20" rows="5" maxlength="300" placeholder="새로운 글을 입력하세요." onkeyup="textArea_onkeyup_down(this)" onkeydown="textArea_onkeyup_down(this)" spellcheck="false"></textarea>
                </div>
                <div class="submit-area">
                    <div class="info">
                        <span class="text-length">0/300</span>
                    </div>
                    <div class="button">
                        <button type="button" name="memo" onclick="btnAdd_onclick(this)">등록</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- MARK/MEMO 아코디언 영역 -->
        <div class="accodian-wrapper">
            <div class="accodian-button"><span>MARK LIST</span></div>
            <div class="accodian-button hidden"><span>MEMO LIST</span></div>
        </div>
        <!-- MARK/MEMO 데이터 목록 영역 -->
        <a name="post-note"></a> <!-- 리모컨 영역 -->
        <div class="content-wrapper scroll-bar">
            <div name="mark">
                <!-- <div class="content-area">
                    <div class="flex-sb">
                        <div>
                            <i class="marking type1 noselect">121</i>
                            |
                            <span class="noselect">2022.08.15 13:22:34</span>
                        </div>
                        <div class="button-area">
                            <ion-icon name="create-outline" class="button" onclick="btnModify_onclick(this)"></ion-icon>
                            <ion-icon name="trash-outline" class="button" onclick="btnDelete_onclick(this)"></ion-icon>
                        </div>
                    </div>
                    <div class="content">
                        mark Content1
                    </div>
                </div> -->
            </div>
            <div class="hidden" name="memo">
                <!-- <div class="content-area">
                    <div class="flex-sb">
                        <div>
                            <span class="noselect memo-datetime">2022.08.15 13:22:34</span>
                        </div>
                        <div class="button-area">
                            <ion-icon name="create-outline" class="button" onclick="btnModify_onclick(this)"></ion-icon>
                            <ion-icon name="trash-outline" class="button" onclick="btnDelete_onclick(this)"></ion-icon>
                        </div>
                    </div>
                    <div class="content">
                        memo Content1
                    </div>
                </div> -->
            </div>
        </div>
    </div>