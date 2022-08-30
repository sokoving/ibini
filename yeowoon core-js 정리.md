# 변수
- 변수 여러 줄 선언
 + var user = 'John', age = 25, message = 'Hello';
## 변수명
- 대소문자 구분
- (추천) camel case : ourVipMambersAddress
- (비추) snake case : our_vip_mambers_address
- X : 숫자로 시작, 숫자만 있음
- X : $, _ 제외한 특수문자
- X : 띄어쓰기
- X : 예약어 (var, if 등등)

----------------------------------------------------------

# 타입
- 타입 로그에서 보기 
   + console.log(typeof decimal);

## number : 숫자 타입(실수, 정수 둘 다)
- binary : 2진수
   + var binary = 0b1001;    //숫자 앞 0b
- NaN(Not a Number): 산술 연산 불가능을 표현하는 값
   + console.log(10/'메롱');  //NaN

## string : 문자 타입('', "", `` 다 사용 가능)
```
var eng = 'hello';         //홑따옴표
var kor = "안녕하세요";     //곁따옴표
var jan = `콘니치와`       //백틱
```
### 탈출문자
- 문자 타입 : 따옴표로 감싸기,  
  + ' 엔터 \n ,  탭 \t , 따옴표 \" '
- 경로 표시 : 리눅스 - /, 윈도우 - \
  + var str = 'E:\\temp\\new.png';
### 템플릿 리터럴 (ES6+ 문법)
- ``(백틱)으로 문단 단위의 문자열 처리
```
        var template = `
        <ul>
            <li>
                <a href="#">Home</a>
            </li>
        </ul>`;
```
- 변수와 문자열 결합을 간편하게 처리할 수 있다
```
var studentName = '김철수', engScore = 88;
console.log(`${studentName} 님의 영어점수는 ${engScore}점입니다.`);
```

## boolean : 논리 타입
- 따옴표 없이 선언
   + var x = true;
## 그외 타입
1. undefined 타입 > 값: undefined
 - 변수를 선언만 하고 초기화하지 않은 경우
2.  null 타입 > 값: null
 - 개발자가 의도를 가지고 값이 아예 없음을 표현 */

## 타입변환(형변환)
### 묵시적 형변환
- 문자 타입과 다른 타입의 결합연산
- 숫자로만 구성된 문자 타입은 산술연산자를 쓰면 숫자 타입으로 형변환
  + 30 - '20' → 10
```
    +true  : 1(대표값은 1이고 0을 제외한 모든 숫자가 true)
    +false : 0
    +null  : 0
    +hello : NaN
```
- 조건문에 쓰면 논리타입으로 자동 형변환되는 값
  + Falsy : undefined, null, 0, NaN, ''
  + Truthy : Falsy를 제외한 모든 값
 
### 명시적 형변환
- 문자열 변환
 1. 빈문자열에 결합연산 : ''+10+20
 2. String 생성자 함수 :  String(10)
 3. toString 메서드 : 10.toString()
- 숫자 변환
 1. 부호 연산자 붙이기 : +'10'
 2. Number 생성자 함수 : Number('10')
 3. parseInt('10') 정수 변환 메서드
 4. parseFloat('5.5') 실수 변환 메서드
- 논리 변환
 1. Boolean 생성자 함수
```
    undefined; //falsy
    Boolean(undefined); // false
```
 2. 부정논리 연산자 연속 사용
```
      null; //falsy
      !logic; //true
      !!logic; //false
```
### 단축평가
- 논리 연산자(||나 &&)에 논리 타입이 아닌 피연산자가 왔을 때
  + 참 거짓을 가르는 데 결정적인 변수를 선택한다.
```
// OR 연산
       console.log('hello' || 'world');  //hello
       console.log(0 || '안녕');         //안녕

// AND 연산
        console.log('hello' && 'world'); //world
        console.log(null && '잘 가');    //null
```
----------------------------------------------------------

# 연산자
## 산술 연산자
- 결합(+) : 문자+다른 타입 → 문자 타입
- 나눗셈(/) : 정수/정수 → 실수
- 나머지(%) : 27%5 → 2
- [ES6+] 거듭제곱(**) :  5**2 → 25 
- 증강연산(++, --) : 1증가, 1감소
   + 전위 연산(prefix, ++x) : 산술연산자 중 최우선
   + 후위 연산(postfix, x--) : 산술연산자 중 최후선(=보다도 뒤에 연산)

## 대입 연산자
- 복합 대입연산
```
    var x = 10;
    x += 5; // x(10)에 5를 더해서  x에 대입
    x **= 3; // x(15)에 3제곱해서 x에 대입
```

## 비교 연산자
- js에서는 문자열 내부에 숫자만 잇으면 숫자로 자동변환해서 연산
- 형, 띄어쓰기까지 비교할 경우에는 일치연산자 쓰기
```
    =  : 할당 / == : 동등 / === : 일치
```
- 문자열 대소비교 (유니코드로)
 + A: 65,  a: 97,  가: 44032
