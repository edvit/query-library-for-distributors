# Ready to Build Production Orders Query Albany

### Description

Attached is what we use at Swagelok Albany I Connecticut. It shows  a negative number if we do not have a component and either a  blank/positive if we have stock. This enables us to know what's ready  to be released to production. We're trying to play with dates for the  negative numbers to truly know when parts are coming in so we can mimic  the DMS > SPO screen but we're not there yet. We do not like  releasing jobs prior to all components being in inventory so this is  helping us out quite a bit.

*please note we do production out of our CT office (coded 02) so  you might have to change the query to read 01 for it to work on your  production.​

### Intended Outcome

​GBS Discussion


```sql
SELECT
	 T0."DocNum" AS "Doc #",
	T0."DueDate",
	 T0."CardCode",
	 CAST(T0."PlannedQty" AS INT) AS "Planned Qty",
	 T0."ItemCode",
	 T4."ItemName",
	 CAST(((SELECT
	 SUM(T3."OnHand") 
			FROM OITW T3 
			WHERE (T3."WhsCode" = '02' 
				or T3."WhsCode" = '02S') 
			AND (T1."ItemCode" = T3."ItemCode"))-T1."PlannedQty") AS INT) AS "QTY Available",
	 T1."ItemCode",
	 CAST(((SELECT
	 SUM(T5."Quantity") 
			FROM POR1 T5 
			WHERE (T5."WhsCode" = '02' 
				or T5."WhsCode" = '02S') 
			AND (T5."LineStatus"= 'O') 
			AND (T1."ItemCode" = T5."ItemCode"))) AS INT) AS "QTY on PO",
	 (SELECT
	 MIN(T5."U_SWK_ShpDateBT") 
	FROM POR1 T5 
	WHERE (T5."WhsCode" = '02' 
		or T5."WhsCode" = '02S') 
	AND (T5."LineStatus"= 'O') 
	AND (T1."ItemCode" = T5."ItemCode")) AS "Date Due PO Early",
	 (SELECT
	 MAX(T5."U_SWK_ShpDateBT") 
	FROM POR1 T5 
	WHERE (T5."WhsCode" = '02' 
		or T5."WhsCode" = '02S') 
	AND (T5."LineStatus"= 'O') 
	AND (T1."ItemCode" = T5."ItemCode")) AS "Date Due PO Late",
	 T0."Status" 
FROM "OWOR" T0 
INNER JOIN "WOR1" T1 ON T0."DocEntry" = T1."DocEntry" 
INNER JOIN OITM T4 ON T0."ItemCode" = T4."ItemCode" 
WHERE T0."Warehouse"='02' 
AND T0."Status"<>'C' 
AND T0."Status"<>'L' 
ORDER BY T0."DueDate",
	 T0."ItemCode"
```

GBS Subtopic: MTC_Manufacture to Complete

Source: ALBNY

Used By: ALBNY
