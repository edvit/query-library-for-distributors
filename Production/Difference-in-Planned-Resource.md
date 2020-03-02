### Difference of planned quantity and issued quantity for resources (Item Type 290)

```sql
SELECT
  T0."DocEntry",
  T0."DocNum" AS "Production Number",
  T0."ItemCode" AS "Production Item",
  T1."ItemCode" AS "Component Item",
  T1."IssuedQty",
  T1."PlannedQty",
  T1."PlannedQty" - T1."IssuedQty" AS "Difference Between Planned",
  T0."CloseDate"
FROM OWOR T0
INNER JOIN WOR1 T1
  ON T0."DocEntry" = T1."DocEntry"
LEFT OUTER JOIN OITW T2
  ON T1."ItemCode" = T2."ItemCode"
  AND T1."wareHouse" = T2."WhsCode"
LEFT OUTER JOIN OITM T3
  ON T1."ItemCode" = T3."ItemCode"
WHERE T0."Status" = 'L'
AND T1."IssuedQty" - T1."PlannedQty" <> 0
AND T1."ItemType" = 290
```
