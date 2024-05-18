const express = require('express');
const router = express.Router();
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const pool = require('../config/db');

// Login route
router.post('/login', async (req, res) => {
    const { email, password } = req.body;
    try {
        const user = await pool.query('SELECT * FROM users WHERE email = $1', [email]);
        if (user.rows.length > 0) {
            const validPassword = await bcrypt.compare(password, user.rows[0].password);
            if (validPassword) {
                const token = jwt.sign({ userId: user.rows[0].id }, 'your_secret_key', { expiresIn: '1h' });
                res.status(200).json({ token: token });
            } else {
                res.status(400).send('Invalid Credentials');
            }
        } else {
            res.status(400).send('Invalid Credentials');
        }
    } catch (error) {
        console.error(error.message);
        res.status(500).send('Server Error');
    }
});

module.exports = router;
