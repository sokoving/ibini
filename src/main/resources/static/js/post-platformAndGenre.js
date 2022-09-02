console.log('post-platformAndGenre start');

    // 1. 저장하기!
        // 1. 버튼 클릭시 핸들러 작동
        // 2. 핸들러 함수로 value값 가져오기
        // 3. 전송할데이터 배열
        // 4. 요청 정보 객체
        // 5. fetch 전송하기 -> 220811 완료
    // 2. 돔 만들기
        // 1. select -> option || ul -> li 생성 후 js로 select처럼 만들기
        // 1-1. select로 돔 구현함
        // 1-2. 저장이후에 보여주는 함수 만들기 + 비동기 GET요청?
    // 3. 저장한 리스트 화면에 랜더링
        // 1. 뱃지 글자색 + 뱃지 배경색 디비에서 불러오기 -> before switch
    // 4. 파일 라디오 버튼 체인지에 따라 생성하고 수정하기 - 아코디언도 가능?

    // 플랫폼 저장 & 랜더링 기능 =======================================================

    // makePlatformDom - 돔생성하기
    function makePlatformDom(domainList) {

        // 플랫폼 셀렉트 아래에 option 추가하기
        const platformselect = document.querySelectorAll('#platformselect'); // length = 1

        let tag = '';

        for (let key in domainList) {

            // console.log(domainList[key].platformName);
            // console.log(domainList[key].platformId);

            let platformName = domainList[key].platformName;
            let platformId = domainList[key].platformId;

            // option 생성할 필요가 없다 -> select 아래에 넣어주니까!!
            // var option = document.createElement("option");
            // tag 더해주기
            tag += `<option id="platform`+platformId+`" value="` + platformId + `">` + platformName + `</option>`;

        }

        document.getElementById('platformselect').innerHTML = tag;

    }

    function showdomainList() {
        console.log(url);
        fetch(url)
        .then(res => res.json())
        .then(domainList => {
            console.log(domainList);
            makePlatformDom(domainList);

            // 플랫폼 이름 찾아서 select 해주기
            const platformselect = document.getElementById('platformselect');
            let len = platformselect.length

            if(len > 6){

                console.log(platformselect);
                let last = platformselect.lastChild;
                last.selected = true;

                console.log(last);
            }
            
            

        });

    }




    // 플랫폼 저장 버튼 클릭 이벤트
    function savePlatformClickEvent(){
        document.getElementById('platformBtn').onclick = savePlatformHandler
    }

    //플랫폼 저장 핸들러
    function savePlatformHandler(e){

        e.preventDefault();
        // 입력창
        const $platformInput = document.getElementById("platformInput");

        console.log();
        let platformName = $platformInput.value;
        // [수정] 서버로 전송할 데이터 -> account 로그인 정보 넘겨주는거 받는걸로수정!
        const platformData = {

            "platformName": platformName,
            "account" : account
        }
        console.log(platformData);

        // POST 요청정보 객체
        const reqInfo = {
            method : "POST"
            , headers : {
                'content-type' : 'application/json'
            }
            , body : JSON.stringify(platformData)

        };
        console.log(reqInfo);

        fetch(url, reqInfo)
            .then(res => res.text())
            .then(msg=>{
                if(msg==="insert-success"){
                    alert('새로운 플랫폼이 등록 완료되었습니다.');
                    // 비워주기
                    platformName = '';
                    // select 해주기
                    showdomainList();
                    

                } else {
                    alert('새로운 플랫폼 저장을 실패했습니다.');
                }
            })

    }





    // 장르 저장 / 리스트 출력 =======================================================

    function showGenreList() {
        console.log(genreURL);
        fetch(genreURL)
        .then(res => res.json())
        .then(genreList => {
            console.log(genreList);
            makeGenreDom(genreList);

            // 플랫폼 이름 찾아서 select 해주기
            const genreSelecter = document.getElementById('genreSelect');
            let len = genreSelecter.length

            if(len > 4){
                
                console.log(genreSelecter);
                let last = genreSelecter.lastChild;
                last.selected = true;

                console.log(last);
            }
        });

    }


    // 장르 돔 생성
    function makeGenreDom(genreList) {

        // 플랫폼 셀렉트 아래에 option 추가하기
        const genreSelect = document.querySelectorAll('#genreSelect'); // length = 1

        let tag = '';

        for (let key in genreList) {

            console.log(genreList[key].genreId);
            console.log(genreList[key].genreName);

            let genreId = genreList[key].genreId;
            let genreName = genreList[key].genreName;


            // option 생성할 필요가 없다 -> select 아래에 넣어주니까!!
            // var option = document.createElement("option");
            // tag 더해주기
            tag += `<option value="` + genreId + `">` + genreName + `</option>`;

        }

        document.getElementById('genreSelect').innerHTML = tag;

    }

    // 장르 클릭이벤트
    function saveGenreClickEvent(){
        document.getElementById('genreBtn').onclick = saveGenreHandler
    }

    function saveGenreHandler(e){
        
        e.preventDefault();
        
        const $genreInput = document.getElementById("genreInput");

        console.log($genreInput.value);

        // 요청정보
        const genreData = {
                "account": gAccount ,
                "genreName": $genreInput.value
            }

        console.log(genreData);

        // POST 요청정보 객체
        const reqInfo = {
            method : "POST"
            , headers : {
                'content-type' : 'application/json'
            }
            , body : JSON.stringify(genreData)

        };
        console.log(reqInfo);

        fetch(genreURL, reqInfo)
            .then(res => res.text())
            .then(msg=>{
                if(msg==="insert-success"){
                    alert('새로운 장르가 등록 완료되었습니다.');
                    // 비워주기
                    $genreInput.value = '';
                    // select 해주기
                    showGenreList();
                } else {
                    alert('새로운 장르 저장을 실패했습니다.');
                }
            })

    }




    // 즉시실행함수 ==========================================================


    (function(){


        // 플랫폼
        showdomainList();
        savePlatformClickEvent();

        // 장르
        showGenreList();
        saveGenreClickEvent();


    })();