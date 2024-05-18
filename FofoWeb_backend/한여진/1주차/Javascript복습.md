## 데이터 타입
- 숫자 데이터 타입
    - 숫자 표현 - 숫자 입력
    - 이항연산자 : + - * / 
- 문자 데이터 타입
    - “ ”, ‘ ’ 안에 문자 입력
    - “ ”.length : 문자열의 길이를 알려줌

## 변수
- 변수 : 바뀔 수 있는 값
- 상수 : 숫자
- 변수를 왜 쓰는가?
    - 변화하는 부분 쉽게 수정 가능
- 변수 앞에 var 붙이기
  ex) var name

## 배열
- 배열 : [ ]
- 가져오는 법 : 배열명[인덱스번호]
- 배열의 길이 : 배열명.length
- 배열에 요소 추가 : 배열명.push

## 조건문
```
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title></title>
  </head>
  <body>
    <h1>Conditional statements</h1>
    <h2>Program</h2>
    <script>
      document.write("1<br>");
      document.write("2<br>");
      document.write("3<br>");
      document.write("4<br>");
    </script>
    <h2>IF-true</h2>
    <script>
      document.write("1<br>");
      if(true){
        document.write("2<br>");
      } else {
        document.write("3<br>");
      }
      document.write("4<br>");
    </script>

    <h2>IF-false</h2>
    <script>
      document.write("1<br>");
      if(false){
        document.write("2<br>");
      } else {
        document.write("3<br>");
      }
      document.write("4<br>");
    </script>
  </body>
</html>
```
f( ) - 괄호 안에는 boolean 데이터 타입

true 일 경우 if 문 안의 문장들 실행됨

false 일 경우 if 문 안의 문장들 실행 X, else 문 문장 실행됨

## 객체
### 객체의 읽기와 쓰기
- 데이터를 순서 없이 저장
- 객체 : 이름이 있는 정리 정돈 상자
```
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
  </head>
  <body>
    <h1>Object</h1>
    <h2>Create</h2>
    <script>
      var coworkers = {
        "programmer":"egoing",
        "designer":"leezche"
      };
      document.write("programmer : "+coworkers.programmer+"<br>");
      document.write("designer : "+coworkers.designer+"<br>");
      coworkers.bookkeeper = "duru";
      document.write("bookkeeper : "+coworkers.bookkeeper+"<br>");
      coworkers["data scientist"] = "taeho";
      document.write("data scientist : "+coworkers["data scientist"]+"<br>");
    </script>
  </body>
</html>
```
- { } 이용
- "programmer":"egoing"
programmer라는 이름으로 egoing라는 값 저장
- coworkers.programmer  - egoing를 가져옴
- coworkers.bookkeeper = "duru"
bookkeeper 라는 이름으로 duru 저장
- coworkers["data scientist"] = "taeho"
이름에 공백을 넣는 경우 . 을 사용하여 데이터 추가 불가능
data scientist 라는 이름으로 taeho 저장

### 객체와 반복문
```
<h2>Iterate</h2>
    <script>
      for(var key in coworkers) {
        document.write(key+' : '+coworkers[key]+'<br>');
      }
    </script>
```
- 배열에서는 순서대로 정리되어있기 때문에 인덱스값 이용
- 객체에서는 순서가 없으므로 key로 저장된 값 불러옴
- \<br\> : 줄바꿈

### 프로퍼티와 메소드
- 객체에 소속된 함수 : 메소드
- 객체에 소속된 변수 : 프로퍼티
ex) bookkeeper, designer, programmer
```
<h2>Property & Method</h2>
    <script>
      coworkers.showAll = function(){
        for(var key in this) {
          document.write(key+' : '+coworkers[key]+'<br>');
        }
      }
      coworkers.showAll();
    </script>
```
- coworkers.showAll = function() { }
→ showAll 이라는 함수 정의
- 만약 객체의 이름(coworkers)이 바뀐다면 오류가 발생할수도
```
<h2>Property & Method</h2>
    <script>
      coworkers.showAll = function(){
        for(var key in this) {
          document.write(key+' : '+this[key]+'<br>');
        }
      }
      coworkers.showAll();
    </script>
```
- 객체 이름 대신 this를 사용하면 객체 이름이 바껴도 오류 X
