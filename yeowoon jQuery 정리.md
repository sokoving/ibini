# 선택자
## 1. 선택자와 이벤트 통일하기
```
    const $btn = $('#hide');
    $btn.click(e => {
        $('.content').hide(); //.show
    })
```
## 2. 선택자에 해당되는 모든 요소를 배열로 잡아온다.
- 단수, 복수 상관없음
- for문을 돌리지 않아도 일괄 적용된다
- eq(index) : 요소의 인덱스를 반환하는 메서드 
```
 $('li').eq(1)
```
## 3. 노드 탐색
- $('css 선택자')
### 부모 노드
- .parent() : 부모 노드 탐색
- .parents() : 직속 부모 포함 모든 조상 탐색
- .parentsUntil('div') : 부모 탐색 범위 
### 자식 노드
- .children() : 자식노드 탐색
- .children('.li2') : 특정 자식노드 탐색
- .find('li') : 후손노드 탐색
### 형제 노드
- .siblings() : 모든 형제 탐색
- .siblings('p') : 특정 형제 탐색
- .next() :  다음 형제 하나 탐색
- .nextAll() : 다음 형제 모두 탐색
- .nextUntil('p') : 다음 형제 탐색 범위 제한
- .prev(), .prevAll() : 이전 형제 하나, 모두 탐색
### 필터링
- $('li').first() : li 중 첫 번째 탐색 : 
- $('ul').children().last() : ul의 자식 중 마지막 탐색
- $('li').eq(1) : li 중 index번째 탐색
- $('li').filter('.red') : 선택자에 해당하는 요소들
- $('li').not('.red') : 선택자에 해당하지 않는 요소들
### 속성 선택
- $("요소 선택[속성]") : li 중 title속성이 포함된 요소만 선택.
 + $("li[title]")
- $("요소 선택[속성=값]") : li 중 title 속성값이 '리스트'인 요소만 선택.
 + $("li[title='리스트']")
- $("요소 선택[속성^=텍스트]") : href 속성값이 'http://'로 시작하는 요소만 선택.
 + $("a[href^='http://']")
- $("요소 선택[속성$=텍스트]") : href 속성값이 '.com'으로 끝나는 요소만 선택.
 + $("a[href$='.com']")
- $("요소 선택[href*=텍스트]") : href 속성값  'on_sunday'를 포함하는 요소만 선택.
 + $("a[href*='on_sunday']")
- $("요소 선택:hidden") : li 중 숨겨져 있는 요소만 선택.
 + $("li:hidden")
- $("요소 선택:visible") : li 중 보이는 요소만 선택
 + $("li:visible")
 
- $(".text") : input 중 type 속성값이 "text"인 요소만 선택.
- $(".selected") : selected 속성이 적용된 요소만 선택.
- $(".checked") : checked 속성이 적용된 요소만 선택.

--------------------------------------------------------

# 요소 추가 / 제거 
## 추가 방법
- 방법 1 : 직접 입력
```
    $ul.append('<li>item6</li>') : 
```
- 방법 2 : js로 만든 항목을 추가
```
    const $newLi = document.createElement('li');
    $newLi.textContent = 'item7';
    $ul.append($newLi)
```
- 방법 3 : 여러 개 동시 추가
```
    const tag1 = '<li>random1</li>'
    const tag2 = '<li>random2</li>'
    const tag3 = '<li>random3</li>'

    $ul.append(tag1, tag2, tag3);
```
## 추가 메서드
- .append() : 맨 마지막 자식요소 추가
- .prepend() : 맨 처음에 자식요소 추가
- .after(), .before() :  이전, 다음 형제 위치에 추가

## 제거
- .empty() : 자식요소 전부 제거
- .remove() : 전부 제거
```
        // ul의 첫 번째 자식 제거
    $ul.children().first().remove();
        // li 중 마지막 제거
    $('li').last().remove();
        // li 중 class="item" 요소 전체 삭제
    // $('li.item').remove();
```

--------------------------------------------------------

# 클래스 추가 / 제거
- .addClass('red') : 클래스 추가
- .removeClass('big') : 클래스 제거
- .toggleClass('red') : 클래스 토글
- .hasClass('circle') : 클래스 존재 확인

--------------------------------------------------------

