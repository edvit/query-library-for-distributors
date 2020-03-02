# Open PO's Past Due Date

### Description

All open purchase orders where ship date is in the past.

```sql
SELECT
	 T0."DocNum",
	 T0."NumAtCard",
	 T1."ItemCode" ,
	 T1."OpenQty",
	 T1."ShipDate" 
FROM OPOR T0 
INNER JOIN POR1 T1 ON T0."DocEntry" = T1."DocEntry" 
WHERE T1."LineStatus" = 'O' 
and T1."ShipDate" < CURRENT_DATE 
ORDER BY T1."ShipDate"
```
