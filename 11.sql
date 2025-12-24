--функциональные зависимости: title, publisher_id, publisher_name, publisher_city от book_id; author_name от authors_id; publisher_name, publisher_city от publisher_id
--нарушение 3НФ, потому что publisher_name и publisher_city зависят не напрямую от первичного ключа (book_id), а через промежуточный атрибут publisher_id.
CREATE TABLE publishers (
    publisher_id int PRIMARY KEY,
    publisher_name VARCHAR(255),
    peblisher_city VARCHAR(100)
);

CREATE Table books (
    book_id int PRIMARY KEY,
    title VARCHAR(255),
    publisher_id int,
    Foreign Key (publisher_id) REFERENCES publishers(publisher_id)
);

CREATE Table authors (
    authors_id int PRIMARY key,
    author_name VARCHAR(255)
);

CREATE Table books_authors (
    book_id int,
    authors_id int,
    PRIMARY KEY (book_id,authors_id),
    Foreign Key (book_id) REFERENCES books(book_id),
    Foreign Key (authors_id) REFERENCES authors(authors_id)
);

--функциональные зависимости: (race_id, driver_id) для car_model, car_manufacturer, finish_time; 
--нарушение 3НФ, потому что (race_id, driver_id) от car_model от car_manufacturer
CREATE TABLE Cars (
    car_model VARCHAR(100) PRIMARY KEY,
    car_manufacturer VARCHAR(100)
);
CREATE TABLE RaceResults (
    race_id INT,
    driver_id INT,
    finish_time TIME,
    car_model VARCHAR(100),
    PRIMARY KEY (race_id, driver_id),
    FOREIGN KEY (car_model) REFERENCES Cars(car_model)
);

--нарушает нфбк, потому что event_type — НЕ суперключ (не является ни (booking_time, room_name), ни (booking_time, event_name)); 
--event_type — НЕ является надмножеством какого-либо ключа;Но существует зависимость event_type → room_name, где event_type — не ключ
CREATE TABLE Rooms (
    room_id INT PRIMARY KEY,
    room_name VARCHAR(50)
);
CREATE TABLE RoomBookings (
    booking_id INT PRIMARY KEY,
    room_id INT NOT NULL,
    booking_time DATE,
    event_type status_type,
    Foreign Key (room_id) REFERENCES Rooms(room_id)
);
CREATE TYPE status_type AS ENUM ('Встреча', 'Презентация');
