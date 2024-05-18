const pool = require('./config/db');

(async () => {
  try {
    const res = await pool.query('SELECT NOW()');
    console.log('Database connection successful:', res.rows);
  } catch (err) {
    console.error('Database connection error:', err.stack);
  } finally {
    pool.end();
  }
})();
