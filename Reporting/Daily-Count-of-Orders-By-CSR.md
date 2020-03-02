### Order count grouped by date and user

```sql
SELECT
  COUNT(T0."DocEntry") AS "Order Count",
  T0."DocDate",
  T1."USER_CODE" AS "Created By"
FROM ORDR T0
LEFT OUTER JOIN OUSR T1
  ON T0."UserSign" = T1."USERID"
WHERE "CANCELED" = 'N'
AND "DocDate" > ADD_DAYS(CURRENT_DATE, -365)
GROUP BY T0."DocDate",
         T1."USER_CODE"
```
