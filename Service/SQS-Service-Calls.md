# SQS Service Calls

### Description

Detail on all SQS service calls entered (call type = 3)

```sql
SELECT
  T0."createDate",
  T0."callID",
  T0."customer",
  (SELECT
    T9."CardName"
  FROM OCRD T9
  WHERE T0."customer" = T9."CardCode")
  AS "Customer",
  T0."subject",
  T0."origin",
  (SELECT
    T10."Name"
  FROM OSCO T10
  WHERE T10."originID" = T0."origin")
  AS "Origin",
  T0."problemTyp",
  (SELECT
    T11."Name"
  FROM OSCP T11
  WHERE T11."prblmTypID" = T0."problemTyp")
  AS "Problem Type",
  T0."ProSubType",
  (SELECT
    T12."Name"
  FROM OPST T12
  WHERE T12."ProSubTyId" = T0."ProSubType")
  AS "Sub Problem Type",
  T0."descrption",
  T0."resolution",
  T0."U_V33_Allocate1",
  T0."U_V33_Alloc2",
  T0."U_V33_RootCause"
FROM OSCL T0
WHERE "callType" = 3
```
