const pool = require('../config/db');

class User {
  static async findByEmail(email) {
    const query = 'SELECT * FROM users WHERE email = $1';
    const { rows } = await pool.query(query, [email]);
    return rows[0];
  }

  static async create({ username, email, password, userid }) {
    const query =
      'INSERT INTO users (username, email, password, userid) VALUES ($1, $2, $3, $4) RETURNING *';
    const { rows } = await pool.query(query, [
      username,
      email,
      password,
      userid,
    ]);
    return rows[0];
  }
}

module.exports = User;
