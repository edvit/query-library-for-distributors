# Production Order Query Calgary

### Description

​Here's what I put together in Calgary for a crystal report that will  lists our production orders and colors them red if they don't have parts  picked or available to be picked. Let me know if you need help breaking  it down ro modifying it to your application. It could be cleaned up a  bit.

### Intended Outcome

​GBS Discussion

```sql
SELECT
	 T0."DocNum",
	 T0."Type",
	 T0."Status",
	 T0."PlannedQty",
	 T0."CmpltQty",
	 T0."PostDate",
	 T0."DueDate",
	 T0."UserSign",
	 T0."Comments",
	 T0."CloseDate",
	 T0."RlsDate",
	 T0."CardCode",
	 T0."JrnlMemo",
	 T0."CreateDate",
	 T2."ItemName",
	 T1."CardName",
	 X0."DocNum" as "No Inventory" 
FROM OWOR T0 
LEFT OUTER JOIN OCRD T1 ON T0."CardCode" = T1."CardCode" 
LEFT OUTER JOIN OITM T2 ON T0."ItemCode" = T2."ItemCode" 
LEFT OUTER JOIN (SELECT
	 DISTINCT T0."DocNum",
	 T0."Type",
	 T0."Status",
	 T0."PlannedQty",
	 T0."CmpltQty",
	 T0."PostDate",
	 T0."DueDate",
	 T0."UserSign",
	 T0."Comments",
	 T0."CloseDate",
	 T0."RlsDate",
	 T0."CardCode",
	 T0."JrnlMemo",
	 T0."CreateDate",
	 T3."ItemName",
	 T2."CardName" 
	FROM OWOR T0 
	INNER JOIN WOR1 T1 ON T0."DocEntry" = T1."DocEntry" 
	LEFT OUTER JOIN OCRD T2 ON T0."CardCode" = T2."CardCode" 
	LEFT OUTER JOIN OITM T3 ON T0."ItemCode" = T3."ItemCode" 
	LEFT OUTER JOIN (Select
	 S0."DocNum" 
		FROM (SELECT
	 T0."DocEntry" AS "DocEntry" ,
	 SUM ( T0."PlannedQty"- T0."IssuedQty") AS "Quantity",
	 MAX(T1."PickRmrk" ) AS "PickRmrk" ,
	 MAX(T1."DocNum") AS "DocNum" 
			FROM WOR1 T0 
			INNER JOIN OWOR T1 ON T0."DocEntry" = T1."DocEntry" 
			INNER JOIN OITM T2 ON T0."ItemCode" = T2."ItemCode" 
			AND T2."InvntItem" = 'Y' 
			GROUP BY T0."DocEntry")S0 
		INNER JOIN (SELECT
	 T0."OrderEntry" AS "OrderEntry" ,
	 SUM(T0."PickQtty"+ T0."RelQtty") AS "Quantity" 
			FROM PKL1 T0 
			INNER JOIN OPKL T1 ON T0."AbsEntry" = T1."AbsEntry" 
			WHERE T1."Status" <>'C' 
			AND T0."BaseObject" = '202' 
			GROUP BY T0."OrderEntry")S1 ON S0."DocEntry" = S1."OrderEntry" 
		WHERE S0."Quantity" = S1."Quantity" 
		OR ( S0."PickRmrk" LIKE '%%partial%%' 
			OR S0."PickRmrk" LIKE '%%partial%%')) S0 ON S0."DocNum" = T0."DocNum" 
	WHERE T1."PlannedQty" <> T1."IssuedQty" 
	AND T1."ItemType" = '4' 
	AND S0."DocNum" IS NULL 
	AND (T0."Status" = 'R' 
		OR T0."Status" = 'P') 
	ORDER BY T0."DueDate" ASC) X0 ON T0."DocNum" = X0."DocNum" 
WHERE T0."Status" = 'R' 
OR T0."Status" = 'P'
```

GBS Subtopic: MTC_Manufacture to Complete

Source: CALGA

Used By: CALGA
