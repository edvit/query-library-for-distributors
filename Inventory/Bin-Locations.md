###  All bin locations with warehouse and on hand

```sql
SELECT
  T0."ItemCode",
  T0."WhsCode",
  T1."BinCode",
  T0."OnHandQty"
FROM OIBQ T0
LEFT OUTER JOIN OBIN T1
  ON T0."BinAbs" = T1."AbsEntry"
  AND T0."WhsCode" = T1."WhsCode"
ORDER BY T1."WhsCode"
```
