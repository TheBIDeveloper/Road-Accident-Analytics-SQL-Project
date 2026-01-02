-- Road Accident Analytics Project
-- Table Creation Script (SQL Server)

CREATE DATABASE RoadAccidentAnalytics;
GO

USE RoadAccidentAnalytics;
GO

-- Accidents table
CREATE TABLE accidents (
    accident_id INT PRIMARY KEY,
    accident_date DATE,
    accident_time TIME,
    road_type VARCHAR(50),
    weather_condition VARCHAR(50),
    light_condition VARCHAR(50),
    accident_severity VARCHAR(20)
);

-- Vehicles table
CREATE TABLE vehicles (
    vehicle_id INT PRIMARY KEY,
    accident_id INT,
    vehicle_type VARCHAR(50),
    vehicle_manoeuvre VARCHAR(50),
    CONSTRAINT fk_vehicles_accident
        FOREIGN KEY (accident_id) REFERENCES accidents(accident_id)
);

-- Casualties table
CREATE TABLE casualties (
    casualty_id INT PRIMARY KEY,
    accident_id INT,
    casualty_class VARCHAR(50),
    casualty_severity VARCHAR(20),
    age INT,
    CONSTRAINT fk_casualties_accident
        FOREIGN KEY (accident_id) REFERENCES accidents(accident_id)
);
