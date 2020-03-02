# PO Lines Open Past Delivery Date

### Description

​Shows PO lines that are still open and are past the delivery date on the line.

### Intended Outcome

​Can help to identify parts that are not delivered on-time by the vendor that might result in a disappointment.

```sql
/* All open purchase order lines with days between delivery and original delivery date */

SELECT
  T2."ItemCode",
  T2."Quantity" AS "Quantity On PO",
  T2."OpenQty" AS "Open PO Quantity",
  T3."DocNum" AS "Purchase Order",
  T3."NumAtCard" AS "PO",
  T2."WhsCode",
  T2."LineStatus",
  T2."ShipDate",
  T2."U_SWK_OrgDelDateBT" AS "Original PO Due Date",
  DAYS_BETWEEN(T2."U_SWK_OrgDelDateBT", T2."ShipDate") AS "Days Past Original Del"

FROM POR1 T2
INNER JOIN OPOR T3
  ON T2."DocEntry" = T3."DocEntry"
WHERE T2."LineStatus" = 'O'
AND DAYS_BETWEEN(T2."U_SWK_OrgDelDateBT", T2."ShipDate") <> 0

ORDER BY T2."ShipDate" DESC
```

GBS Subtopic: STP_Source to Pay

Source: DBORN

Used By: DBORN
