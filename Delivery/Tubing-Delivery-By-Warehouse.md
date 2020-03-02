###  Tubing deliveries 

Filtered on range code 'H' with warehouse parameter

```sql
SELECT
  T1."ItemCode",
  SUM(T1."Quantity")
FROM ODLN T0
INNER JOIN DLN1 T1
  ON T0."DocEntry" = T1."DocEntry"
LEFT OUTER JOIN OITM T2
  ON T1."ItemCode" = T2."ItemCode"
WHERE T2."U_SWK_RangeCd" IN ('H')
AND T1."WhsCode" = [%0]
GROUP BY T1."ItemCode"
```
