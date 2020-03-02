### 12 months of order lines

```sql
SELECT
  T1."DocEntry" AS "ID",
  T1."DocNum" AS "Order#",
  T1."CardCode" AS "BP Code",
  T1."CardName" AS "BP Name",
  T1."DocDate" AS "Date",
  (SELECT
    T11."USER_CODE"
  FROM OUSR T11
  WHERE T1."UserSign" = T11."USERID")
  AS "Created By",
  (SELECT
    T11."U_NAME"
  FROM OUSR T11
  WHERE T1."UserSign" = T11."USERID")
  AS "User Name",
  (SELECT
    T11."U_NAME"
  FROM OUSR T11
  WHERE T1."UserSign2" = T11."USERID")
  AS "Modified By",
  T1."NumAtCard" AS "PO",
  T1."SlpCode" AS "Sales#",
  T1."OwnerCode",
  CASE
    WHEN T1.CANCELED = 'Y' THEN 'Cancelled'
    WHEN T1."DocStatus" = 'C' THEN 'Closed'
    ELSE 'Open'
  END AS "Status",
  T2."ItemCode",
  T2."LineTotal" AS "Total $"
FROM ORDR T1
INNER JOIN RDR1 T2
  ON T1."DocEntry" = T2."DocEntry"
WHERE T1."DocDate" > ADD_YEARS(CURRENT_DATE, -1)
ORDER BY T1."DocDate" DESC
```
