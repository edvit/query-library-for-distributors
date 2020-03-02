# Production Order Allocations

### Description

​Production order lines for a selected item where the release quantity is greater than zero.

### Intended Outcome

​Used to show where a certain component were allocated to. This is mainly used for re-allocating material between orders for expedites.

Columns:
Production Order Number, Production Item Code, Item Code, Production Line Release Quantity, Document Due Date, Document Start Date...

```sql
SELECT
	 T0."DocNum" AS "Production Order",
	T0."ItemCode",
	 T1."ItemCode",
	 T1."ReleaseQty" AS "Allocated",
	 T0."DueDate",
	 T0."StartDate",
	 T0."PostDate" 
FROM OWOR T0 
INNER JOIN WOR1 T1 ON T0."DocEntry" = T1."DocEntry" 
WHERE T1."ItemCode" =[%0] 
AND T1."ReleaseQty" > 0
```

GBS Subtopic: MTC_Manufacture to Complete

Source: 

Used By:
