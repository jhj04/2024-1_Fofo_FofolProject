import './App.css';
import Login from './Login/Login.js';
import MyProfile from './MyProfile/MyProfile.js';
import ProjectFile from './ProjectFile/ProjectFile.js';
import Write from './Write/Write.js';
import Main from './After_Login/Main.js';
// import App from './App.js';
import Signup from './Signup/Signup.js';
import React from 'react';
import { BrowserRouter, Route, Routes } from 'react-router-dom';

function App() {
  return (
    <div className='App'>
      {/*App.js는 건들지 말고, 새 페이지 작성해서 Route로 사용하기*/}
      {/*새로 만들어진 페이지 있으면 여기서 추가해서 사용하기*/}
      {/*페이지 확인은 url 변경해서 확인(기본 링크에 path 부분을 덧붙여서 이동) -> ex)http://localhost:3000/Project/Project */}
      <BrowserRouter>
        <Routes>
          {/* <Route path={'/Before_Login'} element={<Before_Login />}></Route> */}
          <Route path={'/'} element={<App />}></Route>
          <Route path={'/Main'} element={<Main />}></Route>
          <Route path={'/MyProfile'} element={<MyProfile />}></Route>
          <Route path={'/Write'} element={<Write />}></Route>
          <Route path={'/ProjectFile'} element={<ProjectFile />}></Route>
          <Route path={'/Login'} element={<Login />}></Route>
          <Route path={'/Signup'} element={<Signup />}></Route>
        </Routes>
      </BrowserRouter>
    </div>
  );
}

export default App;
