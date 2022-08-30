<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>apiTest</title>
    <style>

        #search {
            background: rgb(229, 173, 173);
        }

        #infoList{
            background: rgb(171, 217, 209);
            display: flex;
            flex-wrap: wrap;
            
        }
        #infoList #infoID{
            width: 100%;
            justify-content: space-evenly;
        }
        #infoList .title{
            width: 50%;
            margin: 30px;
        }
        #infoList .author{
            width: 50%;
        }



    </style>

    <%@ include file="../include/static-head.jsp" %>

</head>

<body>

    <div class="wrap">
        <h1>hi</h1>
        <div id="search">
            <input id="word" type="text" onkeyup="search(this);">
            <!-- keyup event -->
            <button type="button" id="searchBtn">검색</button>
        </div>
        <div class="api">
            <br>
            <div id="infoList">
                <c:forEach var="infoMap" items="${info}" >
                    <div id="infoID">
                        <span class="test">${infoMap.num}</span>
                        <span class="title">${infoMap.title}</span>
                        <span class="author">${infoMap.author}</span>
                    </div>
                    
                </c:forEach>
                <ul id="List"></ul>
            </div>
        </div>

        <div id="moreInfo">
            <button type="button" id="moreBtn" onclick ="location.href ='#'">더보기</button>
        </div>

        <script>

        function search(target){

            var word = target.value;
            var encodeWord = encodeURI(word);
            // console.log(word);
            // console.log(encodeWord);
            $(function (){
                //start Ajax
                $.ajax({
                    type : 'GET',
                    dataType : 'json',
                    url : "https://www.nl.go.kr/seoji/SearchApi.do?" +
                        "cert_key=4d558d393158f70a939dc6c9f6fd608fa97e902d5f35e1f2c937bd025387bdc5" +
                        "&result_style=json&page_no=1&page_size=10" + 
                        "&title="+word,
                error : function(err) {
                    console.log("실행중 오류가 발생하였습니다.");
                },
                success : function(data) {
                        // json data String으로 바꿔주기
                        // var arr = JSON.parse(data);
                        // console.log("arr : ", data);
                        console.log("docs : ", data.docs);
                        

                        // list 배열에서 꺼내주기?
                        // let docs = Object.entries(arr);
                        // console.log("docs : " + docs);

                        

                        // 1. list에서 1번에 있는 doc 잡기
                        // 2. doc에서 제목, 작가, 출판사? 잡아오기
                        // 3. 랜더링 해주기
                        // 4. 선택한 값을 POST에 넘기기기
                        // 4-1. post 슬라이드 형태로 구현하기

                        // console.log("결과 갯수 : "+data.dataSearch.content.length);
                        // console.log("첫번째 결과 : "+data.dataSearch.content[0]);
                        $("#List").empty();
                        var checkWord = $("#word").val(); //검색어 입력값
                        // console.log(data.dataSearch.content.length);
                        // if(checkWord.length > 0 && data.dataSearch.content.length > 0){
                            
                        //     for (i = 0; i < data.dataSearch.content.length; i++) {

                        //         $("#List")
                        //             .append(
                        //                     "<li class='schoolList' value='"
                        //                         + data.dataSearch.content[i].schoolName
                        //                         + "' data-input='"
                        //                         + data.dataSearch.content[i].schoolName
                        //                         + ">"
                        //                         + "<a href='javascript:void(0);'>"
                        //                         + data.dataSearch.content[i].schoolName
                        //                         + "</a>"
                        //                         + "</li>");

                        //     }

                    }
                    
                                        
                })
            });//end Ajax
        };// end jquery

    




        </script>

    </div>



</body>

</html>