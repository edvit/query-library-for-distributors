# Extract for Global Customer Survey 2018

### Description

Select all contacts from CRD1 (Business Partner - Addresses) that have an email address field
that contains data.

Assumptions:
-First ship to address state and country qualify as customer Region and Country
-Non-Customer and Distributor Swagelok Customer Type will be filtered by 'NONC' customer type
or Industry code 133 ('DISTR')

### Intended Outcome

​GBS Discussion

```sql
SELECT
T0."CardCode" || '-' ||T0."CntctCode" AS "Unique Identifier",
(SELECT "AliasName" FROM OADM) AS "WhoTo Code",
IFNULL(T0."FirstName",'Missing First Name') AS "FirstName",
IFNULL(T0."LastName", 'Missing LastName') AS "Last Name",
IFNULL(T0."E_MailL", 'Missing Email') AS "Email",
IFNULL(T0."Tel1", 'Missing Telephone') AS "Telephone",
IFNULL(T1."State",'No State in Ship To') AS "Region",
IFNULL(T1."Country",'No Country in Ship To') AS "Country",
(SELECT T12."Name" FROM OLNG T12 WHERE T2."LangCode" = T12."Code") AS "Language",
IFNULL(T2."U_SWK_BPType",'Missing Customer Type') AS "Customer Type",
IFNULL((SELECT T11."IndName" FROM OOND T11 WHERE T2."IndustryC" = T11."IndCode"),'Missing Market')
AS "Customer Market",
IFNULL(T3."Sales Past Year",0) AS "Sales Past Year",
T0."BlockComm"

FROM OCPR T0
LEFT OUTER JOIN (SELECT MIN(T10."LineNum") AS "First ShipTo", T10."CardCode", T10."State", T10."Country" FROM CRD1 T10
    WHERE T10."AdresType" = 'S' AND T10."Country" IS NOT NULL AND T10."State" IS NOT NULL
    GROUP BY T10."CardCode", T10."State", T10."Country") T1 ON T0."CardCode" = T1."CardCode"
LEFT OUTER JOIN OCRD T2 ON T0."CardCode" = T2."CardCode"
LEFT OUTER JOIN (SELECT T14."CardName", SUM(T14."DocTotal"-T14."VatSum") AS "Sales Past Year" FROM ORDR T14
    WHERE T14."CANCELED" = 'N' AND T14."DocDate" > ADD_YEARS(CURRENT_DATE, -1)
    GROUP BY  T14."CardName") T3 ON T2."CardName" = T3."CardName"
WHERE T0."E_MailL" <> '' AND T0."BlockComm" = 'N'
```

GBS Subtopic: 

Source: NLOND

Used By: 
