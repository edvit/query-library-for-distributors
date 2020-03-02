### All inventory items min and max stock levels with warehouse name

```sql
SELECT
  T0."ItemCode",
  T0."WhsCode",
  (SELECT
    T1."WhsName"
  FROM OWHS T1
  WHERE T1."WhsCode" = T0."WhsCode")
  AS "Warehouse",
  "MinStock",
  T0."MaxStock"
FROM OITW T0
```
