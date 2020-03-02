# Component Production Order Allocations

### Description

​Query runs by component part number to see what other production orders the same item is allocated to.

### Intended Outcome

​​Used to show where a certain component were allocated to. This is mainly used for re-allocating material between orders for expedites

```sql
SELECT DISTINCT
  T6."DocNum",
  T6."U_SWK_ShippingBlock" AS "Shipping Block",
  T6."Confirmed" AS "Approved",
  T6."LineNum" + 1 AS "Line Num",
  T6."U_SWK_AllocateDate",
  T6."U_SWK_EarlyShipDate",
  T6."ShipDate",
  T6."BackOrdr",
  T0."ItemCode",
  AST1."WhsCode" AS "From Whs",
  LEFT(AST1."WhsCode", 2) "To Whs",
  T4."BinCode",
  T5."DistNumber" "Batch",
  --T6."OpenQty" as "Remaining Order Qty",
  --AST1."OnHandQty" as "Batch Qty",
  CASE
    WHEN IFNULL(T6."OpenQty", 0) = 0 THEN IFNULL(T6."OpenQty", 0)
    WHEN T6."OpenQty" < AST1."OnHandQty" THEN T6."OpenQty"
    ELSE AST1."OnHandQty"
  END AS "Required Qty"
FROM OITW T0

INNER JOIN (

SELECT
  AT0."SnBMDAbs" "SnBMDAbs",
  AT0."ItemCode" "ItemCode",
  AT0."WhsCode" "WhsCode",
  AT0."BinAbs" "BinAbs",
  AT0."OnHandQty" "OnHandQty",
  AT0."SnBMDAbs" "No Of Batches"
FROM OBBQ AT0
INNER JOIN OBIN AT1
  ON AT0."BinAbs" = AT1."AbsEntry"
--GROUP BY AT0."ItemCode" 
) AST1

  ON T0."ItemCode" = AST1."ItemCode"
  AND T0."WhsCode" = AST1."WhsCode"
INNER JOIN OBIN

T4

  ON AST1."BinAbs" = T4."AbsEntry"
LEFT OUTER JOIN (

SELECT
  ST1."AbsEntry" AS "AbsEntry",
  ST1."ItemCode" AS "ItemCode",
  ST1."DistNumber" AS "DistNumber"
FROM OBTN ST1)

T5

  ON AST1."SnBMDAbs" = T5."AbsEntry"
  AND T0."ItemCode" = T5."ItemCode"
LEFT OUTER JOIN (

SELECT
  ST2."DocNum",
  ST2."U_SWK_ShippingBlock",
  ST2."Confirmed",
  ST2."ItemCode",
  ST2."LineNum",
  ST2."U_SWK_AllocateDate",
  ST2."U_SWK_EarlyShipDate",
  ST2."ShipDate",
  ST2."BackOrdr",
  SUM(ST2."OpenQty") AS "OpenQtyOLD",
  ST2."WhsCode" AS "WhsCodes",
  MAX(ST2."On Hand"),
  SUM(ST2."AllocatedQty"),
  SUM(ST2."OpenQty" - (ST2."On Hand" - ST2."AllocatedQty")) AS "OpenQty"
FROM (

SELECT
  ST03."DocNum",
  ST03."U_SWK_ShippingBlock",
  ST03."Confirmed",
  ST0."LineNum",
  ST0."U_SWK_AllocateDate",
  ST0."U_SWK_EarlyShipDate",
  ST0."ShipDate",
  ST0."BackOrdr",
  ST0."ItemCode",
  SUM(ST0."OpenQty" - ST0."PickOty" - ST0."ReleasQtty") AS "OpenQty",
  MAX(IFNULL(ST02."Allocated Qty", 0)) AS "AllocatedQty",
  ST0."WhsCode",
  MAX(ST01."OnHand") AS "On Hand"
FROM RDR1 ST0
INNER JOIN ORDR ST03
  ON ST0."DocEntry" = ST03."DocEntry"
INNER JOIN OITW ST01
  ON ST01."ItemCode" = ST0."ItemCode"
  AND ST01."WhsCode" = ST0."WhsCode"
LEFT OUTER JOIN (

SELECT
  BT1."ItemCode" AS "ItemCode",
  SUM(BT0."PickQtty" + BT0."RelQtty") AS "Allocated Qty",
  BT1."WhsCode"
FROM PKL1 BT0
INNER JOIN RDR1 BT1
  ON BT0."OrderEntry" = BT1."DocEntry"
  AND BT0."OrderLine" = BT1."LineNum"
WHERE BT0."PickStatus" <> 'C'
GROUP BY BT1."ItemCode",
         BT1."WhsCode") ST02


  ON ST02."ItemCode" = ST01."ItemCode"
  AND ST01."WhsCode" = ST02."WhsCode"
WHERE ST0."U_SWK_AllocateDate" <= CURRENT_DATE
GROUP BY ST0."ItemCode",
         ST0."LineNum",
         ST0."WhsCode",
         ST03."DocNum",
         ST03."U_SWK_ShippingBlock",
         ST03."Confirmed",
         ST0."U_SWK_AllocateDate",
         ST0."U_SWK_EarlyShipDate",
         ST0."ShipDate",
         ST0."BackOrdr"
--UNION ALL
) ST2

GROUP BY ST2."ItemCode",
         ST2."DocNum",
         ST2."U_SWK_ShippingBlock",
         ST2."Confirmed",
         ST2."LineNum",
         ST2."U_SWK_AllocateDate",
         ST2."U_SWK_EarlyShipDate",
         ST2."ShipDate",
         ST2."BackOrdr",
         ST2."WhsCode")

T6
  ON T0."ItemCode" = T6."ItemCode"
  AND T0."WhsCode" <> T6."WhsCodes"
  AND LEFT(T0."WhsCode", 2) = T6."WhsCodes"
  
WHERE CASE

  WHEN IFNULL(T6."OpenQty", 0) = 0 THEN IFNULL(T6."OpenQty", 0)
  WHEN T6."OpenQty" < AST1."OnHandQty" THEN T6."OpenQty"
  ELSE AST1."OnHandQty"
END > 0
AND T0."WhsCode" = '01'
ORDER BY T6."DocNum", T0."ItemCode"
```

GBS Subtopic: MTC_Manufacture to Complete

Source: 

Used By:
