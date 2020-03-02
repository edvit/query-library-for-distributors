### All order info with sales order parameter

```sql
SELECT *  FROM ORDR T0
INNER JOIN RDR1 T1 ON T0."DocEntry" = T1."DocEntry"
WHERE T0."DocNum"  = [%0]
```
