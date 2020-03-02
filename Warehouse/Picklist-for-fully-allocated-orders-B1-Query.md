# Picklists for fully allocated orders B1 query 

### Description

​Picklist not waiting for allocation.

### Intended Outcome

GBS Discussion Item

```sql
​SELECT
  T2."AbsEntry" AS "PickList Number"
FROM "DIST_Get_Ship_Complete_Allocation" T1
INNER JOIN PKL1 T2
  ON T2."OrderEntry" = T1."DocEntry"
WHERE T2."PickStatus" <> 'C'
GROUP BY T1."DocNum",
         T2."AbsEntry"
HAVING MAX(T1."AwaitingAllocation") <= 0
```

GBS Subtopic: 

Source: EDMON

Used By: EDMON
