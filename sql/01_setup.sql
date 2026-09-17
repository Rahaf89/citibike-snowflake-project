-- ============================================================
-- Citi Bike Snowflake Data Engineering Project
-- 01 - Environment Setup
-- ============================================================

-- Warehouse
USE WAREHOUSE COMPUTE_WH;

-- Database
USE DATABASE DEMO;

-- Schema
USE SCHEMA DEMO_SCHEMA;

-- Verify current environment
SELECT
    CURRENT_DATABASE() AS DATABASE_NAME,
    CURRENT_SCHEMA() AS SCHEMA_NAME,
    CURRENT_WAREHOUSE() AS WAREHOUSE_NAME,
    CURRENT_ACCOUNT_NAME() AS ACCOUNT_NAME,
    CURRENT_REGION() AS REGION;