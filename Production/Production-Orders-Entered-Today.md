### Production orders entered today

```sql
SELECT
T0."DocEntry",
T0."DocNum" AS "Production Number",
(SELECT T10."CardName" FROM OCRD T10 WHERE T0."CardCode" = T10."CardCode") AS "Customer",
T0."ItemCode" AS "Production Item",
T0."PostDate",
T0."DueDate",
(SELECT  T11."U_NAME" FROM OUSR T11 WHERE T0."UserSign" = T11."USERID") AS "User Name",
CASE WHEN T0."Status" = 'R' THEN 'Released'
WHEN T0."Status" = 'C' THEN 'Canceled'
WHEN T0."Status" = 'L' THEN 'Closed'
WHEN T0."Status" = 'P' THEN 'Planned'
END AS "Status"

FROM OWOR T0
WHERE T0."PostDate" = CURRENT_DATE


--T0."PostDate" > ADD_DAYS(CURRENT_DATE, -7)
  
```
