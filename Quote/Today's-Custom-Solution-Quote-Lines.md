### Today's custom solution quotes (range 'E')

```sql
SELECT
T0."DocEntry" AS "ID",
T0."DocNum",
T0."CardCode",
T0."CardName" AS "BP Name",
T0."NumAtCard" AS "PO",
T1."LineNum",
T1."ItemCode",
T0."DocDate",
T1."U_SWK_ActualDeliveryDate",
T1."U_SWK_TargetDate" ,
T2."SlpName",
(SELECT  T11."U_NAME" FROM OUSR T11 WHERE T0."UserSign" = T11."USERID") AS "Created By",
(SELECT  T11."U_NAME" FROM OUSR T11 WHERE T0."UserSign2" = T11."USERID") AS "Modified By",
T4."TrnspName" AS "Ship Method"
FROM OQUT T0  INNER JOIN
QUT1 T1 ON T0."DocEntry" = T1."DocEntry" INNER JOIN
OSLP T2 ON T0."SlpCode" = T2."SlpCode" INNER JOIN
OHEM T3 ON T0."OwnerCode" = T3."empID" LEFT OUTER JOIN
OSHP T4 ON T0."TrnspCode" = T4."TrnspCode" LEFT OUTER JOIN
OITM T5 ON T1."ItemCode" = T5."ItemCode"
WHERE T0."DocDate"  = CURRENT_DATE AND "U_SWK_RangeCd" = 'E'
ORDER BY T0."DocDate" DESC
```
