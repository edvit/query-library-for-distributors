Approximate warehouse value of on hand by average price

```sql
SELECT
  T0."WhsCode",
  SUM(T0."AvgPrice" * T0."OnHand")
FROM OITW T0
LEFT OUTER JOIN OITM T1
  ON T0."ItemCode" = T1."ItemCode"
GROUP BY T0."WhsCode"
```
