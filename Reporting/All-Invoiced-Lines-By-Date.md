### Invoice detail for selected date. Unions OINV,ORIN

If used for sales reporting dashboards, needs to be filtered by user (owner). 

```sql
SELECT
 T0."CardCode",
 T0."CardName",
 T0."CardCode",
 T0."NumAtCard" AS "Purchase Order",
 T0."DocDate",
 T0."DocEntry",
 T0."DocNum",
 T0."SlpCode" AS "Sales Code",
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
 T0."UserSign",
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
 T3."U_SWK_CatDescription" AS "ProductRange",
 T2."U_SWK_GroupCd",
 T4."U_SWK_CatDescription" AS "ProductGroup",
 T2."U_SWK_SeriesCd",
 T5."U_SWK_CatDescription" AS "ProductSeries",
 T2."U_SWK_SizeCd",
 T6."U_SWK_CatDescription" AS "ProductSize",
 T2."U_SWK_MatlCd",
 T7."U_SWK_CatDescription" AS "ProductMaterial"

FROM "OINV" T0
INNER JOIN "INV1" T1 ON T0."DocEntry" = T1."DocEntry"
LEFT OUTER JOIN "OITM" T2 ON T1."ItemCode" = T2."ItemCode"
LEFT OUTER JOIN "@SWK_BICATEGORY" T3 ON T2."U_SWK_RangeCd" = T3."U_SWK_Code" and T3."U_SWK_CatTier" = 1
LEFT OUTER JOIN "@SWK_BICATEGORY" T4 ON T2."U_SWK_GroupCd" = T4."U_SWK_Code" and T4."U_SWK_CatTier" = 2
LEFT OUTER JOIN "@SWK_BICATEGORY" T5 ON T2."U_SWK_SeriesCd" = T5."U_SWK_Code" and T5."U_SWK_CatTier" = 3
LEFT OUTER JOIN "@SWK_BICATEGORY" T6 ON T2."U_SWK_SizeCd" = T6."U_SWK_Code" and T6."U_SWK_CatTier" = 7
LEFT OUTER JOIN "@SWK_BICATEGORY" T7 ON T2."U_SWK_MatlCd" = T7."U_SWK_Code" and T7."U_SWK_CatTier" = 8

WHERE T0."DocDate" = [%0]
AND T0."CANCELED" IN ( 'N')

UNION

SELECT
 T0."CardCode",
 T0."CardName",
 T0."CardCode",
 T0."NumAtCard" AS "Purchase Order",
 T0."DocDate",
 T0."DocEntry",
 T0."DocNum",
 T0."SlpCode" AS "Sales Code",
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
 T0."UserSign",
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
 T3."U_SWK_CatDescription" AS "ProductRange",
 T2."U_SWK_GroupCd",
 T4."U_SWK_CatDescription" AS "ProductGroup",
 T2."U_SWK_SeriesCd",
 T5."U_SWK_CatDescription" AS "ProductSeries",
 T2."U_SWK_SizeCd",
 T6."U_SWK_CatDescription" AS "ProductSize",
 T2."U_SWK_MatlCd",
 T7."U_SWK_CatDescription" AS "ProductMaterial"

FROM "ORIN" T0
INNER JOIN "RIN1" T1 ON T0."DocEntry" = T1."DocEntry"
LEFT OUTER JOIN "OITM" T2 ON T1."ItemCode" = T2."ItemCode"
LEFT OUTER JOIN "@SWK_BICATEGORY" T3 ON T2."U_SWK_RangeCd" = T3."U_SWK_Code" and T3."U_SWK_CatTier" = 1
LEFT OUTER JOIN "@SWK_BICATEGORY" T4 ON T2."U_SWK_GroupCd" = T4."U_SWK_Code" and T4."U_SWK_CatTier" = 2
LEFT OUTER JOIN "@SWK_BICATEGORY" T5 ON T2."U_SWK_SeriesCd" = T5."U_SWK_Code" and T5."U_SWK_CatTier" = 3
LEFT OUTER JOIN "@SWK_BICATEGORY" T6 ON T2."U_SWK_SizeCd" = T6."U_SWK_Code" and T6."U_SWK_CatTier" = 7
LEFT OUTER JOIN "@SWK_BICATEGORY" T7 ON T2."U_SWK_MatlCd" = T7."U_SWK_Code" and T7."U_SWK_CatTier" = 8

WHERE T0."DocDate" = [%0]
AND T0."CANCELED" IN ( 'N')
```
