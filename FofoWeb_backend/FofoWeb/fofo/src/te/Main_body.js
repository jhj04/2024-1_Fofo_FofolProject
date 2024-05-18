//메인화면 body
import React, { useEffect, useRef, useState } from "react";
import './Main_body.css';

const Main_body = () => {
    const [dragging, setDragging] = useState(false);
    const [startX, setStartX] = useState(0);
    const [scrollLeft, setScrollLeft] = useState(0);
    const writeRef = useRef(null);
    const [content, setContent] = useState(""); // 서버에서 내용 가져오는 거 처리

    const handleMouseDown = (e) => {
        setDragging(true);
        setStartX(e.pageX - writeRef.current.offsetLeft);
        setScrollLeft(writeRef.current.scrollLeft);
    };

    const handleMouseMove = (e) => {
        if (!dragging) return;
        const x = e.pageX - writeRef.current.offsetLeft;
        const scrollX = x - startX;
        writeRef.current.scrollLeft = scrollLeft - scrollX;
    };

    const handleMouseUp = () => {
        setDragging(false);
    };

    const handleSearch = (e) => {
        //아직 미구현
    }

    useEffect(() => {}, []); //서버에서 데이터 가져오는 거, 아직 백을 잘 몰라서...

    //글 담는 container
    return <div className="main-content-container" ref={writeRef} onMouseDown={handleMouseDown} onMouseMove={handleMouseMove} onMouseUp={handleMouseUp}>  
        {/* 메인 페이지에 어떤 형식으로..? */}
        {/* 그리고 서버에서 글 불러오는 건 어디까지가 아노 파트..? */}
        <h2>누구누구의 포트폴리오</h2>
        {/* 이건 뭘까 검색바? */}
        <div className="searchBar">
            {/* 누구누구의 포트폴리오 검색(누구누구의 포트폴리오라는 건 그 웹 사이트 제목? 별명임) 검색 바 */}
            <input type="text" placeholder="누구누구의 포트폴리오 검색" onChange={handleSearch} />
            <button onClick={handleSearch}>검색</button>
        </div>
        <p>bbbbbrrrrr</p><br></br>
        <p>bbbbbrrrrr</p><br></br>
        <p>bbbbbrrrrr</p><br></br>
        <p>bbbbbrrrrr</p><br></br>
        <p>bbbbbrrrrr</p><br></br>
        <p>bbbbbrrrrr</p><br></br>
        <p>bbbbbrrrrr</p><br></br>
        <p>bbbbbrrrrr</p><br></br>
        <p>bbbbbrrrrr</p><br></br>
        <p>bbbbbrrrrr</p><br></br>
        <div className="content-container">
        <div dangerouslySetInnerHTML={{ __html: content }} /> 
        {/* React에서 HTML 코드를 동적렌더링할 때 필요하다는데, 음... 이 코드 사용 말고 다른 거 하는 거일 듯.. 우리 html로 불러오는 건가..? */}
        </div>
    </div>
}

export default Main_body;