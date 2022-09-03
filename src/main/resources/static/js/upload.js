// 썸네일 선택 후 랜더링, 히든인풋 만드는 함수
function showThumbImg(fileName, fileOriginName) {
    // console.log('showThumbImg 함수 호출 : ', fileName);
    // console.log('showThumbImg 함수 호출 : ', fileOriginName);

    // 썸네일 랜더링
    const $thumbImg = $('.thumb-img');
    // console.log($thumbImg.length);
    // 등록된 썸네일이 없을 때
    if ($thumbImg.length <= 0) {
        $('#reg-1 .box-msg').addClass('hide');

        // 이미지 랜더링
        const $img = document.createElement('img');
        $img.classList.add('post-img');
        $img.classList.add('thumb-img');
        $img.setAttribute('src', '/loadFile?fileName=' + fileName);
        $img.setAttribute('alt', fileOriginName);
        $('#reg-1 .img-box').append($img);

        // 등록 때 썸네일 경로 보내는 히든인풋
        const $thumbFileName = document.createElement('input');
        $thumbFileName.classList.add('thumbFileName-hidden-input');
        $thumbFileName.setAttribute('type', 'hidden');
        $thumbFileName.setAttribute('name', 'thumbFileName');
        $thumbFileName.setAttribute('value', fileName);
        $('#reg-1 .img-box').append($thumbFileName);


    }
    // 등록된 썸네일이 있을 때
    else {
        // 이미지 주소 교체
        $thumbImg.attr('src', '/loadFile?fileName=' + fileName);
        $thumbImg.attr('alt', fileOriginName);

        // 등록 때 썸네일 경로 보내는 히든인풋 교체
        $('.thumbFileName-hidden-input').attr('value', fileName);
    }

    // 박스에 파일이름 띄우기
    $('#reg-1 .file-box-right').text(fileOriginName)
}


// 첨부파일 선택 후 랜더링, 히든인풋 만드는 함수
function showImgs(fileNames) {
    console.log('showImgs 함수 호출 : ', fileNames);
    // const $boxMsg = $('#reg-6 .file-box-right');
    // console.log($boxMsg.data(imgsNum));

    for (const fileName of fileNames) {

        // 부모 div (이미지, 삭제 버튼, 히든인풋)
        const $imgBox = document.createElement('div');
        $imgBox.classList.add('upload-img-box');

        // 화면에 보여줄 이미지
        const $img = document.createElement('img');
        $img.classList.add('upload-img');
        $img.setAttribute('src', '/loadFile?fileName=' + fileName);
        // let originFileName = fileName.substring(fileName.indexOf("_") + 1);
        // console.log(originFileName);
        // $img.setAttribute('alt', fileOriginName);

        // 삭제 버튼
        const $delBtn = document.createElement('span');
        $delBtn.classList.add('fas', 'fa-times-circle', 'upload-cancel-btn');

        // 등록 때 이미지 경로 보내줄 히든인풋
        const $imgFileName = document.createElement('input');
        $imgFileName.setAttribute('type', 'hidden');
        $imgFileName.setAttribute('name', 'fileNames');
        $imgFileName.setAttribute('value', fileName);


        // 어펜드
        $imgBox.append($img);
        $imgBox.append($delBtn);
        $imgBox.append($imgFileName);
        $('#reg-6 .uploaded-list').append($imgBox);
    }

    // 파일선택창 메시지 세팅
    setUploadCount();
}


// 파일 확장자가 이미지 확장자가 맞으면 true 리턴
function isImageFile(originFileName) {
    const pattern = /jpg$|gif$|png$|jfif$|jpeg$/i;
    return originFileName.match(pattern);
}

// 최하단 파일 선택창 메세지 세팅해주는 함수
function setUploadCount() {
    const upImgCnt = $('.upload-img').length;
    // console.log(upImgCnt);
    if (upImgCnt === 0) {
        $('.upload-msg').text("현재 첨부한 이미지가 없습니다.");
    } else {
        $('.upload-msg').text("첨부 이미지 " + upImgCnt + "개");
    };
}

// 첨부 이미지 삭제하는 함수
function delUploadImg(e) {
    console.log("삭제 이벤트 호출");
    $target = e.target;

    if (!$target.classList.contains('upload-cancel-btn')) {
        return;
    }
    // 타깃 부모 노드 삭제(랜더링 이미지, 히든인풋 포함)
    $target.parentElement.remove();
    // 파일 선택창 메세지 다시 세팅
    setUploadCount()
}