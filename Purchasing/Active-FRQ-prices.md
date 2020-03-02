# Active FRQ Prices

### Description

All items with a price where the due date has not past.

```sql
SELECT
	 T0."ItemCode",
	 MAX(T1."DocDate") AS "Quote Date",
	 T0."Price" 
FROM PQT1 T0 
INNER JOIN OPQT T1 ON T0."DocEntry" = T1."DocEntry" 
INNER JOIN OITM T2 ON T0."ItemCode" = T2."ItemCode" 
WHERE T2."QryGroup63" = 'Y' 
AND T0."Price" <> 0 
AND T1."DocDueDate" >= CURRENT_DATE 
GROUP BY T0."ItemCode",
	 T0."Price" 
ORDER BY T0."ItemCode",
	 "Quote Date" DESC
```
