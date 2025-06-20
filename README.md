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
   - Create a new Snowflake worksheet
   - Ensure you have the necessary permissions for Cortex AI functions

2. **Run Setup Script**
   - Execute `setup.sql` to:
     1. Create necessary database objects
     2. Set up internal stage for data loading
     3. Configure required permissions

3. **Load Data**
   - Navigate to the internal stage created in setup.sql
   - Upload the data file `data/7.1-total-medi-cal-enrollment-q4-2024-odp.csv`
   - Verify data is successfully loaded into the tables

4. **Load Notebook**
   - Create a new Snowflake Notebook either from the repository https://github.com/galaga2000/medi-cal-cortex-insights/blob/main/ai_sql.ipynb or by Click "Upload" and select the `ai_sql.ipynb` file

5. **Run the Analysis**
   - Execute the cells in sequence:
     1. First cell: Import statements and Snowflake session initialization
     2. Second cell: Create the ENROLLMENT_TRENDS table with AI analysis
     3. Third cell: Show summary trends
     4. Fourth cell: Generate visualization

## Code Structure

- `AI_SQL.ipynb`: Main notebook containing the AI analysis pipeline
- `setup.sql`: SQL setup script for database configuration
- `instructions.txt`: Additional setup instructions

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- Snowflake for providing Cortex AI capabilities
- Medi-Cal for the enrollment data https://data.chhs.ca.gov/dataset/medi-cal-enrollment-by-eligibility-group/resource/d33eee4a-4c17-48da-8099-3fd2bac29ac2


## License

This project is licensed under the MIT License - see the LICENSE file for details.

The MIT License allows for free use, modification, and distribution of the code, provided that the copyright notice and license terms are included.

## Acknowledgments

- Snowflake for providing Cortex AI capabilities
- Medi-Cal for the enrollment data https://data.chhs.ca.gov/dataset/medi-cal-enrollment-by-eligibility-group/resource/d33eee4a-4c17-48da-8099-3fd2bac29ac2
