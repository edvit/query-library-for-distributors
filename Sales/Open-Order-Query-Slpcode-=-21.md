# Daily Sales Quotes/Orders/Invoice Queries by Salesperson

### Description
​
Please find attached an example of an Open Orders  query we have created for sales employee number 21 that shows all open  orders for a specific sales employee (it only shows the total for open  lines on the sales order).
If you have any questions please let me know.
Regards,
Julie Wilson
Swagelok Scotland, Teesside & Ireland

### Intended Outcome

​GBS Discussion

```sql
SELECT
	 T0."DocNum" as "Order No",
	 T0."DocDate" as "Order Date",
	 T0."NumAtCard" as "Customer PO",
	 T0."CardCode" as "Account No",
	 T0."CardName" as "Customer",
	 Sum(T4."LineTotal") as "Line Total GBP",
	 T2."Name" AS "Order Contact Person",
	 T2."Position",
	 T2."Tel1" AS "Tel Number",
	 T2."E_MailL" AS "Email" 
FROM ORDR T0 
left outer JOIN OCRD T1 ON T0."CardCode" = T1."CardCode" 
left outer JOIN OCPR T2 ON T0."CntctCode" = T2."CntctCode" 
left outer JOIN OSLP T3 ON T0."SlpCode" = T3."SlpCode" 
INNER JOIN RDR1 T4 ON T0."DocEntry" = T4."DocEntry" 
WHERE T0."SlpCode" IN ('21') 
AND T4."LineStatus" = 'O' 
GROUP BY T0."DocNum",
	 T0."DocDate",
	 T0."NumAtCard",
	 T0."CardCode",
	 T0."CardName",
	 T2."Name",
	 T2."Position",
	 T2."Tel1",
	 T2."E_MailL",
	 T3."SlpName" 
ORDER BY T0."DocDate" Desc,
	 Sum(T4."LineTotal") Desc
```

GBS Subtopic: 

Source: SCOTS

Used By: SCOTS
