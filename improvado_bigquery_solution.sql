/* ==========================================================
   IMPROVADO MARKETING ANALYST TECHNICAL ASSIGNMENT
   Shivani Murukannaiah
   BigQuery SQL Workflow
   ========================================================== */


/* ==========================================================
   STEP 1: CREATE UNIFIED MARKETING TABLE
   ========================================================== */

CREATE OR REPLACE TABLE
`project-63082ae7-3c1b-482e-980.marketing_assignment.unified_marketing_data`
AS

SELECT
    date,
    'Facebook' AS platform,
    campaign_id,
    campaign_name,
    impressions,
    clicks,
    spend,
    conversions,
    NULL AS revenue
FROM `project-63082ae7-3c1b-482e-980.marketing_assignment.facebook_ads`

UNION ALL

SELECT
    date,
    'Google' AS platform,
    campaign_id,
    campaign_name,
    impressions,
    clicks,
    cost AS spend,
    conversions,
    conversion_value AS revenue
FROM `project-63082ae7-3c1b-482e-980.marketing_assignment.google_ads`

UNION ALL

SELECT
    date,
    'TikTok' AS platform,
    campaign_id,
    campaign_name,
    impressions,
    clicks,
    cost AS spend,
    conversions,
    NULL AS revenue
FROM `project-63082ae7-3c1b-482e-980.marketing_assignment.tiktok_ads`;


/* ==========================================================
   STEP 2: DATA QUALITY VALIDATION
   ========================================================== */

-- Row count validation

SELECT
    platform,
    COUNT(*) AS total_rows
FROM `project-63082ae7-3c1b-482e-980.marketing_assignment.unified_marketing_data`
GROUP BY platform;

-- Missing value validation

SELECT
    COUNTIF(date IS NULL) AS missing_dates,
    COUNTIF(campaign_name IS NULL) AS missing_campaigns,
    COUNTIF(impressions IS NULL) AS missing_impressions,
    COUNTIF(clicks IS NULL) AS missing_clicks,
    COUNTIF(spend IS NULL) AS missing_spend
FROM `project-63082ae7-3c1b-482e-980.marketing_assignment.unified_marketing_data`;

-- Clicks should never exceed impressions

SELECT *
FROM `project-63082ae7-3c1b-482e-980.marketing_assignment.unified_marketing_data`
WHERE clicks > impressions;

-- Negative spend validation

SELECT *
FROM `project-63082ae7-3c1b-482e-980.marketing_assignment.unified_marketing_data`
WHERE spend < 0;

-- Duplicate record validation

SELECT
    date,
    campaign_id,
    platform,
    COUNT(*) AS duplicate_count
FROM `project-63082ae7-3c1b-482e-980.marketing_assignment.unified_marketing_data`
GROUP BY date, campaign_id, platform
HAVING COUNT(*) > 1;


/* ==========================================================
   STEP 3: KPI ANALYSIS
   ========================================================== */

-- Overall marketing KPIs

SELECT
    ROUND(SUM(spend),2) AS total_spend,
    SUM(impressions) AS total_impressions,
    SUM(clicks) AS total_clicks,
    SUM(conversions) AS total_conversions
FROM `project-63082ae7-3c1b-482e-980.marketing_assignment.unified_marketing_data`;

-- Platform performance analysis

SELECT
    platform,
    ROUND(SUM(spend),2) AS total_spend,
    SUM(clicks) AS total_clicks,
    SUM(conversions) AS total_conversions
FROM `project-63082ae7-3c1b-482e-980.marketing_assignment.unified_marketing_data`
GROUP BY platform
ORDER BY total_spend DESC;

-- Platform click distribution

SELECT
    platform,
    SUM(clicks) AS total_clicks
FROM `project-63082ae7-3c1b-482e-980.marketing_assignment.unified_marketing_data`
GROUP BY platform
ORDER BY total_clicks DESC;


/* ==========================================================
   STEP 4: CAMPAIGN PERFORMANCE ANALYSIS
   ========================================================== */

SELECT
    campaign_name,
    platform,
    ROUND(SUM(spend),2) AS total_spend,
    SUM(clicks) AS total_clicks,
    SUM(conversions) AS total_conversions
FROM `project-63082ae7-3c1b-482e-980.marketing_assignment.unified_marketing_data`
GROUP BY campaign_name, platform
ORDER BY total_conversions DESC
LIMIT 10;


/* ==========================================================
   FINAL KPI RESULTS
   ==========================================================

   Total Spend:        130,244.90
   Total Impressions:  40,473,185
   Total Clicks:       688,333
   Total Conversions:  13,363

   Platform Performance

   TikTok:
   Spend = 74,266.70
   Clicks = 461,844
   Conversions = 6,750

   Google:
   Spend = 37,686.20
   Clicks = 137,590
   Conversions = 4,218

   Facebook:
   Spend = 18,292.00
   Clicks = 88,899
   Conversions = 2,395

   Key Insights

   • TikTok generated the highest conversion volume.
   • Influencer_Collab was the top-performing campaign.
   • Google demonstrated strong conversion efficiency.
   • Unified reporting enabled cross-channel performance analysis.

   ========================================================== */