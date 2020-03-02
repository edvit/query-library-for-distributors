# All Order lines with open pick quantity

### Description

​Non-Partial delivery orders with items to pick.

### Intended Outcome

GBS Discussion Item


```sql
SELECT
	 T0."DocNum",
	 T0."CardCode",
	 T0."DocDueDate",
	 T1."LineNum",
	 T1."ItemCode",
	 T1."Quantity",
	 T1."OpenQty",
	 T3."OnHand" 
FROM ORDR T0 
INNER JOIN RDR1 T1 ON T0."DocEntry" = T1."DocEntry" 
INNER JOIN OITM T2 ON T1."ItemCode" = T2."ItemCode" 
INNER JOIN OITW T3 ON T2."ItemCode" = T3."ItemCode" 
WHERE T0."DocStatus" = 'O' 
AND T2."QryGroup59" = 'Y'
```

GBS Subtopic: 

Source: EDMON

Used By: 
