/*
 4. Выведите информацию о телефонах, где суммарный чек больше 100 000 и меньше 145 000**
 
*/
SELECT * FROM hw_1_mobile_phones
WHERE ProductCount * Price < '145000' AND ProductCount * Price > '100000';
