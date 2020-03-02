### Components sold in production order made for stock

```sql
SELECT
  T0."DocEntry" AS "Order Entry",
  T3."DocEntry" AS "Production Entry",
  T1."ItemCode",
  T3."Component",
  T1."Quantity",
  T3."OrigPrice",
  T3."Price",
  T3."BOM Qty",
  T3."BOM Qty" * T3."Price",
  T1."LineTotal",
  T1."LineStatus"
FROM ORDR T0
INNER JOIN RDR1 T1
  ON T1."DocEntry" = T0."DocEntry"
LEFT OUTER JOIN OITM T2
  ON T1."ItemCode" = T2."ItemCode"
LEFT OUTER JOIN (SELECT
  T0."DocEntry",
  T0."ItemCode",
  T0."OriginNum",
  T1."BaseQty" AS "Quantity",
  T0."PostDate",
  T3."OrigPrice",
  T3."Price",
  T4."Price" AS "BOM Price",
  T3."Quantity" AS "BOM Qty",
  IFNULL(T1."ItemCode", T1."LineText") AS "Component"
FROM OWOR T0
INNER JOIN WOR1 T1
  ON T0."DocEntry" = T1."DocEntry"
INNER JOIN OITT T2
  ON T2."Code" = T0."ItemCode"
INNER JOIN ITT1 T3
  ON T2."Code" = T3."Father"
  AND T1."ItemCode" = T3."Code"
INNER JOIN ITM1 T4
  ON T3."Code" = T4."ItemCode"
  AND T3."PriceList" = T4."PriceList") T3
  ON T3."ItemCode" = T1."ItemCode"
  AND T3."OriginNum" IS NULL
WHERE T0."CANCELED" = 'N'
AND T1."LineStatus" = 'C'
AND T2."QryGroup59" = 'Y'
AND T3."DocEntry" IS NULL
```
