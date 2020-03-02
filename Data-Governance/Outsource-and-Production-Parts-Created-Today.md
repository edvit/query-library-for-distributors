### Outsourced and Production Items that were created today for data governance alert.

Filtered on Item Group Code where 101 is custom solutions and 104 is outsource.

```sql
SELECT
  T0."ItemCode",
  T0."ItemName",
  T0."UserSign",
  (SELECT
    T11."U_NAME"
  FROM OUSR T11
  WHERE T0."UserSign" = T11."USERID")
  AS "User Name",
  T0."CreateDate",
  T0."ItmsGrpCod"
FROM OITM T0
WHERE DAYS_BETWEEN("CreateDate", CURRENT_DATE) = 0
AND T0."ItmsGrpCod" IN (101, 104)
```
