### Assign a recency rank based on last order date

```sql
SELECT
  MAX(T0."DocDate") AS "Last Order Date",
  T0."CardName",
  CASE
    WHEN DAYS_BETWEEN(MAX(T0."DocDate"), CURRENT_DATE) < 15 THEN 'A'
    WHEN (DAYS_BETWEEN(MAX(T0."DocDate"), CURRENT_DATE) >= 15 AND
      DAYS_BETWEEN(MAX(T0."DocDate"), CURRENT_DATE) <= 45) THEN 'B'
    WHEN DAYS_BETWEEN(MAX(T0."DocDate"), CURRENT_DATE) > 45 THEN 'C'
  END AS "Recency Rank"
FROM ORDR T0
GROUP BY T0."CardName"
```
