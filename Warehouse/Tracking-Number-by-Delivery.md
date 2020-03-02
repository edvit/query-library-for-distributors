# Get Tracking Number by Delivery

### Description

​Gets all deliveries numbers and the associated tracking number. Works when using the scanners and V33 ship.

### Intended Outcome

DocEntry, DocNum,U_TrackingNum

```sql
SELECT "ODLN"."DocEntry", "ODLN"."DocNum", "_V33_SHIP_PLD"."U_TrackNum"
FROM {oj "ODLN" "ODLN"
INNER JOIN ("@V33_SHIP_PLD" "_V33_SHIP_PLD"
LEFT OUTER JOIN "DLN1" "DLN1"
  ON "_V33_SHIP_PLD"."U_DocNum" = "DLN1"."BaseRef")
  ON "ODLN"."DocEntry" = "DLN1"."DocEntry"}
ORDER BY "ODLN"."DocNum"
```

GBS Subtopic: 

Source: 

Used By: DENVR
