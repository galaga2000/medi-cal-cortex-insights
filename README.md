# Medi-Cal Cortex Insights

Harnessing Snowflake Cortex AI for Medi-Cal enrollment intelligence.

## Purpose

This codebase demonstrates how to leverage Snowflake Cortex AI capabilities to analyze and visualize Medi-Cal enrollment data. It uses AI functions to automatically classify enrollment trends, generate summaries, and create interactive visualizations.

## Features

- AI-powered trend analysis of Medi-Cal enrollment data
- Automatic classification of enrollment trends (Increasing, Stable, Decreasing)
- Interactive visualizations using Altair
- Snowflake integration with Snowpark
- AI-powered summarization of enrollment patterns

## Prerequisites

Before using this codebase, ensure you have:

1. Snowflake account with Cortex AI enabled
2. Required Python packages (automatically installed in Snowflake notebook):
   - pandas
   - altair

## Setup Instructions

1. **Set Up Snowflake Connection**
   - Ensure you have the necessary permissions for Cortex AI functions

2. **Run Setup Script**
   - Execute `setup.sql` to:
     1. Create necessary database objects
     2. Set up Git integration with the repository
     3. Create internal stage for data loading
     4. Configure required permissions

3. **Load Data**
   - Verify data is successfully loaded into the tables by checking the MEDI_CAL_ENROLLMENT table

4. **Load Notebook**
  - You can load the notebook in two ways:

    1. create notebook from git repository
        - Verify Notebook that is already available in your Snowflake account as shown below.
    On the left hand navigation menu, select Databases MEDI_CAL_ELIGIBILITY » ELIGIBILITY » Git Repositories » GIT REPO and see ai_sql.ipynb Notebook that is already available in your Snowflake account.
        - Create notebook from git repository
            
    2. Import the notebook to worksheet from your cloned repository

5. **Run the Analysis**
   - Execute the cells in sequence:
     1. Import statements and Snowflake session initialization
     2. Create the ENROLLMENT_TRENDS table with AI analysis
     3. Show summary trends
     4. Generate horizontal diverging bar chart highlighting percentage changes in Medi-Cal enrollment by eligibility group over a six-month period
     5. Generate two pie charts showing:
        - Share of Total Enrollees by Eligibility Group over a six-month period
        - Distribution of Eligibility Groups by Trend Classification over a six-month period

## Code Structure

- `AI_SQL.ipynb`: Main notebook containing the AI analysis pipeline
- `setup.sql`: SQL setup script for database configuration

## License

This project is licensed under the MIT License - see the LICENSE file for details.

The MIT License allows for free use, modification, and distribution of the code, provided that the copyright notice and license terms are included.

## Acknowledgments

- Snowflake for providing Cortex AI capabilities
- Medi-Cal for the enrollment data https://data.chhs.ca.gov/dataset/medi-cal-enrollment-by-eligibility-group/resource/d33eee4a-4c17-48da-8099-3fd2bac29ac2
