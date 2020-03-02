### 12 months of invoice lines (OINV and INV1) unioned with credit lines (ORIN and RIN1)

```sql
SELECT
  T0."CardCode",
  T0."CardName",
  (SELECT
    T10."IndName"
  FROM OOND T10
  WHERE T3."IndustryC" = T10."IndCode")
  AS "Industry Code",
  (SELECT
    T10."IndDesc"
  FROM OOND T10
  WHERE T3."IndustryC" = T10."IndCode")
  AS "Industry",
  T3."U_SWK_BPType",
  (SELECT
    "descript"
  FROM OTER T12
  LEFT OUTER JOIN OCRD T11
    ON T11."CardCode" = T0."CardCode"
  WHERE T11."Territory" = T12."territryID")
  AS "Territory",
  T0."NumAtCard",
  T0."DocDate",
  T0."DocEntry",
  T0."DocNum",
  T0."SlpCode",
  (SELECT
    "SlpName"
  FROM OSLP T11
  WHERE T11."SlpCode" = T0."SlpCode")
  AS "Account Manager",
  T1."LineNum",
  T1."ItemCode",
  T1."Quantity",
  T1."LineTotal",
  T2."QryGroup57" AS "Service Item Flag",
  T2."QryGroup59" AS "Custom Solution Flag",
  (SELECT
    "U_SWK_CatDescription"
  FROM "@SWK_BICATEGORY" T00
  LEFT OUTER JOIN OITM T11
    ON T00."U_SWK_Code" = T11."U_SWK_RangeCd"
    AND T00."U_SWK_CatTier" = 1
  WHERE T11."ItemCode" = T1."ItemCode")
  AS "ProductRange",
  (SELECT
    "U_SWK_CatDescription"
  FROM "@SWK_BICATEGORY" T00
  LEFT OUTER JOIN OITM T11
    ON T00."U_SWK_Code" = T11."U_SWK_GroupCd"
    AND T00."U_SWK_CatTier" = 2
  WHERE T11."ItemCode" = T1."ItemCode")
  AS "ProductGroup",
  (SELECT
    "U_SWK_CatDescription"
  FROM "@SWK_BICATEGORY" T00
  LEFT OUTER JOIN OITM T11
    ON T00."U_SWK_Code" = T11."U_SWK_SeriesCd"
    AND T00."U_SWK_CatTier" = 3
  WHERE T11."ItemCode" = T1."ItemCode")
  AS "ProductSeries",
  (SELECT
    "U_SWK_CatDescription"
  FROM "@SWK_BICATEGORY" T00
  LEFT OUTER JOIN OITM T11
    ON T00."U_SWK_Code" = T11."U_SWK_SizeCd"
    AND T00."U_SWK_CatTier" = 7
  WHERE T11."ItemCode" = T1."ItemCode")
  AS "ProductSize",
  (SELECT
    "U_SWK_CatDescription"
  FROM "@SWK_BICATEGORY" T00
  LEFT OUTER JOIN OITM T11
    ON T00."U_SWK_Code" = T11."U_SWK_MatlCd"
    AND T00."U_SWK_CatTier" = 8
  WHERE T11."ItemCode" = T1."ItemCode")
  AS "ProductMaterial"
FROM "OINV" T0
INNER JOIN "INV1" T1
  ON T0."DocEntry" = T1."DocEntry"
LEFT OUTER JOIN "OITM" T2
  ON T1."ItemCode" = T2."ItemCode"
LEFT OUTER JOIN OCRD T3
  ON T0."CardCode" = T3."CardCode"
WHERE T0."DocDate" > ADD_YEARS(CURRENT_DATE,
-1)
AND T0."DocDate" > '04.05.2018'
AND T0."CANCELED" IN ('N')
UNION
SELECT
  T0."CardCode",
  T0."CardName",
  (SELECT
    T10."IndName"
  FROM OOND T10
  WHERE T3."IndustryC" = T10."IndCode")
  AS "Industry Code",
  (SELECT
    T10."IndDesc"
  FROM OOND T10
  WHERE T3."IndustryC" = T10."IndCode")
  AS "Industry",
  T3."U_SWK_BPType",
  (SELECT
    "descript"
  FROM OTER T12
  LEFT OUTER JOIN OCRD T11
    ON T11."CardCode" = T0."CardCode"
  WHERE T11."Territory" = T12."territryID")
  AS "Territory",
  T0."NumAtCard",
  T0."DocDate",
  T0."DocEntry",
  T0."DocNum",
  T0."SlpCode",
  (SELECT
    "SlpName"
  FROM OSLP T11
  WHERE T11."SlpCode" = T0."SlpCode")
  AS "Account Manager",
  T1."LineNum",
  T1."ItemCode",
  (T1."Quantity" * -1) AS "Quantity",
  (T1."LineTotal" * -1) AS "Line Total",
  T2."QryGroup57" AS "Service Item Flag",
  T2."QryGroup59" AS "Custom Solution Flag",
  (SELECT
    "U_SWK_CatDescription"
  FROM "@SWK_BICATEGORY" T00
  LEFT OUTER JOIN OITM T11
    ON T00."U_SWK_Code" = T11."U_SWK_RangeCd"
    AND T00."U_SWK_CatTier" = 1
  WHERE T11."ItemCode" = T1."ItemCode")
  AS "ProductRange",
  (SELECT
    "U_SWK_CatDescription"
  FROM "@SWK_BICATEGORY" T00
  LEFT OUTER JOIN OITM T11
    ON T00."U_SWK_Code" = T11."U_SWK_GroupCd"
    AND T00."U_SWK_CatTier" = 2
  WHERE T11."ItemCode" = T1."ItemCode")
  AS "ProductGroup",
  (SELECT
    "U_SWK_CatDescription"
  FROM "@SWK_BICATEGORY" T00
  LEFT OUTER JOIN OITM T11
    ON T00."U_SWK_Code" = T11."U_SWK_SeriesCd"
    AND T00."U_SWK_CatTier" = 3
  WHERE T11."ItemCode" = T1."ItemCode")
  AS "ProductSeries",
  (SELECT
    "U_SWK_CatDescription"
  FROM "@SWK_BICATEGORY" T00
  LEFT OUTER JOIN OITM T11
    ON T00."U_SWK_Code" = T11."U_SWK_SizeCd"
    AND T00."U_SWK_CatTier" = 7
  WHERE T11."ItemCode" = T1."ItemCode")
  AS "ProductSize",
  (SELECT
    "U_SWK_CatDescription"
  FROM "@SWK_BICATEGORY" T00
  LEFT OUTER JOIN OITM T11
    ON T00."U_SWK_Code" = T11."U_SWK_MatlCd"
    AND T00."U_SWK_CatTier" = 8
  WHERE T11."ItemCode" = T1."ItemCode")
  AS "ProductMaterial"
FROM "ORIN" T0
INNER JOIN "RIN1" T1
  ON T0."DocEntry" = T1."DocEntry"
LEFT OUTER JOIN "OITM" T2
  ON T1."ItemCode" = T2."ItemCode"
LEFT OUTER JOIN OCRD T3
  ON T0."CardCode" = T3."CardCode"
WHERE T0."DocDate" > ADD_YEARS(CURRENT_DATE,
-1)
AND T0."DocDate" > '04.05.2018'
AND T0."CANCELED" IN ('N')
```
