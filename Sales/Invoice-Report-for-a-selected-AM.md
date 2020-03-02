# Invoice Report for a Selected Account Manager

### Description

​Queries to show daily quotes/orders/invoices by salesperson

We had to  use query groups and permissions and a modified version of these to get  to the point where each salesperson sees only their reports.

### Intended Outcome

​GBS Discussion

```sql
SELECT
	 T0."DocEntry",
	 T0."DocNum",
	 T0."CardCode",
	 T0."CardName",
	 T0."DocType",
	 T0."DocStatus",
	 T0."DocDate",
	 T0."DocTotal",
	 T1."SlpName" 
FROM OINV T0 
LEFT OUTER JOIN OSLP T1 ON T0."SlpCode" = T1."SlpCode" 
WHERE T1."SlpName" =[%0] 
AND T0."DocDate" >=[%2] 
AND T0."DocDate" <=[%1] 
```

GBS Subtopic: 

Source: VENTR

Used By: VENTR
