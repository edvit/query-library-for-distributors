### All business partners created today for data governance alerts

```sql
SELECT
  "CardCode",
  "CardName",
  "CardType",
  "Address",
  "CreateDate"
FROM OCRD
WHERE DAYS_BETWEEN("CreateDate", CURRENT_DATE) = 0
```
