/*
 5.*** С помощью регулярных выражений найти (можно использовать операторы “LIKE”, “RLIKE” для 4.3 ):
5.1. Товары, в которых есть упоминание "iPhone" 
5.2. "Galaxy"
5.3. Товары, в которых есть ЦИФРЫ
5.4. Товары, в которых есть ЦИФРА "8"
*/
-- 5.1 
SELECT * FROM hw_1_mobile_phones
WHERE PoductName LIKE 'iPhone%';

-- 5.2 
SELECT * FROM hw_1_mobile_phones
WHERE PoductName LIKE 'Galaxy%';

-- 5.3
SELECT * FROM hw_1_mobile_phones
WHERE PoductName RLIKE '[0-9]';

-- 5.4
SELECT * FROM hw_1_mobile_phones
WHERE PoductName LIKE '%8%' OR  Manufacture LIKE '%8%' OR ProductCount LIKE '%8%' OR Price LIKE '%8%';
