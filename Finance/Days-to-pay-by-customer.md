# Days to Pay Invoice by Customer

### Description

Query to get the number of days it took to pay an invoice by customer. The customer number does need to be entered exactly as you have it in BP Master. Query does not total and average as
we often have customers that pay by both credit card and terms and I remove those credit card charges before getting the average. ​

### Intended Outcome

​Intended to give you the number of days it takes for a customer to pay/close an invoice.

```sql
SELECT T0."CardCode", 
T0."DocNum" AS "Payment #", 
T0."CardName", 
T2."DocDate" AS "Invoice Posting", 
T0."DocDate" AS "Payment Posting", 
T2."TaxDate" AS "Invoice Date", 
DAYS_BETWEEN(T2."TaxDate", T0."DocDate") AS "Days to Payment", 
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
WHERE T0."CardCode" = [%0]
```

GBS Subtopic: RTR_Record to Report

Source: IDAHO

Used By: IDAHO
