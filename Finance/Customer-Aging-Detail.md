## Customer aged receivable query.

Change XXXXX in  "_SYS_BIC"."sap.XXXXXpb1.ar.case/CustomerReceivableAgingQuery" to appropriate database

```sql
SELECT
  T0."DocEntry",
  T0."DocNum",
  T0."ObjType",
  T0."CardName",
  T0."CardCode",
  T0."DocDate",
  T0."TaxDate",
  T0."DocDueDate",
  T1."AgingBucket",
  T1."BusinessPartnerNameAndCode",
  T1."BranchName",
  T0."Ref" AS "NumAtCard",
  T1."DocumentTypeDisplayName",
  T1."DocumentTypeGroup",
  T1."OverdueLC",
  T1."FutureRemitLC",
  T1."AgingBalanceDueLC",
  T1."OriginalAmountLC",
  T3."Memo",
  DAYS_BETWEEN(T0."TaxDate", CURRENT_DATE) AS "Days From Tax Date",
  CASE
    WHEN DAYS_BETWEEN(T0."TaxDate", CURRENT_DATE) <= 30 THEN '0-30'
    WHEN DAYS_BETWEEN(T0."TaxDate", CURRENT_DATE) >= 31 AND
      DAYS_BETWEEN(T0."TaxDate", CURRENT_DATE) <= 60 THEN '31-60'
    WHEN DAYS_BETWEEN(T0."TaxDate", CURRENT_DATE) >= 61 AND
      DAYS_BETWEEN(T0."TaxDate", CURRENT_DATE) <= 90 THEN '61-90'
    WHEN DAYS_BETWEEN(T0."TaxDate", CURRENT_DATE) >= 91 AND
      DAYS_BETWEEN(T0."TaxDate", CURRENT_DATE) <= 120 THEN '90-120'
    WHEN DAYS_BETWEEN(T0."TaxDate", CURRENT_DATE) > 120 THEN '121+'
  END AS "Age Bucket",
  CASE
    WHEN DAYS_BETWEEN(T0."TaxDate", CURRENT_DATE) <= 30 THEN T1."OriginalAmountLC"
    ELSE 0
  END AS "0-30",
  CASE
    WHEN DAYS_BETWEEN(T0."TaxDate", CURRENT_DATE) >= 31 AND
      DAYS_BETWEEN(T0."TaxDate", CURRENT_DATE) <= 60 THEN T1."OverdueLC"
    ELSE 0
  END AS "31-60",
  CASE
    WHEN DAYS_BETWEEN(T0."TaxDate", CURRENT_DATE) >= 61 AND
      DAYS_BETWEEN(T0."TaxDate", CURRENT_DATE) <= 90 THEN T1."OverdueLC"
    ELSE 0
  END AS "61-90",
  CASE
    WHEN DAYS_BETWEEN(T0."TaxDate", CURRENT_DATE) >= 91 AND
      DAYS_BETWEEN(T0."TaxDate", CURRENT_DATE) <= 120 THEN T1."OverdueLC"
    ELSE 0
  END AS "91-120",
  CASE
    WHEN DAYS_BETWEEN(T0."TaxDate", CURRENT_DATE) > 120 THEN T1."OverdueLC"
    ELSE 0
  END AS "121+"
FROM "_SYS_BIC"."sap.edmonpb1.ar.case/CustomerReceivableAgingQuery" T1
INNER JOIN (SELECT
  T10."DocEntry",
  T10."DocNum",
  T10."ObjType",
  T10."CardName",
  T10."CardCode",
  T10."NumAtCard" AS "Ref",
  T10."DocDate",
  T10."TaxDate",
  T10."DocDueDate"
FROM "EDMON_PB1"."OINV" T10
UNION
SELECT
  T11."DocEntry",
  T11."DocNum",
  T11."ObjType",
  T11."CardName",
  T11."CardCode",
  T11."CounterRef" AS "Ref",
  T11."DocDate",
  T11."TaxDate",
  T11."DocDueDate"
FROM "EDMON_PB1"."ORCT" T11
UNION
SELECT
  T12."DocEntry",
  T12."DocNum",
  T12."ObjType",
  T12."CardName",
  T12."CardCode",
  T12."NumAtCard" AS "Ref",
  T12."DocDate",
  T12."TaxDate",
  T12."DocDueDate"
FROM "EDMON_PB1"."ORIN" T12) T0
  ON T1."BaseDocumentNumber" = T0."DocNum"
  AND T1."DocumentTypeCode" = T0."ObjType"
LEFT OUTER JOIN "EDMON_PB1"."OJDT" T3
  ON T3."BaseRef" = T0."DocNum"
  AND T0."ObjType" = T3."TransType"
```
