Items with multiple bins that are not RECEIVE, CROSS or SYSTEM

```sql
SELECT
  T0."ItemCode",
  T0."WhsCode",
  COUNT(T1."BinCode") AS "Number of Bins"
FROM OIBQ T0
LEFT OUTER JOIN OBIN T1
  ON T0."BinAbs" = T1."AbsEntry"
  AND T0."WhsCode" = T1."WhsCode"
  AND T1."BinCode" NOT LIKE '%-RECEIV%'
  AND T1."BinCode" NOT LIKE '%-CROSS%'
  AND T1."BinCode" NOT LIKE '%-SYSTEM%'

GROUP BY T0."ItemCode",
         T0."WhsCode"
HAVING COUNT(T1."BinCode") > 1
```
