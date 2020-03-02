### All business partners with owner

```sql
SELECT
  T0."CardCode",
  T0."CardName",
  T0."CardType",
  T0."GroupCode",
  (SELECT
    "GroupName"
  FROM OCRG T12
  LEFT OUTER JOIN OCRD T11
    ON T11."CardCode" = T0."CardCode"
  WHERE T12."GroupCode" = T11."GroupCode")
  AS "Price List Group",
  T0."OwnerCode",
  T1."firstName",
  T1."lastName"
FROM OCRD T0
LEFT OUTER JOIN OHEM T1
  ON T0."OwnerCode" = T1."empID"
```
