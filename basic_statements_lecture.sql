#
================================= INSERT STATEMENTS

# Inserting a record

USE codeup_test_db;

DROP TABLE IF EXISTS quotes;

CREATE TABLE quotes (
    id                INT UNSIGNED NOT NULL AUTO_INCREMENT,
    author_first_name VARCHAR(50) DEFAULT 'NONE',
    author_last_name  VARCHAR(100) NOT NULL,
    content           TEXT         NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO quotes (author_first_name, author_last_name, content)
VALUES ('Justin', 'Reich', 'Do your best while you can.');

#
Viewing all records on a table

SELECT *
FROM quotes;

#
Inserting Multiple Records

INSERT INTO quotes (author_first_name, author_last_name, content) VALUES
    ('Leslie', 'Knope', 'We need to remember what''s important in life: friends, waffles, work.'),
    ('Ron', 'Swanson', 'You had me at meat ''tornado''.'),
    ('April', 'Ludgate', 'What?');

#
Inserting empty columns
INSERT INTO quotes (author_last_name, content) VALUES ('last', 'some content');
INSERT INTO quotes (author_first_name, content)
VALUES ('first', 'some content');
INSERT INTO quotes (author_first_name, author_last_name)
VALUES ('first', 'last');


#
Creating a seeder file... -- generally a file that inserts values to populate tables/db's from a outside file source

USE codeup_test_db;

INSERT INTO quotes (author_first_name, author_last_name, content) VALUES
('Leslie', 'Knope', 'We need to remember what''s important in life: friends, waffles, work.'),
('Ron', 'Swanson', 'You had me at meat ''tornado''.'),
('April', 'Ludgate', 'What?');



-- # =================================
-- SELECT STATEMENTS
--
-- # Select All
--
-- # Select Specific Columns # Where clause
--
-- # Operators
--
-- # Miscellaneous Output