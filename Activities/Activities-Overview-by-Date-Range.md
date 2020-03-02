### All activities with start date parameter

```sql
SELECT 
  T0."ClgCode", 
  T0."Recontact" AS "Start Date", 
  T0."CntctTime" AS "Start Time", 
  T1."U_NAME" AS "Handled By", 
  CASE
  WHEN T0."Action" = 'M' THEN 'Meeting'
  WHEN T0."Action" = 'C' THEN 'Phone Call'
  WHEN T0."Action" = 'T' THEN 'Task'
  WHEN T0."Action" = 'N' THEN 'Note'
  WHEN T0."Action" = 'P' THEN 'Campaign'
  ELSE 'Other' END AS "Activity", 
  T3."CardCode", 
  T3."CardName" AS "BP Name", 
  T4."Name" AS "Contact Name", 
  T0."Notes", 
  T2."U_NAME" AS "Assigned By" 
FROM 
  OCLG T0 
  LEFT OUTER JOIN OUSR T1 ON T1."USERID" = T0."AttendUser" 
  LEFT OUTER JOIN OUSR T2 ON T2."USERID" = T0."AssignedBy" 
  LEFT OUTER JOIN OCRD T3 ON T3."CardCode" = T0."CardCode" 
  LEFT OUTER JOIN OCPR T4 ON T4."CntctCode" = T0."CntctCode" 
WHERE 
  T0."Recontact" <= [ % 0] 
  AND T0."Recontact" >= [ % 1]
```
