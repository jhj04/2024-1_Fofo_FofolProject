import React, { useState } from "react";
import "./Main_nav.css";

const MainNav = () => {
    const history = useState();
  
    const handleHomeClick = () => {
      window.location.reload();
    };
  
    const handleMyProfileClick = () => {
      history.push('/MyProfile');
    };
  
    const handleLogoutClick = () => {
      localStorage.clear(); // 로그아웃 처리. 이게 맞나
      // 백엔드에 로그아웃 요청 보내서 끊는 거 필요할 듯. 
      history.push('/Before_Login');
    };
  
    const handleNewProjectClick = () => {
      history.push('/Write');
    };
  
    return (
      <div className="nav">
        <div className="title">Fofol</div>
        <div className="buttons">
          <button className="homeBtn" onClick={handleHomeClick}>홈</button>
          <button className="MyProfileBtn" onClick={handleMyProfileClick}>내 정보</button>
          <button className="logoutBtn" onClick={handleLogoutClick}>로그아웃</button>
          <button className="newProjectBtn" onClick={handleNewProjectClick}>새 프로젝트 생성</button>
        </div>
      </div>
    );
  };
  
  export default MainNav;