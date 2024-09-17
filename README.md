

# University Database 

## Project Overview
The **University Database** project models a comprehensive database system for managing university operations. This includes tracking information about students, courses, faculty, departments, and enrollments. The updated SQL script introduces optimizations and additional features.

## Structure of the SQL Files
Both files contain:
- **Table Creation:** Defines tables for students, faculty, departments, courses, enrollments, and grades.
- **Constraints:** Sets primary and foreign keys to maintain relationships between tables.
- **Data Insertion:** Optionally includes sample data.
  
### Differences between `university.sql` and `university updated.sql`
- **`university updated.sql`:** Adds enhancements such as improved indexing, new columns, and additional tables (e.g., student attendance or course prerequisites).

## Key Tables
- **Students Table:** Contains student information such as ID, name, major, and date of enrollment.
- **Faculty Table:** Stores faculty members’ details like name, department, and rank.
- **Courses Table:** Lists course offerings, including course codes, descriptions, and credit hours.
- **Enrollments Table:** Tracks which students are enrolled in which courses, along with grades.

## Setup Instructions
1. Ensure you have a SQL database running (MySQL, PostgreSQL, etc.).
2. Load the SQL file into the database:
   ```bash
   mysql -u username -p database_name < university.sql
   ```
   or
   ```bash
   mysql -u username -p database_name < university_updated.sql
   ```
3. Verify that all tables and relationships are properly created.

## Dependencies
- Requires a compatible SQL database engine (MySQL, PostgreSQL, etc.).

## Usage
This database can be used to perform various administrative tasks within a university system, such as:
- Tracking student enrollment.
- Managing course offerings.
- Recording and analyzing student performance.

Example query:
```sql
SELECT s.student_name, c.course_name, e.grade
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
JOIN courses c ON e.course_id = c.course_id;
```

