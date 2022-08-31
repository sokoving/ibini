// 썸네일 선택 후 랜더링, 히든인풋 만드는 함수
function showThumbImg(fileName, fileOriginName) {
    console.log('showThumbImg 함수 호출 : ', fileName);
    console.log('showThumbImg 함수 호출 : ', fileOriginName);

    // 썸네일 랜더링
    const $thumbImg = $('.thumb-img');
    console.log($thumbImg.length);
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
    $('#write-form').append($thumbFileName);

        // 등록된 썸네일이 있을 때
    } else {

        // 이미지 주소 교체
        $thumbImg.attr('src', '/loadFile?fileName=' + fileName);
        $thumbImg.attr('alt', fileOriginName);

        // 등록 때 썸네일 경로 보내는 히든인풋
        $('.thumbFileName-hidden-input').attr('value', fileName);
    }

    // 박스에 파일이름 띄우기
    $('#reg-1 .file-box-right').text(fileOriginName)


}


// 첨부파일 선택 후 랜더링, 히든인풋 만드는 함수
function showImgs(fileNames) {
    console.log('showImgs 함수 호출 : ', fileNames);
    const $boxMsg = $('#reg-6 .file-box-right');
    // console.log($boxMsg.data(imgsNum));

    for (const fileName of fileNames) {

        // 랜더링
        const $imgBox = document.createElement('div');
        $imgBox.classList.add('upload-img-box');

        const $img = document.createElement('img');
        $img.classList.add('upload-img');
        $img.setAttribute('src', '/loadFile?fileName=' + fileName);
        // let originFileName = fileName.substring(fileName.indexOf("_") + 1);
        // $img.setAttribute('alt', fileOriginName);

        $imgBox.append($img);
        $('#reg-6 .uploaded-list').append($imgBox);

        // 히든인풋
        const $imgFileName = document.createElement('input');
        $imgFileName.setAttribute('type', 'hidden');
        $imgFileName.setAttribute('name', 'fileNames');
        $imgFileName.setAttribute('value', fileName);
        $('#write-form').append($imgFileName);

    }

}


// 파일 확장자가 이미지 확장자가 맞으면 true 리턴
function isImageFile(originFileName) {
    const pattern = /jpg$|gif$|png$|jfif$|jpeg$/i;
    return originFileName.match(pattern);
}