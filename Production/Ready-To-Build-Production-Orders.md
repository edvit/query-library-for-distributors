### Production orders released and issued quantity is greater than planned quantity

```sql
SELECT
  T1."DocNum" AS "Production Order",
  MAX(T1."ItemCode") AS "Item Code",
  MAX(T4."ItemName") AS "Description",
  MAX(T1."PlannedQty") AS "Planned Quantity",
  MAX(T1."PostDate") AS "Order Placed",
  MAX(T1."DueDate") AS "Due Date",
  MAX(T3."Description") AS "Resource",
  MAX(T2."CardName") AS "Customer Name",
  MAX(T2."DocNum") AS "Sales Order"
FROM WOR1 T0
INNER JOIN OWOR T1
  ON T0."DocEntry" = T1."DocEntry"
LEFT JOIN ORDR T2
  ON T1."OriginNum" = T2."DocNum"
LEFT JOIN (SELECT
  T0."DocEntry",
  T1."ResName" AS "Description"
FROM WOR1 T0
INNER JOIN ORSC T1
  ON T0."ItemCode" = T1."VisResCode"
WHERE T1."ResName" LIKE '%%LABOUR%%') T3
  ON T1."DocEntry" = T3."DocEntry"
INNER JOIN OITM T4
  ON T1."ItemCode" = T4."ItemCode"

WHERE T1."Status" = 'R'
AND T0."ItemType" <> '290'
AND T0."DocEntry" NOT IN (SELECT
  T0."DocEntry"
FROM WOR1 T0
INNER JOIN OWOR T1
  ON T0."DocEntry" = T1."DocEntry"
WHERE T1."Status" = 'R'
AND T0."IssuedQty" < T0."PlannedQty"
AND T0."ItemType" <> '290')
GROUP BY T1."DocNum"
ORDER BY MAX(T1."DueDate")
```
