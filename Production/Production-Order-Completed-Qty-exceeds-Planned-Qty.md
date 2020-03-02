# Production Order Completed Qty exceeds Planned Qty

### Description

​Identifies when someone accidentally issues for production multiple times and it looks like the completed quantity exceeds the planned quantity on a production order.

### Intended Outcome

​Identifies when someone accidentally issues for production multiple times and action will need to be taken to put components back into stock and remove the final assembly from inventory.

```sql
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
```

GBS Subtopic: MTC_Manufacture to Complete

Source: 

Used By: DBORN
