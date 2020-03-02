### Open purchase order lines from vendor 'SWGLK'


```sql
SELECT
  T0."DocNum",
  T1."LineNum",
  T1."ItemCode",
  T2."U_SWK_PurDiscCode",
  T1."LineTotal",
  T1."DiscPrcnt"
FROM OPOR T0
INNER JOIN POR1 T1
  ON T0."DocEntry" = T1."DocEntry"
LEFT OUTER JOIN OITM T2
  ON T1."ItemCode" = T2."ItemCode"
WHERE T0."CardCode" = 'SWGLK'
AND "DocStatus" = 'O'
```
