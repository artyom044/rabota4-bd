CREATE TABLE Students (
    student_id SERIAL PRIMARY KEY, -- Уникальный идентификатор студента
    full_name VARCHAR(255) NOT NULL, -- Полное имя студента
    email VARCHAR(255) UNIQUE NOT NULL, -- Электронная почта студента (должна быть уникальной)
    start_year INT -- Год поступления студента
);

CREATE TABLE Courses (
    course_id SERIAL PRIMARY KEY, -- Уникальный идентификатор курса
    course_name VARCHAR(255) NOT NULL, -- Название курса
    credits INT CHECK (credits > 0) -- Количество зачетных единиц курса (должно быть больше 0)
);

CREATE TABLE Enrollments (
    student_id INT REFERENCES Students(student_id) ON DELETE CASCADE, -- Ссылка на ID студента (внешний ключ)
    course_id INT REFERENCES Courses(course_id) ON DELETE CASCADE, -- Ссылка на ID курса (внешний ключ)
    grade CHAR(1), -- Оценка студента за курс (например, 'A', 'B', 'C')
    PRIMARY KEY (student_id, course_id)
);

INSERT INTO Students VALUES (DEFAULT, 'Алексей Смирнов', 'smirnov@mail.ru', 2021), 
(DEFAULT, 'Елена Кузнецова', 'kuznez@mail.ru', 2022),
(DEFAULT, 'Дмитрий Новиков', 'novikov@mail.ru', 2021),
(DEFAULT, 'Ольга Морозова', 'morozova@mail.ru', 2023);

INSERT INTO Courses VALUES (DEFAULT, 'Введение в программирование', 5),
(DEFAULT, 'База данных', 4),
(DEFAULT, 'Веб-технологии', 4);

INSERT INTO Enrollments (student_id, course_id, grade) VALUES (1,2,'A'),
(2,2,'B'),
(2,3,'A'),
(3,1, NULL),
(3,2, NULL),
(3,3, NULL);

UPDATE Students set email = 'elena.kuznetsova@newmail.com' WHERE full_name = 'Елена Кузнецова';

UPDATE Enrollments set grade = 'A' WHERE student_id = 3 AND course_id = 1;

DELETE FROM Students where email = 'morozova@mail.ru';
