const path = require('path');
const dotenv = require('dotenv');

const envFile = path.resolve(__dirname, '../.env');
dotenv.config({ path: envFile });

const requiredEnv = ['DB_HOST', 'DB_PORT', 'DB_USER', 'DB_PASSWORD', 'DB_NAME', 'PORT'];
const missingEnv = requiredEnv.filter((name) => !process.env[name]);
if (missingEnv.length > 0) {
  console.warn(`Warning: Missing env vars: ${missingEnv.join(', ')}. Default values or fallback behavior may be used.`);
}

module.exports = {
  host: process.env.HOST || '0.0.0.0',
  port: Number(process.env.PORT || 3000),
  db: {
    host: process.env.DB_HOST || '127.0.0.1',
    port: Number(process.env.DB_PORT || 3306),
    user: process.env.DB_USER || 'root',
    password: process.env.DB_PASSWORD || '',
    database: process.env.DB_NAME || 'employees_db',
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0,
  },
};
