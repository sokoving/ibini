# 해야될 것
post-reg.jsp : 별점, 이미지 업로드, 썸네일 지정, 입력값 검증
post-list.jps : 

# /post/detail addAttribute 항목들
```
post-btn-wrap
<button class="post-btn post-modi-btn" title="수정하기"><i class="fas fa-pencil-alt"></i></button>
<button class="post-btn post-del-btn far fa-trash-alt" title="삭제하기"></button>
<button class="post-btn post-list-btn" title="목록으로"><i class="far fa-list-alt"></i></button>


-list
("pl", postService.finaAllPostWithNameService()); //  List<PostWithName>
-detail
("p", postService.fineOnePostWithName(postNo)); //  PostWithName

    // tbl_post
    private Long postNo;            //  포스트 번호   NUMBER(10)  NOT NULL,
    private String account;         // 유저아이디    VARCHAR2(50)  NOT NULL,
    private int genreId;           // 장르아이디    NUMBER(3) NULL,
    private int caId;             // 카테고리아이디   NUMBER(3)  DEFAULT 0,
    private int platformId;       // 연재플랫폼아이디   NUMBER(3)  DEFAULT 0,
    private String postTitle;     // 책제목    VARCHAR2(100) NOT NULL,
    private String postWriter;    // 작가    VARCHAR2(100) NOT NULL,
    private int publishStatus;    // 연재상태   NUMBER(1) DEFAULT 0,
    private String publishCycle;  // 연재주기   VARCHAR2(100) NULL,
    private int epId;             // 회차아이디   NUMBER(1) NULL,
    private int curEp;            // 현재 회차    NUMBER(5) DEFAULT 0,
    private int totalEp;           // 총회차   NUMBER(5) DEFAULT 0,
    private Date regDate;          // 등록일자(KST 표준시)  DATE  DEFAULT SYSDATE,
    private Date updateDate;       // 수정일자(KST 표준시)    DATE               DEFAULT SYSDATE ,
    private int starRate;          // 별점   NUMBER(1)          NULL,

    private String caName;      // 카테고리 이름
    private String publishStatusName;    // 연재상태명
    private String epName;      // 회차 구분명(ex. 페이지)
    private String epName2;   // 회차 구분명 (ex. p)

    FormattingDateDTO shortDate;    // 포매팅한 날짜 DTO (yyyy.MM.dd)
                                        //  등록일 - String postRegDate 수정일 - postUpdateDate;
    private String oneLineTag;      // 포스트의 해시태그 한 줄로(PostService에서 세팅할 것)

    //  prj_genre
    private String genreName;

    // prj_platform
    private String platformName;
    private String platformBgColor;
    private String platformFontColor;

    // prj_post_img
    private String thumbImg;        // 썸네일 이미지 경로(표지)


("tagList", hashTagService.findAllByPostNo(postNo)); // List<HashtagDomain>
private int tagNo;  // 태그 번호
private Long postNo;    // 태그가 속해 있는 포스트 번호
- private String tagName;     // 태그 내용
private String account;     // 태그를 저장한 계정 이름



("imgList", imgService.getPostImgList(postNo));  // List<PostImg>
private String fileName;        // 이미지 풀경로
private Long postNo;            // 이미지가 속한 포스트 번호
private String account;         // 이미지 올린 계정명
private String originalFileName;    // 이미지 원래 이름
private Date regDate;           // 파일 등록일
private String thumbnail;       // 썸네일 여부



("date", postService.convertDate(postService.findOnePostService(postNo)));
private String postRegDate;		// 변환된 날짜
private String postUpdateDate;	// 변환된 날짜
```


# ajax 메서드
```
   ajaxJsonParam('/com/getOrganizationManList.lims',{teamcode:teamcode}, function(data){
      $("#organizationcodeList").empty();
      var _html = "";
      $.each(data, function(i,v){
         _html += "<option data-value='"+v["value"]+"'>"+v["key"]+"</option>";
      })
      $("#organizationcodeList").append(_html);
   });

function ajaxJsonParam(url, param, successfunction, errorfunction, completefunction){
    $.ajax({
         url : url,
         method: "post",
         type: "json",
         async: false,
         contentType: "application/json; charset=utf-8",
         data : JSON.stringify(param),
         beforeSend : function(xmlHttpRequest){
             xmlHttpRequest.setRequestHeader("AJAX", "true"); // ajax 호출을  header에 기록
         },        
         success : function(data,status,request){
            if(successfunction != undefined && successfunction != null)
               successfunction(data);
         },
         error : function(request,status,error) {
            if(request.status == 401) {
               alert("다시 로그인하여야 합니다.");
               document.location.href="/logout.lims";
               return false;
            } else {
               if(request.responseText != undefined){
                  var errorlog = JSON.parse(request.responseText);
                  alert("에러가 발생하였습니다. (" + errorlog.error.excpLogSeqno + ")\n");
               }
            }
            if(errorfunction != undefined && errorfunction != null)
               errorfunction(request,status,error);
         },
         complete : function(request,status) {
            if(completefunction != undefined && completefunction != null){
               completefunction(request,status);
            }
         }
    });
 }
```