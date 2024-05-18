const express = require('express');
const { getUsers } = require('../controllers/userController');
const { authenticateUser } = require('../middleware/authMiddleware');

const router = express.Router();

router.get('/users', authenticateUser, getUsers);

module.exports = router;
