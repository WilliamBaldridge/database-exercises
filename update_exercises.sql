USE codeup_test_db;


UPDATE albums
SET sales = 60.00, genre = 'Pop, Dance, R&B'
WHERE name='Thriller';


DELETE FROM albums
WHERE artist LIKE 'Guns%';