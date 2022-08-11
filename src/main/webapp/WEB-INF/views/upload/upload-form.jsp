<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>

<!-- jquery -->
<script src="/js/jquery-3.3.1.min.js"></script>

<style>
    .img-sizing {
        display: block;
        width: 100px;
        height: 100px;
    }
    .fileAddress {
        width: 500px;
        height: 25px;
        margin: 5px;
    }
    .fileDrop {
            width: 200px;
            height: 200px;
            border: 1px dashed gray;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 1.5em;
        }
</style>

</head>
<body>

    <!-- 파일 업로드를 위한 form -->
    <!-- 첨부파일 / 드래그 영역 -->
    <div class = "fileDrop">
        <span>DROP HERE!!</span>
    </div>
    <!-- 폼이 제출하고 있는 형식 명시 : enctype="multipart/form-data" -->
    <form action="/upload" method="post" enctype="multipart/form-data">
        <input class="fileOpen" type="file" name="files" multiple>
        <button class="submit" type="submit">업로드</button>
    </form>

    <div class="uploadDiv"> 
        <input type="file" name="files" id="ajax-file" style="display:none;">
    </div>
    
    <!-- 업로드된 이미지의 썸네일을 보여주는 영역 -->
    <div class="uploaded-list">
            
    </div>

    <script>
    // 버블링걸어야됌 그리고 e.target으로 클릭한애 찾아야함
        const $uploadedList = $('.uploaded-list');
        const $imgSizing = $('img-sizing');

        // console.log($uploadedList); /parent는 제이쿼리문법
        // function을 써야만 this를 쓸수잇다 / childnode는 안정확함 children써야됌
        $uploadedList.on("click", function(e) {
            // console.log(e); //61
            // console.log(e.target); //62
            // console.log(e.target.children); //63
            // console.log(e.target.parentNode); // 64
            // console.log(e.target.parentNode.children[0]); // 65
            // console.log(e.target.parentNode.children.length); // 66
            // 칠드런을 반복문을 돌린다 children
            if (e.target.children.length===0) {
                for (let index = 0; index < e.target.parentNode.children.length; index++) {
                    e.target.parentNode.children[index].style.border = 'none';
                    // console.log('스타일제거');
                }
                // e.target.parentNode.childNodes.style.border = '1px transparent solid';
                e.target.style.border = '1px blue solid';            
                // console.log('클릭함');
            }
        })


        // start JQuery 
        $(document).ready(function () {

            function isImageFile(originFileName) {
                // 정규표현식 / $는 머머로 끝나는 / 저거 3개로끝나면 true
                const pattern = /jpg$|gif$|png$|jfif$|jpeg$/i;
                return originFileName.match(pattern);
            }

            // 파일의 확장자에 따른 렌더링 처리
            function checkExtType(fileName) {
                    
                // 원본 파일 명 추출
                let originFileName = fileName.substring(fileName.indexOf("_" + 1));

                // 확장자 추출후 이미지인지까지 확인
                if (isImageFile(originFileName)) { // 파일의 이미지라면 이미지를 바로보여줌
                    const $img = document.createElement('img');
                    $img.classList.add('img-sizing');
                    $img.setAttribute('src', '/loadFile?fileName=' + fileName); // 풀경로 컨트롤러
                    $img.setAttribute('alt', originFileName); // 풀경로에서 원본파일이름만뽑음
                    $('.uploaded-list').append($img);
                }
            }

            // 선택한 파일
            function showFileData(fileNames) {

                // 이미지인지? 이미지가 아닌지에 따라 구분하여 처리
                // 이미지면 썸네일을 렌더링
                for (let fileName of fileNames) {
                    checkExtType(fileName);
                }       
            }

            
            // Open 이벤트
            const $OpenBox = $('.fileOpen');

            // console.log($OpenBox);

            // Open 열기 이벤트
            $OpenBox.on("change", e => {
                // e.preventDefault(); // 기본기능방지

                // console.log($OpenBox); 

                const files = $OpenBox[0].files;
                // console.log(files);

                // 2. 읽은 파일 데이터를 input[type-file]태그에 저장 / 59줄
                const $fileInput = $('#ajax-file');
                $fileInput.prop('files', files); // input에 파일정보를 담는다 /form태그라생각

                // console.log($fileInput);

                // 3. 파일 데이터를 비동기 전송하기 위해서는 FormData객체가 필요
                const formData = new FormData();

                // 4. 전송할 파일들을 전부 FormData안에 포장
                for (let file of $fileInput[0].files) {
                    formData.append('files', file); //controller 76줄에 감
                }

                // 5. 비동기 요청 전송
                const reqInfo = {
                    method: 'POST',
                    body: formData
                    // headers: { / form-data는 기본값이라서 굳이안써도됌
                    //     'content-type': 'multipart/form-data'
                    // }
                }
                fetch('/ajax-upload', reqInfo) // UploadController 57줄
                    .then(res => {
                        // console.log(res.status); 200이 옴
                        return res.json();
                    })
                    .then(fileNames => { // 컨트롤러에서 파일보냄 res.json()가 fileNames
                        console.log(fileNames);

                        showFileData(fileNames);
                    });
            });

            // drag & drop 이벤트
            const $dropBox = $('.fileDrop');

            // drag 진입 이벤트
            $dropBox.on('dragover dragenter', e => {
                e.preventDefault(); // 기본기능방지
                $dropBox
                    .css('border-color', 'red')
                    .css('background', 'lightgray');
            });

            // drag 탈출 이벤트
            $dropBox.on('dragleave', e => {
                e.preventDefault();
                $dropBox
                    .css('border-color', 'gray')
                    .css('background', 'transparent');
            });

            // drop 이벤트
            $dropBox.on('drop', e => {
                e.preventDefault(); // 이게있어야 안에넣엇을때 탭이안넘어감
                // console.log('드롭 이벤트 작동!');

                // 드롭된 파일 정보를 서버로 전송

                // 1. 드롭된 파일 데이터 읽기
                console.log(e);

                const files = e.originalEvent.dataTransfer.files;
                console.log('drop file data: ', files);

                // 2. 읽은 파일 데이터를 input[type-file]태그에 저장 / 59줄
                const $fileInput = $('#ajax-file');
                $fileInput.prop('files', files); // input에 파일정보를 담는다 /form태그라생각

                // console.log($fileInput);

                // 3. 파일 데이터를 비동기 전송하기 위해서는 FormData객체가 필요
                const formData = new FormData();

                // 4. 전송할 파일들을 전부 FormData안에 포장
                for (let file of $fileInput[0].files) {
                    formData.append('files', file); //controller 76줄에 감
                }

                // 5. 비동기 요청 전송
                const reqInfo = {
                    method: 'POST',
                    body: formData
                    // headers: { / form-data는 기본값이라서 굳이안써도됌
                    //     'content-type': 'multipart/form-data'
                    // }
                }
                fetch('/ajax-upload', reqInfo)
                    .then(res => {
                        // console.log(res.status);
                        return res.json();
                    })
                    .then(fileNames => { // 컨트롤러에서 파일보냄 res.json()가 fileNames
                        console.log(fileNames);

                        showFileData(fileNames);
                    });
            });

        })

        // (function () {

            

        // })();

    </script>
</body>
</html>