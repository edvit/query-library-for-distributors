# All Open Quotes

### Description

All quotes with status 'O'

```sql
SELECT
  T0."DocNum",
  T0."CardCode",
  T0."CardName",
  T0."UserSign",
  T0."DocTotal"
FROM OQUT T0 --INNER JOIN QUT1 T1 ON T0."DocEntry" = T1."DocEntry"
WHERE T0."DocStatus" = 'O'
```
