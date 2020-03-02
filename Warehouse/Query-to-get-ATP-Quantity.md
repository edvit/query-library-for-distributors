# Query to get ATP Quantity

### Description

​I created a query to get the ATP quantity for a given part

### Intended Outcome

GBS Discussion

```sql
SELECT
	 T0."ItemCode",
	 T0."ItemName",
	 T0."OnHand",
	 T0."IsCommited" AS "Qty On SO",
	 T0."OnOrder" AS "Qty On PO",
	 (T0."OnHand" - T0."IsCommited" + T0."OnOrder") AS "Available To Promise",
	T0."QryGroup63" AS "Factory Item",
	 T0."QryGroup64" AS "Regional Item",
	 T0."QryGroup60" AS "CR Part?",
	 T0."QryGroup61" AS "Swagelok Consigned?",
	 T2."BinCode" 
FROM OITM T0 
INNER JOIN OITW T1 ON T0."ItemCode" = T1."ItemCode" 
INNER JOIN OBIN T2 ON T1."DftBinAbs" = T2."AbsEntry" 
WHERE T1."WhsCode" = '01' 
AND T0."ItemCode" = '[%0]'
```

GBS Subtopic:

Source:SCOTS

Used By:SCOTS
