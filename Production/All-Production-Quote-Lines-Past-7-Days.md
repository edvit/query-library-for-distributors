### All production (Item Group Code 101) quote lines past 4 days

```sql
SELECT
  T0."DocEntry",
  T0."DocNum",
  T0."DocDate",
  T0."CardName",
  T1."ItemCode",
  T1."Quantity",
  T1."LineTotal"
FROM OQUT T0
INNER JOIN QUT1 T1
  ON T0."DocEntry" = T1."DocEntry"
LEFT OUTER JOIN OITM T2
  ON T1."ItemCode" = T2."ItemCode"
WHERE T0."DocDate" > ADD_DAYS(CURRENT_DATE, -7)
AND T2."ItmsGrpCod" = 101
```
