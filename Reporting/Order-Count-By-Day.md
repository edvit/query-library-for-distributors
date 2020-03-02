### Count of orders for each day

```sql
SELECT DISTINCT
  T0."DocDate",
  T1."Daily Order Count"
FROM ORDR T0
INNER JOIN (SELECT
  "DocDate",
  COUNT("DocEntry") AS "Daily Order Count"
FROM ORDR
GROUP BY "DocDate") T1
  ON T0."DocDate" = T1."DocDate"
```
