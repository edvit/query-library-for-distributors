### Price list info on select parts for all business partners. Useful for spot checking prices.

```sql
SELECT
  T0."CardCode",
  T0."CardName",
  T0."GroupCode",
  (SELECT
    T12."GroupName"
  FROM OCRG T12
  LEFT OUTER JOIN OCRD T11
    ON T11."CardCode" = T0."CardCode"
  WHERE T12."GroupCode" = T11."GroupCode")
  AS "Customer Group",
  T0."ListNum",
  (SELECT
    T16."ListName"
  FROM OPLN T16
  WHERE T16."ListNum" = T0."ListNum")
  AS "List Name",
  T0."OwnerCode",
  T1."firstName",
  T1."lastName",
  T0."Territory",
  (SELECT
    T13."descript"
  FROM OTER T13
  WHERE T0."Territory" = T13."territryID")
  AS "Territory Name",
  (SELECT
    T14."Price"
  FROM ITM1 T14
  WHERE "ItemCode" = 'SS-600-1-4'
  AND "PriceList" = 1)
  AS "SS-600-1-4 List",
  (SELECT
    T15."Price"
  FROM OSPP T15
  WHERE T15."ItemCode" = 'SS-600-1-4'
  AND T15."CardCode" = T0."CardCode")
  AS "SS-600-1-4 Cust",
  (SELECT
    T14."Price"
  FROM ITM1 T14
  WHERE "ItemCode" = 'SS-6P4T'
  AND "PriceList" = 1)
  AS "SS-6P4T List",
  (SELECT
    T15."Price"
  FROM OSPP T15
  WHERE T15."ItemCode" = 'SS-6P4T'
  AND T15."CardCode" = T0."CardCode")
  AS "SS-6P4T Cust",
  (SELECT
    T14."Price"
  FROM ITM1 T14
  WHERE "ItemCode" = 'SS-T6-S-035-20'
  AND "PriceList" = 1)
  AS "SS-T6-S-035-20  List",
  (SELECT
    T15."Price"
  FROM OSPP T15
  WHERE T15."ItemCode" = 'SS-T6-S-035-20'
  AND T15."CardCode" = T0."CardCode")
  AS "SS-T6-S-035-20 Cust"
FROM OCRD T0
LEFT OUTER JOIN OHEM T1
  ON T0."OwnerCode" = T1."empID"
WHERE T0."CardType" = 'C'
```
