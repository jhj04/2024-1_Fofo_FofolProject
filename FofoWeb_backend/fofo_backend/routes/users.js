const express = require('express');
const router = express.Router();
const pool = require('../config/db'); // Database connection setup

// Get all users
router.get('/', async (req, res) => {
    try {
        const result = await pool.query('SELECT * FROM users');
        res.status(200).json(result.rows);
    } catch (error) {
        console.error(error.message);
        res.status(500).send('Error retrieving users');
    }
});

// Additional CRUD operations here...

module.exports = router;
