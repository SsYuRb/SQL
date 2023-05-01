use lesson_4;
select mark, count(*) from auto group by mark having mark = 'BMW' or mark = 'LADA';

CREATE TABLE sub_table SELECT mark, count, (SELECT SUM(count) FROM (SELECT COUNT(*) AS count FROM auto GROUP BY mark) AS subquery) AS count_sum
FROM (SELECT mark, COUNT(*) AS count FROM auto GROUP BY mark) AS t;

select mark, count, count_sum - count as 'diff' from sub_table;

SELECT mark, count, ((SELECT SUM(count) FROM (SELECT COUNT(*) AS count FROM auto GROUP BY mark) AS subquery) - count) AS diff
FROM (SELECT mark, COUNT(*) AS count FROM auto GROUP BY mark) AS t;

create table test_a (id INT, test varchar(10));
create table test_b (id INT);

insert into test_a(id, test) values
(10, 'A'),
(20, 'A'),
(30, 'F'),
(40, 'D'),
(50, 'C');
insert into test_b(id) values
(10),
(30),
(50);

SELECT a.*
FROM test_a AS a
LEFT JOIN test_b AS b ON a.id = b.id
WHERE b.id IS NULL;
