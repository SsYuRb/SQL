SELECT product_name, manifacturer FROM les_1.mobile_phones where product_count>2;
Select * From les_1.mobile_phones where manifacturer = 'Samsung';
SELECT * FROM les_1.mobile_phones WHERE CONCAT_WS(',', id, product_name, manifacturer, product_count) REGEXP 'Iphone';
SELECT * FROM les_1.mobile_phones WHERE CONCAT_WS(',', id, product_name, manifacturer, product_count) REGEXP 'Samsung';
SELECT * FROM les_1.mobile_phones WHERE CONCAT_WS(',', id, product_name, manifacturer, product_count) REGEXP '[0-9]';
SELECT * FROM les_1.mobile_phones WHERE CONCAT_WS(',', id, product_name, manifacturer, product_count) REGEXP '8';