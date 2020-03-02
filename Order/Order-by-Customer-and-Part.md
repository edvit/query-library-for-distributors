### Basic order info with customer code and item parameter

```sql
SELECT
  T0."DocEntry",
  T0."DocNum",
  T1."ItemCode",
  T1."Quantity",
  T1."LineTotal"
FROM ORDR T0
INNER JOIN RDR1 T1
  ON T0."DocEntry" = T1."DocEntry"
WHERE T0."CardCode" = [%0]
AND T1."ItemCode" = [%1]
```
