// 글 작성 페이지

import React, { useState } from "react";
import "./Write.css";

const WritePage = () => {
  const [projectname, setProjectname] = useState("");
  const [period, setPeriod] = useState("");
  const [stack, setStack] = useState("");
  const [role, setRole] = useState("");
  const [field, setField] = useState("");
  const [explain, setExplain] = useState("");
  const [explainmore, setExplainmore] = useState("");
  const [files, setFiles] = useState([]);

  const handleSubmit = (e) => {
    e.preventDefault();
  };

  const handleFileUpload = (e) => {
    setFiles([...files, ...e.target.files]);
  };

  const handleChangeState = (e) => {
    setField(e.target.value);
  };

  const handleNewProjectClick = () => {
    alert("저장되었습니다.");
  };

  return (
    <div className="write-body">
      <nav className="top-nav">
        <div className="logo">Fofol</div>
        <ul className="menu">
          <li>
            <a href="/">홈</a>
          </li>
          <li>
            <a href="/my-info">내 정보</a>
          </li>
          <li>
            <a href="/logout">로그아웃</a>
          </li>
        </ul>
        <button className="new-project-btn" onClick={handleNewProjectClick}>
          새 프로젝트
        </button>
      </nav>
      <form onSubmit={handleSubmit}>
        <div className="main-section">
          <div className="myProject">
            <h3>내 프로젝트</h3>
            <div className="form-group">
              <label htmlFor="projectname">프로젝트명</label>
              <input
                type="text"
                id="projectname"
                value={projectname}
                onChange={(e) => setProjectname(e.target.value)}
                placeholder="프로젝트 이름을 작성해주세요."
              />
            </div>
            <div className="form-group">
              <label htmlFor="period">기간</label>
              <input
                type="text"
                id="period"
                value={period}
                onChange={(e) => setPeriod(e.target.value)}
                placeholder="프로젝트 기간을 작성해주세요."
              />
            </div>
            <div className="form-group">
              <label htmlFor="stack">스택</label>
              <input
                type="text"
                id="stack"
                value={stack}
                onChange={(e) => setStack(e.target.value)}
                placeholder="본인의 활동 스택을 작성해주세요."
              />
            </div>
            <div className="form-group">
              <label htmlFor="role">역할</label>
              <input
                type="text"
                id="role"
                value={role}
                onChange={(e) => setRole(e.target.value)}
                placeholder="본인의 역할을 작성해주세요."
              />
            </div>
            <div className="form-group">
              <label htmlFor="field">Field</label>
              <select name="field" value={field} onChange={handleChangeState}>
                <option value="1">Web</option>
                <option value="2">App</option>
                <option value="3">AI</option>
              </select>
            </div>
          </div>
          <div className="file-upload">
            <h3>파일 업로드</h3>
            <input type="file" multiple onChange={handleFileUpload} />
            <div className="file-list">
              {files.map((file, index) => (
                <div key={index} className="file-item">
                  {file.name}
                </div>
              ))}
            </div>
          </div>
        </div>
        <div className="explains">
          <div className="form-group">
            <label htmlFor="explain"></label>
            <textarea
              id="explain"
              value={explain}
              onChange={(e) => setExplain(e.target.value)}
              placeholder="프로젝트 소개"
            />
          </div>
          <div className="form-group">
            <label htmlFor="explainmore"></label>
            <textarea
              id="explainmore"
              value={explainmore}
              onChange={(e) => setExplainmore(e.target.value)}
              placeholder="자세한 설명, 느낀점 등을 작성해주세요."
            />
          </div>
        </div>
      </form>
    </div>
  );
};

export default WritePage;
