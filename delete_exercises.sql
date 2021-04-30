USE codeup_test_db;

SELECT * FROM albums
WHERE release_date > 1990;

DELETE FROM albums
WHERE release_date > 1990;

SELECT * FROM albums
WHERE genre = 'disco';

DELETE FROM albums
WHERE genre = 'disco';

SELECT * FROM albums
WHERE artist = 'Whitney Houston';

DELETE FROM albums
WHERE artist = 'Whitney Houston';



DELETE FROM albums
WHERE artist LIKE 'Guns%';