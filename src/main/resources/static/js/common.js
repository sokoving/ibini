// -------------- 전역변수, 함수 선언부 ----------- //
function jQueryTagTest(msg, node) {
    console.log(msg);
    console.log(node);
}



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


// ------------ 함수 실행부 ------------ //
// jQueryTest("post-reg.js");
