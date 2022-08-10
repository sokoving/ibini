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
                                    <h2><span style="color: gray;">MyBooks</span> 회원정보 수정을 위한 비밀번호 확인 절차</h2>
                                </div>
                                <div class="card-body">

                                    <form action="/member/modify-check" name="sign-in" method="post" id="signInForm"
                                        style="margin-bottom: 0;">
                                        <table style="cellpadding: 0; cellspacing: 0; margin: 0 auto; width: 100%">
                                            
                                                    <td style="text-align: left">
                                                    <p><strong>비밀번호를 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span
                                                            id="pwCheck"></span></p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><input type="password" size="17" maxlength="20" id="signInPw"
                                                        name="password" class="form-control tooltipstered"
                                                        maxlength="20" required="required" aria-required="true"
                                                        style="ime-mode: inactive; margin-bottom: 25px; height: 40px; border: 1px solid #d9d9de"
                                                        placeholder="최소 8자"></td>
                                            </tr>

                                             
                                            <tr>
                                                <td style="width: 100%; text-align: center; colspan: 2;"><input
                                                        type="submit" value="비밀번호 확인" class="btn form-control tooltipstered"
                                                        id="signIn-btn"
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

                    

                    const msg = '${msg}';
                    console.log(msg);
                    if (msg === 'discord') {
                        alert('비밀번호가 일치하지 않습니다. 확인후 재입력해주세요.');
                    }

                   
                </script>


        </body>