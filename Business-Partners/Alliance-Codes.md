### Get alliance codes for all customers (Type 'C')

```sql
SELECT
  T0."CardCode",
  T0."CardName",
  (SELECT
    "GroupName"
  FROM OCRG T12
  WHERE T12."GroupCode" = T0."GroupCode")
  AS "Customer Group",
  T0."U_SWK_AllianceCode",
  T0."U_SWK_SWKKeyAccountCode"
FROM OCRD T0
WHERE T0."CardType" = 'C'
ORDER BY T0."CardCode"
```
