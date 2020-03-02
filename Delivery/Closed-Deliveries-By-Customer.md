### Delivery Info by customer code

```sql
SELECT
  "DocEntry",
  "DocNum",
  "CardCode",
  "DocDate",
  "NumAtCard" AS "Customer Ref"
FROM ODLN
WHERE "DocStatus" = 'C'
AND "CardCode" = [%0]
```
