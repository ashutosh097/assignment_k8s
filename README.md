# Employees API (Node.js + MySQL)

This workspace contains a refactored Express API that reads employee records from a MySQL database using `mysql2`.

## Project structure

- `api/app.js` — API entrypoint with routes and error handling
- `api/src/config.js` — environment configuration
- `api/src/db.js` — reusable MySQL connection pool
- `api/src/routes/employees.js` — employee route definitions
- `api/src/controllers/employeesController.js` — request controller
- `api/src/services/employeeService.js` — business logic and database queries
- `database/schema.sql` — MySQL schema and sample data

## Local setup

1. Install API dependencies:

```bash
cd api
npm install
```

2. Copy environment variables:

```bash
cp api/.env.example api/.env
```

3. Start or configure MySQL, then import the schema:

```bash
mysql -u root -p < database/schema.sql
```

4. Start the API:

```bash
cd api
node app.js
```

5. Check the endpoint:

```bash
curl http://localhost:3000/employees
```

## Notes

- Add sensitive credentials to `api/.env` only; do not commit `.env`.
- Use `curl http://localhost:3000/health` to verify the server is healthy.
