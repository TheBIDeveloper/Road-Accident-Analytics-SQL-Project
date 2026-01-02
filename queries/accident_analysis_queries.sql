USE RoadAccidentAnalytics;
GO

--------------------------------------------------
-- 1. Total accidents
--------------------------------------------------
SELECT COUNT(*) AS total_accidents
FROM accidents;

--------------------------------------------------
-- 2. Total casualties
--------------------------------------------------
SELECT COUNT(*) AS total_casualties
FROM casualties;

--------------------------------------------------
-- 3. Accidents by severity
--------------------------------------------------
SELECT accident_severity, COUNT(*) AS total
FROM accidents
GROUP BY accident_severity
ORDER BY total DESC;

--------------------------------------------------
-- 4. Casualties by severity
--------------------------------------------------
SELECT casualty_severity, COUNT(*) AS total
FROM casualties
GROUP BY casualty_severity
ORDER BY total DESC;

--------------------------------------------------
-- 5. Accidents by road type
--------------------------------------------------
SELECT road_type, COUNT(*) AS total_accidents
FROM accidents
GROUP BY road_type
ORDER BY total_accidents DESC;

--------------------------------------------------
-- 6. Accidents by weather condition
--------------------------------------------------
SELECT weather_condition, COUNT(*) AS total_accidents
FROM accidents
GROUP BY weather_condition
ORDER BY total_accidents DESC;

--------------------------------------------------
-- 7. Accidents by light condition
--------------------------------------------------
SELECT light_condition, COUNT(*) AS total_accidents
FROM accidents
GROUP BY light_condition
ORDER BY total_accidents DESC;

--------------------------------------------------
-- 8. Vehicle type involvement
--------------------------------------------------
SELECT vehicle_type, COUNT(*) AS total_involved
FROM vehicles
GROUP BY vehicle_type
ORDER BY total_involved DESC;

--------------------------------------------------
-- 9. Casualty class distribution
--------------------------------------------------
SELECT casualty_class, COUNT(*) AS total_casualties
FROM casualties
GROUP BY casualty_class
ORDER BY total_casualties DESC;

--------------------------------------------------
-- 10. Casualty severity by vehicle type
--------------------------------------------------
SELECT v.vehicle_type, c.casualty_severity, COUNT(*) AS total
FROM vehicles v
JOIN casualties c ON v.accident_id = c.accident_id
GROUP BY v.vehicle_type, c.casualty_severity
ORDER BY v.vehicle_type, total DESC;