- 논리값 대소비교 (true = 1, false = 0)

## 논리 연산자 
- && : AND 연산
- || : OR 연산
- ! :  NOT 연산(논리 반전)

----------------------------------------------------------

# 조건문
- if(조건식) : 괄호 안에는 true, false가 리턴되는 조건식
- elase if(조건식)
  + 맨 위 if부터 순서대로 참, 거짓 검사
  + 참이면 검사를 종료하고, 거짓이면 다음 else if로 넘어가 검사
- else 
  + if의 종속 코드(단독 사용X)
  + 모든 검사가 거짓일 경우 실행
- 삼항 연산 
  + 조건식 ? 참일 경우 실행 : 거짓일 경우 실행;
  + 변수에 대입할 수 있다
```
  var food = money >= 5000 ? '김치찌개' : 라면;
  console.log(food);
```
----------------------------------------------------------

# 반복문
## while
```
  var m = 3;        // 필수 1. 제어변수의 선언(시작)
  while (m >= 0) {  // 필수 2. 조건식
                                  참일 경우 아래 코드 실행, 
                                  거짓일 경우 반복문 탈출
      console.log(m);  // 반복할 코드
      m--;           // 필수 3. 증강식
  }
```
### while(true) 무한반복문
- 반복 횟수가 정해지지 않았을 때 사용
- 탈출문(break) 필수


## for
```
  for (선언문 ; 조건식 ;증강식)
  for (var i = 0; i < 5; i++) {  
      console.log('안녕'); // 실행문 
  }
```
### for of : 배열 요소 전체 순회
```
    var scoreList = [97, 88, 100, 92, 55, 23];
    var total = 0;
    for (var n of scoreList){
        total += n;
    }
```
### for in : 객체의 key를 전체 순회
- 변수에 key값이 할당돼 프로퍼티의 값을 참조할 수 있다.
- 이때 변수는 문자타입이기 때문에 대괄호 참조 사용
 ```
for (var prop in phone) {          // prop에는 key가 순서대로 대입됨
    console.log(phone[prop]);       // prop은 string 타입의 변수 > phone.prop 하면 안 나옴.
}
```

## 탈출문
### break;
- 가장 가까운 반복문 즉시 탈출
### continue;
- 해당 조건은 건너뛰고 반복문 수행
- countinue를 만나면 for문은 증감식으로, while은 조건식으로 이동

----------------------------------------------------
# 배열
1. 배열 변수 이름 관례: 복수형(-s),  -List
2. 배열 리터럴 : 0개 이상의 요소를 쉼표로 구분하여 대괄호[]로 묶음
  - var fruits = ['사과', '포도', '오렌지', '복숭아', '자몽'];
3. 요소(element) : 배열에 저장된 하나하나의 데이터
4. 길이(length) : 배열 안에 요소의 수
5. 요소 참조 [index]
  - fruits[2]
6. 요소 수정
  - fruits[3] = '파인애플';
7. 인덱스로 배열 내부 순회
```
    for (var i = 0; i < fruits.length; i++){
          console.log(`${fruits[i]} 맛있어요~`);
    }
```
8. 인덱스의 범위 : 0 ~ length - 1
9. for of : 배열 요소 전체 순회
```
    var scoreList = [97, 88, 100, 92, 55, 23];
    var total = 0;
    for (var n of scoreList){
        total += n;
    }
```
10. 요소 추가, 삭제
- push() : 배열 맨 끝에 데이터를 추가
- pop() : 배열의 맨 끝 요소를 제거
- shift() : 배열의 첫 번째 요소 제거
- unshift() : 배열의 맨 앞에 요소를 추가

11. array 함수
- arr.indexOf(element) : 배열 요소의 인덱스를 알려줌
  + lastIndexOf 마지막 일치 인덱스
- arr.slice(start idx, end idx) : 배열을 부분 추출하여 사본 배열로 반환
  + (2,5) 2번부터 5번 미만 추출
  + (2) 2번부터 끝까지
  + () 배열 전체 사본
- arr.reverse() : 배열을 역순으로 재배치 (원본 수정)
- arr1.concat(arr2) : 배열 2개를 결합한 사본을 가져옴
- arr.includes(element) : 배열에 특정 요소가 있는지 여부 확인(논리값 반환)
- arr.splice(start idx, del count num, 추가할 데이터)
```
// 1번 인덱스부터 2개 요소 삭제
pets.splice(1, 2);
// 0번 인덱스부터 1개를 삭제하고 그 자리에 어흥이 삽입
pets.splice(0, 1, '어흥이');
// 1번 인덱스에 징징이 삽입 (1번 인덱스부터 0개 삭제하고 징징이 삽입)
pets.splice(1, 0, '징징이');
// 2번 인덱스부터 끝까지 삭제
pets.splice(2);
```
12. Destructuring(디스트럭쳐링)
- 기존에 구조를 가지고 있던 배열을 파괴하고 별도의 변수에 값을 할당하는 것
  + 배열 안의 어떤 값을 쉽게 추출할 수 있다
