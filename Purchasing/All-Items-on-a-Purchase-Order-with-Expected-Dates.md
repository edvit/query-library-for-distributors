## All lines on open PO with last purchase order and original delivery date

```sql
SELECT
  T0."ItemCode",
  SUM(T0."Quantity") AS "Total Qty On PO",
  SUM(T0."OpenQty") AS "Total Open PO Qty",
  MIN(T0."U_SWK_OrgDelDateBT") AS "Next PO Due Date",
  MIN(T2."DocNum") AS "Next PO",
  CASE
    WHEN MAX(T1."Latest Due") = MIN(T0."U_SWK_OrgDelDateBT") AND
      MAX(T1."Latest PO") = MIN(T2."DocNum") THEN ''
    ELSE MAX(T1."Latest Due")
  END AS "Latest Due",
  CASE
    WHEN MAX(T1."Latest PO") = MIN(T2."DocNum") THEN NULL
    ELSE MAX(T1."Latest PO")
  END AS "Latest PO"
FROM POR1 T0
LEFT OUTER JOIN (SELECT
  T00."ItemCode",
  MAX(T00."U_SWK_OrgDelDateBT") AS "Latest Due",
  MAX(T01."DocNum") AS "Latest PO"
FROM POR1 T00
LEFT OUTER JOIN OPOR T01
  ON T01."DocEntry" = T00."DocEntry"
WHERE T00."LineStatus" = 'O'
GROUP BY T00."ItemCode") T1
  ON T1."Latest Due" = T0."U_SWK_OrgDelDateBT"
  AND T0."ItemCode" = T1."ItemCode"
LEFT OUTER JOIN OPOR T2
  ON T0."DocEntry" = T2."DocEntry"
WHERE T0."LineStatus" = 'O'
GROUP BY T0."ItemCode"
ORDER BY T0."ItemCode"
```
