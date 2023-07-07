CREATE DATABASE IF NOT EXISTS lesson_6;
USE lesson_6;
/* 	1. Создайте функцию, которая принимает кол-во сек и
	формат их в кол-во дней, часов, минут и секунд.
	Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
*/

DROP FUNCTION IF EXISTS time_convertor;

DELIMITER $$
CREATE FUNCTION time_convertor(init_value INT)
RETURNS VARCHAR(100)
DETERMINISTIC
	BEGIN
		DECLARE dd INT;
        DECLARE hh INT;
        DECLARE mm INT;
        DECLARE ss INT;
        DECLARE converted_time VARCHAR(100);
        
        SET dd = FLOOR(init_value/60/60/24);
        SET hh = FLOOR((init_value/60/60/24  - dd)*24);
        SET mm = FLOOR((((init_value/60/60/24  - dd)*24) - hh)*60);
        SET ss = ROUND((((((init_value/60/60/24  - dd) *24) - hh)*60) - mm) * 60, 0);
        SET converted_time = CONCAT(dd, ' day(s) ', hh, ' hour(s) ', mm, ' minute(s) ', ss, ' second(s) ');
        RETURN converted_time;
    
	END $$
DELIMITER ;
SELECT time_convertor(123456);

/*	Выведите только четные числа от 1 до 10 (Через цикл
	внутри процедуры).
	Пример: 2,4,6,8,10
*/
DROP FUNCTION IF EXISTS  even_nums;

DELIMITER $$
CREATE FUNCTION even_nums(init_value INT)
RETURNS VARCHAR(100)
DETERMINISTIC
	BEGIN
		DECLARE i INT;
        DECLARE tmp_val INT;
        DECLARE result VARCHAR(100) DEFAULT '';
        SET i = 2;
        IF (init_value%2 = 0) THEN
			SET tmp_val = init_value;
		ELSE 
			SET tmp_val = init_value - 1;
            END IF;
        WHILE i <= tmp_val DO
			SET result = CONCAT(result, ", ", i);
            SET i = i + 2;
        END WHILE;
        RETURN result;
    END $$
DELIMITER ;

SELECT even_nums(10);



