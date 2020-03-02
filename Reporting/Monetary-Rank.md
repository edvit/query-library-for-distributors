### Assign a monetray rank based on last 90 days sales

```sql
SELECT
  T1."CardName",
  SUM(T0."LineTotal") AS "3mo Sales Total",
  CASE
    WHEN SUM(T0."LineTotal") > 10000 THEN 'A'
    WHEN SUM(T0."LineTotal") > 500 THEN 'B'
    ELSE 'C'
  END AS "Monetary Rank"
FROM RDR1 T0
INNER JOIN ORDR T1
  ON T0."DocEntry" = T1."DocEntry"
WHERE DAYS_BETWEEN(T1."DocDate", CURRENT_DATE) <= 90
GROUP BY T1."CardName"
```
