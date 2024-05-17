import React, { useState } from 'react';
import './Signup.css';

const SignupPage = () => {
  const [username, setUsername] = useState('');
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [userid, setUserid] = useState('');
  const [confirmPassword, setConfirmPassword] = useState('');
  const [error, setError] = useState('');

  const handleSubmit = async (e) => {
    e.preventDefault();
    if (password !== confirmPassword) {
      setError('비밀번호가 일치하지 않습니다.');
    } else {
      try {
        const response = await fetch('http://localhost:3000/signup', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({
            username,
            email,
            password,
            userid,
          }),
        });
        if (response.ok) {
          setError('');
          alert('회원가입이 완료되었습니다!');
          setUsername('');
          setEmail('');
          setPassword('');
          setUserid('');
          setConfirmPassword('');
        } else {
          const data = await response.json();
          setError(data.error);
        }
      } catch (error) {
        setError('회원가입 중 오류가 발생했습니다.');
        console.error('Signup error:', error);
      }
    }
  };

  return (
    <div className="signup-body">
      <div className="all">
        <h2>회원가입</h2>
        <form onSubmit={handleSubmit}>
          <div className="wrapper">
            <div className="name">
              <label htmlFor="username">이름</label>
              <input
                type="text"
                id="username"
                value={username}
                onChange={(e) => setUsername(e.target.value)}
              />
            </div>
            <div className="email">
              <label htmlFor="email">이메일</label>
              <input
                type="email"
                id="email"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
              />
            </div>
            <div className="id">
              <label htmlFor="userid">아이디</label>
              <input
                type="text"
                id="userid"
                value={userid}
                onChange={(e) => setUserid(e.target.value)}
              />
            </div>
            <div className="password">
              <label htmlFor="password">비밀번호</label>
              <input
                type="password"
                id="password"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
              />
            </div>
            <div className="confirm">
              <label htmlFor="confirmPassword">비밀번호 확인</label>
              <input
                type="password"
                id="confirmPassword"
                value={confirmPassword}
                onChange={(e) => setConfirmPassword(e.target.value)}
              />
            </div>
          </div>
          <button className="button" type="submit">
            회원가입
          </button>
          {error && <div style={{ color: 'red' }}>{error}</div>}
        </form>
      </div>
    </div>
  );
};

export default SignupPage;

