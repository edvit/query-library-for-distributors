### Last 7 days of order lines for custom solutions 

Item Group 101

```sql
SELECT
  T0."DocEntry",
  T0."DocNum",
  T0."DocDate",
  T0."CardName",
  T1."ItemCode",
  T1."Quantity",
  T1."LineTotal"
FROM ORDR T0
INNER JOIN RDR1 T1
  ON T0."DocEntry" = T1."DocEntry"
LEFT OUTER JOIN OITM T2
  ON T1."ItemCode" = T2."ItemCode"
WHERE T0."DocDate" > ADD_DAYS(CURRENT_DATE, -7)
AND T2."ItmsGrpCod" = 101
```
