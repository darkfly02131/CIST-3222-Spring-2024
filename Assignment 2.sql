ALTER SESSION SET CURRENT_SCHEMA = MDC;


/* Question One*/

SELECT LastName, FirstName, Phone
FROM CUSTOMER
WHERE FirstName = 'Nikki';


/*Question Two*/
SELECT customer.lastname , customer.firstname, customer.phone , invoice.datein , invoice.dateout 
FROM CUSTOMER
JOIN INVOICE ON customer.customerid = invoice.customerid
WHERE invoice.totalamount > 100.00;

/*Question Three*/
SELECT ROUND(AVG(invoice.totalamount),2) AS AverageTotalAmount
FROM INVOICE;

/*Question Four */
SELECT COUNT(customer.customerid) AS NumberofCustomers
FROM CUSTOMER;

/*Question 5 */
SELECT lastname, firstname, phone
FROM CUSTOMER
WHERE CustomerID IN (
     SELECT customerid
     FROM INVOICE
     WHERE TotalAmount > 100.00
) 
ORDER BY lastname ASC, firstname DESC;

/*Question 6 */
SELECT C.lastname, C.firstname, C.phone
FROM CUSTOMER C, INVOICE I
WHERE c.customerid = I.customerid
    AND i.totalamount > 100.00
ORDER BY c.lastname ASC, c.firstname DESC;

/*Question 7*/
SELECT customer.lastname, customer.firstname, customer.phone
FROM CUSTOMER
JOIN INVOICE ON CUSTOMER.customerid = invoice.customerid
WHERE invoice.totalamount > 100.00
ORDER BY customer.lastname ASC, customer.firstname DESC;

/*Question 8 */
SELECT lastname, firstname, phone
FROM CUSTOMER  i
WHERE customerID IN (
    SELECT DISTINCT i.customerid
    FROM INVOICE_ITEM i
    WHERE i.item = 'Dress Shirt'
)
ORDER BY lastname ASC, firstname DESC;

/*question 9*/
SELECT DISTINCT c.lastname, c.firstname, c.phone
FROM CUSTOMER c, INVOICE i, invoice_item ii
WHERE c.customerid = i.customerid
AND i.invoicenumber = ii.invoicenumber
AND ii.item = 'Dress Shirt'
ORDER BY c.lastname ASC, c.firstname DESC;


/*Question 10  */
SELECT DISTINCT lastname, firstname, phone
FROM CUSTOMER c
JOIN INVOICE i ON c.customerid = i.customerid
JOIN invoice_item ii ON i.invoicenumber = ii.invoicenumber
WHERE ii.item = 'Dress Shirt'
ORDER BY c.lastname ASC, c.firstname DESC;


/*Question 11 */
SELECT C.LastName AS CustomerLastName, C.Firstname AS CustomerFirstName, r.firstname AS ReferredByFirstName, r.lastname AS ReferredByLastname
FROM CUSTOMER C
LEFT JOIN 
CUSTOMER r  ON c.referredby = r.customerid
ORDER BY c.firstname, c.lastname;

/*Question 12*/
SELECT 
    C.LastName AS CustomerLastName, 
    MIN(C.Firstname) AS CustomerFirstName
FROM 
    CUSTOMER C
GROUP BY 
    C.LastName, C.FirstName
ORDER BY 
    C.LastName, MIN(C.FirstName);


/*question 12*/
SELECT  DISTINCT
    C.LastName,  
    MIN(C.Firstname) AS FirstName
FROM
    CUSTOMER C
GROUP BY
    C.LastName, C.FirstName
ORDER BY
    C.LastName, MIN(C.FirstName);




