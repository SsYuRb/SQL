use les_6;

DELIMITER $$
CREATE FUNCTION format_seconds(num_seconds INT) 
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
  RETURN CONCAT(
    FLOOR(num_seconds / (24 * 3600)), ' days ',
    FLOOR((num_seconds % (24 * 3600)) / 3600), ' hours ',
    FLOOR((num_seconds % 3600) / 60), ' minutes ',
    num_seconds % 60, ' seconds'
  );
END$$
DELIMITER ;


SELECT format_seconds(123456);


DELIMITER $$
CREATE PROCEDURE even_numbers(n INT)
BEGIN
  DECLARE i INT;
  SET i = 1;
  WHILE i <= n DO
    IF i % 2 = 0 THEN
      SELECT i;
    END IF;
    SET i = i + 1;
  END WHILE;
END $$
DELIMITER ;

CALL even_numbers(10)