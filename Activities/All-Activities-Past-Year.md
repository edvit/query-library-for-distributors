### All activities for the past year

```sql
SELECT
  T0."ClgCode",
  T5."Name",
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
  (
    SELECT
      "descript"
    FROM
      OTER T12
      LEFT OUTER JOIN OCRD T11 ON T11."CardCode" = T3."CardCode"
    WHERE
      T11."Territory" = T12."territryID"
  ) AS "Territory",
  T4."Name" AS "Contact Name",
  T0."Notes",
  T2."USERID",
  T2."U_NAME" AS "Assigned By"
FROM
  OCLG T0
  LEFT OUTER JOIN OUSR T1 ON T1."USERID" = T0."AttendUser"
  LEFT OUTER JOIN OUSR T2 ON T2."USERID" = T0."AssignedBy"
  LEFT OUTER JOIN OCRD T3 ON T3."CardCode" = T0."CardCode"
  LEFT OUTER JOIN OCPR T4 ON T4."CntctCode" = T0."CntctCode"
  LEFT OUTER JOIN OCLT T5 ON T5."Code" = T0."CntctType"
WHERE
  T0."Recontact" > ADD_YEARS(T0."Recontact", -1)
ORDER BY
  T0."Recontact" DESC
```
