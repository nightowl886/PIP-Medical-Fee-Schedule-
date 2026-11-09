# PIP Medical Fee Schedule Analysis Dashboard

## Project Overview
This project analyzes Personal Injury Protection (PIP) Medical Fee Schedule data across U.S. states using SQL and Tableau.

The objective was to explore reimbursement differences between Facility and Non-Facility fee schedules, identify pricing variations across medical procedure categories (HCPCS), and build an interactive dashboard that allows users to drill down from state-level summaries to individual HCPCS codes.

The project follows a typical analytics workflow:

- Data Exploration in SQL
- Data Transformation and Feature Engineering
- Business Rule Validation
- Interactive Dashboard Development in Tableau
- Insight Generation


## Business Problem

Medical reimbursement schedules contain thousands of HCPCS procedure codes.

A direct comparison at the individual code level quickly becomes difficult because:

- There are too many HCPCS codes to visualize effectively
- Individual procedures may not reveal broader pricing patterns
- Regional reimbursement structures differ across states
- Facility and Non-Facility fee schedules may follow different pricing strategies

The goal was to answer:

1. Which HCPCS categories have the largest reimbursement differences?
2. How much variation exists between Facility and Non-Facility reimbursement amounts?
3. Which states show the highest pricing gaps?
4. Are reimbursement differences concentrated within specific medical specialties?




## 📊 Data Preparation
- Performed SQL-based data exploration and validation.
- Consolidated multiple CMS fee schedule releases into a single master table using a staging-table workflow.
- Identified that CMS files labeled by quarter were revision releases rather than replacement snapshots. Added a source_ver field (AR/B/C/D) to track data origin and preserve historical fee schedule updates.
- Grouped thousands of HCPCS codes into broader clinical categories to improve visualization readability and support category-level pricing analysis.
- Created state-level groupings while preserving regional granularity for geographic reimbursement comparisons.

### 1. CMS Release Consolidation

Initially, I assumed CMS fee schedule files were quarterly replacements. Further validation revealed that each release contained supplemental updates rather than completely replacing prior files. A staging-table workflow was developed to consolidate multiple CMS releases into a single master dataset, and a source_ver field was added to track data origin and revision history.



### 2. HCPCS Categorization

One challenge encountered during analysis was the large number of HCPCS procedure codes.

Visualizing thousands of individual codes produced cluttered and difficult-to-interpret charts.

To improve interpretability, HCPCS codes were grouped into broader medical categories, including:

- Medicine
- Digestive
- Neuro / ENT
- Respiratory
- Musculoskeletal (MSK)
- Radiology
- Laboratory / Pathology
- GU / OB-GYN
- Integumentary
- Other

This transformation allowed analysis at a clinically meaningful level rather than focusing solely on individual procedure codes.

### 3. Geographic Standardization

State and locality data were standardized to support geographic analysis while preserving region-level reimbursement differences where applicable.

-----

## Key Insights

### Facility and Non-Facility Reimbursement Differences Are Not Uniform

Pricing gaps vary significantly across HCPCS categories.

For example:

- Integumentary procedures show some of the largest reimbursement differences.
- Laboratory and Pathology categories exhibit minimal differences.

This suggests reimbursement methodologies differ by medical specialty.

----

### Many HCPCS Codes Share Identical Fee Schedules

Several categories exhibit high percentages of "No Gap" codes where Facility and Non-Facility reimbursement amounts are identical.

This indicates standardized reimbursement practices within those specialties.

----

### Geographic Variation Matters

State-level analysis reveals that reimbursement structures differ across regions.

The dashboard supports geographic drill-down to identify localized pricing patterns.

---
## Technical Skills Demonstrated

### SQL
- Data Exploration
- Aggregation
- Data Validation
- Business Rule Investigation

### Tableau
- Interactive Dashboard Design
- Calculated Fields
- Parameter and Filter Actions
- Geographic Mapping
- Data Visualization
- KPI Reporting

### Analytical Skills
- Healthcare Reimbursement Analysis
- Pricing Gap Identification
- Feature Engineering
- Category-Based Segmentation
- Business Insight Communication

----
## Lessons Learned

One of the most important lessons from this project was that effective analytics often requires transforming highly granular data into business-friendly dimensions.

Rather than comparing thousands of individual HCPCS codes directly, grouping procedures into broader clinical categories made pricing patterns easier to identify and communicate.

The project also reinforced the importance of selecting visualizations based on the business question being answered. Different chart types were used intentionally to compare reimbursement amounts, highlight pricing gaps, and support geographic analysis.

 
