### RFM grouping where a customer has placed an order in the past 3 months

```sql
SELECT DISTINCT
  T0."CardName" AS "BP Name",
  T10."3mo Order Count",
  T10."Frequency Rank",
  T12."Last Order Date",
  T12."Recency Rank",
  T11."3mo Sales Total",
  T11."Monetary Rank",
  T10."Frequency Rank" || T12."Recency Rank"|| T11."Monetary Rank"  AS "RFM Value",
       
     TO_INT(CASE WHEN T10."Frequency Rank" = 'A' THEN 3
       WHEN T10."Frequency Rank" = 'B' THEN 2
       WHEN T10."Frequency Rank" = 'C' THEN 1 END
       +
  
  CASE WHEN T12."Recency Rank" = 'A' THEN 3
       WHEN T12."Recency Rank" = 'B' THEN 2
       WHEN T12."Recency Rank" = 'C' THEN 1 END
       +
              
   CASE WHEN T11."Monetary Rank" = 'A' THEN 3
       WHEN T11."Monetary Rank" = 'B' THEN 2
       WHEN T11."Monetary Rank" = 'C' THEN 1
       END) AS "RFM Score"    
       
       
FROM OCRD T0
LEFT OUTER JOIN (SELECT
  T0."CardName",
  COUNT(T0."DocNum") AS "3mo Order Count",
  CASE
    WHEN COUNT(T0."DocNum") > 10 THEN 'A'
    WHEN COUNT(T0."DocNum") > 2 THEN 'B'
    ELSE 'C'
  END AS "Frequency Rank"
FROM ORDR T0
WHERE DAYS_BETWEEN(T0."DocDate", CURRENT_DATE) <= 90
GROUP BY T0."CardName") T10
  ON T0."CardName" = T10."CardName"
LEFT OUTER JOIN (SELECT
  T1."CardName",
  SUM(T0."LineTotal") AS "3mo Sales Total",
  CASE
    WHEN SUM(T0."LineTotal") > 10000 THEN 'A'
    WHEN SUM(T0."LineTotal") > 500 THEN 'B'
    ELSE 'C'
  END AS "Monetary Rank"
FROM RDR1 T0
INNER JOIN ORDR T1
  ON T0."DocEntry" = T1."DocEntry"
WHERE DAYS_BETWEEN(T1."DocDate", CURRENT_DATE) <= 90
GROUP BY T1."CardName") T11
  ON T0."CardName" = T11."CardName"
LEFT OUTER JOIN (SELECT
  MAX(T0."DocDate") AS "Last Order Date",
  T0."CardName",
  CASE
    WHEN DAYS_BETWEEN(MAX(T0."DocDate"), CURRENT_DATE) < 15 THEN 'A'
    WHEN (DAYS_BETWEEN(MAX(T0."DocDate"), CURRENT_DATE) >= 15 AND
      DAYS_BETWEEN(MAX(T0."DocDate"), CURRENT_DATE) <= 45) THEN 'B'
    WHEN DAYS_BETWEEN(MAX(T0."DocDate"), CURRENT_DATE) > 45 THEN 'C'
  END AS "Recency Rank"
FROM ORDR T0
GROUP BY T0."CardName") T12
  ON T0."CardName" = T12."CardName"
WHERE T10."3mo Order Count" > 0
ORDER BY T0."CardName"
```
