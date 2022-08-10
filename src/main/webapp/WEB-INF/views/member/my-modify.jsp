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
                .container {
                    margin: 200px auto 200px;
                }

                .c-red {
                    color: red;
                }

                .c-blue {
                    color: blue;
                }

                div#nameChk {
                    width: 100px;
                    height: 20px;
                    background: gray;
                }

                #pwChk {
                    width: 100px;
                    height: 20px;
                    background: gray;
                }
            </style>
        </head>

        <body>


            <div class="container">
                <div class="row">
                    <div class="offset-md-2 col-md-4">
                        <div class="card" style="width:200%;">
                            <div class="card-header text-white" style="background: #343A40;">
                                <h2><span style="color: gray;">MyBooks</span>${loginUser.userName}님 반갑습니다.</h2>
                            </div>
                            <div class="card-body">



                                <table style="cellpadding: 0; cellspacing: 0; margin: 0 auto; width: 100%">

                                    <tr>
                                        <td style="text-align: left">
                                            <p><strong>아이디 : ${loginUser.account}</strong>&nbsp;&nbsp;&nbsp;
                                                <span id="idChk"></span>
                                            </p>
                                        </td>
                                    </tr>


                                    <tr>
                                        <td style="text-align: left">
                                            <p><strong>이름 : ${loginUser.userName}</strong>&nbsp;&nbsp;&nbsp;<span
                                                    id="nameChk"></span></p>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td style="text-align: left">
                                            <p><strong>email: ${loginUser.email}</strong>&nbsp;&nbsp;&nbsp;
                                            </p>
                                        </td>
                                    </tr>
                                    
                                    
                                        <tr>
                                            <td style="text-align: left">
                                                <p><strong>이메일을 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span
                                                        id="emailChk"></span></p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <!-- 이메일 수정 input -->
                                            <td><input type="email" name="email" id="user_email"
                                                    class="form-control tooltipstered" required="required"
                                                    aria-required="true"
                                                    style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
                                                    placeholder="ex) abc@mvc.com"></td>
                                        </tr>

                                        <tr>
                                            <td style="width: 100%; text-align: center; colspan: 2;">
                                                <input type="button" value="이메일 수정완료"
                                                    class="btn form-control tooltipstered" id="modify-email-btn"
                                                    style="background: gray; margin-top: 0; height: 40px; color: white; border: 0px solid #388E3C; opacity: 0.8">
                                            </td>
                                        </tr>
                                    


                                    <tr>
                                        <td style="text-align: left">
                                            <p><strong id=""> 비밀번호 변경하기
                                                </strong>&nbsp;&nbsp;&nbsp;
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left">
                                            <p><strong>비밀번호를 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="pwChk"></span>
                                            </p>
                                        </td>
                                    </tr>

                                    <!-- 비밀번호 수정 form -->
                                    <form action="/member/modify" name="pwModify" id="pwModifyForm" method="post"
                                        style="margin-bottom: 0;">
                                        <tr>
                                            <td><input type="password" size="17" maxlength="20" id="password"
                                                    name="password" class="form-control tooltipstered" maxlength="20"
                                                    required="required" aria-required="true"
                                                    style="ime-mode: inactive; margin-bottom: 25px; height: 40px; border: 1px solid #d9d9de"
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
                                                    style="ime-mode: inactive; margin-bottom: 25px; height: 40px; border: 1px solid #d9d9de"
                                                    placeholder="비밀번호가 일치해야합니다."></td>
                                        </tr>
                                        <tr>
                                            <td style="width: 100%; text-align: center; colspan: 2;">
                                                <input type="button" value="패스워드 수정완료"
                                                    class="btn form-control tooltipstered" id="modify-pw-btn"
                                                    style="background: gray; margin-top: 0; height: 40px; color: white; border: 0px solid #388E3C; opacity: 0.8">
                                            </td>
                                        </tr>



                                        <tr>
                                            <td style="padding-top: 10px; text-align: center">
                                                <p><strong>저희 서비스를 이용해주셔서 감사합니다.</strong></p>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td style="width: 100%; text-align: center; colspan: 2;">
                                                <input type="button" value="돌아가기" class="btn form-control tooltipstered"
                                                    id="back-btn"
                                                    style="background: gray; margin-top: 0; height: 40px; color: white; border: 0px solid #388E3C; opacity: 0.8">
                                            </td>
                                        </tr>
                                        </form>

                                </table>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

           

        </body>

        </html>