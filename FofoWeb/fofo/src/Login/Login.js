import React, { useState } from 'react';
import './Login.css';

const LoginPage = () => {
  const [userid, setUserid] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState('');

  const handleLogin = async () => {
    try {
      const response = await fetch('http://localhost:3000/login', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          email: userid, // Assuming userid is the email for login
          password,
        }),
      });
      if (response.ok) {
        const data = await response.json();
        setError('');
        alert('로그인 성공');
        localStorage.setItem('token', data.token); // Store the token in local storage
        // Redirect to a protected route or dashboard
      } else {
        const data = await response.json();
        setError(data.error);
      }
    } catch (error) {
      setError('로그인 중 오류가 발생했습니다.');
      console.error('Login error:', error);
    }
  };

  return (
    <div className="login-body">
      <div className="all">
        <h2>로그인</h2>
        <div className="wrapper">
          <div className="idfield">
            <label htmlFor="userid">아이디</label>
            <input
              type="text"
              id="userid"
              value={userid}
              onChange={(e) => setUserid(e.target.value)}
            />
          </div>
          <div className="passwordfield">
            <label htmlFor="password">비밀번호</label>
            <input
              type="password"
              id="password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
            />
          </div>
        </div>
        <button className="button" onClick={handleLogin}>
          로그인
        </button>
        {error && (
          <div className="error" style={{ color: 'red' }}>
            {error}
          </div>
        )}
      </div>
    </div>
  );
};

export default LoginPage;
