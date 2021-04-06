CREATE DATABASE IF NOT EXISTS design_test_db;

USE design_test_db;

DROP TABLE IF EXISTS quote_topic;
DROP TABLE IF EXISTS quotes;
DROP TABLE IF EXISTS topics;
DROP TABLE IF EXISTS authors;


CREATE TABLE quotes
(
    id                INT UNSIGNED NOT NULL AUTO_INCREMENT,
    author_first_name VARCHAR(50) DEFAULT 'NONE',
    author_last_name  VARCHAR(100) NOT NULL,
    content           TEXT         NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE authors
(
    id                INT UNSIGNED NOT NULL AUTO_INCREMENT,
    author_first_name VARCHAR(50) DEFAULT 'NONE',
    author_last_name  VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);


ALTER TABLE quotes
    DROP COLUMN author_first_name;
ALTER TABLE quotes
    DROP COLUMN author_last_name;
ALTER TABLE quotes
    ADD COLUMN author_id INT UNSIGNED NOT NULL;
ALTER TABLE quotes
    ADD FOREIGN KEY (author_id) REFERENCES authors (id) ON DELETE NO ACTION ON UPDATE CASCADE;


SELECT *
FROM quotes;

SELECT *
FROM authors;


INSERT INTO authors(author_first_name, author_last_name)
VALUES ('Khalil', 'Gibran'),
       ('Richard', 'Branson'),
       ('Henry', 'Thoreau');



INSERT INTO quotes(content, author_id)
VALUES ('“I have found both freedom and safety in my madness; the freedom of loneliness and the safety from being understood, for those who understand us enslave something in us.”',
        1),
       ('“Business opportunities are like buses, there’s always another one coming.”', 2),
       ('“Success usually comes to those who are too busy to be looking for it.”', 3);

SELECT q.content
FROM quotes as q
         JOIN authors as a ON q.author_id = a.id
WHERE author_last_name = 'Branson';



CREATE TABLE topics
(
    id   INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO topics(name)
VALUES ('Business'),
       ('Motivation'),
       ('Poetry'),
       ('Self-help'),
       ('Entrepreneurship');

SELECT *
FROM topics;

CREATE TABLE quote_topic
(
    quote_id INTEGER UNSIGNED NOT NULL,
    topic_id INTEGER UNSIGNED NOT NULL,
    FOREIGN KEY (quote_id) REFERENCES quotes (id),
    FOREIGN KEY (topic_id) REFERENCES topics (id)
);

INSERT INTO quote_topic(quote_id, topic_id)
VALUES (1, 2),
       (1, 3),
       (1, 4),
       (2, 1),
       (2, 2),
       (2, 5),
       (3, 1),
       (3, 2),
       (3, 4),
       (3, 5);

SELECT *
FROM quote_topic;

SELECT q.content AS Quote, CONCAT(a.author_first_name, ' ', a.author_last_name) AS 'Full name', t.name AS Topic
FROM quotes as q
         JOIN quote_topic as qt on q.id = qt.quote_id
         JOIN topics as t ON qt.topic_id = t.id
JOIN authors as a ON q.author_id = a.id
WHERE qt.topic_id IN
      (
          SELECT t.id
          FROM topics as t
          WHERE t.name = 'Business'
      );
