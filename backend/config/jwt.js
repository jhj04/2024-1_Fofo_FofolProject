const jwt = require('jsonwebtoken');
require('dotenv').config();

const generateToken = (user) => {
  return jwt.sign({ id: user.id, email: user.email }, process.env.SECRET_KEY, {
    expiresIn: '1h',
  });
};

const verifyToken = (token) => {
  return jwt.verify(token, process.env.SECRET_KEY);
};

module.exports = { generateToken, verifyToken };
