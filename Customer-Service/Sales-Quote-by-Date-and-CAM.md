# Sales Quote by Date and CAM

### Description

​Quote Documents for selected date and beginning of salesperson name

### Intended Outcome

Quote detail summary for select salesperson and date range.

Columns:
Order Document Number, Order Document Entry, Count of Line Number, Document Date, Posting Period Name, Customer Reference (PO#), etc..

```sql
SELECT
	 T0."DocNum" ,
	 T0."DocDate" AS "Quote Date" ,
	 COUNT(T5."LineNum") AS "Line Count" ,
	 T0."U_SWK_ShippingBlock" AS "Shipping Block?" ,
	 T4."TrnspName" AS "Shipping Method" ,
	 T0."NumAtCard" AS "Customer Quote Ref" ,
	 T0."DocStatus" AS "Quote Status" ,
	 T2."Name" ,
	 CONCAT(T3."firstName",
	CONCAT(' ',
	T3."lastName")) AS "CSR Name" ,
	 UPPER(T1."SlpName") AS "Sales Agent" ,
	 T0."CardCode" AS "Customer Code" ,
	 T0."CardName" AS "Customer Name" ,
	 SUM(T5."LineTotal") AS "Quote Total"
FROM OQUT T0
INNER JOIN OSLP T1 ON T0."SlpCode" = T1."SlpCode"
INNER JOIN OCPR T2 ON T0."CntctCode" = T2."CntctCode"
INNER JOIN OHEM T3 ON T0."OwnerCode" = T3."empID"
INNER JOIN OSHP T4 ON T0."TrnspCode" = T4."TrnspCode"
INNER JOIN QUT1 T5 ON T0."DocEntry" = T5."DocEntry"
WHERE T0."DocDate" =[%0]
AND UPPER(T1."SlpName") LIKE '[%1]%'
GROUP BY T0."DocNum" ,
	 T0."DocDate" ,
	 T0."U_SWK_ShippingBlock" ,
	 T4."TrnspName" ,
	 T0."NumAtCard" ,
	 T0."DocStatus" ,
	 T2."Name" ,
	 T3."firstName" ,
	 T3."lastName" ,
	 T1."SlpName" ,
	 T0."CardCode" ,
	 T0."CardName"
```

GBS Subtopic: QTC_Quote to Cash

Source:

Used By:
