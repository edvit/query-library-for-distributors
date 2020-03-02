### All orders today

```sql
SELECT
  T1."DocEntry" AS "ID",
  T1."DocNum" AS "Order#",
  T1."CardCode" AS "BP Code",
  T1."CardName" AS "BP Name",
  T1."DocDate" AS "Date",
  T1."NumAtCard" AS "PO",
  T1."SlpCode" AS "Sales#",
  O1."OwnerCode",
  CASE
    WHEN T1.CANCELED = 'Y' THEN 'Cancelled'
    WHEN T1."DocStatus" = 'C' THEN 'Closed'
    ELSE 'Open'
  END AS "Status",
  T1."DocTotal" AS "Total $"
FROM ORDR T1
WHERE T1."DocDate" = CURRENT_UTCDATE
ORDER BY T1."DocDate" DESC
```
