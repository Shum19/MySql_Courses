USE lesson_5;
-- Создайте представление, в которое попадут автомобили стоимостью до 25 000 долларов
CREATE VIEW cars_under_25_000 AS
SELECT 
	`name`,
    cost
FROM cars
WHERE cost < 25000;
SELECT * FROM cars_under_25_000;

-- Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов 
-- (используя оператор ALTER VIEW)

ALTER VIEW cars_under_25_000 AS
SELECT 
	`name`,
    cost
FROM cars
WHERE cost < 30000;
SELECT * FROM cars_under_25_000;


-- Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”

CREATE VIEW skoda_audi AS
SELECT 
	`name`,
    cost
FROM cars
WHERE `name`='Audi ' OR `name`='Skoda ';

SELECT * FROM skoda_audi; 



