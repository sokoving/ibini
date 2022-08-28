// 파일 선택 후 썸네일 랜더링, 히든인풋 만드는 함수
function showThumbImg(fileName, fileOriginName) {
    console.log('showThumbImg 함수 호출 : ', fileName);
    console.log('showThumbImg 함수 호출 : ', fileOriginName);

    // 썸네일 랜더링
    $('#reg-1 .box-msg').addClass('hide')
    console.log($('#reg-1 .box-msg'));

    const $img = document.createElement('img');
    $img.classList.add('post-img');
    $img.setAttribute('src', '/loadFile?fileName=' + fileName);
    $img.setAttribute('alt', fileOriginName);
    $('#reg-1 .img-box').append($img);

    $('#reg-1 .file-box-right').text(fileOriginName)

    // 등록 때 다 같이 날릴 것
    const $thumbFileName = document.createElement('input');
    $thumbFileName.setAttribute('type', 'hidden');
    $thumbFileName.setAttribute('name', 'thumbFileName');
    $thumbFileName.setAttribute('value', fileName);
    $('#write-form').append($thumbFileName);

    const $thumbOriginFileName = document.createElement('input');
    $thumbOriginFileName.setAttribute('type', 'hidden');
    $thumbOriginFileName.setAttribute('name', 'thumbOriginalFileName');
    $thumbOriginFileName.setAttribute('value', fileOriginName);
    $('#write-form').append($thumbOriginFileName);
}


// 드롭한 파일을 화면에 보여주는 함수
function showFileData(fileNames,z) {
    // 이미지인지? 이미지가 아닌지에 따라 구분하여 처리
    // 이미지면 썸네일을 렌더링하고 아니면 경고메세지를 보낸다
    for (let fileName of fileNames) {
        checkExtType(fileName);
    }
    console.log("showfileData 함수 호출");
    console.log(fileNames);
}


// 파일의 확장자에 따른 렌더링 처리
function checkExtType(fileName) {

        const $img = document.createElement('img');
        $img.classList.add('img-sizing');
        $img.setAttribute('src', '/loadFile?fileName=' + fileName);
        $img.setAttribute('alt', originFileName);
        $('.uploaded-list').append($img);


}

// 파일 확장자가 이미지 확장자가 맞으면 true 리턴
function isImageFile(originFileName) {
    const pattern = /jpg$|gif$|png$|jfif$|jpeg$/i;
    return originFileName.match(pattern);
}

