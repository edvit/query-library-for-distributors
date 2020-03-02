### Default contact for all business partners

```sql
SELECT
  T0."Name" AS "Default Contact",
  T1."CardCode",
  T1."CardName"
FROM OCPR T0
INNER JOIN OCRD T1
  ON T0."CardCode" = T1."CardCode"
WHERE T1."CntctPrsn" = T0."Name"
ORDER BY T0."Name"
```
