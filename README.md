# 💼 Job Portal Application

A **full-stack job portal** built with **Spring Boot**, **Spring Security** and **Thymeleaf** that connects **recruiters** and **job seekers**.
Recruiters post jobs and track applicants; candidates search, apply for and save jobs, all in one place.

[![Deploy to Render](https://render.com/images/deploy-to-render-button.svg)](https://render.com/deploy?repo=https://github.com/Shibani58/Job-Portal-Application)

---

## 🔑 Try the demo

The live demo runs with sample data and two ready-made accounts (the login page has one-click buttons for them):

| Role | Email | Password |
|---|---|---|
| Recruiter | `recruiter@demo.com` | `demo1234` |
| Job seeker | `candidate@demo.com` | `demo1234` |

Demo data resets whenever the app restarts. On the free hosting plan the app sleeps when idle, so the first visit can take about a minute.

---

## 🚀 Features

### 👤 User management
- Role-based access for **recruiters** and **job seekers** (Spring Security, BCrypt passwords)
- Registration, login and logout
- Personalised dashboard for each role

### 💼 Recruiters
- Recruiter profile with photo upload
- Post and edit job listings (rich-text descriptions)
- Dashboard showing each job with its number of applicants
- Download candidates' résumés

### 👩‍💻 Job seekers
- Profile with skills, photo and résumé upload
- Search jobs by title and location, and filter by employment type, remote policy and posting date
- Apply for jobs and save jobs for later

### 🔍 Global search
- Public job search that works without signing in

---

## 🛠️ Tech stack

- **Backend:** Java 21, Spring Boot 3.5 (Spring MVC, Spring Data JPA / Hibernate, Spring Security, Bean Validation)
- **Frontend:** Thymeleaf, Bootstrap 5, JavaScript
- **Database:** MySQL 8 (H2 in-memory for the demo profile)
- **Build & deploy:** Maven, Docker, Render

---

## ▶️ Run locally

**Quick start (no database to install).** The `demo` profile uses an in-memory H2 database with sample data:

```bash
./mvnw spring-boot:run -Dspring-boot.run.profiles=demo
```

**With MySQL.** Create the database user and schema with the scripts in [`database/`](database), then run:

```bash
mysql -u root -p < database/00-create-user.sql
mysql -u root -p < database/01-jobportal-schema.sql
./mvnw spring-boot:run
```

Open http://localhost:8080.

### Configuration

| Variable | Default | Purpose |
|---|---|---|
| `DB_URL` | `jdbc:mysql://localhost:3306/jobportal` | MySQL connection URL |
| `DB_USERNAME` / `DB_PASSWORD` | `jobportal` / `jobportal` | MySQL credentials |
| `PORT` | `8080` | HTTP port |
| `SPRING_PROFILES_ACTIVE` | *(none)* | Set to `demo` for the in-memory database with sample data |

---

## ☁️ Deployment

The repo includes a [`Dockerfile`](Dockerfile) and a Render Blueprint ([`render.yaml`](render.yaml)) that runs the app on Render's free plan with the `demo` profile. Click **Deploy to Render** above, sign in with GitHub and apply the Blueprint.

---

## 🙏 Credits

Built while following the Spring Boot job portal course by **Chad Darby ([luv2code](https://www.luv2code.com))**. The original course code is © luv2code LLC and is used under the course's license.

My additions on top of the course project:
- An in-memory `demo` profile with sample data and one-click demo logins
- Docker image and Render deployment for a live demo
- Environment-variable configuration for the database and port
- A portable `GROUP BY` in the recruiter-dashboard query, and a fix for global search crashing for signed-in recruiters
