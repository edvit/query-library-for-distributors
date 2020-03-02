# Hypercare Metrics | All Swagelok Reporting Metrics

### Description

​Count of documents and document lines for date entered and five days in the future

### Intended Outcome

​Hypercare metrics data. Might be useful for distributors tracking quote/order/delivery stats.


Columns:
Count of Quotes, Quote Lines, Orders, Order Lines, Deliveries, Delivery Lines, Invoices, Invoice Lines, Purchase Orders, Purchase Order Lines for each day six days from the date selected.


```sql
SELECT
  'Quote' AS "Doc Type",
  COUNT("DocNum") AS "Day 1",
  (SELECT
    COUNT("DocNum")
  FROM OQUT T0
  WHERE T0."DocDate" = ADD_DAYS('[%]', +1))
  AS "Day 2",
  (SELECT
    COUNT("DocNum")
  FROM OQUT T0
  WHERE T0."DocDate" = ADD_DAYS('[%]', +2))
  AS "Day 3",
  (SELECT
    COUNT("DocNum")
  FROM OQUT T0
  WHERE T0."DocDate" = ADD_DAYS('[%]', +3))
  AS "Day 4",
  (SELECT
    COUNT("DocNum")
  FROM OQUT T0
  WHERE T0."DocDate" = ADD_DAYS('[%]', +4))
  AS "Day 5",
  (SELECT
    COUNT("DocNum")
  FROM OQUT T0
  WHERE T0."DocDate" = ADD_DAYS('[%]', +5))
  AS "Day 6"
FROM OQUT T0
WHERE T0."DocDate" = ('[%]')
UNION ALL
SELECT
  'Quote Lines' AS "Doc Type",
  COUNT("DocNum") AS "Day 1",
  (SELECT
    COUNT("DocNum")
  FROM OQUT T0
  INNER JOIN QUT1 T1
    ON T0."DocEntry" = T1."DocEntry"
  WHERE T0."DocDate" = ADD_DAYS('[%]', +1))
  AS "Day 2",
  (SELECT
    COUNT("DocNum")
  FROM OQUT T0
  INNER JOIN QUT1 T1
    ON T0."DocEntry" = T1."DocEntry"
  WHERE T0."DocDate" = ADD_DAYS('[%]', +2))
  AS "Day 3",
  (SELECT
    COUNT("DocNum")
  FROM OQUT T0
  INNER JOIN QUT1 T1
    ON T0."DocEntry" = T1."DocEntry"
  WHERE T0."DocDate" = ADD_DAYS('[%]', +3))
  AS "Day 4",
  (SELECT
    COUNT("DocNum")
  FROM OQUT T0
  INNER JOIN QUT1 T1
    ON T0."DocEntry" = T1."DocEntry"
  WHERE T0."DocDate" = ADD_DAYS('[%]', +4))
  AS "Day 5",
  (SELECT
    COUNT("DocNum")
  FROM OQUT T0
  INNER JOIN QUT1 T1
    ON T0."DocEntry" = T1."DocEntry"
  WHERE T0."DocDate" = ADD_DAYS('[%]', +5))
  AS "Day 6"
FROM OQUT T0
INNER JOIN QUT1 T1
  ON T0."DocEntry" = T1."DocEntry"
WHERE T0."DocDate" = [%]
UNION ALL
SELECT
  'Orders' AS "Doc Type",
  COUNT("DocNum") AS "Day 1",
  (SELECT
    COUNT("DocNum")
  FROM ORDR T0
  WHERE T0."DocDate" = ADD_DAYS('[%]', +1))
  AS "Day 2",
  (SELECT
    COUNT("DocNum")
  FROM ORDR T0
  WHERE T0."DocDate" = ADD_DAYS('[%]', +2))
  AS "Day 3",
  (SELECT
    COUNT("DocNum")
  FROM ORDR T0
  WHERE T0."DocDate" = ADD_DAYS('[%]', +3))
  AS "Day 4",
  (SELECT
    COUNT("DocNum")
  FROM ORDR T0
  WHERE T0."DocDate" = ADD_DAYS('[%]', +4))
  AS "Day 5",
  (SELECT
    COUNT("DocNum")
  FROM ORDR T0
  WHERE T0."DocDate" = ADD_DAYS('[%]', +5))
  AS "Day 6"
FROM ORDR T0
WHERE T0."DocDate" = '[%]'
UNION ALL
SELECT
  'Order Lines' AS "Doc Type",
  COUNT('DocNum') AS "Day 1",
  (SELECT
    COUNT('DocNum')
  FROM ORDR T0
  INNER JOIN RDR1 T1
    ON T0."DocEntry" = T1."DocEntry"
  WHERE T0."DocDate" = ADD_DAYS('[%]', +1))
  AS "Day 2",
  (SELECT
    COUNT('DocNum')
  FROM ORDR T0
  INNER JOIN RDR1 T1
    ON T0."DocEntry" = T1."DocEntry"
  WHERE T0."DocDate" = ADD_DAYS('[%]', +2))
  AS "Day 3",
  (SELECT
    COUNT('DocNum')
  FROM ORDR T0
  INNER JOIN RDR1 T1
    ON T0."DocEntry" = T1."DocEntry"
  WHERE T0."DocDate" = ADD_DAYS('[%]', +3))
  AS "Day 4",
  (SELECT
    COUNT('DocNum')
  FROM ORDR T0
  INNER JOIN RDR1 T1
    ON T0."DocEntry" = T1."DocEntry"
  WHERE T0."DocDate" = ADD_DAYS('[%]', +4))
  AS "Day 5",
  (SELECT
    COUNT('DocNum')
  FROM ORDR T0
  INNER JOIN RDR1 T1
    ON T0."DocEntry" = T1."DocEntry"
  WHERE T0."DocDate" = ADD_DAYS('[%]', +5))
  AS "Day 6"
FROM ORDR T0
INNER JOIN RDR1 T1
  ON T0."DocEntry" = T1."DocEntry"
WHERE T0."DocDate" = '[%]'
UNION ALL
SELECT
  'Deliveries' AS "DocType",
  COUNT("DocNum") AS "Day 1",
  (SELECT
    COUNT("DocNum")
  FROM ODLN T0
  WHERE T0."DocDate" = ADD_DAYS('[%]', +1))
  AS "Day 2",
  (SELECT
    COUNT("DocNum")
  FROM ODLN T0
  WHERE T0."DocDate" = ADD_DAYS('[%]', +2))
  AS "Day 3",
  (SELECT
    COUNT("DocNum")
  FROM ODLN T0
  WHERE T0."DocDate" = ADD_DAYS('[%]', +3))
  AS "Day 4",
  (SELECT
    COUNT("DocNum")
  FROM ODLN T0
  WHERE T0."DocDate" = ADD_DAYS('[%]', +4))
  AS "Day 5",
  (SELECT
    COUNT("DocNum")
  FROM ODLN T0
  WHERE T0."DocDate" = ADD_DAYS('[%]', +5))
  AS "Day 6"
FROM ODLN T0
WHERE T0."DocDate" = '[%]'
UNION ALL
SELECT
  'Delivery Lines' AS "Doc Type",
  COUNT("DocNum") AS "Day 1",
  (SELECT
    COUNT("DocNum")
  FROM ODLN T0
  INNER JOIN DLN1 T1
    ON T0."DocEntry" = T1."DocEntry"
  WHERE T0."DocDate" = ADD_DAYS('[%]', +1))
  AS "Day 2",
  (SELECT
    COUNT("DocNum")
  FROM ODLN T0
  INNER JOIN DLN1 T1
    ON T0."DocEntry" = T1."DocEntry"
  WHERE T0."DocDate" = ADD_DAYS('[%]', +2))
  AS "Day 3",
  (SELECT
    COUNT("DocNum")
  FROM ODLN T0
  INNER JOIN DLN1 T1
    ON T0."DocEntry" = T1."DocEntry"
  WHERE T0."DocDate" = ADD_DAYS('[%]', +3))
  AS "Day 4",
  (SELECT
    COUNT("DocNum")
  FROM ODLN T0
  INNER JOIN DLN1 T1
    ON T0."DocEntry" = T1."DocEntry"
  WHERE T0."DocDate" = ADD_DAYS('[%]', +4))
  AS "Day 5",
  (SELECT
    COUNT("DocNum")
  FROM ODLN T0
  INNER JOIN DLN1 T1
    ON T0."DocEntry" = T1."DocEntry"
  WHERE T0."DocDate" = ADD_DAYS('[%]', +5))
  AS "Day 6"
FROM ODLN T0
INNER JOIN DLN1 T1
  ON T0."DocEntry" = T1."DocEntry"
WHERE T0."DocDate" = '[%]'
UNION ALL
SELECT
  'Invoices' AS "Doc Type",
  COUNT("DocNum") AS "Day 1",
  (SELECT
    COUNT("DocNum")
  FROM OINV T0
  WHERE T0."DocDate" = ADD_DAYS('[%]', +1))
  AS "Day 2",
  (SELECT
    COUNT("DocNum")
  FROM OINV T0
  WHERE T0."DocDate" = ADD_DAYS('[%]', +2))
  AS "Day 3",
  (SELECT
    COUNT("DocNum")
  FROM OINV T0
  WHERE T0."DocDate" = ADD_DAYS('[%]', +3))
  AS "Day 4",
  (SELECT
    COUNT("DocNum")
  FROM OINV T0
  WHERE T0."DocDate" = ADD_DAYS('[%]', +4))
  AS "Day 5",
  (SELECT
    COUNT("DocNum")
  FROM OINV T0
  WHERE T0."DocDate" = ADD_DAYS('[%]', +5))
  AS "Day 6"
FROM OINV T0
WHERE T0."DocDate" = '[%]'
UNION ALL
SELECT
  'Invoice Lines' AS "Doc Type",
  COUNT("DocNum") AS "Day 1",
  (SELECT
    COUNT("DocNum")
  FROM OINV T0
  INNER JOIN INV1 T1
    ON T0."DocEntry" = T1."DocEntry"
  WHERE T0."DocDate" = ADD_DAYS('[%]', +1))
  AS "Day 2",
  (SELECT
    COUNT("DocNum")
  FROM OINV T0
  INNER JOIN INV1 T1
    ON T0."DocEntry" = T1."DocEntry"
  WHERE T0."DocDate" = ADD_DAYS('[%]', +2))
  AS "Day 3",
  (SELECT
    COUNT("DocNum")
  FROM OINV T0
  INNER JOIN INV1 T1
    ON T0."DocEntry" = T1."DocEntry"
  WHERE T0."DocDate" = ADD_DAYS('[%]', +3))
  AS "Day 4",
  (SELECT
    COUNT("DocNum")
  FROM OINV T0
  INNER JOIN INV1 T1
    ON T0."DocEntry" = T1."DocEntry"
  WHERE T0."DocDate" = ADD_DAYS('[%]', +4))
  AS "Day 5",
  (SELECT
    COUNT("DocNum")
  FROM OINV T0
  INNER JOIN INV1 T1
    ON T0."DocEntry" = T1."DocEntry"
  WHERE T0."DocDate" = ADD_DAYS('[%]', +5))
  AS "Day 6"
FROM OINV T0
INNER JOIN INV1 T1
  ON T0."DocEntry" = T1."DocEntry"
WHERE T0."DocDate" = '[%]'
UNION ALL
SELECT
  'Purchase Orders' AS "Doc Type",
  COUNT("DocNum") AS "Day 1",
  (SELECT
    COUNT("DocNum")
  FROM OPOR T0
  WHERE T0."CardCode" = 'SWGLK'
  AND T0."DocDate" = ADD_DAYS('[%]', +1))
  AS "Day 2",
  (SELECT
    COUNT("DocNum")
  FROM OPOR T0
  WHERE T0."CardCode" = 'SWGLK'
  AND T0."DocDate" = ADD_DAYS('[%]', +2))
  AS "Day 3",
  (SELECT
    COUNT("DocNum")
  FROM OPOR T0
  WHERE T0."CardCode" = 'SWGLK'
  AND T0."DocDate" = ADD_DAYS('[%]', +3))
  AS "Day 4",
  (SELECT
    COUNT("DocNum")
  FROM OPOR T0
  WHERE T0."CardCode" = 'SWGLK'
  AND T0."DocDate" = ADD_DAYS('[%]', +4))
  AS "Day 5",
  (SELECT
    COUNT("DocNum")
  FROM OPOR T0
  WHERE T0."CardCode" = 'SWGLK'
  AND T0."DocDate" = ADD_DAYS('[%]', +5))
  AS "Day 6"
FROM OPOR T0
WHERE T0."CardCode" = 'SWGLK'
AND T0."DocDate" = '[%]'
UNION ALL
SELECT
  'Purchase Order Lines' AS "Doc Type",
  COUNT(T0."DocNum") AS "Day1",
  (SELECT
    COUNT(T0."DocNum")
  FROM OPOR T0
  INNER JOIN POR1 T1
    ON T0."DocEntry" = T1."DocEntry"
  WHERE T0."CardCode" = 'SWGLK'
  AND T0."DocDate" = ADD_DAYS('[%]', +1))
  AS "Day 2",
  (SELECT
    COUNT(T0."DocNum")
  FROM OPOR T0
  INNER JOIN POR1 T1
    ON T0."DocEntry" = T1."DocEntry"
  WHERE T0."CardCode" = 'SWGLK'
  AND T0."DocDate" = ADD_DAYS('[%]', +2))
  AS "Day 3",
  (SELECT
    COUNT(T0."DocNum")
  FROM OPOR T0
  INNER JOIN POR1 T1
    ON T0."DocEntry" = T1."DocEntry"
  WHERE T0."CardCode" = 'SWGLK'
  AND T0."DocDate" = ADD_DAYS('[%]', +3))
  AS "Day 4",
  (SELECT
    COUNT(T0."DocNum")
  FROM OPOR T0
  INNER JOIN POR1 T1
    ON T0."DocEntry" = T1."DocEntry"
  WHERE T0."CardCode" = 'SWGLK'
  AND T0."DocDate" = ADD_DAYS('[%]', +4))
  AS "Day 5",
  (SELECT
    COUNT(T0."DocNum")
  FROM OPOR T0
  INNER JOIN POR1 T1
    ON T0."DocEntry" = T1."DocEntry"
  WHERE T0."CardCode" = 'SWGLK'
  AND T0."DocDate" = ADD_DAYS('[%]', +5))
  AS "Day 6"
FROM OPOR T0
INNER JOIN POR1 T1
  ON T0."DocEntry" = T1."DocEntry"
WHERE T0."CardCode" = 'SWGLK'
AND T0."DocDate" = '[%]'
```

GBS Subtopic:

Source:

Used By:
