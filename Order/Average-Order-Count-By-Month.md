### Count of orders grouped by month year

```sql
SELECT (YEAR("DocDate") ||'-'|| MONTH("DocDate")) AS "Month",
MONTH("DocDate"),
COUNT("DocEntry")/20 AS "AverageWorkdayOrderCount"
FROM ORDR
WHERE "CANCELED" = 'N'
GROUP BY (YEAR("DocDate") ||'-'|| MONTH("DocDate")),MONTH("DocDate")
ORDER BY MONTH("DocDate")
```
