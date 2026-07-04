Employee Performance & KPI Analytics

An end-to-end HR analytics project that takes a raw employee dataset from cleaning to business insight, using Excel, SQL, Python, and Power BI. Built as a portfolio piece to demonstrate a complete Business Analyst / Data Analyst workflow — not just a model, but the full path from data to a decision-ready dashboard.

Project Overview

HR and people-ops teams need to know which employees and departments are performing well against KPIs, where training investment pays off, and what factors are associated with high performance. This project analyzes 16,052 employee records across 9 departments to answer those questions, using a four-stage pipeline: Excel → SQL → Python → Power BI.

Only 35.8% of employees meet more than 80% of their KPIs, and just 2.3% have won an award — the analysis digs into what separates the two groups.

Dataset

employees_data_cleaned.csv — 16,052 rows, 13 columns:

ColumnDescriptionemployee_idUnique employee identifierdepartmentDepartment (Sales & Marketing, Operations, Technology, Analytics, etc.)regionRecruitment regioneducationHighest qualification (Bachelors, Masters & above)genderEmployee genderrecruitment_channelHow the employee was hired (sourcing, other, referral)no_of_trainingsNumber of trainings completedageEmployee ageprevious_year_ratingPrior year performance rating (1–5)length_of_serviceTenure in yearsKPIs_met_more_than_80Whether the employee met >80% of KPIs (1/0)awards_wonWhether the employee won an award (1/0)avg_training_scoreAverage score across trainings

Tech Stack


Excel — initial data cleaning and validation
SQL (MySQL) — data loading, aggregation, and window-function analysis
Python (Pandas, Seaborn/Matplotlib, SciPy, Statsmodels, scikit-learn) — EDA, hypothesis testing, and predictive modeling
Power BI — interactive dashboard with DAX measures for stakeholder reporting


Repository Contents

├── employees_data_cleaned.csv      # Cleaned dataset (input for SQL & Python)
├── Analysis_Queries.sql            # SQL analysis: department/region rankings, KPI tiers, CTEs
├── employee_analysis.ipynb         # Python EDA, hypothesis testing & logistic regression
├── employee_data_PowerBI.pbix      # Interactive Power BI dashboard
└── README.md

Methodology

1. Data Cleaning (Excel)
Raw HR data was validated and cleaned — handling missing values, standardizing categorical labels, and preparing the dataset for downstream loading.

2. SQL Analysis (Analysis_Queries.sql)


Employee counts by department and department distribution by region
Top-performing departments and regions ranked by training score using window functions (RANK() OVER)
KPI performance tiering via CASE statements
Department-level summary statistics (avg training score, KPI %, award rate) using CTEs


3. Exploratory & Statistical Analysis (Python) (employee_analysis.ipynb)


Feature engineering: age bands and tenure bands
Correlation heatmap across numeric features
Training score distribution by department (boxplots)
Hypothesis testing: t-test comparing training scores between Bachelors and Masters employees
Chi-square test of independence between department and KPI achievement
Point-biserial correlation and Mann-Whitney U test relating KPI achievement to training score
Logistic regression modeling KPI achievement as a function of department and training score


4. Dashboard (Power BI) (employee_data_PowerBI.pbix)
Interactive dashboard summarizing department performance, KPI achievement, and training outcomes with DAX measures, built for a non-technical stakeholder audience.

Key Questions Answered


Which departments and regions have the strongest training outcomes?
Is there a statistically significant relationship between training score and KPI achievement?
Does education level affect training performance?
Can department and training score predict whether an employee meets their KPIs?


How to Reproduce


SQL: Run Analysis_Queries.sql in MySQL (update the LOAD DATA LOCAL INFILE path to your local CSV location; ensure local_infile is enabled on the server).
Python: Open employee_analysis.ipynb in Jupyter and run cells sequentially. Requires pandas, seaborn, matplotlib, scipy, statsmodels, scikit-learn.
Power BI: Open employee_data_PowerBI.pbix in Power BI Desktop to explore the interactive dashboard.


Author

Built by Muad as part of a data & business analytics portfolio.
