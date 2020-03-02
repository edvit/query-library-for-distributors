### All items with BI code and description

```sql
SELECT
  T0."ItemCode",
  T0."U_SWK_RangeCd" AS "RangeCd",
  (SELECT
    T1."U_SWK_CatDescription"
  FROM OITM T10
  LEFT OUTER JOIN "@SWK_BICATEGORY" T1
    ON T1."U_SWK_Code" = T0."U_SWK_RangeCd"
    AND T1."U_SWK_CatTier" = 1
  WHERE T10."ItemCode" = T0."ItemCode")
  AS "RangeDesc",
  T0."U_SWK_GroupCd" AS "GroupCd",
  (SELECT
    T1."U_SWK_CatDescription"
  FROM OITM T10
  LEFT OUTER JOIN "@SWK_BICATEGORY" T1
    ON T1."U_SWK_Code" = T0."U_SWK_GroupCd"
    AND T1."U_SWK_CatTier" = 2
  WHERE T10."ItemCode" = T0."ItemCode")
  AS "GroupDesc",
  T0."U_SWK_SeriesCd" AS "SeriesCd",
  (SELECT
    T1."U_SWK_CatDescription"
  FROM OITM T10
  LEFT OUTER JOIN "@SWK_BICATEGORY" T1
    ON T1."U_SWK_Code" = T0."U_SWK_SeriesCd"
    AND T1."U_SWK_CatTier" = 3
  WHERE T10."ItemCode" = T0."ItemCode")
  AS "SeriesDesc",
  T0."U_SWK_ConnectionCd" AS "ConnectionCd",
  (SELECT
    T1."U_SWK_CatDescription"
  FROM OITM T10
  LEFT OUTER JOIN "@SWK_BICATEGORY" T1
    ON T1."U_SWK_Code" = T0."U_SWK_ConnectionCd"
    AND T1."U_SWK_CatTier" = 4
  WHERE T10."ItemCode" = T0."ItemCode")
  AS "ConnectionDesc",
  T0."U_SWK_NumPortsCd" AS "NumOfPortsCd",
  (SELECT
    T1."U_SWK_CatDescription"
  FROM OITM T10
  LEFT OUTER JOIN "@SWK_BICATEGORY" T1
    ON T1."U_SWK_Code" = T0."U_SWK_NumPortsCd"
    AND T1."U_SWK_CatTier" = 5
  WHERE T10."ItemCode" = T0."ItemCode")
  AS "NumOfPortsDesc",
  T0."U_SWK_MeasureUnitCd" AS "MeasureUnitCd",
  (SELECT
    T1."U_SWK_CatDescription"
  FROM OITM T10
  LEFT OUTER JOIN "@SWK_BICATEGORY" T1
    ON T1."U_SWK_Code" = T0."U_SWK_MeasureUnitCd"
    AND T1."U_SWK_CatTier" = 6
  WHERE T10."ItemCode" = T0."ItemCode")
  AS "MeasureUnitDesc",
  T0."U_SWK_SizeCd" AS "SizeCd",
  (SELECT
    T1."U_SWK_CatDescription"
  FROM OITM T10
  LEFT OUTER JOIN "@SWK_BICATEGORY" T1
    ON T1."U_SWK_Code" = T0."U_SWK_SizeCd"
    AND T1."U_SWK_CatTier" = 7
  WHERE T10."ItemCode" = T0."ItemCode")
  AS "SizeDesc",
  T0."U_SWK_MatlCd" AS "MaterialCd",
  (SELECT
    T1."U_SWK_CatDescription"
  FROM OITM T10
  LEFT OUTER JOIN "@SWK_BICATEGORY" T1
    ON T1."U_SWK_Code" = T0."U_SWK_MatlCd"
    AND T1."U_SWK_CatTier" = 8
  WHERE T10."ItemCode" = T0."ItemCode")
  AS "MaterialDesc",
  T0."U_SWK_AutomatedCd" AS "MaterialCd",
  (SELECT
    T1."U_SWK_CatDescription"
  FROM OITM T10
  LEFT OUTER JOIN "@SWK_BICATEGORY" T1
    ON T1."U_SWK_Code" = T0."U_SWK_AutomatedCd"
    AND T1."U_SWK_CatTier" = 9
  WHERE T10."ItemCode" = T0."ItemCode")
  AS "AutomatedDesc"

FROM OITM T0
ORDER BY T0."ItemCode"
```
