C:\Users\zaochnik\.dbclient\query\1764311684860@@127.0.0.1@5432@postgres\example.sql


CREATE Table authors(
    authors_id SERIAL PRIMARY KEY,
    authors_name VARCHAR(255) NOT NULL
);

CREATE TABLE books(
    books_id INT PRIMARY KEY,
    title TEXT NOT NULL,
    published_year INT NOT NULL,
    authors_id INT NOT NULL,
    FOREIGN KEY (authors_id) REFERENCES authors(authors_id)
);

ALTER Table books add constraint published_year check (published_year <= 2025);
ALTER Table books
drop column authors_id;

alter table books
add column genre VARCHAR(100);

CREATE Table book_authors(
    books_id int,
    authors_id int,
    PRIMARY KEY (books_id, authors_id),
    FOREIGN KEY (books_id) REFERENCES books (books_id),
    FOREIGN KEY (authors_id) REFERENCES authors(authors_id)
);
