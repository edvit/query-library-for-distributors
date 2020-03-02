### Open 'SWGLK' purchase order lines with 0 discount percentage

```sql
SELECT
  T0."DocNum",
  MIN(T1."DiscPrcnt"),
  SUM(T1."LineTotal")
FROM OPOR T0
INNER JOIN POR1 T1
  ON T0."DocEntry" = T1."DocEntry"
WHERE T0."CardCode" = 'SWGLK'
AND T1."DiscPrcnt" = 0
AND "DocStatus" = 'O'
GROUP BY T0."DocNum"

/*SELECT
  *
FROM OPOR T0
INNER JOIN POR1 T1
  ON T0."DocEntry" = T1."DocEntry"
WHERE T0."CardCode" = 'SWGLK'
AND T1."DiscPrcnt" = 0
AND "DocStatus" = 'O'*/
```
