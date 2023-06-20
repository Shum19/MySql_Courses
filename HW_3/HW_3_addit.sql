USE lesson_3;
-- Посчитать количество документов у каждого пользователя
SELECT  (SELECT firstname FROM users WHERE users.id = media.user_id) AS user_name,
		user_id, 
        COUNT(media_type_id) AS quantity_0f_files
FROM media
WHERE filename LIKE '%docx' OR filename LIKE '%doc'
GROUP BY user_id;

-- Посчитать лайки для моих документов (моих медиа)
SELECT 	media_id,
		COUNT(media_id) AS likees,
		(SELECT filename FROM media WHERE media.id = likes.media_id) as f_name
FROM likes
GROUP BY media_id;