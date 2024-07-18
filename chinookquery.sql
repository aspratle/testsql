/* What is the average invoice total by customer? */
select c.FirstName || ' ' || c.LastName as FullName, 
    ROUND(AVG(i.Total),1) as AvgInvoiceTotal
from customers c
join invoices i
on c.CustomerId=i.Customerid
group by c.CustomerId
having AvgInvoiceTotal > 6.0
order by AvgInvoiceTotal DESC; 

/* What are the top 10 customers with the most invoices */
select c.FirstName || ' ' || c.LastName as FullName,
    count(i.InvoiceId) as InvoiceCount 
from customers c 
join invoices i 
on c.CustomerId=i.CustomerId
group by c.CustomerId
order by InvoiceCount DESC
limit 10; 


/* What are the top 10 customers by purchase amount (‘Total’ col)? */
select c.FirstName || ' ' || c.LastName as FullName,
    sum(i.Total) as TotalAmount
from customers c 
join invoices i 
on c.CustomerId=i.CustomerId
group by c.CustomerId
order by TotalAmount DESC
limit 10; 



/* What are the total sales by country -- countries with most sales?*/
select country, round(sum(i.Total),1) as TotalSales
from customers c 
join invoices i
on c.customerid=i.customerid
group by country
order by TotalSales desc
limit 5; 





