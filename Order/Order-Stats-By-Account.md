### Basic stats per customer account name

```sql
SELECT
T0."CardName",
COUNT(T0."DocEntry") AS "Total Number of Orders B1",
SUM(T0."DocTotal"-"VatSum") AS "Total Sales B1",
ROUND(AVG(T0."DocTotal"-"VatSum"),2) AS "Average Order Size",
DAYS_BETWEEN('04.05.2018', CURRENT_DATE) AS "Days on B1",
ROUND((DAYS_BETWEEN('04.05.2018', CURRENT_DATE)*.71428), 0) AS "Working Days B1",
ROUND(SUM(T0."DocTotal"-T0."VatSum")/ ROUND((DAYS_BETWEEN('04.05.2018', CURRENT_DATE)*.71428),0),2) AS "Average Daily Order",
ROUND(COUNT(T0."DocEntry")/ ROUND((DAYS_BETWEEN('04.05.2018', CURRENT_DATE)*.71428),0),0) AS "Average Orders Per Day"
FROM ORDR T0 
GROUP BY T0."CardName"
ORDER BY T0."CardName"
```
