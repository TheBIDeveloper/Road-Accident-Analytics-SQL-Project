USE RoadAccidentAnalytics;
GO

-- Accidents
INSERT INTO accidents VALUES
(1, '2024-01-01', '08:30', 'Highway', 'Rain', 'Daylight', 'Severe'),
(2, '2024-01-02', '21:15', 'Urban', 'Clear', 'Night', 'Slight'),
(3, '2024-01-03', '14:00', 'Rural', 'Fog', 'Daylight', 'Serious'),
(4, '2024-01-04', '18:45', 'Urban', 'Clear', 'Twilight', 'Severe'),
(5, '2024-01-05', '07:20', 'Highway', 'Clear', 'Daylight', 'Slight');

-- Vehicles
INSERT INTO vehicles VALUES
(101, 1, 'Car', 'Going Straight'),
(102, 1, 'Truck', 'Overtaking'),
(103, 2, 'Motorbike', 'Turning Left'),
(104, 3, 'Car', 'Going Straight'),
(105, 4, 'Bicycle', 'Crossing'),
(106, 5, 'Car', 'Turning Right');

-- Casualties
INSERT INTO casualties VALUES
(201, 1, 'Driver', 'Fatal', 35),
(202, 1, 'Passenger', 'Serious', 28),
(203, 2, 'Pedestrian', 'Slight', 40),
(204, 3, 'Driver', 'Serious', 22),
(205, 4, 'Passenger', 'Fatal', 50),
(206, 5, 'Driver', 'Slight', 30);
