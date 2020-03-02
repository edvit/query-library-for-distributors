### Extract for Global Customer Survey 2018

Select all contacts from CRD1 (Business Partner - Addresses) that have an email address and "Block Sending Marketing Content" equals no.

Assumptions:
-First ship to address's state and country qualify as customer Region and Country
-Non-Customer and Distributor Swagelok Customer Type will be filtered by 'NONC' customer type or Industry code 133 ('DISTR') */

```sql
SELECT
IFNULL(T0."FirstName",'Missing First Name') AS "FirstName",
IFNULL(T0."LastName", 'Missing LastName') AS "Last Name",
IFNULL(T0."E_MailL", 'Missing Email') AS "Email",
IFNULL(T0."Tel1", 'Missing Telephone') AS "Telephone",
(SELECT T12."Name" FROM OLNG T12 WHERE T2."LangCode" = T12."Code") AS "Language",
CASE WHEN T0."BlockComm" = 'Y' THEN 'Do Not Allow'
WHEN T0."BlockComm" = 'N' THEN 'Allow' END AS "Do not allow Marketing Materials",
T0."CardCode" || '-' ||T0."CntctCode" AS "Unique Identifier",
(SELECT "AliasName" FROM OADM) AS "WhoTo Code",
--(SELECT T11."IndName" FROM OOND T11 WHERE T2."IndustryC" = T11."IndCode"),
IFNULL(CASE WHEN T2."U_SWK_BPType" <> 'NONC' OR T2."IndustryC" <> 133 THEN 'End Customer'
ELSE 'Non-Customer or Distributor' END ,'Missing Market')
AS "Swaeglok Account Type",
IFNULL(T2."U_SWK_BPType" || ' - ' ||
CASE
WHEN T2."U_SWK_BPType" = 'AE' THEN 'Architect and Engineering Firm EPC'
WHEN T2."U_SWK_BPType" = 'FABR' THEN 'Fabricator/Panel Contractor or Construction'
WHEN T2."U_SWK_BPType" = 'INCON' THEN 'Contractor'
WHEN T2."U_SWK_BPType" = 'INST' THEN 'Instrument Vendor or Contractor'
WHEN T2."U_SWK_BPType" = 'MECH' THEN 'Mechanical Contractor'
WHEN T2."U_SWK_BPType" = 'NONC' THEN 'Non/Customer'
WHEN T2."U_SWK_BPType" = 'OEM' THEN 'Original Equipment Manufactured'
WHEN T2."U_SWK_BPType" = 'OWN' THEN 'Owner(end user)'
WHEN T2."U_SWK_BPType" = 'PROC' THEN 'Procurement Firm'
WHEN T2."U_SWK_BPType" = 'RD' THEN 'Research/Development Firm'
END
  ,'Missing Customer Type') AS "Customer Type Code & Desc",
--T2."GroupCode" ,
--(SELECT "GroupName" FROM OCRG T12 LEFT OUTER JOIN OCRD T11 ON T11."CardCode" = T2."CardCode" WHERE T12."GroupCode" = T11."GroupCode") AS "Price List Group",
IFNULL(T1."Country",'No Country in Ship To') AS "Country",
IFNULL(T1."State",'No State in Ship To') AS "Region"
--IFNULL(T3."Sales Past Year",0) AS "Sales Past Year"
```
