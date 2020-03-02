# New Production Orders

### Description

​Planned production orders for selected date

### Intended Outcome

​Tool used to copy and paste new production order onto our schedule by Date

Columns:
Production Order Origin Number, Production Order Number, Production Item Code, Customer Name, Planned Quantity, Production Document Start Date, Production Document Date

```sql
SELECT
	 T0."OriginNum",
	 T0."DocNum",
	 T0."ItemCode",
	 T1."CardName",
	 T0."PlannedQty",
	 T0."DueDate",
	 T0."StartDate",
	 T0."PostDate" 
FROM OWOR T0 
INNER JOIN ORDR T1 ON T0."OriginNum" = T1."DocNum" 
WHERE T0."PostDate" =[%0] 
AND T0."Status" = 'P'
```

GBS Subtopic: MTC_Manufacture to Complete, QTC_Quote to Cash

Source: 

Used By:
