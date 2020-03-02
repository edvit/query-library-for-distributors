SELECT 
T0."Status", 
T0."OriginNum", 
T0."DocNum", 
T0."ItemCode", 
T1."CardName", 
T0."PlannedQty", 
T0."CmpltQty", 
T0."DueDate", 
T0."StartDate", 
T0."PostDate"
FROM OWOR T0
INNER JOIN ORDR T1
  ON T0."OriginNum" = T1."DocNum"
WHERE T0."CmpltQty" > T0."PlannedQty"
