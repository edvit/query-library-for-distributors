### Open quote line detail past year with BI Coding 

```sql
SELECT
  T0."DocNum",
  T0."DocDate",
  T0."CardCode",
  T0."CardName",
  T0."UserSign",
  (SELECT
    "U_NAME"
  FROM OUSR T11
  WHERE T11."USERID" = T0."UserSign")
  AS "UserName",
  T0."SlpCode",
  (SELECT
    "SlpName"
  FROM OSLP T11
  WHERE T11."SlpCode" = T0."SlpCode")
  AS "Account Manager",
  T1."ItemCode",
  T1."Quantity",
  T1."Price",
  T1."LineTotal",
  T0."DocTotal",
  T2."QryGroup57" AS "Service Item Flag",
  T2."QryGroup59" AS "Custom Solution Flag",
  T2."U_SWK_RangeCd",
  (SELECT
    "U_SWK_CatDescription"
  FROM "@SWK_BICATEGORY" T00
  LEFT OUTER JOIN OITM T11
    ON T00."U_SWK_Code" = T11."U_SWK_RangeCd"
    AND T00."U_SWK_CatTier" = 1
  WHERE T11."ItemCode" = T2."ItemCode")
  AS "ProductRange",
  T2."U_SWK_GroupCd",
  (SELECT
    "U_SWK_CatDescription"
  FROM "@SWK_BICATEGORY" T00
  LEFT OUTER JOIN OITM T11
    ON T00."U_SWK_Code" = T11."U_SWK_GroupCd"
    AND T00."U_SWK_CatTier" = 2
  WHERE T11."ItemCode" = T2."ItemCode")
  AS "ProductGroup",
  T2."U_SWK_SeriesCd",
  (SELECT
    "U_SWK_CatDescription"
  FROM "@SWK_BICATEGORY" T00
  LEFT OUTER JOIN OITM T11
    ON T00."U_SWK_Code" = T11."U_SWK_SeriesCd"
    AND T00."U_SWK_CatTier" = 3
  WHERE T11."ItemCode" = T2."ItemCode")
  AS "ProductSeries",
  T2."U_SWK_SizeCd",
  (SELECT
    "U_SWK_CatDescription"
  FROM "@SWK_BICATEGORY" T00
  LEFT OUTER JOIN OITM T11
    ON T00."U_SWK_Code" = T11."U_SWK_SizeCd"
    AND T00."U_SWK_CatTier" = 7
  WHERE T11."ItemCode" = T2."ItemCode")
  AS "ProductSize",
  T2."U_SWK_MatlCd",
  (SELECT
    "U_SWK_CatDescription"
  FROM "@SWK_BICATEGORY" T00
  LEFT OUTER JOIN OITM T11
    ON T00."U_SWK_Code" = T11."U_SWK_MatlCd"
    AND T00."U_SWK_CatTier" = 8
  WHERE T11."ItemCode" = T2."ItemCode")
  AS "ProductMaterial"

FROM OQUT T0
INNER JOIN QUT1 T1
  ON T0."DocEntry" = T1."DocEntry"
LEFT OUTER JOIN OITM T2
  ON T1."ItemCode" = T2."ItemCode"

WHERE T0."DocDate" > ADD_DAYS(CURRENT_DATE, -365)
AND T0."DocStatus" = 'O'
```
