# ATP Quantity but No Pick List

### Description

​This is a query that will help identify orders where there is an ATP quantity on the line of the order but no pick list generated. Will help to identify several issues like: ATP recalc not done when converting quote to order or when changing the warehouse, or an incorrect ATP calculation because it doesn't take into account transfers or production orders, or if the automatic transfer from Swagelok consigned to Distributor owned isn't working. Fluctuates throughout the day and we typically only look at orders with an allocate date before today.

### Intended Outcome

​This is a workaround to assist with monitoring process habits and identifying systems issues related to ATP quantity calculation and automatic transfer not working.

```sql
SELECT DISTINCT T0."DocNum",
                T0."CardCode" AS "Customer Code",
                T0."CardName" AS "Customer Name",
                T1."ItemCode" AS "Part Number",
                T1."Quantity",
                T1."U_SWK_AllocateDate" AS "Allocate Date",
                T1."U_SWK_TargetDate" AS "Target Date",
                T1."U_SWK_ATPQty" AS "ATP Qty",
                T0."U_SWK_ShippingBlock" AS "Shipping Block",
                T1."WhsCode"
FROM ORDR T0
INNER JOIN RDR1 T1 ON T0."DocEntry" = T1."DocEntry"
WHERE T1."PickIdNo" IS NULL
  AND T1."U_SWK_ATPQty" >0
  AND T1."U_SWK_AllocateDate" <= CURRENT_DATE
  AND T0."U_SWK_ShippingBlock" = 'N'
  AND T0."CANCELED" <> 'Y'
  AND T0."DocStatus" = 'O'
```

GBS Subtopic: QTC_Quote to Cash

Source: DBORN

Used By: 
