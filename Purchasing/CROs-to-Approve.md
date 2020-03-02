# CRO Quotes to Approve

### Description

All open quotes with Swagelok order type 'CRO'

```sql
SELECT
	 DISTINCT T0."DocNum",
	 T0."NumAtCard",
	 T1."WhsCode" 
FROM OPQT T0 
INNER JOIN PQT1 T1 ON T0."DocEntry" = T1."DocEntry" 
WHERE T0."DocStatus" = 'O' 
AND T0."U_SWK_ORDERType" = 'CRO'
```
