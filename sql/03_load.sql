-- ============================================================
-- 03 - Raw Data Ingestion
-- ============================================================

USE DATABASE DEMO;
USE SCHEMA DEMO_SCHEMA;

-- Upload all monthly Citi Bike CSV files to the internal stage.
--
-- IMPORTANT:
-- Replace YOUR_LOCAL_PATH with the location of the dataset
-- on your own computer.
--
-- The actual project files are intentionally NOT committed
-- to GitHub because they are very large.

PUT 'file:///YOUR_LOCAL_PATH/2023-citibike-tripdata/2023-citibike-tripdata/*/*.csv'
    @BIKE_STAGE;

-- Verify uploaded files
LIST @BIKE_STAGE;