import React, { useState } from "react";
import "./Main_body.css";

// 블럭 추가 처리. 클릭하면 추가 프로젝트 버튼 생성되고, 이름 정하라고 +부분에 커서 깜빡거림.
// 엔터 누르거나 마우스 커서로 화면의 다른 곳 누르면 그 이름으로 프로젝트 폴더 생성됨.
// 생성된 버튼에서 버튼 이름을 하나도 안 쓰고 다른 곳을 누르면 '폴더명을 작성하세요'라고 알림창이 뜸.
// 폴더 명을 적어서 그 이름으로 새로운 버튼이 생성되었다면 그대로 놔두기. 다시 그 부분을 누른다고 이름이 변경되는 것이 아님.
// 3개의 블럭이 생성됐다면 다음 블럭부터는 다음 줄에 생성되면서 스크롤 가능하게 하기.

const MainBody = ({ onCreateProject }) => {
  const [projects, setProjects] = useState([]);
  const [editableProjectId, setEditableProjectId] = useState(null);

  const handleAddBlockClick = () => {
    setProjects([...projects, { id: Date.now(), name: '', editable: true, created: false }]);
  };

  const handleProjectNameChange = (e, projectId) => {
    const updatedProjects = projects.map(project => {
      if (project.id === projectId) {
        return { ...project, name: e.target.value };
      }
      return project;
    });
    setProjects(updatedProjects);
  };

  const handleProjectCreation = (projectId) => {
    const project = projects.find(project => project.id === projectId);
    if (project.name.trim() === '') {
      alert('폴더명을 작성하세요.');
    } else {
      onCreateProject(project.name);
      const updatedProjects = projects.map(p => {
        if (p.id === projectId) {
          return { ...p, created: true, editable: false };
        }
        return p;
      });
      setProjects(updatedProjects);
      setEditableProjectId(null);
    }
  };

  const handleInputBlur = (projectId) => {
    const project = projects.find(project => project.id === projectId);
    if (project.name.trim() === '') {
      alert('폴더명을 작성하세요.');
    }
  };

  const handleProjectEdit = (projectId) => {
    setEditableProjectId(projectId);
    const updatedProjects = projects.map(p => {
      if (p.id === projectId) {
        return { ...p, editable: true };
      }
      return p;
    });
    setProjects(updatedProjects);
  };

  return (
    <div className="body">
      <div className="schedule">
        <div className="schedule-list">진행중인 일정</div>
        <div className="calendar">내 일정</div>
      </div>
      <div className="editBtn-section">
          <button
            onClick={() => handleProjectEdit()}
            className="editBtn"
          >
          Edit
          </button>
      </div>
      <div className="Projects">
        {projects.map(project => (
          <div key={project.id} className="project">
            <div className="inputForderName"> 
              <input
                type="text"
                value={project.name}
                readOnly={editableProjectId !== project.id}
                onChange={(e) => handleProjectNameChange(e, project.id)}
                onBlur={() => handleInputBlur(project.id)}
                className="projectNameInput"
              />
              {!project.created && (
                <button 
                  onClick={() => handleProjectCreation(project.id)}
                  className="newForderBtn"
                />
              )}
            </div>
          </div>
        ))}
        <button className="addProjectBtn" onClick={handleAddBlockClick}>
          +
        </button>
      </div>
    </div>
  );
};

export default MainBody;
