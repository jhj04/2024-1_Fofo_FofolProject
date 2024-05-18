//메인 페이지 화면

import Main_body from "./Main_body";
import Main_leftnav from "./Main_leftnav";
// import Main_rightnav from "./Main_rightnav";
import './Main.css';

const Main = () => {
    return <div className="main-container">
        <div className="leftnav">
            <Main_leftnav />
        </div>
        <div className="body">
            <Main_body />
        </div>
        {/* <div className="rightnav">
            <Main_rightnav />
        </div> */}
    </div>
}

export default Main;