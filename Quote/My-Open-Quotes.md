### Open quotes for current user. For use with count widget

```sql
SELECT
  "DocNum",
  "CardCode",
  "CardName",
  "UserSign"
FROM OQUT
WHERE "DocStatus" = 'O' 
AND "UserSign" = $[USER]
```
