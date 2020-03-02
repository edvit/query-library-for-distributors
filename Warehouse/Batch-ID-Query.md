# Batch ID Query

### Description

​This is the batch report that I put together. It's more of a summary of  all of the batches but since it's in Excel, you could easily search for or filter on the batch you ​are interested in.

### Intended Outcome

GBS Discussion:

You will need to save the attached file to your SAP Remote Desktop then configure it to look at your database. To configure it:Open the Excel file.Navigate to the Data Tab.Click Queries &  Connections. The Queries & Connections pane will open on the right.Right Click on the Batches connection and select Properties.Navigate to the Definition Tab.In the Connection String      box, replace the 172.20.XXX.10 with your server IP address.In the Command Text box,replace all instances of XXXXX_PB1 with your database name.Since there are 27 instances, I’d recommend copy and pasting all of the text into a word processor and doing a Find & Replace.Click OK.X out of the Queries & Connections pane.Save the file.
Then you are all set. The data will update automatically when you change the date range at the top of the sheet.

*Query from data connection also added.


```sql"


```sql
SELECT
	*

FROM
	(SELECT
		'Delivery' as "Doc Type", T2."DocNum" as "Doc No.", NULL as "Base Doc Type", NULL as "Base Doc No.", 
		T0."U_SWK_Batch" AS "Batch No.", T0."U_SWK_ItemCode" AS "Item Code", T0."U_SWK_Quantity" AS "Quantity", 
		T0."U_SWK_COO" AS "Country of Origin", T0."U_SWK_Direction" AS "Direction", T0."U_SWK_Date" AS "Date"	
	
	FROM
		"@SWK_BATCHES" T0
		INNER JOIN "DLN1" T1 ON T0."U_SWK_DocEntry" = T1."DocEntry" 
			AND T0."U_SWK_ItemCode" = T1."ItemCode" AND T0."U_SWK_ObjType" = '15'
		INNER JOIN "ODLN" T2 ON T2."DocEntry" = T1."DocEntry"
		
	UNION ALL
	
	SELECT
		DISTINCT
		'Pick List' as "Doc Type",
		T2."AbsEntry" as "Doc No.", 
		CASE WHEN T1."BaseObject" = '17' THEN 'Order'
			WHEN T1."BaseObject" = '202' THEN 'Production Order'
			WHEN T1."BaseObject" = '1250000001' THEN 'Transfer'
			ELSE NULL END as "Base Doc Type", 
		COALESCE(T3."DocNum", T4."DocNum", T5."DocNum") as "Base Doc No.", 
		T0."U_SWK_Batch" AS "Batch No.", T0."U_SWK_ItemCode" AS "Item Code", 
		T0."U_SWK_Quantity" AS "Quantity", T0."U_SWK_COO" AS "Country of Origin", T0."U_SWK_Direction" AS "Direction", 
		T0."U_SWK_Date" AS "Date"	
	
	FROM
		"@SWK_BATCHES" T0
		INNER JOIN "PKL1" T1 ON T0."U_SWK_DocEntry" = T1."AbsEntry" AND T0."U_SWK_ObjType" = '156'
		INNER JOIN "OPKL" T2 ON T2."AbsEntry" = T1."AbsEntry"
		LEFT OUTER JOIN "ORDR" T3 ON T1."OrderEntry" = T3."DocEntry" AND T1."BaseObject" = '17'
		LEFT OUTER JOIN "OWOR" T4 ON T1."OrderEntry" = T4."DocEntry" AND T1."BaseObject" = '202'
		LEFT OUTER JOIN "OWTQ" T5 ON T1."OrderEntry" = T5."DocEntry" AND T1."BaseObject" = '1250000001'
		
	UNION ALL
	
	SELECT
		'Sales Return' as "Doc Type", T2."DocNum" as "Doc No.", 
		NULL as "Base Doc Type", NULL as "Base Doc No.", 
		T0."U_SWK_Batch" AS "Batch No.", T0."U_SWK_ItemCode" AS "Item Code", T0."U_SWK_Quantity" AS "Quantity", 
		T0."U_SWK_COO" AS "Country of Origin", T0."U_SWK_Direction" AS "Direction", T0."U_SWK_Date" AS "Date"	
	
	FROM
		"@SWK_BATCHES" T0
		INNER JOIN "RDN1" T1 ON T0."U_SWK_DocEntry" = T1."DocEntry" 
			AND T0."U_SWK_ItemCode" = T1."ItemCode" AND T0."U_SWK_ObjType" = '16'
		INNER JOIN "ORDN" T2 ON T2."DocEntry" = T1."DocEntry"	
	
	UNION ALL
	
	SELECT
		'GRPO' as "Doc Type", T2."DocNum" as "Doc No.", NULL as "Base Doc Type", NULL as "Base Doc No.", 
		T0."U_SWK_Batch" AS "Batch No.", T0."U_SWK_ItemCode" AS "Item Code", T0."U_SWK_Quantity" AS "Quantity", 
		T0."U_SWK_COO" AS "Country of Origin", T0."U_SWK_Direction" AS "Direction", T0."U_SWK_Date" AS "Date"	
	
	FROM
		"@SWK_BATCHES" T0
		INNER JOIN "PDN1" T1 ON T0."U_SWK_DocEntry" = T1."DocEntry" 
			AND T0."U_SWK_ItemCode" = T1."ItemCode" AND T0."U_SWK_ObjType" = '20'
		INNER JOIN "OPDN" T2 ON T2."DocEntry" = T1."DocEntry"	
	
	UNION ALL
	
	SELECT
		'Goods Receipt' as "Doc Type", T2."DocNum" as "Doc No.", NULL as "Base Doc Type", NULL as "Base Doc No.", 
		T0."U_SWK_Batch" AS "Batch No.", T0."U_SWK_ItemCode" AS "Item Code", T0."U_SWK_Quantity" AS "Quantity", 
		T0."U_SWK_COO" AS "Country of Origin", T0."U_SWK_Direction" AS "Direction", T0."U_SWK_Date" AS "Date"	
	
	FROM
		"@SWK_BATCHES" T0
		INNER JOIN "IGN1" T1 ON T0."U_SWK_DocEntry" = T1."DocEntry" 
			AND T0."U_SWK_ItemCode" = T1."ItemCode" AND T0."U_SWK_ObjType" = '59'
		INNER JOIN "OIGN" T2 ON T2."DocEntry" = T1."DocEntry"	
	
	UNION ALL
	
	SELECT
		'Goods Issue' as "Doc Type", T2."DocNum" as "Doc No.", 
		CASE WHEN T1."BaseType" = '202' THEN 'Production Order' ELSE NULL END as "Base Doc Type", 
		CASE WHEN T1."BaseType" = '202' THEN T1."BaseRef" ELSE NULL END as "Base Doc No.", 
		T0."U_SWK_Batch" AS "Batch No.", T0."U_SWK_ItemCode" AS "Item Code", T0."U_SWK_Quantity" AS "Quantity", 
		T0."U_SWK_COO" AS "Country of Origin", T0."U_SWK_Direction" AS "Direction", T0."U_SWK_Date" AS "Date"	
	
	FROM
		"@SWK_BATCHES" T0
		INNER JOIN "IGE1" T1 ON T0."U_SWK_DocEntry" = T1."DocEntry" 
			AND T0."U_SWK_ItemCode" = T1."ItemCode" AND T0."U_SWK_ObjType" = '60'
		INNER JOIN "OIGE" T2 ON T2."DocEntry" = T1."DocEntry"	
	
	UNION ALL
	
	SELECT
		'Inv. Transfer' as "Doc Type", T2."DocNum" as "Doc No.", NULL as "Base Doc Type", NULL as "Base Doc No.", 
		T0."U_SWK_Batch" AS "Batch No.", T0."U_SWK_ItemCode" AS "Item Code", T0."U_SWK_Quantity" AS "Quantity", 
		T0."U_SWK_COO" AS "Country of Origin", T0."U_SWK_Direction" AS "Direction", T0."U_SWK_Date" AS "Date"	
	
	FROM
		"@SWK_BATCHES" T0
		INNER JOIN "WTR1" T1 ON T0."U_SWK_DocEntry" = T1."DocEntry" 
			AND T0."U_SWK_ItemCode" = T1."ItemCode" AND T0."U_SWK_ObjType" = '67'
		INNER JOIN "OWTR" T2 ON T2."DocEntry" = T1."DocEntry"	
	
	UNION ALL
	
	SELECT
		CASE WHEN T2."ObjType" = '13' THEN 'Draft - Invoice' 
			WHEN T2."ObjType" = '15' THEN 'Draft - Delivery'
			WHEN T2."ObjType" = '16' THEN 'Draft - Return'
			WHEN T2."ObjType" = '17' THEN 'Draft - Order'
			WHEN T2."ObjType" = '18' THEN 'Draft - AP Invoice'
			WHEN T2."ObjType" = '20' THEN 'Draft - GRPO'
			WHEN T2."ObjType" = '22' THEN 'Draft - PO'
			WHEN T2."ObjType" = '23' THEN 'Draft - Quote'
			WHEN T2."ObjType" = '540000006' THEN 'Draft - Purchase Quote'
			ELSE 'Draft' END as "DocType", 
		T2."DocNum", NULL as "Base Doc Type", NULL as "Base Doc No.",
		T0."U_SWK_Batch" AS "Batch No.", T0."U_SWK_ItemCode" AS "Item Code", T0."U_SWK_Quantity" AS "Quantity", 
		T0."U_SWK_COO" AS "Country of Origin", T0."U_SWK_Direction" AS "Direction", T0."U_SWK_Date" AS "Date"	
	
	FROM
		"@SWK_BATCHES" T0
		INNER JOIN "DRF1" T1 ON T0."U_SWK_DocEntry" = T1."DocEntry" 
			AND T0."U_SWK_ItemCode" = T1."ItemCode" AND T0."U_SWK_ObjType" = 'DRF'
		INNER JOIN "ODRF" T2 ON T2."DocEntry" = T1."DocEntry"
	) BATCH
```


GBS Subtopic:

Source:SCIOT

Used By:SCIOT
