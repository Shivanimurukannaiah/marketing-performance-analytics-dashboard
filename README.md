# marketing-performance-analytics-dashboard
Cross-channel marketing analytics project using BigQuery, SQL, and Looker Studio to integrate, validate, and visualize advertising performance data across Facebook, Google Ads, and TikTok.

# Marketing Performance Analytics Dashboard

## Project Overview

This project focuses on integrating and analyzing advertising performance data from multiple digital marketing platforms, including Facebook Ads, Google Ads, and TikTok Ads.

The objective was to create a unified reporting framework, perform data quality validation, calculate key marketing KPIs, and develop an interactive dashboard for cross-channel performance monitoring and decision-making.

---

## Business Problem

Marketing data is often distributed across multiple advertising platforms, making it difficult to evaluate overall campaign performance.

This project addresses that challenge by consolidating platform-specific datasets into a single reporting layer and providing stakeholders with a centralized dashboard for performance analysis.

---

## Data Sources

- Facebook Ads
- Google Ads
- TikTok Ads

---

## Data Engineering & Integration

### BigQuery

The following steps were performed:

1. Uploaded source datasets into BigQuery.
2. Standardized platform-specific schemas.
3. Created a unified marketing data model using SQL.
4. Performed data quality validation and consistency checks.
5. Built reporting-ready datasets for dashboarding and analysis.

---

## Data Quality Validation

Validation checks included:

- Record count verification
- Missing value detection
- Duplicate record validation
- Clicks versus impressions consistency checks
- Negative spend validation

---

## Marketing KPIs

| Metric | Value |
|----------|---------:|
| Total Spend | 130,244.90 |
| Total Impressions | 40,473,185 |
| Total Clicks | 688,333 |
| Total Conversions | 13,363 |

---

## Platform Performance

| Platform | Spend | Clicks | Conversions |
|----------|---------:|---------:|---------:|
| TikTok | 74,266.70 | 461,844 | 6,750 |
| Google | 37,686.20 | 137,590 | 4,218 |
| Facebook | 18,292.00 | 88,899 | 2,395 |

---

## Dashboard Features

The dashboard includes:

- Executive KPI Summary
- Spend by Platform
- Conversions by Platform
- Conversion Trends Over Time
- Campaign Performance Analysis

---

## Key Insights

- TikTok generated the highest conversion volume across all channels.
- Influencer_Collab was the highest-performing campaign.
- Google demonstrated strong conversion efficiency despite lower traffic volume.
- The unified reporting framework enables cross-channel performance comparison and marketing optimization.

---

## Technology Stack

- Google BigQuery
- SQL
- Looker Studio
- GitHub

---

## Dashboard

Dashboard Link:
[Add Looker Studio URL Here]
