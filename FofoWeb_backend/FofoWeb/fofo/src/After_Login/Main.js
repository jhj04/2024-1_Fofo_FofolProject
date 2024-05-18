//메인 페이지 화면

import Main_body from "./Main_body";
import Main_nav from "./Main_nav";
import './Main.css';

const Main = () => {
    return <div className="main-container">
        <div className="nav">
            <Main_nav />
        </div>
        <div className="body">
            <Main_body />
        </div>
    </div>
}

export default Main;