USE RoadAccidentAnalytics;
GO

--------------------------------------------------
-- 11. Rank roads by number of severe accidents
--------------------------------------------------
SELECT road_type,
       COUNT(*) AS severe_accidents,
       RANK() OVER(ORDER BY COUNT(*) DESC) AS road_rank
FROM accidents
WHERE accident_severity = 'Severe'
GROUP BY road_type;

--------------------------------------------------
-- 12. Rank vehicles by involvement in severe accidents
--------------------------------------------------
SELECT vehicle_type,
       COUNT(*) AS severe_accidents,
       RANK() OVER(ORDER BY COUNT(*) DESC) AS vehicle_rank
FROM vehicles v
JOIN accidents a ON v.accident_id = a.accident_id
WHERE a.accident_severity = 'Severe'
GROUP BY vehicle_type;

--------------------------------------------------
-- 13. Casualties per accident (Running Total)
--------------------------------------------------
SELECT accident_id,
       COUNT(casualty_id) OVER(PARTITION BY accident_id ORDER BY casualty_id ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_casualties
FROM casualties;

--------------------------------------------------
-- 14. Most dangerous weather conditions
--------------------------------------------------
SELECT weather_condition,
       COUNT(*) AS total_accidents,
       SUM(CASE WHEN accident_severity = 'Severe' THEN 1 ELSE 0 END) AS severe_accidents
FROM accidents
GROUP BY weather_condition
ORDER BY severe_accidents DESC;

--------------------------------------------------
-- 15. Day vs Night accident severity analysis
--------------------------------------------------
SELECT light_condition,
       COUNT(*) AS total_accidents,
       SUM(CASE WHEN accident_severity = 'Severe' THEN 1 ELSE 0 END) AS severe_accidents
FROM accidents
GROUP BY light_condition
ORDER BY severe_accidents DESC;

--------------------------------------------------
-- 16. Accidents with multiple casualties
--------------------------------------------------
SELECT a.accident_id,
       COUNT(c.casualty_id) AS total_casualties
FROM accidents a
JOIN casualties c ON a.accident_id = c.accident_id
GROUP BY a.accident_id
HAVING COUNT(c.casualty_id) > 1
ORDER BY total_casualties DESC;

--------------------------------------------------
-- 17. Average casualties per accident
--------------------------------------------------
SELECT AVG(casualty_count) AS avg_casualties
FROM (
    SELECT accident_id, COUNT(casualty_id) AS casualty_count
    FROM casualties
    GROUP BY accident_id
) AS sub;

--------------------------------------------------
-- 18. Vehicle type vs casualty severity
--------------------------------------------------
SELECT v.vehicle_type,
       c.casualty_severity,
       COUNT(*) AS total
FROM vehicles v
JOIN casualties c ON v.accident_id = c.accident_id
GROUP BY v.vehicle_type, c.casualty_severity
ORDER BY v.vehicle_type, total DESC;

--------------------------------------------------
-- 19. Top accident-prone days
--------------------------------------------------
SELECT accident_date,
       COUNT(accident_id) AS total_accidents
FROM accidents
GROUP BY accident_date
ORDER BY total_accidents DESC;

--------------------------------------------------
-- 20. Top 3 high-risk roads (CTE + Ranking)
--------------------------------------------------
WITH road_risk AS (
    SELECT road_type,
           COUNT(*) AS severe_accidents
    FROM accidents
    WHERE accident_severity = 'Severe'
    GROUP BY road_type
)
SELECT road_type,
       severe_accidents,
       RANK() OVER(ORDER BY severe_accidents DESC) AS road_rank
FROM road_risk
WHERE RANK() OVER(ORDER BY severe_accidents DESC) <= 3;
