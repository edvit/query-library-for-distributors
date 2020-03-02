# Open Production Orders in All Branches

### Description

​Gives an overview of all Open Production Orders in all branches and provides part#, description, qty, Order #, BP Code, Due Date, and Order Date.

### Intended Outcome

​Can help to give an overview of the work in CS that is open and when it is due. Can be filtered by branch after running.

```sql
SELECT T0."Warehouse",
  T0."DocNum" AS "Prod. Order",
  T0."ItemCode" AS "Part #",
  T1."ItemName",
  T0."PlannedQty" AS "Planned Qty",
  T2."DocNum" AS "Sales Order",
  T0."CardCode",
  T0."DueDate",
  T0."PostDate" AS "Order Date"
FROM OWOR T0
INNER JOIN OITM T1
  ON T0."ItemCode" = T1."ItemCode"
LEFT OUTER JOIN ORDR T2
  ON T0."OriginNum" = T2."DocNum"
WHERE T0."Status" = 'P'
OR T0."Status" = 'R'
ORDER BY T0."Warehouse", T0."DueDate"
```

GBS Subtopic: MTC_Manufacture to Complete

Source: KAW

Used By: KAW
