# Netflix-Data-Analysis-Visualization
Netflix content data cleaning, transformation, and visualization using PostgreSQL and Tableau.

## Project Overview
This project focuses on cleaning, transforming, and analyzing the Netflix content dataset to gain insights into content trends, distribution patterns, and global production.

The project uses SQL for data cleaning and transformation in PostgreSQL and Tableau to create interactive dashboards for visualizing trends in Netflix content over time, by country, and by genre.

## Objective
Clean, preprocess, and analyze Netflix content data to identify trends, understand global content distribution, and generate actionable insights through interactive dashboards.

## Dataset
The dataset used in this project contains Netflix content data including:

- `show_id`  
- `type` (Movie/TV Show)  
- `title`  
- `director`  
- `country`  
- `date_added`  
- `release_year`  
- `rating`  
- `duration`  
- `listed_in` (genre)  

**Dataset Files:**  
- `netflix.csv` (raw data)  
- `netflix_cleaned.csv` (cleaned data)  

## Tech Stack
- **Database:** PostgreSQL  
- **Visualization:** Tableau  

## Project Steps

### 1. Data Loading
The raw Netflix dataset is loaded into a PostgreSQL table `netflix_raw` using the `\copy` command.

### 2. Data Understanding
Basic data exploration is performed to understand column types and missing values.

### 3. Data Cleaning
- Missing values are handled (e.g., replacing empty director or country values with `Unknown`).  
- Date column converted to proper `DATE` type.  
- Duplicates removed.  
- Duration is split into numeric value (`duration_value`) and type (`min` or `Season`).  
- Extracted `year_added` and `month_added` from `date_added`.  

### 4. Data Transformation
A cleaned table `netflix_cleaned` is created with all necessary features for analysis, and data is inserted using SQL transformations.

### 5. Export Cleaned Data
The cleaned table is exported as `netflix_cleaned.csv` for use in Tableau dashboards and further analysis.

### 6. Visualization
Three Tableau dashboards were created:

**1. Netflix Content Analysis Dashboard**  
- Total Movies vs TV Shows  
- Content Added to Netflix by Year  

**2. Netflix Global Content Analysis**  
- Top Countries Producing Netflix Content  
- Distribution of Netflix Movies by Country  
- Distribution of Content Ratings  

**3. Netflix Content Insights: Country & Genre Analysis**  
- Bubble graph: Netflix Content Distribution by Genre  
- Treemap: Netflix Content Distribution by Country  

## Project Structure

Netflix-Data-Analysis-Visualization/
│
├─ Netflix_Data_Cleaning.sql
├─ netflix.csv
├─ netflix_cleaned.csv
├─ dashboards/
│ ├─ Netflix_Content_Analysis.twbx
│ ├─ Netflix_Global_Content_Analysis.twbx
│ └─ Netflix_Content_Insights.twbx
└─ README.md


## Workflow Diagram

Raw CSV (netflix.csv)
│
▼
PostgreSQL: netflix_raw table
│
▼
SQL Cleaning & Transformation
│
▼
Cleaned Table: netflix_cleaned
│
▼
Export as CSV (netflix_cleaned.csv)
│
▼
Tableau Dashboards
├─ Netflix Content Analysis
├─ Netflix Global Content Analysis
└─ Netflix Content Insights


## How to Run the Project
1. Clone the repository.  
2. Open PostgreSQL shell and run the SQL script:  
   ```sql
   \i Netflix_Data_Cleaning.sql

Export cleaned data to CSV.

Open Tableau and import netflix_cleaned.csv to explore dashboards.

## Learning Outcomes

Data cleaning and preprocessing using PostgreSQL

Feature extraction and transformation for analysis

SQL querying and database management

Creating interactive Tableau dashboards

Understanding global Netflix content distribution and trends

## Author

Shruti Maruti Pawar
