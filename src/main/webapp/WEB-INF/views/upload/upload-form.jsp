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
</style>

</head>
<body>

    <!-- 파일 업로드를 위한 form -->
    <!-- 폼이 제출하고 있는 형식 명시 : enctype="multipart/form-data" -->
    <form action="/upload" method="post" enctype="multipart/form-data">
        <input class="fileOpen" type="file" name="files" multiple>
        
        <!-- <div class="mb-3">
            <input name="img" class="fileAddress" name="files"
                placeholder="이미지 링크 주소">
        </div> -->

        <button class="submit" type="submit">업로드</button>
        
    </form>

    <div class="uploadDiv"> 
        <input type="file" name="files" id="ajax-file" style="display:none;">
    </div>
    
    <!-- 업로드된 이미지의 썸네일을 보여주는 영역 -->
    <div class="uploaded-list">
            
    </div>

    <script>

        const $imgSizing = $('.img-sizing');

        console.log($imgSizing);

        $imgSizing.on("click", e => {
            
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

            // // fileAddress 이벤트
            // const $fileAddress = $('.fileAddress');

            // console.log($fileAddress);
            
            // Open 이벤트
            const $OpenBox = $('.fileOpen');

            console.log($OpenBox);

            // Open 열기 이벤트
            $OpenBox.on("change", e => {
                // e.preventDefault(); // 기본기능방지

                console.log($OpenBox); //

                const files = $OpenBox[0].files;
                console.log(files);

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
                        console.log(res.status);
                        return res.json();
                    })
                    .then(fileNames => { // 컨트롤러에서 파일보냄 res.json()가 fileNames
                        console.log(fileNames);

                        showFileData(fileNames);
                    });
            });

        })

        </script>
</body>
</html>