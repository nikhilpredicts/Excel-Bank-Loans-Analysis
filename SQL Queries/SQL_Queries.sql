Use [DB Bank Loan];

select * from Loan_Data;

SELECT COUNT(ID) AS Total_Loan_Applications from Loan_Data;

/* MTD Loan Applications */
select count(id) as Total_Applications from Loan_Data 
where month(issue_date) =(select max(month(issue_date)) from loan_data);

/* PMTD Loan Applications */
select count(id) as Total_Applications from Loan_Data 
where month(issue_date) =(select max(month(issue_date))-1 from loan_data);

-- Total Funded Amount
SELECT SUM(loan_amount) AS Total_Funded_Amount FROM Loan_Data;

-- MTD Total Funded Amount
select sum(loan_amount) as Total_Funded_Amount from Loan_Data 
where month(issue_date) =(select max(month(issue_date)) from loan_data);

-- PMTD Total Funded Amount
select sum(loan_amount) as Total_Funded_Amount from Loan_Data 
where month(issue_date) =(select max(month(issue_date))-1 from loan_data);

-- Total Amount Recieved
select sum(total_payment) as Total_Amount_Collected from Loan_Data;

-- MTD Total Amount Recieved
select sum(total_payment) as Total_Amount_Collected from Loan_Data 
where month(issue_date) =(select max(month(issue_date)) from loan_data);

-- PMTD Total Amount Recieved
select sum(total_payment) as Total_Amount_Collected from Loan_Data 
where month(issue_date) =(select max(month(issue_date)-1) from loan_data);

-- Average Inerest Rate
select AVG(int_rate)*100 as Avg_Int_Rate from Loan_Data;

-- MTD Average Interest Rate
select AVG(int_rate)*100  as MTD_Avg_Int_Rate  from Loan_Data 
where month(issue_date) =(select max(month(issue_date)) from loan_data);

-- PMTD Average Interest Rate
select AVG(int_rate)*100  as PMTD_Avg_Int_Rate  from Loan_Data 
where month(issue_date) =(select max(month(issue_date))-1 from loan_data);

-- Average DTI(Debt to Income Ratio)
select AVG(dti)*100 as Avg_DTI from Loan_Data;

-- MTD DTI(Debt to Income Ratio)
select AVG(dti)*100  as MTD_Avg_DTI from Loan_Data 
where month(issue_date) =(select max(month(issue_date)) from loan_data);

-- PMTD DTI(Debt to Income Ratio)
select AVG(dti)*100  as PMTD_Avg_DTI from Loan_Data 
where month(issue_date) =(select max(month(issue_date))-1 from loan_data);

-- Good Loan Percentage
select
	(count(case
			when loan_status = 'Fully Paid' or loan_status='Current' 
			then id end)*100.0)/count(id) as Good_Loan_Percentage
from Loan_Data;

-- Good Loan Applicants
select 
	count(case
			when loan_status = 'Fully Paid' or loan_status='Current' 
			then id end) as Good_Loan_Aplications
from Loan_Data;

-- Good Loan Funded Amount
select sum(loan_amount) as Good_Loan_Funded_Amount from loan_data
where loan_status = 'Fully Paid' or loan_status='Current';

-- Good Loan Amount Recieved
select sum(total_payment) as Good_Loan_amount_recieved from loan_data
where loan_status = 'Fully Paid' or loan_status='Current';

-- Bad Loan Percentage
select
	count(case
			when loan_status='Charged Off'
			then id end)*100.0/count(id) as Bad_Loan_Percentage
from Loan_Data;

-- Bad Loan Applications
select count(id) as Bad_Loan_Applications from Loan_Data
where loan_status = 'Charged Off'

-- Bad Loan Funded Amount
select sum(loan_amount) as Bad_Loan_Funded_amount from Loan_Data
where loan_status = 'Charged Off';

-- Bad Loan Amount Recieved 
select sum(total_payment) as Bad_Loan_amount_recieved from Loan_Data
where loan_status = 'Charged Off';

-- Loan Status
select
	loan_status,
	count(id) as LoanCount,
	sum(total_payment) as Total_Amount_Received,
	sum(loan_amount) as Total_Funded_Amount,
	AVG(int_rate)*100 as Interest_Rate,
	AVG(dti)*100 as DTI
from Loan_Data
group by loan_status;


select 
	loan_status,
	sum(total_payment) as MTD_Total_Amount_Received,
	sum(loan_amount) as MTD_Total_Amount_Funded
from Loan_Data
where month(issue_date)=(
					select max(month(issue_date)) from Loan_Data)
group by loan_status;

-- Bank Loan Report | Overview

-- MONTH
select 
	month(issue_date) as Month_Number,
	DATENAME(month,issue_date) as Month_Name,
	count(id) as Total_Loan_Applications,
	sum(loan_amount) as Total_Funded_Amount,
	sum(total_payment) as Total_Amount_Recieved
from Loan_Data
group by month(issue_date),DATENAME(month,issue_date)
ORDER BY month(issue_date) ASC;

-- STATE
select
	address_state as State,
	count(id) as Total_Loan_Applicants,
	sum(loan_amount) as Total_Funded_Amount,
	sum(total_payment) as Total_Amount_Received
from loan_data
group by address_state
order by address_state;

-- TERM
select 
	term as Term,
	count(id) as Total_Loan_Applications,
	sum(loan_amount) as Total_Funded_Amount,
	sum(total_payment) as Total_Amount_Received
from loan_data
group by term
order by term;

-- EMPLOYEE LENGTH
select
	emp_length as Employee_length,
	count(id) as Total_Loan_Applications,
	sum(loan_amount) as Total_Funded_Amount,
	sum(total_payment) as Total_Amount_Received
from Loan_Data
group by emp_length
order by emp_length;

-- PURPOSE
select
	purpose as PURPOSE,
	count(id) as Total_Loan_Applications,
	sum(loan_amount) as Total_Funded_Amount,
	sum(total_payment) as Total_Amount_Received
from Loan_Data
group by purpose
order by purpose;

-- HOME OWNERSHIP
select 
	home_ownership as Home_Ownership,
	count(id) as Total_Loan_Applications,
	sum(loan_amount) as Total_Funded_Amount,
	sum(total_payment) as Total_Amount_Receieved
from loan_data
group by home_ownership
order by home_ownership;











-- select * from Loan_Data;





