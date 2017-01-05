Badge Leaderboard for current course ###

SELECT u.username, (SELECT COUNT(*) FROM prefix_badge_issued AS d WHERE d.userid = u.id) AS earned
FROM prefix_role_assignments AS ra
JOIN prefix_context AS context ON context.id = ra.contextid
JOIN prefix_course AS c ON c.id = context.instanceid AND c.id = %%COURSEID%%
JOIN prefix_user AS u ON u.id = ra.userid
ORDER BY earned DESC, u.username ASC
