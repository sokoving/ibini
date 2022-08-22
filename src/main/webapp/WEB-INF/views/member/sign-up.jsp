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
            </style>
        </head>

        <body>


            <div class="container">
                <div>
                    <div>
                        <div>
                            <div>
                                <h2><span>MyBooks</span> 회원 가입</h2>
                            </div>

                            <div>
                                <form action="/member/sign-up" name="signup" id="signUpForm" method="post">


                                    <table>
                                        <tr>
                                            <td>
                                                <p><strong>아이디를 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;
                                                    <span id="idChk"></span>
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><input type="text" name="account" id="user_id"
                                                    maxlength="14"
                                                    required="required" aria-required="true"                                                   
                                                    placeholder="숫자와 영어로 4-14자">
                                            </td>

                                        </tr>

                                        <tr>
                                            <td style="text-align: left">
                                                <p><strong>비밀번호를 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span
                                                        id="pwChk"></span></p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><input type="password" size="17" maxlength="20" id="password"
                                                    name="password" maxlength="20"
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
                                                    name="pw_check" maxlength="20"
                                                    required="required" aria-required="true"                                                    
                                                    placeholder="비밀번호가 일치해야합니다."></td>
                                        </tr>

                                        <tr>
                                            <td style="text-align: left">
                                                <p><strong>이름을 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span
                                                        id="nameChk"></span></p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><input type="text" name="userName" id="user_name"
                                                    maxlength="6" required="required"
                                                    aria-required="true"                                                   
                                                    placeholder="한글로 최대 6자"></td>
                                        </tr>


                                        <tr>
                                            <td style="text-align: left">
                                                <p><strong>이메일을 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span
                                                        id="emailChk"></span></p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><input type="email" name="email" id="user_email"
                                                    required="required"
                                                    aria-required="true"                                                    
                                                    placeholder="ex) abc@mvc.com"></td>
                                        </tr>


                                        <tr>
                                            <td style="padding-top: 10px; text-align: center">
                                                <p><strong>회원가입하셔서 더 많은 서비스를 사용하세요~~!</strong></p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 100%; text-align: center; colspan: 2;">
                                                <input type="button" value="회원가입" id="signup-btn">
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
                //회원가입 폼 검증 - jquery
                $(document).ready(function () {
                    //입력값 검증 정규표현식
                    const getIdCheck = RegExp(/^[a-zA-Z0-9]{4,14}$/); // ^ : ~로 시작하는 $ : 끝나는 {4~14} : 최소~최대
                    const getPwCheck = RegExp(
                        // 영문 숫자가 들어가야하고 특수기호를 하나라도 포함해야 하고 또는 시작을 특수문자로 해도 되고
                        // 영문과 숫자가 들어가야한다.
                        /([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
                    const getName = RegExp(/^[가-힣]+$/); // 한글로 써야 한다. 유니코드 시작과 끝 가 - 힣
                    const getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
                    // 영어로 시작하고 + 골뱅이 + 영문 + . + 영문

                    // 입력값 검증 배열
                    //1.아이디, 2.비번, 3.비번확인, 4.이름 , 5.이메일
                    const checkArr = [false, false, false, false, false];

                    //1. 아이디 검증
                    const $idInput = $('#user_id');
                    $idInput.on('keyup', e => {
                        // 아이디를 입력하지 않은 경우
                        if ($idInput.val().trim() === '') {
                            $idInput.css('border-color', 'red');
                            $('#idChk').html('<b class = "c-red">[아이디는 필수 정보 입니다.]</b>')
                            checkArr[0] = false;
                        }

                        // 아이디를 패턴에 맞지 않게 입력 하였을 경우
                        // test() 메서드는 정규표현식을 검증하여 입력값이 표현식과
                        // 일치하면 true, 일치하지 않으면 false를 리턴
                        else if (!getIdCheck.test($idInput.val())) {
                            $idInput.css('border-color', 'red');
                            $('#idChk').html('<b class = "c-red">[영문,숫자로 4~14자 사이로 작성하세요!]</b>')
                            checkArr[0] = false;
                        }

                        // 아이디 중복 확인 검증
                        else {

                            fetch('/member/check?type=account&value=' + $idInput.val())
                                .then(res => res.text())
                                .then(flag => {
                                    console.log('flag:', flag);

                                    if (flag === 'true') {
                                        $idInput.css('border-color', 'red');
                                        $('#idChk').html('<b class = "c-red">[중복된 아이디 입니다.]</b>')
                                        checkArr[0] = false;

                                    } // 정상적으로 입력한 경우
                                    else {
                                        $idInput.css('border-color', 'skyblue');
                                        $('#idChk').html('<b class = "c-blue">[허용 가능한 아이디 입니다.]</b>')
                                        checkArr[0] = true;
                                    }
                                });

                        }

                    }); //end id check event

                    //패스워드 입력값 검증.
                    $('#password').on('keyup', function () {
                        //비밀번호 공백 확인
                        if ($("#password").val() === "") {
                            $('#password').css('border-color', 'red');
                            $('#pwChk').html('<b class="c-red">[패스워드는 필수정보!]</b>');
                            checkArr[1] = false;
                        }
                        //비밀번호 유효성검사
                        else if (!getPwCheck.test($("#password").val()) || $("#password").val().length < 8) {
                            $('#password').css('border-color', 'red');
                            $('#pwChk').html('<b class="c-red">[특수문자 포함 8자이상]</b>');
                            checkArr[1] = false;
                        } else {
                            $('#password').css('border-color', 'skyblue');
                            $('#pwChk').html('<b class="c-blue">[참 잘했어요]</b>');
                            checkArr[1] = true;
                        }

                    });

                    //패스워드 확인란 입력값 검증.
                    $('#password_check').on('keyup', function () {
                        //비밀번호 확인란 공백 확인
                        if ($("#password_check").val() === "") {
                            $('#password_check').css('border-color', 'red');
                            $('#pwChk2').html('<b class="c-red">[패스워드확인은 필수정보!]</b>');
                            checkArr[2] = false;
                        }
                        //비밀번호 확인란 유효성검사
                        else if ($("#password").val() !== $("#password_check").val()) {
                            $('#password_check').css('border-color', 'red');
                            $('#pwChk2').html('<b class="c-red">[위에랑 똑같이!!]</b>');
                            checkArr[2] = false;
                        } else {
                            $('#password_check').css('border-color', 'skyblue');
                            $('#pwChk2').html('<b class="c-blue">[참 잘했어요]</b>');
                            checkArr[2] = true;
                        }

                    });

                    //이름 입력값 검증.
                    $('#user_name').on('keyup', function () {
                        //이름값 공백 확인
                        if ($("#user_name").val() === "") {
                            $('#user_name').css('border-color', 'red');
                            $('#nameChk').html('<b class="c-red">[이름은 필수정보!]</b>');
                            checkArr[3] = false;
                        }
                        //이름값 유효성검사
                        else if (!getName.test($("#user_name").val())) {
                            $('#user_name').css('border-color', 'red');
                            $('#nameChk').html('<b class="c-red">[이름은 한글로 ~]</b>');
                            checkArr[3] = false;
                        } else {
                            $('#user_name').css('border-color', 'skyblue');
                            $('#nameChk').html('<b class="c-blue">[참 잘했어요]</b>');
                            checkArr[3] = true;
                        }

                    });

                    //이메일 입력값 검증.
                    const $emailInput = $('#user_email');
                    $emailInput.on('keyup', function () {
                        //이메일값 공백 확인
                        if ($emailInput.val() == "") {
                            $emailInput.css('border-color', 'red');
                            $('#emailChk').html('<b class="c-red">[이메일은 필수정보에요!]</b>');
                            checkArr[4] = false;
                        }
                        //이메일값 유효성검사
                        else if (!getMail.test($emailInput.val())) {
                            $emailInput.css('border-color', 'red');
                            $('#emailChk').html('<b class="c-red">[이메일 형식 몰라?]</b>');
                            checkArr[4] = false;
                        } else {

                            //이메일 중복확인 비동기 통신
                            fetch('/member/check?type=email&value=' + $emailInput.val())
                                .then(res => res.text())
                                .then(flag => {
                                    //console.log(flag);
                                    if (flag === 'true') {
                                        $emailInput.css('border-color', 'red');
                                        $('#emailChk').html(
                                            '<b class="c-red">[이메일이 중복되었습니다!]</b>');
                                        checkArr[4] = false;
                                    } else {
                                        $emailInput.css('border-color', 'skyblue');
                                        $('#emailChk').html(
                                            '<b class="c-blue">[사용가능한 이메일입니다.]</b>'
                                        );
                                        checkArr[4] = true;
                                    }
                                });
                        }

                    });

                    //회원가입 양식 서버로 전송하는 클릭 이벤트
                    const $regForm = $('#signUpForm');

                    $('#signup-btn').on('click', e => {
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

        </html>