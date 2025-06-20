CREATE DATABASE IF NOT EXISTS MEDI_CAL_ELIGIBILITY;

CREATE SCHEMA IF NOT EXISTS MEDI_CAL_ELIGIBILITY.ELIGIBILITY;



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

--Load files into stage

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
     