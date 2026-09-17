# Citi Bike Data Engineering Project with Snowflake

## Overview

This project demonstrates an end-to-end data engineering workflow using
Snowflake and the 2023 Citi Bike trip dataset.

The project covers local data ingestion, Snowflake staging, data loading,
SQL transformations, data quality checks, and analytical queries.

## Technologies

- Snowflake
- SnowSQL
- SQL
- Git
- GitHub
- Visual Studio Code

## Architecture

```text
Citi Bike CSV Files
        |
        v
Local File System
        |
        v
Snowflake Internal Stage
        |
        v
Raw Snowflake Table
        |
        v
Transformed / Analytical Data
        |
        v
SQL Analysis


