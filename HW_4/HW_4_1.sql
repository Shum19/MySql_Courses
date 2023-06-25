USE lesson_4;
-- Вывести всех котиков по магазинам по id (условие соединения shops.id = cats.shops_id)
SELECT 
	c.name,
	sh.shopname
FROM cats c 
JOIN shops sh 
ON c.shops_id=sh.id; 


-- Вывести магазин, в котором продается кот “Мурзик” (попробуйте выполнить 2 способами)
SELECT 
	c.name,
	sh.shopname
FROM shops sh
JOIN cats c
ON c.shops_id = sh.id
WHERE c.name = 'Murzik';
	

-- Вывести магазины, в которых НЕ продаются коты “Мурзик” и “Zuza”
SELECT
	sh.shopname,
    c.name
FROM shops sh
JOIN cats c 
ON c.shops_id = sh.id
WHERE c.name != 'Murzik' and c.name != 'Zuza';
    

