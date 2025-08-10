# 📊 Bank Loan Analysis Report 

Comprehensive analytics and dashboards to monitor bank lending performance, portfolio health, and borrower behavior. This project delivers interactive insights using SQL Server + Excel Pivot dashboards, covering KPIs, Good vs Bad loan segmentation, trend analyses, and detailed drill-downs.
---

## 📁 Table of Contents
| # | Section |
|---|---------|
| 1️⃣ | 🏦 Project Overview |
| 2️⃣ | 🔧 Data Pipeline & Tech Stack |
| 3️⃣ | 🧩 Business Problem |
| 4️⃣ | ✅ KPI Definitions |
| 5️⃣ | 📈 Lending Portfolio Insights |
| 6️⃣ | 🗺️ Loan Applications Insights |
| 7️⃣ | 🏆 Data View |
| 8️⃣ | 🔍 Key Insights   |
| 9️⃣ | 💡 Recommendations for the Bank   |
| 🔟 | 📬 Contact   |
---  
## 🏦 Project Overview
The **Bank Loan Report** provides a 360° view of loan activity, from application counts to repayment performance. It is built on data extracted from an Excel loan‑origination workbook, imported into **SQL Server 2022** and exposed to Excel via a direct data source.  
- Data Source: XLSX imported into SQL Server (SSMS v21)
- Data Modeling: Structured tables and views for KPI computation and dimensional analysis
- Reporting Layer: Excel connected to SQL Server as data source
- Reports:
  - Lending Portfolio Insights: KPI cards for portfolio‑wide metrics and Good/Bad loan split.  
  - Loan Applications Insights: Six visualisations (line, map, donut, bar & treemap) that expose trends, geography, loan terms, employee tenure, purpose and home‑ownership impact.  
- Delivery: Pivot tables, charts, slicers, and KPIs aligned to business requirements

***

## 🔧 Data Pipeline & Tech Stack
| Component | Description |
|-----------|-------------|
| **Source file** | `loan_data.xlsx` (original loan‑origination export) |
| **SQL Server** | SSMS 21 – imported the Excel sheet into a table `dbo.LoanPortfolio` using the *Import Data* wizard. |
| **Excel** | Connected to the SQL Server table via **Data → Get Data → From Database → SQL Server**. |
| **Pivot Tables** | Built on the connected data model to compute the KPI values and feed the charts. |
| **Visualisations** | Native Excel charts (Line, Filled Map, Donut, Bar, TreeMap) placed on separate worksheets that act as the three dashboards. |
| **Version control** | GitHub – all source files, scripts and this README are stored in the repository. |

> **Future‑proofing:** The same SQL ↔ Excel data model can be swapped for Power BI or Tableau with minimal changes.

---  

## 🧩 Business Problem

To track lending performance, assess portfolio risk, and identify trends, the bank requires:
- Core loan KPIs with MTD and MoM tracking
- Good vs Bad loan segmentation based on status
- Loan Status grid for operational monitoring
- Visual Overview with trends by issue date, geography, term, employment length, purpose, and home ownership
- A Details dashboard for unified data exploration

***
## ✅ KPI Definitions

- Total Loan Applications
  - Total count, MTD, and MoM change
- Total Funded Amount
  - Sum of disbursed principal, MTD, and MoM change
- Total Amount Received
  - Sum of borrower repayments, MTD, and MoM change
- Average Interest Rate
  - Portfolio average, MTD, and MoM change
- Average Debt-to-Income (DTI)
  - Portfolio average, MTD, and MoM change

### Good vs Bad Loan Classification
- Good Loans: Loan Status in {Fully Paid, Current}
- Bad Loans: Loan Status = Charged Off

#### Good Loan KPIs
- Good Loan Application %
- Good Loan Applications
- Good Loan Funded Amount
- Good Loan Total Received Amount

#### Bad Loan KPIs
- Bad Loan Application %
- Bad Loan Applications
- Bad Loan Funded Amount
- Bad Loan Total Received Amount

***
## 📈 Lending Portfolio Insights:
<img width="2186" height="1128" alt="image" src="https://github.com/user-attachments/assets/5b5ac147-323b-4ab9-ad51-514dcbf10e4e" />


| KPI | Metric Definition | MTD | MoM Δ |
|-----|-------------------|-----|-------|
| **Total Loan Applications** | Count of all loan submissions in the period | 4.3 K | ↗ 6.9 % |
| **Total Funded Amount** | Σ *Funded Amount* (principal disbursed) | $54.0 M | ↗ 13.0 % |
| **Total Amount Received** | Σ *Payments Received* (principal + interest) | $58.1 M | ↗ 15.8 % |
| **Average Interest Rate** | AVG(*Interest Rate*) | 12.36 % | 3.5 % |
| **Average DTI** | AVG(*Debt‑to‑Income Ratio*) | 13.67 % | 2.7 % |

### Good vs. Bad Loan KPIs  
| Category | Loan Status | % of Applications | # Applications | Funded Amount | Total Received |
|----------|-------------|------------------|----------------|---------------|----------------|
| **Good Loans** | *Fully Paid* & *Current* | **86.18 %** | 33.2 K | $370.2 M | $435.8 M |
| **Bad Loans** | *Charged Off* | **13.82 %** | 5.3 K | $65.5 M | $37.3 M |

