// 배경 클릭 이벤트
function modiBgInputClick(e) {

    console.log('modiBgInputClick : ', e.target);

    var colorPicker = new iro.ColorPicker("#picker", {
        // Set the size of the color picker
        width: 270,
        // Set the initial color to pure red
        color: "#f00"
    });
    // document.getElementById('eventRemoveBtn');

    // btn 위치 잡아서 클릭이벤트 활성화될ㄸㅐ 추가해주기

    var rgbString = colorPicker.color.rgbString;

    // listen to a color picker's color:change event
    // color:change callbacks receive the current color
    colorPicker.on('color:change', function (color) {
        // log the current color as a HEX string
        console.log(color.rgbString);
        document.getElementById('modiBgInput').value = color.rgbString;
    });

}


// 폰트 클릭이벤트
function modiFontInputEvent(e) {
        

        var colorPicker = new iro.ColorPicker("#picker", {
            // Set the size of the color picker
            width: 270,
            // Set the initial color to pure red
            color: "#f00"
        });

        // btn 위치 잡아서 클릭이벤트 활성화될ㄸㅐ 추가해주기
        // const eventRemoveBtn = document.querySelector('#eventRemoveBtnFont');
        // tag = `<button type="button" class="btn btn-primary" id="removeFontEvent">수정완료</button>`;
        
        // document.getElementById('removeFontEvent').innerHTML = tag;


        var rgbString = colorPicker.color.rgbString;

        // listen to a color picker's color:change event
        // color:change callbacks receive the current color
        colorPicker.on('color:change', function (color) {
            // log the current color as a HEX string
            console.log(color.rgbString);
            document.getElementById('modiFontInput').value = color.rgbString;
        });


}

function color(){
    console.log('color');
    const modalBody = document.getElementById('modalBody');
    const pickerHTML = document.querySelector('#picker');
    
    // 존재한다면?
    const picker = document.querySelector('#picker').children;
    const IroColorPicker = document.querySelectorAll('.IroColorPicker');

    modalBody.onclick = e => {
        console.log(e.target);

        if(e.target.matches('#modiBgInput') && picker.length == 0){
            
            console.log('modiBgInput');
            // input클릭시 IroColorPicker 생성
            modiBgInputClick(e);
            console.log('pickerHTML : ',pickerHTML);
            console.log('picker.length(==0) : ' , picker.length);

        } else if(e.target.matches('#modiBgInput') && picker.length >= 1){
            console.log('modiBgInput.length>=1');
            pickerHTML.innerHTML = ``;
            modiBgInputClick(e);
            console.log('pickerHTML : ',pickerHTML);
            console.log('picker.length(>=1) : ' , picker.length);
    

        } else if(e.target.matches('#modiFontInput') && picker.length == 0) {
            console.log('modiFontInput.length==0');
            modiFontInputEvent(e);
            console.log('modiFontInput.picker.length(==0) : ' , picker.length);
        }
        else if (e.target.matches('#modiFontInput') && picker.length >= 1){
            console.log('modiFontInput.length>=1');
            pickerHTML.innerHTML = ``;
            // ??????
            // IroColorPicker.style.display = "none";
            modiFontInputEvent(e);
            console.log('modiFontInput.picker.length(>=1) : ' , picker.length);
        
        }

        //IroColorPicker.style.display = "none";

    }

    platformModifyEvent(pickerHTML);

}


// 배경 색상 선택 input 수정
function modiBgInput() {
    
    const modalBody = document.getElementById('modalBody');
    console.log('modalBody: ', modalBody);

    const modiBgInput = document.getElementById('modiBgInput');
    modiBgInput.addEventListener('click', modiBgInputClick );
    
        
    // 중복이벤트 제거
    modiBgInput.addEventListener('click', function(e){
        modiBgInput.removeEventListener('click', modiBgInputClick);
    })

    
}

// 글자 색상 input 수정
function modiFontInput() {
    const modiFontInput = document.getElementById('modiFontInput');
    modiFontInput.addEventListener('click', modiFontInputEvent );
    
    
    // 중복이벤트 제거
    modiFontInput.addEventListener('click', function(e){
        modiFontInput.removeEventListener('click', modiFontInputEvent);
    })
    
}


// 도메인 리스트 불러오기
function showdomainList() {
    
    fetch(url)
    .then(res => res.json())
    .then(domainList => {
        console.log(domainList);
        makePlatformDom(domainList);
    });

}

// 플랫폼 돔 생성
function makePlatformDom(domainList) {

    // 1. 추가할 위치 가져오기
    const selectSetting = document.querySelector('#selectSetting');
    // 2. div 생성
    // document.createElement('');

    let tag = '';

    for (let key in domainList) {

        console.log(domainList[key].platformName);
        console.log(domainList[key].platformId);

        let platformName = domainList[key].platformName;
        let platformId = domainList[key].platformId;
        let platformBgColor  = domainList[key].platformBgColor;
        let platformFontColor = domainList[key].platformFontColor;
        let rowNum = domainList[key].rowNum;
        console.log('rowNum : ', rowNum);
        let loop = +key + 1;
        // option 생성할 필요가 없다 -> select 아래에 넣어주니까!!
        // var option = document.createElement("option");
        // tag 더해주기
        tag += `<div id="selList">
                    <div class="platformNo">
                        <input type="hidden" value="`+ platformId+`">
                        `+ loop + `
                    </div>
                    <div class="platformName">
                        <span>` + platformName + `</span>
                    </div>
                    <div class="bgColor">
                        <div class="bgColorBox" style="background-color: ` + platformBgColor + `;"></div><span>배경색상</span>
                    </div>
                    <div class="fontColor" id="fontColor">
                        <div class="fontColorBox" style="background-color: ` + platformFontColor + `;"></div><span>글자색상</span>
                    </div>
                    <div class="modiAndDel">
                        <button type="button" class="btn btn-primary" id="modalBtn" data-bs-toggle="modal" data-bs-target="#platModi">
                            수정
                        </button>
                        <button type="button" id="delBtn" class="btn btn-danger">삭제</button>

                    </div>
                </div>`;

    }
    // selectSetting 아래쪽에 넣어주기
    document.getElementById('selectSetting').innerHTML = tag;

}





