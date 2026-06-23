# Online Retail Sales Analysis

End-to-end analysis of 537,752 retail transactions from a UK-based 
online gift store — identifying revenue trends, product performance, 
customer behaviour, and time-based sales patterns using SQL, Excel, 
and Power BI.

---

## Business Problem

A UK-based online retailer had 537K+ transaction records but no 
structured view of which products were most profitable, who their 
most valuable customers were, or when demand peaked. This analysis 
answers 5 key business questions to support inventory, marketing, 
and retention decisions.

---

## Tools Used

| Tool | Purpose |
|---|---|
| Excel | Data cleaning and preparation |
| MySQL | Data loading, transformation, and analysis |
| Power BI | Interactive dashboard and visualisation |

---

## Business Questions & Key Findings

| # | Business Question | Key Finding |
|---|---|---|
| 1 | How has monthly revenue trended? | November 2011 peak at £2.92M — 3x February (£1.02M). Heavily seasonal — Christmas gifting demand. |
| 2 | Which products drive most revenue? | REGENCY CAKESTAND 3 TIER top revenue product. All top 10 are occasion-driven gift/decorative items. |
| 3 | Who are the highest-value customers? | CustomerID 14646 — highest lifetime spend. CustomerID 14911 — highest order frequency (244 orders). |
| 4 | Which countries generate most revenue? | UK = 30x Netherlands. Netherlands has highest average order value (£6,031 vs EIRE £1,943). |
| 5 | When do customers buy most? | Peak hours 10am–3pm, Tuesday and Thursday. Suggests B2B customer base ordering during business hours. |

---

## Recommendations

- Restock inventory by September, launch campaigns in October for November peak
- Review pricing on high-volume, low-revenue products
- Build VIP retention programme for top 10 customers
- Prioritise international expansion into Netherlands and Germany
- Schedule email campaigns Tuesday and Thursday at 9am

---

## Dashboard

![Dashboard Page 1](dashboard_page1.png)
![Dashboard Page 2](dashboard_page2.png)

---

## Data Cleaning Decisions

- Removed internal warehouse entries (?lost, ?missing, ?damages)
- Removed postage and fee StockCodes (POST, DOT, gift, M)
- Retained rows with blank CustomerID where product description was valid
- Filtered negative quantities and unit prices in analysis queries
- Raw dataset: 541,910 rows → Clean dataset: 537,752 rows

---

## SQL Queries

See [analysis.sql](analysis.sql) for all 5 business queries with 
comments explaining the business question each one answers.