---  

## 🗺️ Loan Applications Insights:
<img width="2181" height="1126" alt="image" src="https://github.com/user-attachments/assets/98d64da4-dcdc-4f8d-8209-b100c8748974" />


| # | Visualisation | Icon | What It Shows |
|---|---------------|-------|---------------|
| 1️⃣ | **Monthly Trends by Issue Date** | 📈 | Line chart of *Applications*, *Funded Amount* and *Amount Received* over months. |
| 2️⃣ | **Regional Analysis by State** | 🗺️ | Filled map displaying the three metrics per US state. |
| 3️⃣ | **Loan Term Analysis** | 🔁 | Donut chart breaking down metrics by *Loan Term* (36 mo, 60 mo). |
| 4️⃣ | **Employee Length Analysis** | 👔 | Bar chart of metrics by employee tenure categories ( `<1 yr`, `1‑5 yr`, `5‑10 yr`, `10+ yr`). |
| 5️⃣ | **Loan Purpose Breakdown** | 🎯 | Bar chart of metrics by purpose (Debt Consolidation, Small Business, etc.). |
| 6️⃣ | **Home‑Ownership Column Chart** | 🏠 | Column Chart visualising metrics by home‑ownership status (Mortgage, Own, Rent, None). |


---  

## 🏆 Data View – Details (Full Data Grid)

A single Table that lists every loan row with the following columns:

* Issue Date  
* State  
* Grade  
* Term  
* Employment Length  
* Home Ownership  
* Loan Purpose  
* **Loan Status** (Current, Fully Paid, Charged Off, etc.)  
* Funded Amount  
* Total Received  
* Interest Rate  
* Debt‑to‑Income Ratio  

---  

## 🔍 Key Insights  

| # | Insight |
|---|---------|
| 📌 **1** | **Small‑Business loans** are under‑performing: only **74.38 %** are good loans; **25.62 %** are bad (charged‑off). |
| 📌 **2** | **Debt‑Consolidation** purpose generates the highest number of charged‑off loans – **≈ 2.7 k** applications. |
| 📌 **3** | **Grade “A”** is the best performing – **94.30 %** good loans. However, **Grade “B”** has the highest *total received amount* (**$140.8 M**) despite a lower funded amount (**$130.7 M**) and the most fully‑paid loans (**≈ 10 k**). |
| 📌 **4** | **December** shows the peak monthly volume – **4.3 k** applications. For **Grade B**, December alone accounts for **1.3 k** applications (the highest single‑month spike). |
| 📌 **5** | **California** tops the state‑level count with **6.89 k** applications; **Maine** is the lowest with just **3**. |
| 📌 **6** | **Loan term 36 months** dominates the portfolio (**28.2 k** applications) vs. **60 months** (**10.3 k**). |
| 📌 **7** | **Employee tenure “10+ years”** yields the most applications (**8.9 k**). The least comes from **9‑year** tenure (**1.3 k**). Surprisingly, **< 1 year** tenure is the second‑largest segment (**4.6 k**). |
| 📌 **8** | **Home‑ownership “Mortgage”** leads with **17.19 k** applications; “None” is the smallest group (**3** applications). |

---  

## 💡 Recommendations for the Bank  
- Tighten high-risk segments:
  - Small Business: Increase underwriting rigor (DTI caps, time-in-business, cash flow coverage), consider collateral/personal guarantees, and price for risk.
  - Debt Consolidation: Stricter credit filters (score, delinquencies, utilization), set payment-to-income caps, mandate autopay, and create early-intervention collections.
- Optimize grade strategy:
  - Preserve A-grade growth (quality anchor).
  - Keep B-grade as revenue driver but refine cutoffs and pricing to protect losses; offer B→A upgrade incentives for strong payers.
- Align pricing and terms:
  - Encourage 36-month terms where risk-adjusted returns are stronger.
  - For 60-month loans, add duration risk premium and stronger applicant requirements.
- Plan for seasonality:
  - Staff underwriting/servicing for Q4 spikes (esp. December); pre-approve and pre-underwrite to smooth peaks.
- Geographic focus:
  - Invest in California with targeted offers and robust fraud/risk controls.
  - Use low-cost tests in low-volume states (e.g., Maine) to gauge potential before scaling.
- Employment tenure policy:
  - For <1 year tenure, add stability checks (employment verification, probation status) and smaller initial limits.
  - Reward 10+ years with loyalty pricing and cross-sell.
- Monitoring and controls:
  - Track MoM shifts in Avg Interest Rate and DTI with alerts.
  - Build cohort loss curves for Small Business and Debt Consolidation to recalibrate pricing and approvals.
  - Segment performance dashboards by grade, purpose, and term for continuous tuning.

---

## 🤝 Contributing  

Contributions are welcome!

---

## 📬 Contact  

- **Author:** Nikhil Karaka
- **Email:** karakanikhil2003@gmail.com 
- **LinkedIn:** [linkedin.com/in/your‑profile](https://www.linkedin.com/in/nikhil-karaka/)  

> For any questions, data clarification, feel free to reach out!  

---  

## *Happy analysing! 🚀*  