```
// ES6
    // [대괄호]를 사용해 변수를 배열처럼 만들어 배열의 값 받기
const arr = [1, 2, 3];
const [one, two, three] = arr;
// one = 1, two = 2, three = 3;
let [x, y, z] = arr;
// x = 1, y = 2, z = 3

// 배열 디스트럭쳐링의 다양한 표현 방법
let a, b, c;
    // 변수 배열의 길이 = 배열의 길이
[a, b] = [1, 2];       // a = 1, b = 2
    // 변수 배열의 길이 > 배열의 길이
[a, b] = [1];         // a = 1, b = undefined
    // 변수 배열의 길이 < 배열의 길이
[a, b] = [1, 2, 3];   // a = 1, b = 2
[a, , z] = [1, 2, 3]; // a = 1, b = 3

    // 기본값 설정
[a, b, c=3] = [1, 2];       // a = 1, b = 2, c = 3
[a, b= 10, c = 3] = [1, 2]; // a = 1, b = 2, c = 3

    // 스프레드 연산자(spread operator)
[a, ...b] = [1, 2, 3];   // a = 1, b = [2, 3]
```
----------------------------------------------------
# 객체
- 배열(array) : index 번호로 관리, 요소간에 연관이 있을 때
- 객체(object) : index 대신 key로 관리, 요소간에 연관이 없다
## 객체 리터럴
- 대괄호 >> {}
- 객체 생성 >> {};
- 빈 객체 만들기 : var obj = {};
```[예시]
              var obj = {
                  key1: 'string value',
                  key2: num vaue,
                  key3: [1, 2]
              };
```
## property
 - key와 value로 구성
 - , 로 구분
 - key
   + value를 호출할 수 있기 때문에 나열 순서는 상관없다.
   + key : 문자지만 ''는 붙이지 않는다.
   + 숫자는 되도록 쓰지 않는다.
   + 띄어쓰기가 있으면 '' 붙이기. (권장되지 않음)
 - value
  + 모든 타입을 쓸 수 있다.
  + '문자', / 숫자 - 8,  / 논리 - true, false, / 배열 - ['문자1', '문자2', '문자3']

## 객체에 저장된 값 참조
- obj.key1;
- obj.key3[0];  >> 1  배열 값을 가진 키는 배열처럼 사용 가능
## 프로퍼티 값 수정
- obj.key1 = '수정값';
- obj.key3[0] = '배열수정';

## 새로운 프로퍼티 동적 추가 (코드 실행 중 추가)
- obj.key4 = 'newProp';
- 있는지 찾아보고(있으면 기존값 수정되니까) 추가
```
        if (!('key4' in obj)) {
             obj.key4 = 'newProp';
        }
```

## 프로퍼티 동적 제거(코드 실행 중 추가)
- delete obj.key4;

## for in
- 객체의 key를 전체 순회한다
- 변수에 key값이 할당돼 프로퍼티의 값을 참조할 수 있다.
- 이때 변수는 문자타입이기 때문에 대괄호 참조 사용
 ```
for (var prop in phone) {          // prop에는 key가 순서대로 대입됨
    console.log(phone[prop]);       // prop은 string 타입의 변수 > phone.prop 하면 안 나옴.
}
```
### 객체 내부의 특정 키의 존재 여부 확인
```
      var haskey = color in phone;   // phone에 변수 color가 있는지 확인
      console.log(haskey);           // false
```
## Destructuring(디스트럭쳐링)
- 기존에 구조를 가지고 있던 객체를 파괴하고 별도의 변수에 값을 할당하는 것
  + 객체 안의 어떤 값을 쉽게 추출할 수 있다
```
// ES6
    // 프로퍼티명으로 변수 선언하고 값을 받기
const obj2 = { first_name: 'Ungmo', last_name: 'Lee'};
const {first_name, last_name}= obj2;
// const {f, l} = obj2;  (X)
console.log(full_name);

    // 변수와 프로퍼티 이름만 같다면 순서와 변수 수는 상관없다
const {prop2} = {prop1: 'a', prop2: 'b'};
console.log("prop2 : " + prop2);

    // 중첩 객체에서는 중첩 객체로 형태를 맞춰줘야 값을 받을 수 있다
        // 사용은 프로퍼티값이 아니라 변수 이름으로
function settings(){
    return { display: {color: 'red'}, keyboard: {layout: 'qwerty'}};
}
const {display: {color: displayColor}, keyboard: {layout: keyboardLayout}}= settings();
// console.log("displayColor : "  + display, ", keyboardLayout : " + keyboard);
console.log("displayColor : "  + displayColor, ", keyboardLayout : " + keyboardLayout);
```
----------------------------------------------------
# 기타
## Math
- 내림 : Math.floor(3.789
- 올림 : Math.ceil(3.289)
- 반올림 : Math.round(3.16)
- 랜덤값 : Math.random();
  + x 이상 y 이하의 랜덤 정수 생성
  + Math.floor(Math.random() * (y-x+1)) + x;