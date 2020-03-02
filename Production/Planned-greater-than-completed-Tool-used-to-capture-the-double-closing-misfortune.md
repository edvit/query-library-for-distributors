# Planned less-than completed: Tool used to capture the double closing issue

### Description

​Production orders from a sales order where the production order complete quantity is greater than the planned quantity

### Intended Outcome

​Displays production orders from sales orders that have more items completed than planned.

Columns:
Production Order Status, Production Order Origin, Production Order Number, Production Item Code, Customer Name...

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
INNER JOIN ORDR T1 ON T0."OriginNum"= T1."DocNum" 
WHERE T0."CmpltQty" > T0."PlannedQty"
```

GBS Subtopic: MTC_Manufacture to Complete

Source: 

Used By:
