-- Sample data for the "demo" profile (in-memory H2).
-- Loaded after Hibernate creates the tables; everything resets on restart.
-- All companies, people and jobs below are fictional.

INSERT INTO users_type (user_type_name) VALUES ('Recruiter'), ('Job Seeker');

-- Demo accounts. Password for both: demo1234 (BCrypt-hashed)
INSERT INTO users (email, password, is_active, registration_date, user_type_id) VALUES
  ('recruiter@demo.com', '$2b$10$abJ1HNLbAQGvedE682lIlefHa9Z6rI9bhIXBSLGXS3uS8006QfNIq', TRUE, CURRENT_TIMESTAMP, 1),
  ('candidate@demo.com', '$2b$10$abJ1HNLbAQGvedE682lIlefHa9Z6rI9bhIXBSLGXS3uS8006QfNIq', TRUE, CURRENT_TIMESTAMP, 2);

INSERT INTO recruiter_profile (user_account_id, first_name, last_name, city, state, country, company) VALUES
  (1, 'Riya', 'Sharma', 'Bangalore', 'Karnataka', 'India', 'Nimbus Labs');

INSERT INTO job_seeker_profile (user_account_id, first_name, last_name, city, state, country, employment_type) VALUES
  (2, 'Arjun', 'Mehta', 'Pune', 'Maharashtra', 'India', 'Full-Time');

INSERT INTO skills (name, experience_level, years_of_experience, job_seeker_profile) VALUES
  ('Java', 'Advance', '3', 2),
  ('Spring Boot', 'Intermediate', '2', 2),
  ('Angular', 'Intermediate', '2', 2);

INSERT INTO job_company (name, logo) VALUES
  ('Nimbus Labs', ''), ('Orbit Fintech', ''), ('GreenLeaf Health', ''), ('Craftly', '');

INSERT INTO job_location (city, state, country) VALUES
  ('Bangalore', 'Karnataka', 'India'),
  ('Pune', 'Maharashtra', 'India'),
  ('Hyderabad', 'Telangana', 'India'),
  ('Remote', 'Remote', 'India');

INSERT INTO job_post_activity (job_title, job_type, remote, salary, description_of_job, posted_date, posted_by_id, job_company_id, job_location_id) VALUES
  ('Java Full Stack Developer', 'Full-time', 'Partial-Remote', '₹18–24 LPA',
   '<p>Build features end to end across our Spring Boot services and Angular front end.</p><ul><li>3+ years with Java and Spring Boot</li><li>Comfortable with REST APIs, JPA and MySQL</li><li>Angular or another modern front-end framework</li></ul>',
   DATEADD('DAY', -1, CURRENT_TIMESTAMP), 1, 1, 1),
  ('Angular Frontend Engineer', 'Full-time', 'Remote-Only', '₹12–16 LPA',
   '<p>Own the customer dashboard of a payments product.</p><ul><li>Angular, TypeScript and RxJS</li><li>Accessibility and performance mindset</li></ul>',
   DATEADD('DAY', -3, CURRENT_TIMESTAMP), 1, 2, 2),
  ('Spring Boot Backend Intern', 'Internship', 'Office-Only', '₹35,000 / month',
   '<p>Six-month internship working on microservices with a senior mentor.</p><ul><li>Core Java and OOP fundamentals</li><li>Basic SQL</li></ul>',
   DATEADD('DAY', -6, CURRENT_TIMESTAMP), 1, 1, 1),
  ('DevOps Engineer (AWS)', 'Full-time', 'Office-Only', '₹15–20 LPA',
   '<p>Automate deployments and keep our healthcare platform reliable.</p><ul><li>AWS ECS, Docker and CI/CD pipelines</li><li>Monitoring and incident response</li></ul>',
   DATEADD('DAY', -12, CURRENT_TIMESTAMP), 1, 3, 3),
  ('Freelance UI Developer', 'Freelance', 'Remote-Only', '₹1,500 / hour',
   '<p>Turn Figma designs into responsive pages for small-business clients.</p><ul><li>HTML, CSS and JavaScript</li><li>Bootstrap or Tailwind</li></ul>',
   DATEADD('DAY', -20, CURRENT_TIMESTAMP), 1, 4, 4),
  ('QA Automation Engineer', 'Part-time', 'Partial-Remote', '₹8–10 LPA',
   '<p>Grow our automated test suite for web and API layers.</p><ul><li>JUnit, Mockito and Selenium</li><li>Postman or REST Assured</li></ul>',
   DATEADD('DAY', -40, CURRENT_TIMESTAMP), 1, 2, 2);

-- The demo candidate has applied to one job and saved another
INSERT INTO job_seeker_apply (user_id, job, apply_date, cover_letter) VALUES (2, 2, CURRENT_TIMESTAMP, '');
INSERT INTO job_seeker_save (user_id, job) VALUES (2, 1);
