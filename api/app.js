const express = require('express');
const employeesRouter = require('./src/routes/employees');
const { port, host } = require('./src/config');

const app = express();
app.use(express.json());
app.use('/employees', employeesRouter);

// Root endpoint - basic info about the API
app.get('/', (req, res) => {
  res.json({ service: 'Employees API', status: 'running' });
});
app.get('/health', (req, res) => {
  res.json({ status: 'working fine' });
});

app.use((err, req, res, next) => {
  console.error(err);
  res.status(500).json({ error: 'Internal server error' });
});

app.listen(port, host, () => {
  console.log(`Server listening on http://${host}:${port}`);
  if (host === '0.0.0.0') {
    console.log(`Local: http://localhost:${port}`);
  }
});
