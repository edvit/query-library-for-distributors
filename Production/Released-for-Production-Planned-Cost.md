### Cost of components and resources based on warehouse 'CS' (OITW) and resource table (ORSC

```sql
SELECT
  T0."DocEntry",
  T0."DocNum" AS "Production Order",
  T1."ItemCode",
  CASE
    WHEN T1."ItemType" = '4' THEN 'Item'
    WHEN T1."ItemType" = '290' THEN 'Resource'
  END AS "ItemType",
  T1."PlannedQty",
  T5."AvgPrice" AS "Cost in CS Warehouse",
  T3."StdCost1" AS "Resource Cost",
  COALESCE(T3."StdCost1", T5."AvgPrice", 0) AS "Cost",
  COALESCE(T3."StdCost1", T5."AvgPrice", 0) * T1."PlannedQty" AS "Planned Component Line Cost"
FROM WOR1 T1
INNER JOIN OWOR T0
  ON T0."DocEntry" = T1."DocEntry"
LEFT OUTER JOIN ORSC T3
  ON T1."ItemCode" = T3."ResCode"
LEFT OUTER JOIN OITW T5
  ON T1."ItemCode" = T5."ItemCode"
  AND T5."WhsCode" = 'CS'

WHERE T0."Status" = 'R'
AND T1."ItemType" <> '-18'
--AND T0."DocNum" = [%0]
```
