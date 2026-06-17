const pool = require('../db');

async function getAllEmployees() {
  const [rows] = await pool.query(
    `SELECT id,
      person_id,
      name,
      email,
      department,
      role,
      project,
      project_name,
      recent_feedback,
      business_unit_head,
      business_unit_head_role
     FROM employees`
  );
  return rows;
}

module.exports = {
  getAllEmployees,
};
