-- ============================================================
-- 02_stage.sql
-- Create and populate the Citi Bike internal Snowflake stage
-- ============================================================

USE DATABASE DEMO;
USE SCHEMA DEMO_SCHEMA;


-- Create internal stage
CREATE OR REPLACE STAGE BIKE_STAGE;


-- ============================================================
-- Upload local Citi Bike CSV files
--
-- IMPORTANT:
-- PUT must be executed using SnowSQL / Snowflake CLI.
--
-- Replace YOUR_LOCAL_PATH with the location of the extracted
-- Citi Bike dataset on your computer.
--
-- Example:
-- C:/Users/YOUR_USERNAME/Downloads
-- ============================================================

PUT 'file:///YOUR_LOCAL_PATH/2023-citibike-tripdata/*/*.csv'
    @BIKE_STAGE;


-- Verify files uploaded to the stage
LIST @BIKE_STAGE;