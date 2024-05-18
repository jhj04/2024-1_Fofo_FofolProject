## CSS 기초

- CSS 는 html과는 완전 다른 언어
- 웹브라우저는 기본적으로 코드를 html 언어로 인식하는데, CSS 언어로 인식하게 만드려면 아래와 같은 코드를 입력해줘야 한다.

  ``` <style> </style> ```

  ```
  <style>
	a {
	color:red;
	}
  </style>
  ```

- html 에서 여러 태그의 컬러를 바꾸려면 하나하나 폰트 컬러 태그를 작성해줘야 했지만, CSS를 이용하면 한 번에 변경이 가능
    - CSS 의 효과: 
    - 중복 코드 제거: 웹페이지 사이즈를 줄일 수 있다.
    - 효과적으로 웹페이지를 짤 수 있다.
- 디자인과 관련된 코드를 <style> </style> 안에 넣어서 코드 분석이 용이해진다.

  
## 선택자
- 모든 링크를 기본적으로 검은색으로 설정
    
    ```
    <style>
        a {
          color:black;
            text-decoration: none;
        }
        h1 {
          font-size:45px;
          text-align: center;
        }
      </style>
    ```
    
- 방문한 페이지는 회색으로 설정
    
    ```
    <body>
      <h1><a href="index.html">WEB</a></h1>
      <ol>
        <li><a href="1.html" style="color:gray">HTML</a></li>
        <li><a href="2.html" style="color:gray">CSS</a></li>
        <li><a href="3.html">JavaScript</a></li>
      </ol>
    ```
    
    이렇게 하면 코드의 중복이 발생한다
    
    → HTML과 CSS를 그룹으로 묶어서 처리하자
    
    ```
    <body>
      <h1><a href="index.html">WEB</a></h1>
      <ol>
        <li><a href="1.html" class="saw">HTML</a></li>
        <li><a href="2.html" class="saw">CSS</a></li>
        <li><a href="3.html">JavaScript</a></li>
      </ol>
    ```
    
    ⇒ class의 값을 가지고 있는 태그 두 개를 만듦
    
    ```
    <style>
        a {
          color:black;
            text-decoration: none;
        }
        saw {
          color:gray;
        }
        h1 {
          font-size:45px;
          text-align: center;
        }
      </style>
    ```
    
    이렇게 하면 원하는대로 페이지가 작동하지 않는다 
    : saw 라고 하는 것은 웹페이지에 대한 모든 **saw 라는 이름의 태그를 선택하는 선택자**이기 때문.

    **class 값이 saw 인 태그를 나타내는 선택자** → **. 을 붙여야 함**
    
    ```
    <style>
        a {
          color:black;
            text-decoration: none;
        }
        .saw {
          color:gray;
        }
        h1 {
          font-size:45px;
          text-align: center;
        }
      </style>
    ```
    
    .saw → class의 값이 saw인 태그를 가리키는 선택자

- 현재 방문하고 있는 페이지 - 빨간색으로 설정
    
    ```html
    <head>
      <title>WEB - CSS</title>
      <meta charset="utf-8">
      <style>
        a {
          color:black;
            text-decoration: none;
        }
        .saw {
          color:gray;
        }
        .active {
          color: red;
        }
        h1 {
          font-size:45px;
          text-align: center;
        }
      </style>
    </head>
    <body>
      <h1><a href="index.html">WEB</a></h1>
      <ol>
        <li><a href="1.html" class="saw">HTML</a></li>
        <li><a href="2.html" class="saw active">CSS</a></li>
        <li><a href="3.html">JavaScript</a></li>
      </ol>
    ```
    
    - **class라고 하는 속성의 값은 여러 개의 값이 들어올 수 있고, 띄어쓰기로 구분한다.**
  
    - **하나의 태그에는 여러 개의 속성이 들어올 수 있고,  여러 개의 선택자를 통해서 하나의 태그를 공동으로 제어할 수 있다.**
- 우선 순위
  ```
    <li><a href="2.html" class="saw active">CSS</a></li>
  ```

  이 a 태그는 두 개의 클래스의 영향을 받고 있다.근데 왜 이 a 태그는 빨간색이 된 것일까?
  → 순서 때문. active가 saw보다 나중에 등장했기 때문.

  ```
  <style>
      a {
        color:black;
          text-decoration: none;
      }
      .saw {
        color:gray;
      }
      .active {
        color: red;
      }
      h1 {
        font-size:45px;
        text-align: center;
      }
    </style>
  ```
  
  저 둘의 순서를 바꾸면 HTML과 CSS 모두 회색이 된다.
  
  → 가장 나중의 코드를 따른다.
  
  → 우선 순위가 높은 것을 사용해야 한다: **id 선택자**
  
  ```
  <head>
    <title>WEB - CSS</title>
    <meta charset="utf-8">
    <style>
      a {
        color:black;
          text-decoration: none;
      }
      #active {
        color: red;
      }
      .saw {
        color:gray;
      }
      
      h1 {
        font-size:45px;
        text-align: center;
      }
    </style>
  </head>
  <body>
    <h1><a href="index.html">WEB</a></h1>
    <ol>
      <li><a href="1.html" class="saw">HTML</a></li>
      <li><a href="2.html" class="saw" id="active">CSS</a></li>
      <li><a href="3.html">JavaScript</a></li>
    </ol>
  ```
  
  - #active → id의 값이 active인 태그를 가리키는 선택자
      - id 선택자와 class 선택자가 붙으면 id 선택자가 이긴다.
      - class 선택자와 태그 선택자가 붙으면 class 선택자가 이긴다.
      - 동일한 종류의 선택자끼리 붙으면 가장 나중에 등장하는 선택자가 이긴다.
      
      ⇒ 우선순위: id > class > 일반 태그
      
  - id 선택자의 값이 active인 태그가 이 페이지에서 한 번 등장하면 그 다음에 active의 값을 쓰면 안된다. 써도 웹페이지가 동작하긴 하지만 쓰지 말자.
    **→ id의 값은 한 번만 사용한다. 중복되서는 안된다.**
  - a 와 #active 중 더 포괄적인 것은? 
    : a 태그를 나타내는 선택자
    구체적인 것의 우선 순위를 포괄적인 것보다 높임
    → **태그 선택자를 통해 전체적인 디자인을 한 후, id 선택자를 통해 예외를 두는 것이 더 효율적이기 때문**
  - class 선택자: 중간 정도의 우선 순위

 
## 박스 모델
  h1 태그는 화면 전체를 차지하지만, a 태그는 줄바꿈이 되지 않음(화면 전체를 차지하지 않음)

→ 제목 태그는 화면 전체를 쓰는 것이 더 편함. 링크는 기본적으로 줄바꿈을 하지 않음.

- boarder - 테두리를 그려서 부피감 알아보기
    
    ```html
    <style>
                h1 {
                    border-width:5px;
                    border-color:red;
                    border-style: solid;
                }
    
            </style>
    ```
    
    - **border**: 테두리
    - border-width: 선 굵기
    - border-color: 선 색
    - border-style: 선 스타일 , solid: 일반 선
    - 테두리 하단만 표시하기
        
        ```html
        h1 {
              font-size:45px;
              text-align: center;
              border-bottom:1px solid gray;
            }
        ```
        
        **border-bottom**: 테두리 네 변 중 바닥만 표시.
        
    
- **태그의 성격에 따라 화면 전체를 쓰기도, 자기 크기 만큼을 쓰기도 한다.**
    - **화면 전체를 쓰는 태그: block level element**
    - **자기 크기 만큼을 쓰는 태그: inline element**
    - 기본 값 바꾸기
        
        ```
        <style>
                    /*
                    block level element
                    */
                    h1 {
                        border-width:5px;
                        border-color:red;
                        border-style: solid;
                        display:inline;
                    }
                    /*
                    inline element
                    */
                    a {
                        border-width:5px;
                        border-color:red;
                        border-style: solid;
        								display:block;
                    }
        
                </style>
        ```
        
        - display:inline - block level → inline level
        - display:block - inline level → block level
        - display:none - 해당 태그가 화면에서 사라짐
        
- 중복 코드 없애기
    
    ```html
    <style>
                h1, a{
                    border-width:5px;
                    border-color:red;
                    border-style: solid;
                }
    
            </style>
    ```
    
    → **, 선택자**를 통해 코드 길이를 줄일 수 있다.
    
- 더 간결해진 코드
    
    ```
    <style>
                h1, a{
                    border:5px solid red
                }
    
            </style>
    ```
    
    → 공백으로 속성을 구분하여 코드를 줄일 수 있다. 순서는 상관 X
    

- content 와 테두리 사이 여백 - **padding**
    
    ```
    <style>
                h1{
                    border:5px solid red;
                    padding:20px;
                }
    
            </style>
    ```
    
    → **padding 을 이용해 여백 주기**
    
- 테두리와 테두리 사이 간격 - **margin**
    
    ```
    <style>
                h1{
                    border:5px solid red;
                    padding:20px;
                    margin:0;
                }
    
            </style>
    ```
    
    **margin** : 테두리 사이 간격 조정
    
- 태그의 크기 변경 - **width**
    
    ```
    <style>
                h1{
                    border:5px solid red;
                    padding:20px;
                    margin:20px;
                    display:block;
                    width:100px
                }
    
            </style>
    ```
    
    - block level 태그는 기본적으로 display:block 이 생략되어 있음
  
    - **width**를 통해 태그의 크기 변경
