# Usage by Part Number

### Description

Looks at usage over the past year for a part number. Includes Sales and Production orders.​

### Intended Outcome

Show the pieces of a part that were sold in each month.

```sql
SELECT 
T50."Month", 
T50."Year", 
Sum(T50."Orders") as "Orders", 
Sum(T50."Pieces") as "Pieces Sold" 
from
((SELECT Count(T0."DocNum") as "Orders", 
Sum(T1."Quantity") as "Pieces", MonthName(T0."DocDate") as "Month", 
Year(T0."DocDate") as "Year" 
FROM ORDR T0  INNER JOIN RDR1 T1 ON T0."DocEntry" = T1."DocEntry" 
WHERE T0."CANCELED" = 'N' and  T1."ItemCode" = [%0] and T0."DocDate" > add_days(Current_Date,-365) 
GROUP BY T0."DocDate" ORDER BY T0."DocDate" desc)

UNION ALL

SELECT 
Count(T0."DocNum") as "Orders", 
Sum(T1."IssuedQty") as "Pieces", 
MonthName(T0."PostDate") as "Month", 
Year(T0."PostDate") as "Year" 
FROM OWOR T0  INNER JOIN WOR1 T1 ON T0."DocEntry" = T1."DocEntry" 
WHERE T0."Status" <> 'C' and  T1."ItemCode" = [%0] and T0."PostDate" > add_days(Current_Date,-365) 
GROUP BY T0."PostDate" ORDER BY T0."PostDate" desc))T50
Group by T50."Month", T50."Year"
Order by T50."Month"
```

GBS Subtopic: FTP_Forecast to Plan, ITD_Inventory to Delivery, MTC_Manufacture to Complete, QTC_Quote to Cash

Source: ROCHS

Used By: ROCHS
