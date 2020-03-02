### Service calls related to customer care (origin = 1) with date range parameter

```sql
SELECT
  T0."callID",
  T0."subject",
  T0."custmrName",
  T0."createDate",
  T0."descrption",
  T0."updateDate",
  T0."resolOnDat",
  T0."resolution",
  T0."respAssign",
  T0."U_V33_RootCause"
FROM OSCL T0
WHERE T0."origin" = 1
AND T0."createDate" > [%0]
AND T0."createDate" < [%1]
```
