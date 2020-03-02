### Basic info on all business partners

```sql
SELECT
  T0."CardCode",
  T0."CardName",
  T0."CardType",
  T2."BPLId",
  T3."BPLName",
  T0."GroupCode",
  (SELECT
    "GroupName"
  FROM OCRG T13
  LEFT OUTER JOIN OCRD T11
    ON T11."CardCode" = T0."CardCode"
  WHERE T13."GroupCode" = T11."GroupCode")
  AS "Price List Group",
  T0."OwnerCode",
  T1."firstName",
  T1."lastName"
FROM OCRD T0
LEFT OUTER JOIN OHEM T1
  ON T0."OwnerCode" = T1."empID"
LEFT OUTER JOIN CRD8 T2
  ON T2."CardCode" = T0."CardCode"
LEFT OUTER JOIN OBPL T3
  ON T2."BPLId" = T3."BPLId"
```
