### Used for sales reporting dashboards

Needs to be filtered by user (owner). Unions OINV,ORIN,OCSV,OCSI and their row tables.

```sql
SELECT
  T0."CardCode",
  T0."CardName",
  T0."NumAtCard" AS "Purchase Order",
  T0."DocDate",
  T0."DocEntry",
  T0."DocNum",
  T0."SlpCode" AS "Sales Code",
  T0."UserSign",
  T1."LineNum" AS "Line Number",
  T1."ItemCode",
  T1."SubCatNum" AS "Customer Part Code",
  T1."ShipDate",
  T1."Quantity",
  T1."Price",
  T1."DiscPrcnt",
  T1."LineTotal",
  T1."StockPrice",
  T1."GrssProfit",
  T1."BaseDocNum",
  T1."BaseType",
  T2."U_SWK_SalesDiscCode",
  T2."U_SWK_PurDiscCode",
  T2."U_SWK_ProductGroup",
  T2."QryGroup57" AS "Service Item Flag",
  T2."QryGroup59" AS "Custom Solution Flag",
  T2."U_SWK_RangeCd",
  (SELECT
    "U_SWK_CatDescription"
  FROM "@SWK_BICATEGORY" T00
  LEFT OUTER JOIN OITM T16
    ON T00."U_SWK_Code" = T16."U_SWK_RangeCd"
    AND T00."U_SWK_CatTier" = 1
  WHERE T16."ItemCode" = T1."ItemCode")
  AS "Product Range",
  T2."U_SWK_GroupCd",
  (SELECT
    "U_SWK_CatDescription"
  FROM "@SWK_BICATEGORY" T00
  LEFT OUTER JOIN OITM T16
    ON T00."U_SWK_Code" = T16."U_SWK_GroupCd"
    AND T00."U_SWK_CatTier" = 2
  WHERE T16."ItemCode" = T1."ItemCode")
  AS "Product Group",
  T2."U_SWK_SeriesCd",
  (SELECT
    "U_SWK_CatDescription"
  FROM "@SWK_BICATEGORY" T00
  LEFT OUTER JOIN OITM T16
    ON T00."U_SWK_Code" = T16."U_SWK_SeriesCd"
    AND T00."U_SWK_CatTier" = 3
  WHERE T16."ItemCode" = T1."ItemCode")
  AS "Product Series",
  T2."U_SWK_SizeCd",
  (SELECT
    "U_SWK_CatDescription"
  FROM "@SWK_BICATEGORY" T00
  LEFT OUTER JOIN OITM T16
    ON T00."U_SWK_Code" = T16."U_SWK_SizeCd"
    AND T00."U_SWK_CatTier" = 7
  WHERE T16."ItemCode" = T1."ItemCode")
  AS "Product Size",
  T2."U_SWK_MatlCd",
  (SELECT
    "U_SWK_CatDescription"
  FROM "@SWK_BICATEGORY" T00
  LEFT OUTER JOIN OITM T16
    ON T00."U_SWK_Code" = T16."U_SWK_MatlCd"
    AND T00."U_SWK_CatTier" = 8
  WHERE T16."ItemCode" = T1."ItemCode")
  AS "Product Material",
  T4."USER_CODE" AS "Current User"

FROM (SELECT
  T10."CardCode",
  T10."CardName",
  T10."NumAtCard",
  T10."DocDate",
  T10."DocEntry",
  T10."DocNum",
  T10."SlpCode",
  T10."UserSign",
  T10."OwnerCode"
FROM OINV T10
WHERE T10."CANCELED" = 'N'
UNION ALL
SELECT
  T11."CardCode",
  T11."CardName",
  T11."NumAtCard",
  T11."DocDate",
  T11."DocEntry",
  T11."DocNum",
  T11."SlpCode",
  T11."UserSign",
  T11."OwnerCode"
FROM ORIN T11
WHERE T11."CANCELED" = 'N'
UNION ALL
SELECT
  T12."CardCode",
  T12."CardName",
  T12."NumAtCard",
  T12."DocDate",
  T12."DocEntry",
  T12."DocNum",
  T12."SlpCode",
  T12."UserSign",
  T12."OwnerCode"
FROM OCSI T12
WHERE T12."CANCELED" = 'N'
UNION ALL
SELECT
  T13."CardCode",
  T13."CardName",
  T13."NumAtCard",
  T13."DocDate",
  T13."DocEntry",
  T13."DocNum",
  T13."SlpCode",
  T13."UserSign",
  T13."OwnerCode"
FROM OCSV T13
WHERE T13."CANCELED" = 'N') T0
INNER JOIN (SELECT
  T10."DocEntry",
  T10."LineNum",
  T10."ItemCode",
  T10."SubCatNum",
  T10."ShipDate",
  T10."Quantity",
  T10."Price",
  T10."DiscPrcnt",
  T10."LineTotal",
  T10."StockPrice",
  T10."GrssProfit",
  T10."BaseDocNum",
  T10."BaseType"
FROM INV1 T10
UNION ALL
SELECT
  T11."DocEntry",
  T11."LineNum",
  T11."ItemCode",
  T11."SubCatNum",
  T11."ShipDate",
  T11."Quantity",
  T11."Price",
  T11."DiscPrcnt",
  T11."LineTotal" * (-1),
  T11."StockPrice",
  T11."GrssProfit",
  T11."BaseDocNum",
  T11."BaseType"
FROM RIN1 T11
UNION ALL
SELECT
  T12."DocEntry",
  T12."LineNum",
  T12."ItemCode",
  T12."SubCatNum",
  T12."ShipDate",
  T12."Quantity",
  T12."Price",
  T12."DiscPrcnt",
  T12."LineTotal",
  T12."StockPrice",
  T12."GrssProfit",
  T12."BaseDocNum",
  T12."BaseType"
FROM CSI1 T12
UNION ALL
SELECT
  T13."DocEntry",
  T13."LineNum",
  T13."ItemCode",
  T13."SubCatNum",
  T13."ShipDate",
  T13."Quantity",
  T13."Price",
  T13."DiscPrcnt",
  T13."LineTotal",
  T13."StockPrice",
  T13."GrssProfit",
  T13."BaseDocNum",
  T13."BaseType"
FROM CSV1 T13) T1
  ON T0."DocEntry" = T1."DocEntry"
LEFT OUTER JOIN OITM T2
  ON T1."ItemCode" = T2."ItemCode"
LEFT JOIN OHEM T3
  ON T0."OwnerCode" = T3."empID"
LEFT JOIN OUSR T4
  ON T3."userId" = T4."USERID"
--WHERE MONTHNAME(T0."DocDate") =  MONTHNAME(CURRENT_DATE)
```
