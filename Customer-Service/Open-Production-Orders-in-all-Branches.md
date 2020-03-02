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
