# 💼 Power BI Dashboard — Data Jobs Analysis

## 📊 Project Overview
This Power BI project provides an analytical overview of **data-related job postings** using the dataset `job_postings_flat`.  
The dashboard is designed to help understand job market trends, salary distributions, and demand for various data roles.  
It enables users to interactively explore insights by job titles and drill down for detailed job-specific information.

---

## 🧾 Dataset
**Name:** `job_postings_flat`  
**Description:** Contains job listings from multiple platforms with details such as job title, posting date, salary (hourly and yearly), job rating, work schedule, location, degree requirement, benefits, and job source.

---

## 🏠 Main Dashboard — *“Data Jobs Overview”*
### 🔹 Layout
- **Top Section:**
  - Main title: *Data Jobs Dashboard*
  - Dropdown slicer to filter by **Job Title**
- **Body Layout:** 3 × 2 grid

### 🔹 Key Performance Indicators (KPIs)
| KPI | Description |
|-----|--------------|
| 🧾 **Job Count** | Total number of job postings |
| ⭐ **Average Job Star Rating** | Average company/job satisfaction rating |
| 💰 **Median Yearly Salary** | Central tendency of annual pay |
| ⏱ **Median Hourly Salary** | Central tendency of hourly pay |

### 🔹 Visuals
| Row | Visualization | Description |
|-----|----------------|-------------|
| 2️⃣ | **Line Chart** | Jobs over Time – shows trends in job postings |
| 2️⃣ | **Scatter Plot** | Median Yearly vs Hourly Salary per Job Title |
| 3️⃣ | **Stacked Bar Chart** | Job counts by Job Title |
| 3️⃣ | **Matrix (Table)** | Job statistics (Title, Job Count, Yearly & Hourly Salary, and Job Trends using Sparklines) |

---

## 🔍 Drill-Through Page — *“Job Title Details”*
This page allows users to **drill through** from the main dashboard to view in-depth information about a selected job title.

### 🔹 Layout
| Row | Visualization | Description |
|-----|----------------|-------------|
| 1️⃣ | **Gauges** | Displays yearly and hourly salaries for the selected job |
| 1️⃣ | **Donut Charts (3)** | Work-from-home %, No-degree-mentioned %, and Health-insurance % |
| 2️⃣ | **Map** | Shows geographic distribution of the job postings |
| 2️⃣ | **Stacked Bar Chart** | Displays job sources/platforms (LinkedIn, Indeed, etc.) |
| 2️⃣ | **Treemap** | Shows job schedule types (Full-Time, Part-Time, Internship, etc.) |

🔙 *A back arrow at the top-left corner lets the user return to the main dashboard.*

---

## ⚙️ Tools & Techniques
- **Power BI Desktop**
- **Power Query** for data transformation and cleaning
- **DAX (Data Analysis Expressions)** for KPI and calculated measures
- **Interactive Slicers & Drill-Through Features** for dynamic exploration
- **Custom Visuals** (sparklines, gauges, treemaps)

---

## 📈 Insights
- Trends in job availability over time help identify market demand peaks.  
- Salary comparisons reveal gaps between hourly and annual pay scales.  
- Drill-through analysis provides deeper understanding of specific roles — location, job type, and platform insights.  

---

## 🗂️ Project Structure

```text
📁 Data_Jobs_Dashboard/
│
├── Data_Jobs_Dashboard.pbix     
├── Dashboard_Snapshot.png            
└── README.md

```

---

## 🚀 How to Use 
1. Download the `.pbix` file.
2. Open it in **Power BI Desktop**.
3. Explore dashboard visuals or apply filters for custom insights.

---



           
                   



