### Assign a frequency rank based on last 90 days order count

```sql
SELECT
  T0."CardName",
  COUNT(T0."DocNum") AS "Order Count",
  CASE
    WHEN COUNT(T0."DocNum") > 10 THEN 'A'
    WHEN COUNT(T0."DocNum") > 2 THEN 'B'
    ELSE 'C'
  END AS "Frequency Rank"
FROM ORDR T0
WHERE DAYS_BETWEEN(T0."DocDate", CURRENT_DATE) <= 90
GROUP BY T0."CardName"
```
