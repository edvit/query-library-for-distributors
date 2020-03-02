### Top 1000 items ranked by total 12 month sales

```sql
SELECT TOP 1000
  T0."ItemCode",
  T1."Total $" AS "Total $(12mo)",

  TO_Decimal((T1."Total $" / (SELECT
    SUM(T20."LineTotal") AS "Total Sales"
  FROM OINV T10
  INNER JOIN INV1 T20
    ON T10."DocEntry" = T20."DocEntry"
  LEFT OUTER JOIN "OITM" T30
    ON T20."ItemCode" = T30."ItemCode"
  WHERE T10."DocDate" > ADD_YEARS(CURRENT_DATE, -1)
  AND T10."CANCELED" IN ('N'))
  ), 12, 4) * 100 AS "% of 12 Months Sales",

  T2."Total $" AS "Total $(6mo)",

  TO_Decimal((T2."Total $" / (SELECT
    SUM(T20."LineTotal") AS "Total Sales"
  FROM OINV T10
  INNER JOIN INV1 T20
    ON T10."DocEntry" = T20."DocEntry"
  LEFT OUTER JOIN "OITM" T30
    ON T20."ItemCode" = T30."ItemCode"
  WHERE T10."DocDate" > ADD_MONTHS(CURRENT_DATE, -6)
  AND T10."CANCELED" IN ('N'))
  ), 12, 4) * 100 AS "% of 6 Months Sales",

  TO_DECIMAL(T3."OnHand", 12, 0) AS "On Hand 01 & 01S",

  (SELECT
    T30."U_SWK_PlnGrp"
  FROM "@SWK_PARTBYBRANCH" T30
  WHERE T30."U_SWK_DBSBranch" = 00
  AND T30."U_SWK_ItemNumber" = T0."ItemCode")
  AS "Planning Group Code 01",

  (SELECT
    T30."U_SWK_DAOrdPoint"
  FROM "@SWK_PARTBYBRANCH" T30
  WHERE T30."U_SWK_DBSBranch" = 00
  AND T30."U_SWK_ItemNumber" = T0."ItemCode")
  AS "Reorder Level 01",
  T1."Total Delivered" AS "Total Delivered (12mo)",
  T2."Total Delivered" AS "Total Delivered (6mo)",

  TO_DECIMAL(T1."Total Delivered" / 12, 12, 0) AS "Sales Qty Per Month",

  TO_DECIMAL(T2."Total Delivered" / 6, 12, 0) AS "Sales Qty Per Month 6mo",

  TO_DECIMAL(T3."OnHand" / (T1."Total Delivered" / 12), 12, 0) AS "Months On Hand",

  TO_DECIMAL(T3."OnHand" / (T2."Total Delivered" / 6), 12, 0) AS "Months On Hand 6mo",

  T0."U_SWK_PurDiscCode" AS "Purchase Discount Code",
  (SELECT
    "BI Desc"
  FROM "DIST_BI_Desc" T00
  WHERE T00."BI Code" = T0."U_SWK_RangeCd"
  AND T00."BI Level" = 1)
  AS "Product Range",
  (SELECT
    "BI Desc"
  FROM "DIST_BI_Desc" T00
  WHERE T00."BI Code" = T0."U_SWK_GroupCd"
  AND T00."BI Level" = 2)
  AS "Product Group"

FROM OITM T0

/* T1 Past 12 months sales*/
LEFT OUTER JOIN (SELECT
  T11."ItemCode",
  SUM(T11."Total Delivered") AS "Total Delivered",
  SUM(T11."Total $") AS "Total $"
FROM (SELECT
  T20."ItemCode" AS "ItemCode",
  T20."Quantity" AS "Total Delivered",
  T20."LineTotal" AS "Total $",
  T10."DocDate"
FROM OINV T10
INNER JOIN INV1 T20
  ON T10."DocEntry" = T20."DocEntry"
WHERE T10."DocDate" > ADD_YEARS(CURRENT_DATE, -1)
AND T10."CANCELED" IN ('N')) T11
GROUP BY T11."ItemCode") T1
  ON T0."ItemCode" = T1."ItemCode"

/*T2 Past 6 months sales*/
LEFT OUTER JOIN (SELECT
  T11."ItemCode",
  SUM(T11."Total Delivered") AS "Total Delivered",
  SUM(T11."Total $") AS "Total $"
FROM (SELECT
  T20."ItemCode" AS "ItemCode",
  T20."Quantity" AS "Total Delivered",
  T20."LineTotal" AS "Total $",
  T10."DocDate"
FROM OINV T10
INNER JOIN INV1 T20
  ON T10."DocEntry" = T20."DocEntry"
WHERE T10."DocDate" > ADD_MONTHS(CURRENT_DATE, -6)
AND T10."CANCELED" IN ('N')) T11
GROUP BY T11."ItemCode") T2
  ON T0."ItemCode" = T2."ItemCode"

/* T3 Stock Levels from warehouse 01 and 01S */
LEFT OUTER JOIN ((
SELECT
  T10."ItemCode",
  SUM(T10."OnHand") AS "OnHand"
FROM OITW T10
WHERE T10."WhsCode" IN ('01', '01S')
GROUP BY T10."ItemCode"
)) T3
  ON T0."ItemCode" = T3."ItemCode"

WHERE T0."ItmsGrpCod" <> 101
ORDER BY T1."Total $" DESC
```
