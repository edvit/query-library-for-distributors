### Count of 'SWGLK purchase orders with doc date range parameter

```sql
SELECT
T1."ItemCode",
T2."U_SWK_FulfillmentStrategyCode",
SUM(T1."Quantity") AS "Ordered Quantity",
COUNT(T0."DocNum") AS "Count of POs"
FROM OPOR T0 INNER JOIN POR1 T1 ON T0."DocEntry"  = T1."DocEntry"
LEFT OUTER JOIN OITM T2 ON T1."ItemCode" = T2."ItemCode"
WHERE T2."QryGroup63" = 'Y'
AND T0."CardCode" = 'SWGLK'
AND T0."DocDate" <= [%0] AND  T0."DocDate" >= [%1]
AND T0."CardCode" = 'SWGLK'
GROUP BY T1."ItemCode", T2."U_SWK_FulfillmentStrategyCode"
```
