USE lesson_3;
-- Подсчитать общее количество лайков, которые получили пользователи младше 12 лет.
SELECT 
	/*p.birthday,
    l.user_id,
    TIMESTAMPDIFF(YEAR, p.birthday, CURDATE()) AS diff_age
    */
    COUNT(*) AS users_younger_twelve
FROM likes l
JOIN `profiles` p
ON l.user_id = p.user_id
WHERE TIMESTAMPDIFF(YEAR,p.birthday, CURDATE()) < 12;


-- Определить кто больше поставил лайков (всего)% мужчины или женщины.

SELECT
	COUNT(p.gender) as gender,
    p.gender
FROM `profiles` p
JOIN likes l
ON p.user_id = l.user_id
GROUP BY p.gender 
ORDER BY p.gender;
-- LIMIT  1;


-- Вывести всех пользователей, которые не отправляли сообщения.
SELECT 
	CONCAT (u.firstname, ' ', u.lastname) AS fullname,
    m.body
FROM users u
LEFT JOIN messages m
ON u.id = m.from_user_id
WHERE m.from_user_id IS NULL;

