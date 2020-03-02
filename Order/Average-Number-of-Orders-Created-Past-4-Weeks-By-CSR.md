### Count of orders divided by approximate work days past 4 weeks grouped by user

```sql
SELECT
  T1."USER_CODE" AS "Created By",
  COUNT(T0."DocEntry") / 20 AS "AverageCountOfClosedOrders"
FROM ORDR T0
LEFT OUTER JOIN OUSR T1
  ON T0."UserSign" = T1."USERID"
WHERE "CANCELED" = 'N'
AND "DocDate" > ADD_DAYS(CURRENT_DATE, -29)
AND "DocDate" < CURRENT_DATE
GROUP BY T1."USER_CODE"
```
