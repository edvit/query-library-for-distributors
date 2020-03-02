### Open orders with missing dates (Allocate and early ship) 

```sql
SELECT
T0."DocNum",
T0."DocDate",
T1."LineNum",
T0."CardCode",
T2."SlpName",
(SELECT  T11."U_NAME" FROM OUSR T11 WHERE T0."UserSign" = T11."USERID") AS "Created By",
(SELECT  T11."U_NAME" FROM OUSR T11 WHERE T0."UserSign2" = T11."USERID") AS "Modified By",
T1."ItemCode",
T1."Quantity",
T1."DelivrdQty",
T1."U_SWK_EarlyShipDate",
T1."U_SWK_AllocateDate",
T1."U_SWK_BPNeedDate",
T1."U_SWK_PromiseDate",
T1."U_SWK_TargetDate",
T1."ShipDate",
T1."LineStatus" ,
T4."TrnspName"
FROM ORDR T0  INNER JOIN
RDR1 T1 ON T0."DocEntry" = T1."DocEntry" INNER JOIN
OSLP T2 ON T0."SlpCode" = T2."SlpCode" INNER JOIN
OHEM T3 ON T0."OwnerCode" = T3."empID" INNER JOIN
OSHP T4 ON T0."TrnspCode" = T4."TrnspCode"
WHERE T1."LineStatus"  = 'O'
AND ('' =  COALESCE(T1."U_SWK_AllocateDate", '' )
OR '' =  COALESCE(T1."U_SWK_EarlyShipDate", '' ))
ORDER BY T0."DocNum", T1."LineNum"
```
