<%@ page contentType="text/html; charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <%@ include file="../include/static-head.jsp" %>

        </head>

        <body>
        <div id="wrap">
           <%@ include file="../include/header.jsp" %>
            <section>
                <div>
                    <div>
                        <div>
                            <div>
                                <h2><span>MyBooks</span>${loginUser.userName}님 반갑습니다.</h2>
                            </div>
                            <div>


                                    <table>
                                        <tr>
                                            <td>
                                                <p><strong>아이디 : ${loginUser.account}</strong>&nbsp;&nbsp;&nbsp;
                                                    <span id="idChk"></span>
                                                </p>
                                            </td>
                                        </tr>
    

                                        <tr>
                                            <td>
                                                <p><strong>닉네임 : ${loginUser.userName}</strong>&nbsp;&nbsp;&nbsp;<span
                                                        id="nameChk"></span></p>
                                                        
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <p><strong>email: ${loginUser.email}</strong>&nbsp;&nbsp;&nbsp;<span
                                                        id="nameChk"></span></p>
                                            </td>
                                        </tr>


                                        <tr>
                                            <td>
                                                <p><strong id="join-date">가입일자 : ${loginUser.prettierDate} </strong>&nbsp;&nbsp;&nbsp;<span
                                                        id="pwChk"></span></p>
                                            </td>
                                        </tr>


                                        <tr>
                                            <td>
                                                <p><strong>저희 서비스를 이용해주셔서 감사합니다.</strong></p>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <input type="button" value="닉네임 수정"
                                                    id="nickmodify-btn"
                                                   >
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <input type="button" value="비밀번호 수정"
                                                    id="modify-btn"
                                                   >
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 100%; text-align: center; colspan: 2;">
                                                <input type="button" value="회원 탈퇴" 
                                                    id="joinOut-btn"
                                                    >
                                            </td>
                                        </tr>

                                    </table>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            </div>
            <script>
                const date = '${loginUser.prettierDate}';
                console.log(date);
                
                const $nickModifyBtn = document.getElementById('nickmodify-btn');
                console.log($nickModifyBtn);

                const $modifyBtn = document.getElementById('modify-btn');
                console.log($modifyBtn);

                const $joinOutBtn = document.getElementById('joinOut-btn');
                console.log($joinOutBtn);

                $nickModifyBtn.onclick = e => {
                    location.href = '/member/modifyNick-check';
                }

                $modifyBtn.onclick = e => {
                    location.href = '/member/modifyPw-check';
                }

                $joinOutBtn.onclick = e => {
                    location.href = '/member/join-out';
                }

                const msg = '${msg}';
                console.log(msg);
                if(msg==='modify-success'){
                    alert('비밀번호 변경 성공!');
                }

                if(msg === 'nickModify-success'){
                    alert('닉네임 수정 성공!')
                }
            </script>



           

           
        </body>

        </html>