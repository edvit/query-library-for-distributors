# AS Items w/o Lead time: Used to identify items without lead times

### Description

​Custom Solutions (Property 59) items with no lead time

### Intended Outcome

​All custom solution items missing a lead time.

Columns:
Item Code, Lead Time.

```sql
SELECT
	 T0."ItemCode",
	 T0."LeadTime" 
FROM OITM T0 
WHERE T0."QryGroup59" = 'Y' 
and T0."LeadTime" IS NULLSELECT
	 T0."ItemCode",
	 T0."LeadTime" 
FROM OITM T0 
WHERE T0."QryGroup59" = 'Y' 
and T0."LeadTime" IS NULL
```

GBS Subtopic: MTC_Manufacture to Complete

Source: 

Used By:
