-- Задание 1: Приведение к Первой нормальной форме (1НФ)
CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(255)
);

CREATE TABLE ProjectTeamMembers (
    project_id INT,
    team_member_name VARCHAR(255),
    PRIMARY KEY (project_id, team_member_name),
    FOREIGN KEY (project_id) REFERENCES Projects(project_id)
);

-- Задание 2: Приведение ко Второй нормальной форме (2НФ)
CREATE TABLE Clients (
    client_id INT PRIMARY KEY,
    client_name VARCHAR(255),
    client_email VARCHAR(255)
);

CREATE TABLE Equipment (
    equipment_id INT PRIMARY KEY,
    equipment_name VARCHAR(255)
);

CREATE TABLE EquipmentRentals (
    client_id INT,
    equipment_id INT,
    rental_date DATE,
    PRIMARY KEY (client_id, equipment_id),
    FOREIGN KEY (client_id) REFERENCES Clients(client_id),
    FOREIGN KEY (equipment_id) REFERENCES Equipment(equipment_id)
);

-- Задание 3 (со звездочкой): Комплексная нормализация
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(255) NOT NULL
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_professor VARCHAR(255) NOT NULL
);

CREATE TABLE Assignments (
    assignment_id INT PRIMARY KEY,
    assignment_name VARCHAR(255) NOT NULL,
    course_id INT NOT NULL,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

CREATE TABLE StudentGrades (
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    assignment_id INT NOT NULL,
    grade INT NOT NULL,
    PRIMARY KEY (student_id, course_id, assignment_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    FOREIGN KEY (assignment_id) REFERENCES Assignments(assignment_id)
);
