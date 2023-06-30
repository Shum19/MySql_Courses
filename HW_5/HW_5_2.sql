USE lesson_5;
DROP TABLE IF EXISTS train_timetable;
CREATE TABLE  train_timetable
(train_id_integer INT,
 station VARCHAR (20),
 station_time TIME
);
INSERT train_timetable 
		(train_id_integer, station, station_time)
		VALUES
		(110, 'SAN FRANCISCO', '10:00:00'),
        (120, 'SAN FRANCISCO', '11:00:00'),
		(110, 'REDWOOD CITY', '10:54:00'),
        (110, 'PALO ALTO', '11:02:00'),
        (120, 'PALO ALTO', '12:49:00'),
        (110, 'SAN JOSE', '12:35:00'),
		(120, 'SAN JOSE', '13:30:00');
SELECT * FROM train_timetable;

/* 
Добавьте новый столбец под названием «время до следующей станции». Чтобы получить это значение, 
мы вычитаем время станций для пар смежных станций. Мы можем вычислить это значение без использования 
оконной функции SQL, но это может быть очень сложно. Проще это сделать с помощью оконной функции LEAD. 
Эта функция сравнивает значения из одной строки со следующей строкой, чтобы получить результат. 
В этом случае функция сравнивает значения в столбце «время» для станции со станцией сразу после нее.
*/

SELECT 
	train_id_integer,
	station,
	station_time,
    TIMEDIFF(LEAD(station_time) OVER (PARTITION BY train_id_integer ORDER BY train_id_integer), station_time) AS time_to_next_station
FROM train_timetable;
