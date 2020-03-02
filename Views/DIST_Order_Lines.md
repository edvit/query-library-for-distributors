# CREATE VIEW  DIST_Order_Lines

### Description


View for reporting on Order  line detail.

```sql
/*CREATE VIEW  "DIST_Order_Lines" AS*/

/* All Order Lines (RDR1)
Excludes cancelled orders
Requires "DIST_BI_Desc" view to pull BI Coding Descriptions
Requires "DIST_MRO_Group" view to pull MRO Group*/

SELECT
	T0."CardCode",
	T0."CardName",
	 (T3."CardName" ||' - ' || IFNULL(T3."MailAddres",'') || ' ' || IFNULL(T3."MailCity",''))
	AS "Ship To",
	 (SELECT "GroupName" FROM OCRG T12 WHERE T12."GroupCode" = T3."GroupCode")
	AS "Price List Group",
	 (SELECT T11."IndName" FROM OOND T11 WHERE T3."IndustryC" = T11."IndCode")
	AS "Industry Code",
	 (SELECT T10."IndDesc" FROM OOND T10 WHERE T3."IndustryC" = T10."IndCode")
	AS "Industry",
	 (SELECT "descript" FROM OTER T12	LEFT OUTER JOIN OCRD T11 ON T11."CardCode" = T0."CardCode"
	 WHERE T11."Territory" = T12."territryID")
	AS "Territory",
	T3."U_SWK_TradeCode" AS "Trade Code",
	T3."U_SWK_BPType" AS "Type Code",
	T0."NumAtCard",
	T0."DocDate",
	T0."DocEntry",
	CAST (T0."DocStatus" AS CHAR) AS "Doc Status",
	T0."DocNum",
	T0."ObjType" AS "Document Type",
	T0."SlpCode",
	 (SELECT "SlpName" FROM OSLP T11 WHERE T11."SlpCode" = T0."SlpCode")
	AS "Account Manager",
	T0."BPLId" AS "Branch Code",
	T0."BPLName" AS "Branch",
	(SELECT T00."TrnspName" FROM OSHP T00 WHERE T0."TrnspCode" = T00."TrnspCode") AS "Delivery Method",
	T1."LineNum",
	T1."ItemCode",
	T1."SubCatNum",
	T1."ShipDate",
	T1."Quantity",
	 (SELECT "Price" FROM ITM1 T11 WHERE T11."ItemCode" = T1."ItemCode" AND T11."PriceList" = 1)
	AS "List Price",
	T1."Price",
	T1."DiscPrcnt" AS "Discount Percent",
	T1."LineTotal" AS "Line Total",
	T1."StockPrice" AS "Item Cost",
	T1."GrssProfit" AS "Gross Profit",
	T1."BaseType",
	T1."BaseDocNum",
	T0."UserSign",
	 (SELECT "U_NAME" FROM OUSR T11 WHERE T11."USERID" = T0."UserSign")
	AS "Created By",
	T2."U_SWK_SalesDiscCode" AS "Sales Discount Code",
	T2."U_SWK_PurDiscCode" AS "Purchase Discount Code",
	T2."U_SWK_ProductGroup" AS "Swagelok Product Group",
	T2."U_SWK_FulfillmentStrategyCode" AS "Fulfillment Strategy Code",
	T2."U_SWK_SwglSalesClassCode" AS "Sales Class Code",
	T2."U_SWK_MarketFamilyCode" AS "Market Family Code",
	T2."U_SWK_MarketFamilyTypedescription" AS "Market Family Description",
	T2."U_SWK_CommercializationCode" AS "Commerialization Code",
	T2."U_SWK_TargetMarketForcast" AS "Target Market Forcast",
	CAST (T2."QryGroup57" AS VARCHAR) AS "Service Item Flag",
	CAST (T2."QryGroup59" AS VARCHAR) AS "Custom Solution Flag",
	(SELECT T00."MRO_Group" FROM "DIST_MRO_Group" T00 WHERE T00."ItemCode" = T2."ItemCode") AS "MRO_Group",
		T2."U_SWK_RangeCd" AS "Range Code",
	 (SELECT "BI Desc" FROM "DIST_BI_Desc" T00 WHERE T00."BI Code" = T2."U_SWK_RangeCd" AND T00."BI Level" = 1)
	AS "Product Range",
	T2."U_SWK_GroupCd" AS "Group Code",
	(SELECT "BI Desc" FROM "DIST_BI_Desc" T00 WHERE T00."BI Code" = T2."U_SWK_GroupCd" AND T00."BI Level" = 2)
	AS "Product Group",
	T2."U_SWK_SeriesCd" AS "Series Code",
	(SELECT "BI Desc" FROM "DIST_BI_Desc" T00 WHERE T00."BI Code" = T2."U_SWK_SeriesCd" AND T00."BI Level" = 3)
	AS "Product Series",
	T2."U_SWK_ConnectionCd" AS "Connection Code",
	(SELECT "BI Desc" FROM "DIST_BI_Desc" T00 WHERE T00."BI Code" = T2."U_SWK_ConnectionCd" AND T00."BI Level" = 4)
	AS "Product Connection",
	T2."U_SWK_NumPortsCd" AS "Number of Ports Code",
	(SELECT "BI Desc" FROM "DIST_BI_Desc" T00 WHERE T00."BI Code" = T2."U_SWK_NumPortsCd" AND T00."BI Level" = 5)
	AS "Product Number of Ports",
	T2."U_SWK_MeasureUnitCd" AS "Product Measurement Code",
	(SELECT "BI Desc" FROM "DIST_BI_Desc" T00 WHERE T00."BI Code" = T2."U_SWK_MeasureUnitCd" AND T00."BI Level" = 6)
	AS "Product Measurement Unit",
	T2."U_SWK_SizeCd" AS "Size Code",
	(SELECT "BI Desc" FROM "DIST_BI_Desc" T00 WHERE T00."BI Code" = T2."U_SWK_SizeCd" AND T00."BI Level" = 7)
	AS "Product Size",
	T2."U_SWK_MatlCd" AS "Material Code",
	(SELECT "BI Desc" FROM "DIST_BI_Desc" T00 WHERE T00."BI Code" = T2."U_SWK_MatlCd" AND T00."BI Level" = 8)
	AS "Product Material",
	T2."U_SWK_AutomatedCd" AS "Automated Code",
	(SELECT "BI Desc" FROM "DIST_BI_Desc" T00 WHERE T00."BI Code" = T2."U_SWK_AutomatedCd" AND T00."BI Level" = 9)
	AS "Product Automated",
	"U_SWK_KeyAccountCode" AS "Key Account Code"

FROM "ORDR" T0
INNER JOIN "RDR1" T1 ON T0."DocEntry" = T1."DocEntry"
LEFT OUTER JOIN "OITM" T2 ON T1."ItemCode" = T2."ItemCode"
LEFT OUTER JOIN "OCRD" T3 ON T0."CardCode" = T3."CardCode"
WHERE T0."CANCELED" IN ('N')
```
