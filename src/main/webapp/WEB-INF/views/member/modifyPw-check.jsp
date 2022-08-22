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






                <div>
                    <div>
                        <div>
                            <div>
                                <div>
                                    <h2><span>MyBooks</span> 비밀번호를 수정하시려면 기존 비밀번호를 입력해주세요.</h2>
                                </div>
                                <div>

                                    <form action="/member/modifyPw-check" name="pWmodifyForm" method="post" id="pWmodifyForm"
                                        >
                                        <table >

                                            <input type="hidden" name="account" id="originPw" value="${loginUser.account}" >
                                            
                                                    <td>
                                                    <p><strong>현재 비밀번호를 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span
                                                            id="pwCheck"></span></p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><input type="password" size="17" maxlength="20" id="signInPw"
                                                        name="originPassword" class="form-control tooltipstered"
                                                        maxlength="20" required="required" aria-required="true"
                                                        
                                                        placeholder="최소 8자"></td>
                                            </tr>

                                            <tr>
                                                <td style="text-align: left">
                                                    <p><strong>수정할 비밀번호를 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span
                                                            id="pwChk"></span></p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><input type="password" size="17" maxlength="20" id="password"
                                                        name="password" class="form-control tooltipstered" maxlength="20"
                                                        required="required" aria-required="true"
                                                        
                                                        placeholder="영문과 특수문자를 포함한 최소 8자"></td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left">
                                                    <p><strong>비밀번호를 재확인해주세요.</strong>&nbsp;&nbsp;&nbsp;<span
                                                            id="pwChk2"></span></p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><input type="password" size="17" maxlength="20" id="password_check"
                                                        name="pw_check" class="form-control tooltipstered" maxlength="20"
                                                        required="required" aria-required="true"
                                                        
                                                        placeholder="비밀번호가 일치해야합니다."></td>
                                            </tr>
    

                                             
                                            <tr>
                                                <td style="width: 100%; text-align: center; colspan: 2;"><input
                                                        type="submit" value="비밀번호 확인" class="btn form-control tooltipstered"
                                                        id="pWmodify-btn"
                                                        >
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


                    //비밀번호 폼 검증 - jquery
                $(document).ready(function () {
                    //입력값 검증 정규표현식
                    const getPwCheck = RegExp(
                        // 영문 숫자가 들어가야하고 특수기호를 하나라도 포함해야 하고 또는 시작을 특수문자로 해도 되고
                        // 영문과 숫자가 들어가야한다.
                        /([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
                    
                    // 입력값 검증 배열
                    const checkArr = [false,false];
                    
                    //패스워드 입력값 검증.
                    $('#password').on('keyup', function () {
                        //비밀번호 공백 확인
                        if ($("#password").val() === "") {
                            $('#password').css('border-color', 'red');
                            $('#pwChk').html('<b class="c-red">[패스워드는 필수정보!]</b>');
                            checkArr[0] = false;
                        }
                        //비밀번호 유효성검사
                        else if (!getPwCheck.test($("#password").val()) || $("#password").val().length < 8) {
                            $('#password').css('border-color', 'red');
                            $('#pwChk').html('<b class="c-red">[특수문자 포함 8자이상]</b>');
                            checkArr[0] = false;
                        } else {
                            $('#password').css('border-color', 'skyblue');
                            $('#pwChk').html('<b class="c-blue">[참 잘했어요]</b>');
                            checkArr[0] = true;
                        }

                    });

                    //패스워드 확인란 입력값 검증.
                    $('#password_check').on('keyup', function () {
                        //비밀번호 확인란 공백 확인
                        if ($("#password_check").val() === "") {
                            $('#password_check').css('border-color', 'red');
                            $('#pwChk2').html('<b class="c-red">[패스워드확인은 필수정보!]</b>');
                            checkArr[1] = false;
                        }
                        //비밀번호 확인란 유효성검사
                        else if ($("#password").val() !== $("#password_check").val()) {
                            $('#password_check').css('border-color', 'red');
                            $('#pwChk2').html('<b class="c-red">[위에랑 똑같이!!]</b>');
                            checkArr[1] = false;
                        } else {
                            $('#password_check').css('border-color', 'skyblue');
                            $('#pwChk2').html('<b class="c-blue">[참 잘했어요]</b>');
                            checkArr[1] = true;
                        }

                    });


                    //회원가입 양식 서버로 전송하는 클릭 이벤트
                    const $regForm = $('#pWmodifyForm');

                    $('#pWmodify-btn').on('click', e => {
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