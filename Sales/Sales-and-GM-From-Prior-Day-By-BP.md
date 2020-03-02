# Sales and GM from Prior Day

### Description

​Total gross profit over total sales by account code and sales person for yesterday.

### Intended Outcome

​Columns:
Customer Code, Salesperson Name, Sum of Invoiced Lines, Sum of Gross Profit, ‘GM %’

```sql
SELECT
	 T0."CardCode" ,
	 T2."SlpName" ,
	 SUM(T1."LineTotal") AS "Total Net Invoiced" ,
	 SUM(T1."GrssProfit") AS "Total GP $" ,
	 CASE WHEN SUM(T1."LineTotal") = 0 
THEN NULL 
ELSE SUM(T1."GrssProfit")/SUM(T1."LineTotal") 
END AS "GM %" 
FROM OINV T0 
INNER JOIN INV1 T1 ON T0."DocEntry" = T1."DocEntry" 
INNER JOIN OSLP T2 ON T0."SlpCode" = T2."SlpCode" 
WHERE T0."DocType" = 'I' 
AND T0."DocDate" = ADD_DAYS(CURRENT_DATE,-1) 
GROUP BY T0."CardCode" , T2."SlpName" 
ORDER BY "GM %" 
```

GBS Subtopic: 

Source: 

Used By: 
