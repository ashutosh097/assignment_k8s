const fs = require('fs');
const path = require('path');
const pool = require('./src/db');

async function initDB() {
  const schema = fs.readFileSync(path.join(__dirname, '../database/schema.sql'), 'utf8');
  const statements = schema
    .split(';')
    .map((s) => s.trim())
    .filter(Boolean);

  for (const statement of statements) {
    if (!statement) continue;
    try {
      await pool.query(statement);
    } catch (err) {
      if (!['ER_DB_CREATE_EXISTS', 'ER_DUP_FIELDNAME'].includes(err.code)) {
        console.error('Schema error:', err.message);
      }
    }
  }

  const [rows] = await pool.query('SELECT COUNT(*) AS count FROM employees');
  console.log(`Employees in DB: ${rows[0].count}`);
  process.exit(0);
}

initDB();
