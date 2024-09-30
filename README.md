# Customer Conversion Time: Analyzing the Path to Purchase

## Project Overview
This project analyzes the user journey on a website and examines how long users take to make their first purchase on the same day they initiate an action. The goal is to understand user behavior and identify bottlenecks in the purchase flow to improve the conversion process.

## Purpose
The purpose of this project is to analyze how much time users spend before making a purchase on the day they visit the website. By understanding how users start their journey and identifying potential roadblocks, we aim to improve the user experience and increase same-day conversions.

## Data
- **Source**: The data used in this analysis comes from BigQuery, sourced from the Turing College dataset.
- **Contents**: The dataset includes information such as user behavior, timestamps, userID, actions taken on the website, browser type, device type, and more.

## Methodology
1. **Data Collection**: Relevant data for the analysis was gathered and aggregated using SQL queries.
2. **Data Cleaning**: Users who took more than 300 minutes from the first action of the day to complete a purchase had their times capped at 300 minutes to avoid outlier skewing.
3. **Median Calculation**: The median was used to calculate time to purchase, providing a more robust measure against extreme values.

## Key Findings
1. The median time to purchase was **17 minutes**.
2. Most users visited and made purchases on weekdays, particularly on **Tuesday, Wednesday, and Friday**, while weekends showed longer median times to purchase.
3. Based on funnel chart analysis, users spent the most time when their journey started with **first_visit** and **view_item** actions.

## Recommendations
1. **A/B Testing**: Conduct A/B testing on website design to find a more effective UI/UX that encourages faster transitions from viewing items to making purchases.
2. **Product Improvement**: Improve product descriptions and images to help users make faster purchase decisions.

## Further Analysis Recommendations
1. Analyze how many users were new versus returning visitors.
2. Investigate the time of day when users are most likely to make a purchase.
3. Group products into categories to analyze whether certain types of products lead to longer decision times.

---

This project offers valuable insights into how users interact with a website before making a purchase. By identifying areas for improvement, businesses can optimize the user journey and enhance conversion rates.
