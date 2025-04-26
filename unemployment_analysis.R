# ---- Part 1: Top 10 States with Highest Unemployment ----

# Load libraries
library(readxl)
library(dplyr)
library(ggplot2)

# Load data
df <- read_excel("C:/Users/devin/Desktop/Unemployment in America Per US State.xlsx")
colnames(df) <- trimws(colnames(df))

# Rename important columns
df <- df %>%
  rename(
    State = `State/Area`,
    Unemployment_Rate = `Percent (%) of Labor Force Unemployed in State/Area`
  )

# Filter the latest year if you want, otherwise use whole dataset
latest_year <- max(df$Year, na.rm = TRUE)
latest_data <- df %>% filter(Year == latest_year)

# Top 10 states plot
top10_df <- latest_data %>%
  arrange(desc(Unemployment_Rate)) %>%
  head(10)

ggplot(top10_df, aes(x = reorder(State, Unemployment_Rate), y = Unemployment_Rate)) +
  geom_bar(stat = "identity", fill = "firebrick") +
  coord_flip() +
  labs(title = paste("Top 10 States by Unemployment Rate in", latest_year),
       x = "State",
       y = "Unemployment Rate (%)") +
  theme_minimal()

# ---- Part 2: Trend Over Time for Entire U.S. (Linear Regression) ----

# Aggregate national unemployment rate by year
national_trend <- df %>%
  group_by(Year) %>%
  summarize(Avg_Unemployment_Rate = mean(Unemployment_Rate, na.rm = TRUE))

# Plot trend with regression line
ggplot(national_trend, aes(x = Year, y = Avg_Unemployment_Rate)) +
  geom_point(color = "blue") +
  geom_smooth(method = "lm", se = FALSE, color = "darkred") +
  labs(title = "Unemployment Rate Trend in the U.S. Over Time",
       x = "Year",
       y = "Average Unemployment Rate (%)") +
  theme_minimal()
# ---- Part 3: Linear Regression Analysis: Year vs. Average Unemployment Rate ----

# Use the same national_trend data we already created
# (aggregated unemployment rate by year)

# Build a linear regression model
model <- lm(Avg_Unemployment_Rate ~ Year, data = national_trend)

# Summarize the model
summary(model)
