Unemployment Analysis in the United States
Overview
This project explores unemployment patterns across U.S. states and over time, using both exploratory data analysis and linear regression modeling.

Objective
To visualize state-level unemployment rates, analyze national unemployment trends, and predict changes in unemployment over time based on year-to-year data.

Tools Used
R

dplyr

ggplot2

readxl

Process
Loaded and cleaned U.S. unemployment data from an Excel file.

Visualized the top 10 regions with the highest unemployment rates.

Analyzed national unemployment trends over time using scatter plots and regression lines.

Built a linear regression model to predict average national unemployment rate based on year.

Key Findings
In 2023, the regions with the highest unemployment rates included New York City, Los Angeles County, and the District of Columbia.

Over the past several decades, the national average unemployment rate in the U.S. has declined, as shown by a negative trend in the scatter plot and regression line.

The Linear Regression model confirmed a statistically significant negative relationship between year and average unemployment rate (p-value = 0.01082).

The model’s R-squared value was 0.136, indicating that about 13.6% of the variation in unemployment rate can be explained by time (year) alone.

This suggests that while unemployment has generally improved over time, other external factors beyond the passage of time are also influencing unemployment trends.

Visualizations
Top 10 States by Unemployment Rate (2023)

National Unemployment Rate Trend Over Time

Files
unemployment_analysis.R — Full R script including data loading, cleaning, visualization, and modeling.

How to Run
Install required R libraries: readxl, dplyr, ggplot2.

Load the R script into RStudio or another R environment.

Ensure the Excel file is available or adjust the path to match your system.

Run all code sections sequentially to reproduce the visualizations and model.
![Top 10 Unemployment](Top10.png)
![Unemployment Trend](Trend.png)
