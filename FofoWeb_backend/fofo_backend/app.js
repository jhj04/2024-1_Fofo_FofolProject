const express = require('express');
const app = express();

app.use(express.json());

const usersRoutes = require('./routes/users');
const authRoutes = require('./routes/auth');

app.use('/users', usersRoutes);
app.use('/auth', authRoutes);

app.get('/', (req, res) => {
    res.status(200).send('Welcome to the API');
});

app.listen(3003, () => {
    console.log('Server running on http://localhost:3003');
  });
