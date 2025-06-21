CREATE DATABASE IF NOT EXISTS MEDI_CAL_ELIGIBILITY;

CREATE SCHEMA IF NOT EXISTS MEDI_CAL_ELIGIBILITY.ELIGIBILITY;

CREATE OR REPLACE API INTEGRATION git_api_integration
  API_PROVIDER = git_https_api
  API_ALLOWED_PREFIXES = ('https://github.com/galaga2000/')
  ENABLED = TRUE;

CREATE OR REPLACE GIT REPOSITORY git_repo
    api_integration = git_api_integration
    origin = 'https://github.com/galaga2000/medi-cal-cortex-insights';

-- Make sure we get the latest files
ALTER GIT REPOSITORY git_repo FETCH;


CREATE OR REPLACE STAGE MEDI_CAL_STAGE
    DIRECTORY = ( ENABLE = true )
    ENCRYPTION = ( TYPE = 'SNOWFLAKE_SSE' );

CREATE OR REPLACE FILE FORMAT CSVFORMAT  
  SKIP_HEADER = 1  
  FIELD_OPTIONALLY_ENCLOSED_BY = '"'  
  TYPE = 'CSV';  

CREATE OR REPLACE TABLE MEDI_CAL_ENROLLMENT (
  year                   INTEGER,
  reporting_period       DATE,       -- will hold the first of the month
  eligibility_group      VARCHAR(100),
  number_of_enrollees    NUMBER(38,0)
);

--Load file into stage from data/ directory using SnowSQL with Put or Snowsight

COPY INTO MEDI_CAL_ENROLLMENT (year, reporting_period, eligibility_group, number_of_enrollees)
FROM (
  SELECT
    TO_NUMBER($1)                                         AS year,
    TO_DATE($2, 'YYYY-MM')                                AS reporting_period,
    $3                                                   AS eligibility_group,
    TO_NUMBER(REPLACE($4, ',', ''))                      AS number_of_enrollees
  FROM @MEDI_CAL_STAGE/7.1-total-medi-cal-enrollment-q4-2024-odp.csv
)
FILE_FORMAT = (FORMAT_NAME = 'CSVFORMAT')
ON_ERROR = 'CONTINUE';
     
     -- Show trends   
SELECT ELIGIBILITY_GROUP, SUMMARY, TREND_CLASSIFICATION ,TREND_CLASSIFICATION:labels[0]::STRING AS TREND  FROM ENROLLMENT_TRENDS;