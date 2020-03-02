# Fully allocated orders B1 query 

### Description

​Orders ready to pick.

### Intended Outcome

GBS Discussion Item

```sql

SELECT
  T1."DocNum" AS "SalesOrder"
FROM "DIST_Get_Ship_Complete_Allocation" T1
GROUP BY T1."DocNum"
HAVING MAX(T1."AwaitingAllocation") <= 0
```

GBS Subtopic: 

Source: EDMON

Used By: EDMON
