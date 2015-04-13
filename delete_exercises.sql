use codeup_test_db;

-- select name as 'Albums released after 1991'

delete from albums
where release_date > 1991;

-- select name as 'Albums with the genre "disco"'
delete from albums
where genre like 'disco';

-- select name as 'Albums by "Whitney Houston"'
delete from albums
where artist = 'Whitney Houston';
