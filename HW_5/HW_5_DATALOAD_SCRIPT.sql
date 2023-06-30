SHOW VARIABLES LIKE "secure_file_priv";
SHOW VARIABLES LIKE "local_infile";
SET GLOBAL local_infile = 1;
USE lesson_5;
LOAD DATA INFILE '/var/lib/mysql-files/test_db.csv' -- в этой строчке пришдось убрать параметр LOCAL
													-- плюс пришлось переместить файл по указаному пути
                                                    -- не получилось прописать путь в конфиг файле
INTO TABLE cars
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;
SELECT * FROM cars;
