// 썸네일 선택 후 랜더링, 히든인풋 만드는 함수
function showThumbImg(fileName, fileOriginName) {
    console.log('showThumbImg 함수 호출 : ', fileName);
    console.log('showThumbImg 함수 호출 : ', fileOriginName);

    // if($('#reg-1 .box-msg').hasClass('hide')){
    //     console.log("이미 등록돼 있는 썸네일, 히든인풋 지우고 다시 넣기");
    // }

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