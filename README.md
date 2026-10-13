# EduFlow – School Management System

A web-based School ERP application developed using **Python, Django, and SQLite/MySQL-compatible database architecture** to manage school administration and academic activities through role-based dashboards.

## 📌 Overview

EduFlow is a School Enterprise Resource Planning (ERP) system designed to digitize school operations, simplify academic management, and improve coordination between administrators, teachers, students, and parents.

The application provides a centralized platform for managing admissions, homework, assignment submissions, attendance, and student academic performance.

## ✨ Key Features

- **Role-Based Dashboards:** Separate access for Admin, Principal, Teacher, Student, and Parent.
- **User Authentication:** Secure login and role-based access control.
- **Admission Management:** Manage student admission applications and their status.
- **Homework Management:** Teachers can create and manage homework assignments.
- **Assignment Submission:** Students can upload assignment files.
- **Attendance Management:** Maintain and monitor student attendance.
- **Marks Management:** Record and view student examination marks.
- **Parent Monitoring:** Parents can monitor their child's academic progress.
- **Database Management:** Store and retrieve academic records.
- **File Management:** Organize homework attachments and student submissions.

## 🛠️ Technology Stack

| Component | Technology |
|---|---|
| Backend | Python, Django |
| Frontend | HTML5, CSS3, Bootstrap |
| Database | SQLite/MySQL, depending on configuration |
| Architecture | Django MVT |
| Version Control | Git, GitHub |
| Development Environment | Visual Studio Code |

## 👥 User Roles

| Role | Responsibilities |
|---|---|
| Admin | User management and administrative operations |
| Principal | Monitor academic activities and school performance |
| Teacher | Manage homework, attendance, marks, and submissions |
| Student | View homework and submit assignments |
| Parent | Monitor student attendance and academic progress |

## 🏗️ Project Structure

```text
School_Management_System/
│
├── academics/
├── accounts/
├── eduflow/
├── homework_files/
├── media/
├── templates/
├── manage.py
├── db.sqlite3
├── ed.sql
└── README.md
```

*The structure above reflects the folders and files visible in the repository. Additional files may exist inside the directories.*

## ⚙️ Installation and Setup

### 1. Clone the repository

```bash
git clone https://github.com/vkvinodhkumar/School_Management_System.git
cd School_Management_System
```

### 2. Create a virtual environment

```bash
python -m venv venv
```

Activate it on Windows:

```powershell
.\venv\Scripts\Activate.ps1
```

### 3. Install dependencies

If `requirements.txt` is available:

```bash
pip install -r requirements.txt
```

Otherwise, install Django and the database driver required by your project configuration.

### 4. Apply database migrations

```bash
python manage.py migrate
```

### 5. Create an administrator account

```bash
python manage.py createsuperuser
```

### 6. Run the development server

```bash
python manage.py runserver
```

Open the application at:

http://127.0.0.1:8000/

Django administration is generally available at:

http://127.0.0.1:8000/admin/

## 🔐 Security

- Authentication and role-based authorization.
- Server-side permission validation.
- Django CSRF protection.
- Database credential protection.
- Validation of uploaded files and user inputs.

Security controls should be verified against the actual implementation before deployment.

## 🚀 Future Enhancements

- Cloud deployment.
- Email and SMS notifications.
- Advanced academic reports and analytics.
- Automated testing and continuous integration.
- Improved dashboard visualizations.

## 🎓 Project Information

- **Project Name:** EduFlow
- **Project Type:** School Management System
- **Degree:** Bachelor of Computer Applications (BCA)
- **Institution:** Guru Nanak College (Autonomous), Chennai
- **Academic Year:** 2025–2026
- **Developer:** Vinodh Kumar P

## 👨‍💻 Author

**Vinodh Kumar P**

- GitHub: [@vkvinodhkumar](https://github.com/vkvinodhkumar)
- LinkedIn: [Vinodh Kumar](https://www.linkedin.com/in/vinodh-kumar-4b945931b/)

---

*EduFlow aims to simplify school administration through centralized data management, academic workflows, and role-based access.*
