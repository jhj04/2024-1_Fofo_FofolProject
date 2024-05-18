const pool = require('../config/db');

class Project {
  static async create({ projectname, period, stack, role, field, explain, explainmore }) {
    const query = `
      INSERT INTO projects (projectname, period, stack, role, field, explain, explainmore)
      VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING *`;
    const { rows } = await pool.query(query, [
      projectname,
      period,
      stack,
      role,
      field,
      explain,
      explainmore,
    ]);
    return rows[0];
  }

  static async getAll() {
    const query = 'SELECT * FROM projects';
    const { rows } = await pool.query(query);
    return rows;
  }
}

module.exports = Project;
