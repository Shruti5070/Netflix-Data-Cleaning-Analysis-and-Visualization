#!/usr/bin/env python
# coding: utf-8

# Import libraries
import pandas as pd
import sqlite3
import numpy as np
import sqlalchemy
import psycopg2
import matplotlib
import seaborn

# Load the Netflix dataset
df = pd.read_csv("netflix.csv")

# Display first 5 rows
print(df.head())

# Dataset shape
print("Shape:", df.shape)

# Info
print(df.info())

# Describe
print(df.describe())

# Missing values
print("Missing values:\n", df.isnull().sum())

# Replace missing values
df['director'] = df['director'].fillna('Unknown')
df['country'] = df['country'].fillna('Unknown')
df['rating'] = df['rating'].fillna('Not Rated')

# Convert date column to datetime
df['date_added'] = pd.to_datetime(df['date_added'], errors='coerce')

# Remove duplicates
df = df.drop_duplicates()
print("Shape after removing duplicates:", df.shape)

# Strip whitespace from string columns
df['type'] = df['type'].str.strip()
df['title'] = df['title'].str.strip()
df['country'] = df['country'].str.strip()
df['director'] = df['director'].str.strip()

# Extract numeric duration and duration type
df['duration_value'] = df['duration'].str.extract(r'(\d+)')
df['duration_type'] = df['duration'].str.extract(r'([A-Za-z]+)')

# Extract year and month when content was added
df['year_added'] = df['date_added'].dt.year
df['month_added'] = df['date_added'].dt.month

# View updated dataset
print(df.head())

# Save cleaned dataframe to CSV
df.to_csv("netflix_cleaned.csv", index=False)
print("Cleaned dataset saved successfully")

# Print column names
print(df.columns)

# Reload cleaned CSV and print columns
df = pd.read_csv("netflix_cleaned.csv")
print(df.columns)