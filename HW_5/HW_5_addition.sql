USE lesson_5;
-- Получите друзей пользователя с id=1 (решение задачи с помощью представления “друзья”)
DROP VIEW freinds_of_user_1;
CREATE VIEW freinds_of_user_1 AS
	SELECT 
		f_r.`status`,
        CONCAT(u.firstname, ' ', u.lastname) AS fullname_of_friend,
        u.id as user_id,
        f_r.initiator_user_id,
        target_user_id
	FROM friend_requests f_r
    JOIN users u
	ON f_r.initiator_user_id = u.id OR target_user_id = u.id
    WHERE f_r.initiator_user_id = 1 AND f_r.`status` = 'approved' AND u.id != 1 OR target_user_id = 1 AND f_r.`status` = 'approved' AND u.id !=1;
    SELECT * FROM freinds_of_user_1;
    
-- Создайте представление, в котором будут выводится все сообщения, в которых принимал 
-- участие пользователь с id = 1
DROP VIEW messages_of_user_1;
CREATE VIEW messages_of_user_1 AS
	SELECT 
		CONCAT(u.firstname, ' ', u.lastname) AS fullname_of_user_1,
        m.body,
        from_user_id,
        to_user_id
	FROM messages m
    LEFT JOIN  users u
	ON m.from_user_id = u.id OR m.to_user_id = u.id
    WHERE u.id = 1;
    
SELECT * FROM messages_of_user_1;
    
SELECT 
	m_u.fullname_of_user_1, 
    body, 
    m_u.from_user_id, 
    m_u.to_user_id,
    u.firstname,
    u.lastname
FROM messages_of_user_1 m_u
LEFT JOIN users u
ON m_u.from_user_id = u.id OR m_u.to_user_id = u.id
WHERE u.id !=1;

-- Получите список медиафайлов пользователя с количеством лайков(media m, likes l, users u)
DROP VIEW list_of_likes;
CREATE VIEW list_of_likes AS
	SELECT
		l.user_id,
		l.media_id,
        m.filename,
        COUNT(l.media_id) OVER (PARTITION BY l.user_id)as `sum`
	FROM likes l
    JOIN media m
    ON m.id = l.media_id;
SELECT 
	u.lastname,
    ll.filename,
    ll.`sum`
FROM list_of_likes ll
JOIN users u
ON u.id = ll.user_id
ORDER BY u.lastname;
    
        
-- Получите количество групп у пользователей
DROP VIEW qty_of_communities;
CREATE VIEW qty_of_communities AS
	SELECT 
		u.lastname,
        u_c.community_id,
		COUNT(u_c.community_id) OVER (PARTITION BY u.lastname) AS `sum`
	FROM users_communities u_c
    JOIN users u
    ON u.id = u_c.user_id
    ORDER BY u.lastname;
SELECT DISTINCT
	q.lastname,
    c.`name` AS communitty_name,
    q.`sum`
FROM qty_of_communities q
JOIN communities c
ON c.id = q.community_id
ORDER BY q.lastname;

    