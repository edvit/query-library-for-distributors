### Customers by days between invoice and payment

```sql
SELECT
  T0."CardCode",
  T0."DocNum" AS "Payment #",
  T0."CardName",
  T2."DocDate" "Invoice Posting",
  T0."DocDate" "Payment Posting",
  T2."TaxDate" "Invoice Date",
  DAYS_BETWEEN(T2."TaxDate", T0."DocDate") "Days to Payment",
  T4."PymntGroup"
FROM ORCT T0
JOIN RCT2 T1
  ON T1."DocNum" = T0."DocNum"
JOIN OINV T2
  ON T2."DocEntry" = T1."DocEntry"
JOIN OCRD T3
  ON T3."CardCode" = T0."CardCode"
JOIN OCTG T4
  ON T4."GroupNum" = T3."GroupNum"


/*Optional Customer Filter*/
--WHERE T0."CardName" LIKE '[%0\]%'
```
