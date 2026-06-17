-- Create database and employees table for MySQL
CREATE DATABASE IF NOT EXISTS employees_db;
USE employees_db;

CREATE TABLE IF NOT EXISTS employees (
  id INT AUTO_INCREMENT PRIMARY KEY,
  person_id VARCHAR(50) NOT NULL UNIQUE,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  department VARCHAR(255),
  role ENUM(
    'Associate Engineer',
    'Engineer',
    'Senior Engineer',
    'Associate Staff Engineer',
    'Staff Engineer',
    'Senior Staff Engineer'
  ) NOT NULL DEFAULT 'Engineer',
  project VARCHAR(100),
  project_name VARCHAR(255),
  recent_feedback VARCHAR(255),
  business_unit_head VARCHAR(255),
  business_unit_head_role VARCHAR(255)
);

INSERT INTO employees (
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
) VALUES
('P1001', 'Alice Smith', 'alice@naggaro.com', 'Engineering', 'Associate Engineer', 'NAG-Alpha', 'Alpha Platform', 'Excellent', 'Nina Patel', 'VP Engineering'),
('P1002', 'Bob Jones', 'bob@naggaro.com', 'Sales', 'Engineer', 'NAG-Sales', 'Sales Growth', 'Good', 'Ravi Kumar', 'Head of Sales'),
('P1003', 'Carol Lee', 'carol@naggaro.com', 'HR', 'Senior Engineer', 'NAG-HR', 'HR Analytics', 'Satisfactory', 'Mira Singh', 'Head of HR'),
('P1004', 'David Chen', 'david@naggaro.com', 'Infrastructure', 'Senior Staff Engineer', 'NAG-Core', 'Core Platform', 'Outstanding', 'Asha Mehta', 'Chief Technology Officer')
,
('P1005', 'Liam OConnor', 'liam@naggaro.com', 'Design', 'Engineer', 'NAG-Design', 'Design System', 'Very Good', 'Sanjay Rao', 'Director Design'),
('P1006', 'Aarav Patel', 'aarav@naggaro.com', 'Product', 'Associate Engineer', 'NAG-Prod', 'Product Suite', 'Promising', 'Priya Menon', 'VP Product'),
('P1007', 'Maya Johnson', 'maya@naggaro.com', 'QA', 'Staff Engineer', 'NAG-QA', 'Quality Platform', 'Solid', 'John Doe', 'Head of QA'),
('P1008', 'Noah Williams', 'noah@naggaro.com', 'Marketing', 'Engineer', 'NAG-Marketing', 'Campaign Analytics', 'Good', 'Sonal Gupta', 'Head Marketing'),
('P1009', 'Priya Sharma', 'priya@naggaro.com', 'Data', 'Senior Engineer', 'NAG-Data', 'Data Platform', 'Excellent', 'Rahul Verma', 'Head Data'),
('P1010', 'Lucas Müller', 'lucas@naggaro.com', 'Security', 'Associate Staff Engineer', 'NAG-Sec', 'Security Core', 'Very Good', 'Anita Desai', 'Chief Security Officer'),
('P1011', 'Isha Kapoor', 'isha@naggaro.com', 'Operations', 'Staff Engineer', 'NAG-Ops', 'Operations Engine', 'Solid', 'Manish Singh', 'Head Operations'),
('P1012', 'Olivia Brown', 'olivia@naggaro.com', 'Support', 'Engineer', 'NAG-Support', 'Support Portal', 'Satisfactory', 'Karan Mehra', 'Head Support')
ON DUPLICATE KEY UPDATE id=id;
