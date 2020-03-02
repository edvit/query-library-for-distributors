### Count of parts where greater than 1

Filters out SYSTEM, CROSS and RECEIVE bins. Change where required.

```sql
SELECT
  COUNT(T0."ItemCode") "Number of Parts",
  T0."WhsCode",
  T1."BinCode"
FROM OBIN T1
LEFT OUTER JOIN OIBQ T0
  ON T0."BinAbs" = T1."AbsEntry"
  AND T0."WhsCode" = T1."WhsCode"
  AND T1."BinCode" NOT LIKE '%-RECEIV%'
  AND T1."BinCode" NOT LIKE '%-CROSS%'
  AND T1."BinCode" NOT LIKE '%-SYSTEM%'

GROUP BY T0."WhsCode",
         T1."BinCode"

HAVING COUNT(T0."ItemCode") > 1
```
