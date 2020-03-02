# Open Assemblies Overview

### Description

​An overview of all open Assemblies on sales orders with details of what is in stock or on order with Sales Order dates.

### Intended Outcome

​Used to view what is confirmed and pending

```sql
SELECT T0."DocNum" AS "Sales Order", 
T1."PoTrgNum" AS "Production Order", 
T1."ItemCode", 
T0."CardName", 
T1."OpenQty", 
T1."U_SWK_TargetDate", 
T1."U_SWK_NeedShipDate", 
T1."U_SWK_BPNeedDate",
T0."DocDate" AS "Date Entered", 
T0."NumAtCard" AS "Customer PO#", 
T1."LineNum", 
T1."LinePoPrss", 
T2."OnHand", 
T2."IsCommited", 
T2."OnOrder", 
T1."LineStatus", 
T1."LineTotal"
FROM ORDR T0
INNER JOIN RDR1 T1
  ON T0."DocEntry" = T1."DocEntry"
INNER JOIN OITM T2
  ON T1."ItemCode" = T2."ItemCode"
WHERE T0."DocStatus" = 'O'
AND T2."QryGroup59" = 'Y'
AND T1."LineStatus" = 'O'
```

GBS Subtopic: MTC_Manufacture to Complete

Source: 

Used By:
