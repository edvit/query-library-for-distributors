### Order lines count past year grouped by user and date

```sql
SELECT
  T1."USER_CODE" AS "Created By",
  COUNT(T0."DocEntry") AS "CountOfOrderLines",
  T0."DocDate"
FROM ORDR T0
INNER JOIN RDR1 T2
  ON T0."DocEntry" = T2."DocEntry"
LEFT OUTER JOIN OUSR T1
  ON T0."UserSign" = T1."USERID"
WHERE "CANCELED" = 'N'
AND T0."DocDate" > ADD_DAYS(CURRENT_DATE, -365)
GROUP BY T1."USER_CODE",
         T0."DocDate"
```
