# Write your MySQL query statement below
SELECT 
    s1.id, 
    COALESCE(s2.student, s1.student) AS student
FROM seat s1
LEFT JOIN seat s2 
    ON (s1.id % 2 = 1 AND s1.id + 1 = s2.id)   -- Odd rows look for the next even row
    OR (s1.id % 2 = 0 AND s1.id - 1 = s2.id)   -- Even rows look for the previous odd row
ORDER BY s1.id;
