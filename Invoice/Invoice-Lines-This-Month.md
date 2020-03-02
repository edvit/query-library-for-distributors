### Invoice lines current month. Does not union credit memo table

```sql
SELECT
  T0."CardCode",
  T0."CardName",
  (SELECT
    "GroupName"
  FROM OCRG T12
  LEFT OUTER JOIN OCRD T11
    ON T11."CardCode" = T0."CardCode"
  WHERE T12."GroupCode" = T11."GroupCode")
  AS "Price List Group",
  T0."NumAtCard" AS "Purchase Order",
  T0."DocDate",
  T0."DocEntry",
  T0."DocNum",
  T0."SlpCode" AS "Sales Code",
  (SELECT ("firstName"||' '||"lastName") FROM OHEM T11 WHERE T11."salesPrson" = T0."SlpCode") AS "Account Manager",
  T1."LineNum" AS "Line Number",
  T1."ItemCode",
  T1."SubCatNum" AS "Customer Part Code",
  T1."ShipDate",
  T1."Quantity",
  (SELECT
    "Price"
  FROM ITM1 T11
  WHERE T11."ItemCode" = T1."ItemCode"
  AND T11."PriceList" = 1)
  AS "List Price",
  T1."Price",
  T1."DiscPrcnt",
  T1."LineTotal",
  T1."StockPrice",
  T1."GrssProfit",
  T1."BaseDocNum",
  T0."UserSign",
  (SELECT
    "U_NAME"
  FROM OUSR T11
  WHERE T11."USERID" = T0."UserSign")
  AS "User Name",
  T2."U_SWK_SalesDiscCode",
  T2."U_SWK_PurDiscCode",
  T2."U_SWK_ProductGroup",
  T2."U_SWK_FulfillmentStrategyCode",
  T2."U_SWK_SwglSalesClassCode",
  T2."U_SWK_MarketFamilyCode",
  T2."U_SWK_MarketFamilyTypedescription",
  T2."U_SWK_CommercializationCode",
  T2."U_SWK_TargetMarketForcast",
  T2."QryGroup57" AS "Service Item Flag",
  T2."QryGroup59" AS "Custom Solution Flag",
  T2."U_SWK_RangeCd",
  (SELECT
    "U_SWK_CatDescription"
  FROM "@SWK_BICATEGORY" T00
  LEFT OUTER JOIN OITM T11
    ON T00."U_SWK_Code" = T11."U_SWK_RangeCd"
    AND T00."U_SWK_CatTier" = 1
  WHERE T11."ItemCode" = T1."ItemCode")
  AS "Product Range",
  T2."U_SWK_GroupCd",
  (SELECT
    "U_SWK_CatDescription"
  FROM "@SWK_BICATEGORY" T00
  LEFT OUTER JOIN OITM T11
    ON T00."U_SWK_Code" = T11."U_SWK_GroupCd"
    AND T00."U_SWK_CatTier" = 2
  WHERE T11."ItemCode" = T1."ItemCode")
  AS "Product Group",
  T2."U_SWK_SeriesCd",
  (SELECT
    "U_SWK_CatDescription"
  FROM "@SWK_BICATEGORY" T00
  LEFT OUTER JOIN OITM T11
    ON T00."U_SWK_Code" = T11."U_SWK_SeriesCd"
    AND T00."U_SWK_CatTier" = 3
  WHERE T11."ItemCode" = T1."ItemCode")
  AS "Product Series",
  T2."U_SWK_SizeCd",
  (SELECT
    "U_SWK_CatDescription"
  FROM "@SWK_BICATEGORY" T00
  LEFT OUTER JOIN OITM T11
    ON T00."U_SWK_Code" = T11."U_SWK_SizeCd"
    AND T00."U_SWK_CatTier" = 7
  WHERE T11."ItemCode" = T1."ItemCode")
  AS "Product Size",
  T2."U_SWK_MatlCd",
  (SELECT
    "U_SWK_CatDescription"
  FROM "@SWK_BICATEGORY" T00
  LEFT OUTER JOIN OITM T11
    ON T00."U_SWK_Code" = T11."U_SWK_MatlCd"
    AND T00."U_SWK_CatTier" = 8
  WHERE T11."ItemCode" = T1."ItemCode")
  AS "Product Material"
FROM "OINV" T0
INNER JOIN "INV1" T1
  ON T0."DocEntry" = T1."DocEntry"
LEFT OUTER JOIN "OITM" T2
  ON T1."ItemCode" = T2."ItemCode"
WHERE MONTHNAME(T0."DocDate") = MONTHNAME(CURRENT_DATE)
```
