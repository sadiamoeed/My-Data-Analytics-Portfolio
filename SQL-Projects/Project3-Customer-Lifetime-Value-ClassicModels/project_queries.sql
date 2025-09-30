-- In this Project i will compute the  Customer Lifetime Value(CLV) over the classicmodels dataset
-- Let me first highlight the steps that will be followed in this project
-- 1) Compute total Customers as total_customers
-- 2) Compute total Transactions as total_transactions
-- 3) Compute Total Revenue as total_revenue
-- 4) Compute Average Purchase Value as avg_pv = total_revenue/total_transactions
-- 5) Compute Average Purchase Frequency as avg_pf=total_transactions/total_customers
-- 6) Compute Average Customer lifespan(years) AS avg_cls (last_purchase_date - first_purchase_date)/ 365
-- 7) Compute CLV AS (avg_pv * avg_pf *gross_margin*avg_cls)-CAC
-- Assumptions: gross_margin= 60% and CAC=50000
-- Conclusion and Insights over CLV: 
-- CLV (+ve) would indicate : Customer is generating more revenue than the actual amount invested by the business to acquire him(profitable)
-- CLV (-ve) would indicate: Revenue From customer is less than the acquired cost ( Loss)
-- CLV( 0) would indicate: Revenue From customer is equal to the acquired cost ( No Profit No Loss)

-- STEP 1 : Compute Total Customers as total_customers
SELECT * FROM customers;  -- view the customers table

SET @gross_margin=0.6 ;
SET @CAC=50000;
WITH total_customers As (
SELECT COUNT(customerNumber) AS total_customers
FROM customers -- total customers count returned is 122
),
-- STEP 2 : Compute Total Transactions as total_transcations 
total_transactions AS (
SELECT COUNT(checkNumber) AS total_transactions
FROM payments),


-- STEP 3 | Step 6: Compute total_revenue | Average Lifespan (avg_cls_years)
total_revenue As (
SELECT ROUND(SUM(revenue)) AS revenue, ROUND(AVG(lifespan),2) AS avg_cls_years FROM(
SELECT c.customerNumber,(SUM(od.quantityOrdered*od.priceEach)) AS revenue, datediff(MAX(o.orderDate),MIN(o.orderDate))/365 AS lifespan
FROM employees e
LEFT JOIN customers c
	ON e.employeeNumber=c.salesRepEmployeeNumber
LEFT JOIN orders o
	ON c.customerNumber=o.customerNumber
LEFT JOIN orderdetails od
	ON o.orderNumber=od.orderNumber
WHERE o.status="Shipped"    
GROUP BY c.customerNumber
 ) AS revenue_table)
 
 -- Step 4 | Step 5 | Step 7: Computing Avg Purchase Value (avg_pv)| Avg purchase frequency(avg_pf) | Customer Lifetime Value (CLV)
 
 SELECT t.total_transactions,r.revenue,c.total_customers,
 ROUND((r.revenue/c.total_customers)) AS avg_pv, 
 ROUND(t.total_transactions/c.total_customers) AS avg_pf, r.avg_cls_years,
 ROUND(ROUND(r.revenue/c.total_customers)*ROUND(t.total_transactions/c.total_customers)*@gross_margin*r.avg_cls_years,2)-@CAC AS CLV,
 CASE 
	WHEN  
		ROUND(ROUND(r.revenue/c.total_customers)*ROUND(t.total_transactions/c.total_customers)*@gross_margin*r.avg_cls_years,2)-@CAC>0 
    THEN 
		"Profitable (CLV>CAC)"
    WHEN 
		 ROUND(ROUND(r.revenue/c.total_customers)*ROUND(t.total_transactions/c.total_customers)*@gross_margin*r.avg_cls_years,2)-@CAC<0
    THEN 
		"Loss (CLV<CAC)"
    ELSE
		"No Profit No Loss (CLV=CAC)"
END AS Comment        
    
 FROM total_transactions t,total_revenue r,total_customers c;
 
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Extra Work
-- For a safer side i computed the revenue from payment as well as orderDetails table and i got to know that
-- there is a slight difference between both values ,it might be possible that all the sales mentioned in the orderdetails table
-- may not be actually sold so this gives rise the point of actual revenue and expected revenue
-- Note that for this project i will use the ideal case value i.e the expected revenue from the orderDetails table
WITH payment_revenue AS (
SELECT ROUND(SUM(amount)) AS actual_revenue
FROM payments ),  -- revenue from complete trasactions taken from payment table rounded off to nearest int

order_revenue As (
SELECT ROUND(SUM(revenue)) AS expected_revenue FROM(
SELECT c.customerNumber,(SUM(od.quantityOrdered*od.priceEach)) AS revenue
FROM employees e
LEFT JOIN customers c
	ON e.employeeNumber=c.salesRepEmployeeNumber
LEFT JOIN orders o
	ON c.customerNumber=o.customerNumber
LEFT JOIN orderdetails od
	ON o.orderNumber=od.orderNumber
WHERE o.status="Shipped"    
GROUP BY c.customerNumber
 ) AS revenue_table)
SELECT o.expected_revenue,p.actual_revenue,
(o.expected_revenue-p.actual_revenue) AS Difference  -- difference between actual revenue(from payment table) and expected revenue(from orderdetails table)
FROM  order_revenue o, payment_revenue p;











    


