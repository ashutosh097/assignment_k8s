const mysql = require('mysql2/promise');
const { db } = require('./config');

const pool = mysql.createPool(db);

pool.on('connection', () => {
  console.log('MySQL connection established');
});

module.exports = pool;
