# Completed but not Closed Production Orders

### Description

​Shows those Production orders where completion was reported but the status wasn't changed to "Closed".

### Intended Outcome

​Could easily be turned into a widget that is monitored for any issues where production orders are completed but not toggled to "closed".

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
WHERE T0."PlannedQty" = T0."CmpltQty" 
AND T0."Status" = 'R'
```

GBS Subtopic: MTC_Manufacture to Complete

Source: 

Used By:
