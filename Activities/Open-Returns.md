### Open cases where Activity Type ("CntctType") is a Return ('6') and is not closed 


```sql
SELECT
  T0."ClgCode",
  "CardCode",
  "CntctDate",
  "Notes",
  "Details"
FROM OCLG T0
WHERE "Closed" = 'N'
AND "CntctType" = 6
```
