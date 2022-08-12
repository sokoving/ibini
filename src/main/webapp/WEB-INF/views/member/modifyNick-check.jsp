<%@ page contentType="text/html; charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title></title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
                crossorigin="anonymous">
            <!-- jquery -->
            <script src="/js/jquery-3.3.1.min.js"></script>

                <style>
                    .wrap {
                        margin: 200px auto;
                    }
                </style>
        </head>

        <body>


                <div class="container wrap">
                    <div class="row">
                        <div class="offset-md-2 col-md-4">
                            <div class="card" style="width:200%;">
                                <div class="card-header text-white" style="background: #343A40;">
                                    <h2><span style="color: gray;">MyBooks</span> 비밀번호를 수정하시려면 기존 비밀번호를 입력해주세요.</h2>
                                </div>
                                <div class="card-body">

                                    <form action="/member/modifyNick-check" name="nickModifyForm" method="post" id="nickModifyForm"
                                        style="margin-bottom: 0;">
                                        <table style="cellpadding: 0; cellspacing: 0; margin: 0 auto; width: 100%">

                                            <input type="hidden" name="account" value="${loginUser.account}">                             


                                            <tr>
                                                <td style="text-align: left">
                                                    <p><strong>수정하실 닉네임을 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span
                                                            id="nameChk"></span></p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><input type="text" size="17" maxlength="20" id="user_name"
                                                        name="userName" class="form-control tooltipstered" maxlength="20"
                                                        required="required" aria-required="true"
                                                        style="ime-mode: inactive; margin-bottom: 25px; height: 40px; border: 1px solid #d9d9de"
                                                        placeholder="한글로 최대 6자"></td>
                                            </tr>
                                          

                                             
                                            <tr>
                                                <td style="width: 100%; text-align: center; colspan: 2;"><input
                                                        type="submit" value="비밀번호 확인" class="btn form-control tooltipstered"
                                                        id="Nickmodify-btn"
                                                        style="background-color: #343A40; margin-top: 0; height: 40px; color: white; border: 0px solid #f78f24; opacity: 0.8">
                                                </td>
                                            </tr>                                            
                                           
                                            
                                        </table>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <script>

                    console.log('${loginUser.account}');
                   
                    const msg = '${msg}';
                    console.log(msg);
                    if (msg === 'discord') {
                        alert('현재 비밀번호가 일치하지 않습니다. 확인후 재입력해주세요.');
                    } 
                    
                    if(msg === 'modify-fail'){
                        alert('비밀번호 수정에 실패 했습니다.')
                    }   
                    
                    if(msg === 'nickModify-fail'){
                        alert('닉네임 변경에 실패하였습니다.')
                    }  

                </script>

                <script>
                    // 수정 닉네임 검증 - jquery
                $(document).ready(function () {
                    //입력값 정규 표현식
                    const getName = RegExp(/^[가-힣]+$/); // 한글로 써야 한다. 유니코드 시작과 끝 가 - 힣

                    const checkArr = [false];

                        //이름 입력값 검증.
                        $('#user_name').on('keyup', function () {
                        //이름값 공백 확인
                        if ($("#user_name").val() === "") {
                            $('#user_name').css('border-color', 'red');
                            $('#nameChk').html('<b class="c-red">[이름은 필수정보!]</b>');
                            checkArr[0] = false;
                        }
                        //이름값 유효성검사
                        else if (!getName.test($("#user_name").val())) {
                            $('#user_name').css('border-color', 'red');
                            $('#nameChk').html('<b class="c-red">[이름은 한글로 ~]</b>');
                            checkArr[0] = false;
                        } else {
                            $('#user_name').css('border-color', 'skyblue');
                            $('#nameChk').html('<b class="c-blue">[참 잘했어요]</b>');
                            checkArr[0] = true;
                        }

                    });

                    //회원가입 양식 서버로 전송하는 클릭 이벤트
                    const $regForm = $('#nickModifyForm');

                    $('#Nickmodify-btn').on('click', e => {
                        console.log('클릭이벤트 발생확인')
                        if (!checkArr.includes(false)) {
                            // console.log($regForm);
                            $regForm.submit();

                        } else {
                            alert('입력란을 다시 확인하세요!');
                        }
                    })



                 });
                </script>


        </body>