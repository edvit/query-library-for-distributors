# Ready to Build Production Orders Query Calgary

### Description

​I have attached the query we use. We set this up as a widget for the  warehouse staff and it will show a count of all the production orders  that are complete and ready to be picked. They can drill into it for the  details. The nice thing is that if the word "partial" is typed into the  pick and pack remarks it will also show up in the query.

### Intended Outcome

​GBS Discussion

```sql
Select
	 S0."DocEntry" ,
	 S0."DocNum",
	S0."PickRmrk" 
FROM (SELECT
	 T0."DocEntry" AS "DocEntry" ,
	 SUM ( T0."PlannedQty"- T0."IssuedQty") AS "Quantity",
	 MAX(T1."PickRmrk" ) AS "PickRmrk" ,
	 MAX(T1."DocNum") AS "DocNum" 
	FROM WOR1 T0 
	INNER JOIN OWOR T1 ON T0."DocEntry" = T1."DocEntry" 
	INNER JOIN OITM T2 ON T0."ItemCode" = T2."ItemCode" 
	AND T2."InvntItem" = 'Y' 
	GROUP BY T0."DocEntry" )S0 
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
	OR S0."PickRmrk" LIKE '%%partial%%')
```

GBS Subtopic: MTC_Manufacture to Complete

Source: CALGA

Used By: CALGA
