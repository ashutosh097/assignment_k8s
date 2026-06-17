const { getAllEmployees } = require('../services/employeeService');

async function listEmployees(req, res, next) {
  try {
    const employees = await getAllEmployees();
    res.json(employees);
  } catch (error) {
    next(error);
  }
}

module.exports = {
  listEmployees,
};