//플랫폼 수정 삭제 이벤트
function openModifyModalAndRemoveEvent() {
    const $SelectSetting = document.getElementById('selectSetting');

    $SelectSetting.addEventListener('click', function(e){
        // alert('selectSetting');
        console.log('e : ', e.target);
        platformModAndDelHandler(e);
    });
}


// 플랫폼 삭제 처리
function processRemove(no) {
    console.log(no)
    if (!confirm('선택하신 플랫폼을 삭제하시겠습니까?')) return;

    fetch(modiURL + '/' + no, {
        method: 'DELETE'
    })
        .then(res => res.text())
        .then(msg => {
            if (msg === 'del-success') {
                alert('삭제 성공!');
                // 목록 새로불러오기
                showdomainList();
            } else {
                alert('삭제 실패!');
            }
        });
}

// 수정 화면 modal에 보여주기
function processModifyShow(e, no) {
    console.log('processmodiShow no:', no)

    const platformName = e.target.parentElement.parentElement.firstElementChild.nextElementSibling.innerText;
    console.log('platformName : ', platformName);
    const platfomrBgColor = e.target.parentElement.parentElement.firstElementChild.nextElementSibling.nextElementSibling.firstElementChild.style.backgroundColor;
    console.log('platfomrBgColor: ', platfomrBgColor);
    const platformFontColor = e.target.parentElement.parentElement.lastElementChild.previousElementSibling.firstElementChild.style.backgroundColor;
    console.log('platformFontColor : ', platformFontColor)

    document.getElementById('modiNameInput').value = platformName;
    // 색상 수정할때 컬러 api 사용하기
    document.getElementById('modiBgInput').value = platfomrBgColor;
    document.getElementById('modiFontInput').value = platformFontColor;

    // 모달 찾아서 번호 달아주기
    const $modal = document.querySelector('.modal');
    $modal.dataset.no = no;
    console.log('no: ', no);



}



// 플팻폼 수정 비동기 처리 이벤트
function platformModifyEvent(pickerHTML) {

    const modal = document.getElementById('platModi');
    console.log('platformModifyEvent')

    const modiBtn = document.getElementById('modiBtn');
    modiBtn.onclick = e => {
        let modiNameInput = document.getElementById('modiNameInput');
        let modiBgInput = document.getElementById('modiBgInput');
        let modiFontInput = document.getElementById('modiFontInput');

        console.log('modalInput : ',modiNameInput.value);
        // data-no에 \n 상태로 들어감??
        const no = e.target.closest('.modal').dataset.no;
        console.log('ModifyEvent no :', no);
        // console.log('no.value: ', no.value);

        const objj = {
                         account : account,
                         platformName: modiNameInput.value,
                         platformBgColor: modiBgInput.value,
                         platformFontColor: modiFontInput.value
                     };

        const reqInfo = {
            method: 'PUT',
            headers: {
                'content-type': 'application/json'
            },
            body: JSON.stringify(objj)
        };
        console.log(objj);

        console.log(modiURL + '/' + no);
            fetch(modiURL + '/' + no, reqInfo)
                .then(res => res.text())
                .then(msg => {
                    if (msg === 'modi-success') {
                        alert('수정 성공!!');
                        // jquery로 모달창 닫기?
                        $(document).ready(function(){
                            $('#platModi').modal('hide');
                        })
                        // picker 비워주기
                        pickerHTML.innerHTML = ``;
                        showdomainList(); //새로불러오기
                    } else {
                        alert('수정 실패!!');
                    }
                });
    };
}


// 플랫폼 수정/삭제 핸들러
function platformModAndDelHandler(e) {
    //textcontent를 innerText로 바꿈
    const no = e.target.parentElement.parentElement.firstElementChild.firstElementChild.value;
    // const noo = e.target.parentElement;
    console.log('no:', no);
    // console.log('noo', noo);
    console.log('플랫폼 수정/삭제 핸들러');
    let b = +no === +1;
    console.log('1', 1);
    console.log('b: ', b)
    if (+no === +1){
        e.preventDefault();
        alert('삭제할 수 없는 값 입니다.');
        return;

    } else {
        console.log('else')
        e.preventDefault();

        // console.log('수정버튼 클릭함!! before');
        if (e.target.matches('#modalBtn')) {
            console.log('modalBtn');
            processModifyShow(e, no);
        } else if (e.target.matches('#delBtn')) {
            processRemove(no);
            console.log('delBtn: ', no);
        }
    }



}


// 함수 실행부

(function (){
    // 플랫폼 돔 생성
    showdomainList();
    openModifyModalAndRemoveEvent();
    platformModifyEvent();
    // 컬러 선택 함수
    // modiBgInput();
    // modiFontInput();
    // colorEventHanlder();
    color();

})();
