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

---

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



----

## 📊 Data Preparation
## SQL Data Exploration


This project uses the **CMS Physician Fee Schedule (PFS) non‑QP files** as the foundation for calculating Florida Personal Injury Protection (PIP) insurance payments.

- Non‑QP files are chosen because Florida Statute 627.736 requires insurers to base payments on **Medicare Part B non‑QP allowed amounts × 200% × 80%**.


- Initially assumed the business key was:

 `   Locality + HCPCS Code + Modifier`

- Duplicate checks identified a large number of apparent duplicate records.

- Added a quarter field (Q1, Q2, Q3, Q4) to distinguish CMS file releases, assuming later files contained additional payment records.

- Further investigation revealed that the apparent duplicates were caused by different Carrier Numbers (MAC jurisdictions) rather than quarterly updates.

- Identical HCPCS codes could have different allowed amounts across carriers:
`   HCPCS: Q4322`  <br>
`   Locality: 01 ` <br>
`   Carrier 01212 → $144.69 `  <br>
`   Carrier 02102 → $135.53 `  <br> 
`   Carrier 02302 → $141.38 `  <br>

- Quarterly CMS releases represent revision updates rather than supplemental datasets.

- Duplicate validation using the revised business key returned zero duplicate records:

- Final pricing engine design uses:
- 
``Primary Key:`` <br>
   ``Year + Carrier Number + Locality + HCPCS Code + Modifier
``

- Later CMS releases (AR/B/C/D) are loaded as version updates that overwrite prior payment amounts.
 
