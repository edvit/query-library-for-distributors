### All contacts that have Block Sending Marketing equal to yes

```sql
SELECT
T0."CardCode",
T1."CardName",
T0."FirstName",
T0."LastName",
T0."E_MailL",
T0."Tel1",
T0."BlockComm",
T2."lastName" AS "Account Manager"

FROM OCPR T0 LEFT OUTER JOIN OCRD T1 ON T0."CardCode" = T1."CardCode"
LEFT OUTER JOIN OHEM T2 ON T1."OwnerCode"  = T2."empID"

WHERE  T0."BlockComm" = 'Y'
```
