-- ============================================================
-- 02 - Snowflake Stage
-- ============================================================

USE DATABASE DEMO;
USE SCHEMA DEMO_SCHEMA;
USE WAREHOUSE COMPUTE_WH;

-- Create an internal stage for Citi Bike files
CREATE STAGE IF NOT EXISTS BIKE_STAGE;

-- Verify the stage
LIST @BIKE_STAGE;