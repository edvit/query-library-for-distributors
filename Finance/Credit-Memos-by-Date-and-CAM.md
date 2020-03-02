# Credit Memos by Date and CAM 

### Description

​Credit memo documents for selected date range and beginning of salesperson name

### Intended Outcome

Credit memo summary detail for a select salesperson in a select date range.

​Coumns:
Credit Memo Document Number, Credit Memo Document Entry, Count of Line Number, Document Date, Posting Period Name, Customer Reference (PO#), etc...

```sql
SELECT
	 T0."DocNum" AS "Actual Invoice Number" ,
	 T6."DocEntry" AS "Drill Down to Invoice Details" ,
	 COUNT(T6."LineNum") AS "Line Count" ,
	 T0."DocDate" AS "Invoice Date" ,
	 T5."Name" AS "Posting Month" ,
	 T0."NumAtCard" AS "Customer PO" ,
	 T0."DocStatus" AS "Invoice Status" ,
	 T2."Name" ,
	 T3."firstName" ,
	 T3."lastName" ,
	 UPPER(T1."SlpName") AS "Sales Agent" ,
	 T0."CardCode" AS "Customer Code" ,
	 T0."CardName" AS "Customer Name" ,
	 SUM(-1*T6."LineTotal") AS "Total Customer Credit" 
FROM ORIN T0 
INNER JOIN OSLP T1 ON T0."SlpCode" = T1."SlpCode" 
INNER JOIN OCPR T2 ON T0."CntctCode" = T2."CntctCode" 
INNER JOIN OHEM T3 ON T0."OwnerCode" = T3."empID" 
INNER JOIN OSHP T4 ON T0."TrnspCode" = T4."TrnspCode" 
INNER JOIN OFPR T5 ON T0."FinncPriod" = T5."AbsEntry" 
INNER JOIN RIN1 T6 ON T0."DocEntry" = T6."DocEntry" 
WHERE T0."DocDate" BETWEEN [%0] 
AND [%2] 
AND UPPER(T1."SlpName") LIKE '[%1]%' 
GROUP BY T0."DocNum" ,
	 T6."DocEntry" ,
	 T0."draftKey" ,
	 T0."DocDate" ,
	 T5."Name" ,
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
