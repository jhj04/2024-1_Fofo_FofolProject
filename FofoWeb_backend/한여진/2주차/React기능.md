## 입력 받기
`input` 태그 : 한 즐 입력 받기   
`onChange` : 이벤트 - 값이 바뀌었을 때 수행되는 이벤트   
어떤 값이 입력되면 이벤트가 발생함.   
→ input의 값이 바뀌었을 때 onChange에 전달한 콜백 함수를 수행한다.   
```JavaScript
<div>
  <input
      value = {author}
      onChange = {(e) => {
        setAuthor(e.target.value);
      }}
  />
</div>
```
<br/> <br/>
`textarea` 태그 : 여러 줄을 입력받을 수 있음, 창 크기 조절 가능   
```JavaScript
<div>
  <textarea
      value = {content}
      onChange = {(e) => {
        setContent(e.target.value);
      }}
  />
</div>
```
<br/> <br/>
동작이 비슷한 state들은 하나의 state로 묶을 수 있음   
```JavaScript
const [state, setState] = useState({
    author: "",
    content: "",
});
```
사용시 state. ~~    
```JavaScript
<div>
  <input
      value = {state.author}
      onChange = {(e) => {
        setState({
          author: e.target.value,
          content: state.content, 
        });
      }}
  />
</div>
<div>
  <textarea
      value = {state.content}
      onChange = {(e) => {
        setState({
          content: e.target.value,
          author: state.author, 
        });
      }}
  />
</div>
```
input 태그에 내용을 입력하는 경우 author의 내용만 변경되어야하므로   
author에만 `e.target.value`, content에는 `state.content`

<br/> <br/>
현재의 경우 useState()에 author과 content 객체 둘 뿐이지만 여러 개의 객체가 들어간다면 하나를 바꾸는데 여러 개를 줄줄이 작성해야 함   
→ `...state` 라는 스프레드 연산자 사용   
```JavaScript
<div>
  <input
      value = {state.author}
      onChange = {(e) => {
        setState({
          ...state,
          author: e.target.value,
        });
      }}
  />
</div>
<div>
  <textarea
      value = {state.content}
      onChange = {(e) => {
        setState({
          ...state,
          content: e.target.value,
        });
      }}
  />
</div>
```
```JavaScript
setState({
          ...state,
          author: e.target.value,
        });
```
만약 이 두 코드의 순서를 아래와 같이 바꾼다면 값을 입력해도 작동하지 않음   
```JavaScript
setState({
          author: e.target.value,
          ...state,
        });
```
author의 값을 업데이트시켰지만 아래에 오는 `...state` 코드로 인해 원래의 값이 적용됨.    
→ 반드시 원래 있던 state들을 펼쳐준 후(`....state`), 변경하고자 하는 state의 코드를 작성해 줄 것
<br/> <br/>
## 이벤트 핸들러 합치기
```JavaScript
const handelChangeState = (e) => {
  setState({
      ...state,
      [e.target.name]: e.target.value,
  });
}

return (
      <div>
        <input
            value = {state.author}
            onChange = {(e) => {
              setState({
                ...state,
                author: e.target.value,
              });
            }}
        />
      </div>
      <div>
        <textarea
            value = {state.content}
            onChange = {(e) => {
              setState({
                ...state,
                content: e.target.value,
              });
            }}
        />
      </div>
);
```
`handleChangeState` 작성해주고 `onChange` 에 전달   
author의 값을 바꿔주면 `e.target.name`의 값이 author가 되고, `e.target.value`의 값이 바뀐 값이 되어 업데이트 됨.
