###  Purchase order lines for factory items (Query group 63) from 'SWGLK' with date range parameter

```sql
SELECT
  T0."DocNum",
  T0."DocDate",
  T1."ItemCode",
  T2."U_SWK_FulfillmentStrategyCode",
  T1."Quantity"
FROM OPOR T0
INNER JOIN POR1 T1
  ON T0."DocEntry" = T1."DocEntry"
LEFT OUTER JOIN OITM T2
  ON T1."ItemCode" = T2."ItemCode"
WHERE T2."QryGroup63" = 'Y'
AND T0."CardCode" = 'SWGLK'
AND T0."DocDate" <= [%0]
AND T0."DocDate" >= [%1]
```
