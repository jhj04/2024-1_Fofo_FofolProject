const express = require('express');
const { createProject, getProjects } = require('../controllers/projectController');
const { authenticateUser } = require('../middleware/authMiddleware');

const router = express.Router();

router.post('/projects', authenticateUser, createProject);
router.get('/projects', authenticateUser, getProjects);

module.exports = router;
