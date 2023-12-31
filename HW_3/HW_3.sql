CREATE DATABASE IF NOT EXISTS lesson_3;
USE lesson_3;

DROP TABLE IF EXISTS staff;

CREATE TABLE staff
(
id INT PRIMARY KEY AUTO_INCREMENT,
firstname VARCHAR (45),
lastname VARCHAR(45),
post VARCHAR(45),
seniority INT,
salary DECIMAL(8, 2),
age INT
);

INSERT staff (firstname, lastname, post, seniority, salary, age)
VALUES
 ('Вася', 'Петров', 'Начальник', 40, 100000, 60),
 ('Петр', 'Власов', 'Начальник', 8, 70000, 30),
 ('Катя', 'Катина', 'Инженер', 2, 70000, 25),
 ('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
 ('Иван', 'Петров', 'Рабочий', 40, 30000, 59),
 ('Петр', 'Петров', 'Рабочий', 20, 25000, 40),
 ('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
 ('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
 ('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
 ('Максим', 'Петров', 'Рабочий', 2, 11000, 22),
 ('Юрий', 'Петров', 'Рабочий', 3, 12000, 24),
 ('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);

-- Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания 
SELECT salary FROM staff
ORDER BY
salary DESC; -- в порядке убывания

SELECT salary FROM staff
ORDER BY
salary; -- в порядке возрастания

-- Выведите 5 максимальных заработных плат (saraly)
SELECT salary FROM staff
ORDER BY 
salary DESC
LIMIT 5;

-- Посчитайте суммарную зарплату (salary) по каждой специальности (роst)
SELECT post, SUM(salary) AS sum_of_salary_by_post
FROM staff
GROUP BY
post;

-- Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.
SELECT COUNT(*) AS qauntity_or_workers
FROM staff
WHERE post = 'Рабочий' AND age >= 24 AND age <= 49;

-- Найдите количество специальностей
SELECT COUNT(DISTINCT post) AS quantity_of_post
FROM staff;

-- Выведите специальности, у которых средний возраст сотрудников меньше 30 лет 
SELECT post, AVG(age) AS average_age_by_post
FROM staff
GROUP BY post;

SELECT post
FROM staff
GROUP BY post
HAVING AVG(age) <= 30;

-- Внутри каждой должности вывести ТОП-2 по ЗП (2 самых высокооплачиваемых сотрудника по ЗП внутри каждой должности)
-- НЕ МОГУ СПРАВИТЬСЯ С ЗАДАЧЕЙ ПОДСКЖИТЕ НАПРАВЛЕНИЕ ГДЕ ИСКАТЬ ИЛИ С ЧЕГО НАЧАТЬ?


