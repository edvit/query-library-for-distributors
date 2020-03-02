# DIST_Customer_Aging_Receivables

### Desription

Alternate aged receivables report

```sql
CREATE VIEW "DIST_Customer_Aging_Receivables" AS

SELECT
 
T1."CardCode" AS "Cust Num",
T1."CardName" AS "Cust Name",
T0."SYSDeb" AS "Debit Amt",
T0."SYSCred" * -1 AS "Credit Amt",
T0."BalDueDeb",
T0."BalDueCred",
T0."LineMemo",
 
CASE
WHEN T0."TransType" = 13 THEN 'AR Invoice'
WHEN T0."TransType" = 14 THEN 'AR Cred Memo'
WHEN T0."TransType" = 24 THEN 'Payment'
ELSE 'Other'
END AS "Trans Type",

CASE
WHEN T0."TransType" = 13 THEN 'IN'
WHEN T0."TransType" = 14 THEN 'CN'
WHEN T0."TransType" = 24 THEN 'RC'
WHEN T0."TransType" = 30 THEN 'JE'
ELSE ' '
END AS "Trans Abbr",

T0."Ref1" AS "Reference",
T2."NumAtCard",
T0."FCCurrency" AS "Currency",
T0."RefDate",
T0."DueDate",
T0."TaxDate",
 
CASE
WHEN DAYS_BETWEEN(T0."TaxDate",CURRENT_DATE) <  31 THEN
CASE
WHEN T0."BalDueCred" <> 0 THEN T0."BalDueCred" * -1
ELSE T0."BalDueDeb"
END
END AS "0-30 Days",
 
CASE
WHEN DAYS_BETWEEN(T0."TaxDate",CURRENT_DATE) > 30 
AND DAYS_BETWEEN(T0."TaxDate",CURRENT_DATE) < 61 THEN
CASE
WHEN T0."BalDueCred" <> 0 THEN T0."BalDueCred" * -1
ELSE T0."BalDueDeb"
END
END AS "31 to 60 Days",
 
CASE
WHEN DAYS_BETWEEN(T0."TaxDate",CURRENT_DATE) > 60 
AND DAYS_BETWEEN(T0."TaxDate",CURRENT_DATE) < 91 THEN
CASE
WHEN T0."BalDueCred" <> 0 THEN T0."BalDueCred" * -1
ELSE T0."BalDueDeb"
END
END AS "61 to 90 days",
 
CASE
WHEN DAYS_BETWEEN(T0."TaxDate",CURRENT_DATE) > 90 
AND DAYS_BETWEEN(T0."TaxDate",CURRENT_DATE)  < 121 THEN
CASE
WHEN T0."BalDueCred" <> 0 THEN T0."BalDueCred" * -1
ELSE T0."BalDueDeb"
END
END AS "91 to 120 Days",
 
CASE
WHEN DAYS_BETWEEN(T0."TaxDate",CURRENT_DATE) > 120 
THEN
CASE
WHEN T0."BalDueCred" != 0 THEN T0."BalDueCred" * -1
ELSE T0."BalDueDeb"
END
END AS "120 Plus Days"
 
FROM JDT1 T0
 
INNER JOIN OCRD T1 
ON T0."ShortName" = T1."CardCode" 
AND T1."CardType" = 'C' 

LEFT OUTER JOIN (
SELECT TO_VARCHAR(T10."DocNum") AS "DocNum", T10."NumAtCard", T10."ObjType" FROM OINV T10
UNION
SELECT TO_VARCHAR(T20."DocNum") AS "DocNum", T20."NumAtCard", T20."ObjType" FROM ORIN T20
) T2
ON T2."DocNum" = T0."Ref1" AND T2."ObjType" = T0."TransType"
 
WHERE 
 
T0."IntrnMatch" = '0' 
AND T0."BalDueDeb" !=  T0."BalDueCred"
 
ORDER BY 
 
T1."CardCode", 
T0."TaxDate"
```
