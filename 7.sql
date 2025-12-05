CREATE TABLE Students (
    student_id SERIAL PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    start_year INT NOT NULL
);

CREATE TABLE Courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(255) NOT NULL,
    credits INT CHECK (credits > 0)
);

CREATE TABLE Enrollments (
    student_id INT REFERENCES Students(student_id) ON DELETE CASCADE,
    course_id INT REFERENCES Courses(course_id) ON DELETE CASCADE,
    grade CHAR(1),
    PRIMARY KEY (student_id, course_id)
);

INSERT INTO students VALUES 
(DEFAULT, 'Алексей Смирнов', 'smir@exemple.com', 2021),
(DEFAULT, 'Елена Кузнецова', 'elena@exempl.com', 2022),
(DEFAULT, 'Дмитрий Новиков', 'dimanov@exempl.com', 2021),
(DEFAULT, 'Ольга Морозова', 'moroz_olga@exemple.com', 2023);

INSERT INTO courses VALUES 
(DEFAULT, 'Введение в программирование', 5),
(DEFAULT, 'Базы данных', 4),
(DEFAULT, 'Веб-технологии', 4);

INSERT INTO enrollments VALUES 
(1, 2, 'A'), 
(2, 2, 'B'), 
(2, 3, 'A'), 
(3, 1, NULL), 
(3, 2, NULL), 
(3, 3, NULL);

UPDATE students 
SET email = 'elena.kuznetsova@newmail.com' 
WHERE student_id = 2;

UPDATE enrollments
set grade = 'A'
WHERE student_id = 3 AND course_id = 1;

DELETE FROM students
WHERE student_id = 4;

----------------------------------------------------------------------

SELECT * FROM students;
SELECT course_name, credits FROM courses;
SELECT * FROM students WHERE start_year = 2021;
SELECT * FROM courses WHERE credits > 4;
SELECT * FROM students WHERE email = 'elena.kuznetsova@newmail.com';
SELECT * FROM students WHERE full_name LIKE '%Дмитрий%';
SELECT * FROM enrollments WHERE grade IS NULL;
SELECT * FROM courses ORDER BY course_name;
SELECT * FROM students ORDER BY start_year, full_name;
SELECT * FROM students ORDER BY start_year DESC LIMIT 2;
