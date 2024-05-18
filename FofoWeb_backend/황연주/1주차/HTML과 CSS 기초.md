# HTML과 CSS
**html : 문서의 구조와 내용을 다루는 언어. -> 웹피이지의 뼈대를 만드는 언어**

```html
<!DOCTYPE html>                         <!-- 1) doctype  VSCode에서 !를 입력하면 기본으로 만들어짐.-->
<html lang="ko">                        <!-- 2) <html> 태그 -->
  <head>                                <!-- 3) <head> 태그 -->
    <meta charset="UTF-8">
    <title>HTML 기본구조</title>
  </head>
  <body>                                <!-- 4) <body> 태그 -->
    <h1>Hello, HTML</h1>
  </body>
</html>
```
html 문서는 기본적으로 head와 body로 구분됨. <head>태그, <body>태그
  head 안의 내용은 화면에 출력되진 않지만 웹브라우저가 알아야 할 중요한 정보들이 들어있음.
  body 안의 내용은 화면에 직접 출력되는 부분
기본 문법 - 태그
- 태그의 속성은 <태그 속성="값"> 형태로 사용하며, 태그마다 여러 속성을 부여할 수도 있다.
- 모든 태그에는 id 속성과 class 속성을 지정해줄 수 있다.
```html
<div>
<p>이것은 텍스트를 넣는 태그</p>
<p id="name">내 이름은 홍길동</p>  <!-- id 속성으로 지정-->
<p class="age">내 나이는 21</p>  <!-- class 속성으로 지정-->
<br> <!--br을 사용하면 줄바꿈 가능함(엔터기능)-->
```
**CSS: html 구조의 디자인을 부여하는 도구. 요소들의 배치, 색상, 폰트 등**

###### h1 {color:red; font-size:12px;}
- h1 => 선택자
- { } => 선언부
- color, font-size => 속성
- red, 12px => 속성 값

```CSS
p#id{font-weight:bold; display:flex;} <!-- id를 사용한 경우 css -->
p.class{display:flex;font-size:20px;}  <! --class를 사용한 경우 css -->
```
```CSS
font-size :글씨 크기 설정
font-family : 글꼴 설정
font-weight : 글씨 굵기 설정
background-color : 글씨 배경색 설정
```
