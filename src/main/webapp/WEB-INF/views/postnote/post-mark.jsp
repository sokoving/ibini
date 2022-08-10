<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>

    <!-- fontawesome css: https://fontawesome.com -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">

    <!-- reset css -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">

    <!-- linear icons -->
    <!-- https://linearicons.com/free#cdn -->
    <link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">

    <!-- bootstrap css -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- bootstrap js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" defer></script>

    <!-- Bootstrap icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" />


    <style>
        body {
            width: 80%;
            margin: 10vh auto;
        }

        .form-control:focus {
            border-color: rgb(4, 97, 50);
            box-shadow: 0px 1px 1px rgba(4, 97, 50, 0.075) inset, 0px 0px 8px rgba(4, 97, 50, 0.5);
        }


        .list-group-item:focus {
            border-color: rgb(4, 97, 50) !important;
            background: rgb(4, 97, 50) !important;
        }

        .list-group-item.active {
            border-color: rgb(4, 97, 50) !important;
            background: rgb(4, 97, 50) !important;
        }
    </style>

</head>

<body>



    <div class="row">
        <div class="text-center">
            <div class="list-group list-group-horizontal" id="list-tab" role="tablist">
                <a class="list-group-item list-group-item-action active" id="list-home-list" data-bs-toggle="list"
                    href="#list-home" role="tab" aria-controls="list-home">
                    <i class="bi bi-bookmark-plus-fill" style="margin-right: 5px;"></i>MARK
                </a>
                <a class="list-group-item list-group-item-action" id="list-profile-list" data-bs-toggle="list"
                    href="#list-profile" role="tab" aria-controls="list-profile">MEMO</a>

            </div>
            <div class="">
                <div class="tab-content" id="nav-tabContent">
                    <div class="tab-pane fade show active m-3" id="list-home" role="tabpanel"
                        aria-labelledby="list-home-list">
                        <div class="d-flex justify-content-end">
                            <button type="button" id="markBtn" class="btn btn-dark btn-lg mb-3">등록</button>
                        </div>
                        <!-- <button type="button" id="markBtn" class="btn btn-dark mb-3">등록</button> -->
                        <textarea id="" class="form-control" rows="5" placeholder="새로운 글을 입력해 주세요."></textarea>
                    </div>
                    <div class="tab-pane fade m-3" id="list-profile" role="tabpanel"
                        aria-labelledby="list-profile-list">
                        <textarea id="memoText" class="form-control" rows="5" placeholder="새로운 글을 입력해 주세요."></textarea>
                        <button type="button" id="memoBtn" class="btn btn-dark mt-3">등록</button>
                    </div>
                </div>
            </div>
        </div>


    <script>
        
    // 메모 요청 URL
    const URL = '/post/detail/memo';

    
    // // 메모 등록 이벤트 핸들러 등록 함수
    // function createMemoClickEvent() {
        
    //     document.getElementById('memoBtn').onclick = createMemo;
    // }

    // // 메모 등록 처리 핸들러 함수
    // function createMemo(e) {

    //     const $memoText = document.getElementById('memoText');

    //     fetch(URL, {
    //             method: "POST",
    //             headers: {
    //                 "Content-Type": "application/json"
    //             },
    //             body: JSON.stringify({
    //                 "postNo": 3,
    //                 "content": $memoText.textContent
    //             })
    //         }) 
    //         .then(response => response.text())
    //         .then(message => {
    //             if (message === 'insert-success') {
    //                 alert('메모 등록 성공');
    //                 $memoText.textContent = '';
    //             } else {
    //                 alert('메모 등록 실패');
    //             }
    //         })

    // }

    // // 메인 실행
    // (function() {

    //     createMemoClickEvent();
      
    // })();
            

    document.getElementById('memoBtn').onclick = e => {

        const $memoText = document.getElementById('memoText');

        fetch(URL, {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify({
                    "postNo": 3,
                    "content": $memoText.value
                })
            }) 
            .then(response => response.text())
            .then(message => {
                if (message === 'insert-success') {
                    alert('메모 등록 성공');
                    $memoText.value = '';
                } else {
                    alert('메모 등록 실패');
                }
            })
            .catch((error) => console.log("error:", error));
    }
            

    </script>
</body>

</html>