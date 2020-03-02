### Open quotes modified by current user. 

For use with count widget

```sql
SELECT
  "DocNum",
  "CardCode",
  "CardName",
  "UserSign"
FROM OQUT
WHERE "DocStatus" = 'O'
AND "UserSign2" = $[USER]

```
