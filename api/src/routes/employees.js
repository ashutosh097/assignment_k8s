const express = require('express');
const { listEmployees } = require('../controllers/employeesController');

const router = express.Router();
router.get('/', listEmployees);

module.exports = router;