# 스타일 조작
## 1. 인라인 스타일
```
    $('h1').css({
        'font-style' : 'italic',
        'font-weight' : 'normal',
        'border' : '2px dashed orange'
    })

    $('h1').css('font-weight', 'normal')
    $('h1').css('border', '2px dashed orange')
```
## 2. css 속성값 얻기
- 인라인 스타일 조작에서 값을 안 쓰면 값 반환
```
    const fontStyle = $('h1').css('font-style');
    // fontStyle = 'italic';
```
## 3. 텍스트 수정
- text()
 + 인수로 값을 지정하면 텍스트 수정
 + 지정하지 않으면 텍스트 반환
 + $('p').text(fontStyle);

--------------------------------------------------------

# 이벤트
## 이벤트 부여
```
$('.btn').click(function(e) {
    $('.box').css('background', 'aqua');
    $('.box').text('콕!')
})
```
## $(this)
- 이벤트를 건 대상
- 화살표 함수에서 작동 안 함
```
$('.box').mouseenter(function(e){
    $(this).css('border', '2px dashed blue')
})
```
## addEventListener
```
$('.btn2').on('click', e => {
    alert('콕콕!!');
})
```
## 복수 이벤트 타입 부여
```
$('.box').on({
    click: function(e) {
        $(this).css('transform', 'rotate(45deg)')
    },
    dblclick: function(e) {
        $(this).hide();
    },
    mouseleave: function(e) {
        $(this).css('border-radius', '50%');
    },
});
```

## 이벤트 종류
### 1. 마우스 이벤트
- click, dblclick
- hover : mouseenter + mouseleave
- mousedown : 마우스를 눌렀다가 떼었을 때
- mouseenter : 마우스가 진입했을 때
   + 자식노드에서는 이벤트를 감지 못함
- mouseleave : 마우스가 노드에서 벗어났을 때
- mousemove : 노드 영역에서 마우스를 움직였을 때
- mouseout : 노드에서 마우스 포인터가 떠났을 때
- mouseover : 노드 영역에서 마우스를 올려놓았을 때
   + 내부노드까지 이벤트를 감지
- mouseup : 마우스 포인터를 노드에 올려놓고 클릭
- toggle : click 이벤트에 핸들러를 바인딩하고 클릭할 때마다 실행될 함수들을 차례대로 실행
### 2. 문서로딩 이벤트
- ready : 해당 페이지가 로딩되었을 때(처음 읽힐 때)
- unload : 해당 페이지를 빠져나갈 때
- error : 이벤트 대상 요소에서 오류가 발생했을 때
### 3. 폼 이벤트
- blur : 노드에서 포커스가 떠날 때
- change : 노드의 값이 변경될 때
- focus : 노드가 포커스를 획득했을 때
- select : 유저가 텍스트를 선택했을 때
- submit : 폼의 내용을 전송할 때
### 4. 키보드 이벤트
- keydown : 키보드를 눌렀을 때에 발생
- keypress :  키보드를 계속 누르고 있을 때에 발생
- keyup : 키보드를 눌렀다가 떼었을 때 발생
### 5. 웹 브라우저 이벤트
- resize : 웹브라우저 윈도우 사이즈의 변화가 있을 때
- scroll : 스크롤이 움직일 때에 발생

--------------------------------------------------------

# 속성 추가, 제거
- 속성값 얻기 : $('#account').attr('id')
- 속성값 변경 : $('#account').attr('id', 'email')
- 속성값 추가 : $('#account').attr('title', '이메일');
- 속성값 제거 : $('#account').removeAttr('title');

# 속성 활용
``` value 속성 얻어 p의 text에 입력
    $('#account').keyup(e => {
        $('p').text($('#account').val());
        /*
            html() > innerHTML
            text() > textContent, innerText
            val() > value
        */
    });
```

--------------------------------------------------------

# data 속성 제어
- 속성값 얻기 : $('#zero').data('air'); // data-air="23"
- 속성값 변경 : $('#zero').data('air', 24); // data-air="24"
--------------------------------------------------------

# 설치
https://jquery.com/
- 방법 1. googld cdn으로 다운받아 아래 링크 head에 넣기   + 인터넷이 연결되지 않으면 사용 안 됨)
```
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
```
- 방법 2. static/js에 파일 다운로드 하고 script 태그로 연결하기
```
<script src="/js/jquery-3.3.1.min.js"></script>
```


# 사용
1. js와 마찬가지로 script 태그 안에 작성
 선택자와 속성 부여는 같은 언어로 쓸 것
2. defer가 기본적으로 들어가 있기 때문에 쓰는 위치는 상관 
```
    <script>
        // 제이쿼리의 시작 : 
        $(document).ready(function(){
            $(() => {
                
            });
        });
    </script>
```




