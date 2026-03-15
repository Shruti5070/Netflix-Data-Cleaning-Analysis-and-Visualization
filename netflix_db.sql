-- Step 1: Create raw table
CREATE TABLE netflix_raw (
    show_id VARCHAR,
    type VARCHAR,
    title VARCHAR,
    director VARCHAR,
    country VARCHAR,
    date_added VARCHAR,
    release_year INT,
    rating VARCHAR,
    duration VARCHAR,
    listed_in VARCHAR
);

-- Step 2: Import raw CSV
\copy netflix_raw FROM 'C:/Users/Shruti Maruti Pawar/OneDrive/Desktop/unified datasets/Projects/Netflix_Data_Prediction/netflix.csv' WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');

-- Step 3: Create cleaned table
DROP TABLE IF EXISTS netflix_cleaned;

CREATE TABLE netflix_cleaned (
    show_id VARCHAR PRIMARY KEY,
    type VARCHAR,
    title VARCHAR,
    director VARCHAR,
    country VARCHAR,
    date_added DATE,
    release_year INT,
    rating VARCHAR,
    duration VARCHAR,
    listed_in VARCHAR,
    duration_value INT,
    duration_type VARCHAR,
    year_added INT,
    month_added INT
);

-- Step 4: Clean and insert data
INSERT INTO netflix_cleaned (
    show_id, type, title, director, country, date_added, release_year, rating, duration, listed_in,
    duration_value, duration_type, year_added, month_added
)
SELECT
    show_id,
    type,
    title,
    NULLIF(director,'Not Given'),
    country,
    TO_DATE(date_added, 'MM/DD/YYYY'),
    release_year,
    rating,
    duration,
    listed_in,
    CAST(REGEXP_REPLACE(duration, '[^0-9]', '', 'g') AS INT),
    CASE WHEN duration LIKE '%min%' THEN 'min' WHEN duration LIKE '%Season%' THEN 'Season' ELSE NULL END,
    EXTRACT(YEAR FROM TO_DATE(date_added, 'MM/DD/YYYY')),
    EXTRACT(MONTH FROM TO_DATE(date_added, 'MM/DD/YYYY'))
FROM netflix_raw;

-- Step 5: Export cleaned CSV
\copy netflix_cleaned TO 'C:/Users/Shruti Maruti Pawar/OneDrive/Desktop/unified datasets/Projects/netflix_cleaned.csv' WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');
