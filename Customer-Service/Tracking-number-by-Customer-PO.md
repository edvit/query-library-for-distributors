# Tracking number by Customer PO

### Description

​Delivery Lines for select customer reference (PO#) where warehouse code contains ‘DROP’ (A distributor with the V33 ship addon should test this)

### Intended Outcome

​Note: Requires @V33_SHIP_PLD

Columns:
Delivery Document Number, Item Code, Delivery Document Entry, Customer Reference (PO#), V33 Tracking Number, Customer Name, Delivery Document Date

```sql
SELECT DISTINCT
  T0."DocNum" AS "Delivery Number",
  T1."ItemCode",
  T0."DocEntry" AS "Internal ID",
  T0."NumAtCard" AS "BP Reference Number",
  T0."U_V33_TRACK_OTHER" AS "Tracking # UPS/FedEx/Other",
  --T3."U_TrackNum" as "Tracking # UPS/Fedex" ,
  --T3."U_ShipDate" as "UPS/Fedex Ship Date",
  --T0."DocDueDate" as "DLN Date",
  T0."CardName" AS "Customer Name",
  T0."DocDate" AS "Document Date"
--T0."DocDueDate" as "DLN Date"
FROM "ODLN" T0
INNER JOIN "DLN1" T1
  ON T0."DocEntry" = T1."DocEntry"
LEFT OUTER JOIN "ORDR" T2
  ON t2."DocNum" = T1."BaseDocNum"
WHERE SUBSTRING(T1."WhsCode", 1, 4) = 'DROP'
AND T0."NumAtCard" = '[%0]'
AND T0."CANCELED" = 'N'
GROUP BY t0."DocNum",
         t1."ItemCode",
         T0."DocEntry",
         T0."NumAtCard",
         T0."U_V33_TRACK_OTHER",
         T0."CardName",
         T0."DocDate",
         T0."DocDueDate"
UNION ALL
SELECT DISTINCT
  T0."DocNum" AS "Delivery Number",
  T1."ItemCode",
  T0."DocEntry" AS "Internal ID",
  T0."NumAtCard" AS "BP Reference Number",
  --T0."U_V33_TRACK_OTHER" as "Tracking # Other",
  T3."U_TrackNum" AS "Tracking # UPS/Fedex",
  --T3."U_ShipDate" as "UPS/Fedex Ship Date",
  T0."CardName" AS "Customer Name",
  T0."DocDate" AS "Document Date"
--T0."DocDueDate" as "DLN Date"
--T3."U_ShipDate"
--CASE WHEN SUBSTRING("Code",1,2)= '1Z' THEN
--   TO_DATE("U_ShipDate", 'YYYYMMDD')
--  ELSE TO_DATE("U_ShipDate", 'MM/DD/YYYY')
-- END
FROM "ODLN" T0
INNER JOIN "DLN1" T1
  ON T0."DocEntry" = T1."DocEntry"
LEFT OUTER JOIN "ORDR" T2
  ON t2."DocNum" = T1."BaseDocNum"
LEFT OUTER JOIN "@V33_SHIP_PLD" T3
  ON T3."U_DocNum" = CAST(T2."DocNum" AS varchar)
WHERE T0."NumAtCard" = '[%0]'
AND T0."CANCELED" = 'N'
AND
   CASE
     WHEN SUBSTRING(T3."Code", 1, 2) = '1Z' THEN TO_DATE(T3."U_ShipDate", 'YYYYMMDD')
     WHEN SUBSTRING("Code", 1, 2) > '40' THEN TO_DATE(T3."U_ShipDate", 'MM/DD/YYYY')
   -- ELSE T0."DocDueDate"
   END = T0."DocDate"
```

GBS Subtopic: QTC_Quote to Cash

Source:

Used By:
