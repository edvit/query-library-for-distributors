### Yesterday's Quote Lines

```sql
SELECT *  FROM OQUT T0
 INNER JOIN QUT1 T1 ON T0."DocEntry" = T1."DocEntry"
WHERE T0."DocDate"  = ADD_DAYS(CURRENT_DATE,-1)
```
