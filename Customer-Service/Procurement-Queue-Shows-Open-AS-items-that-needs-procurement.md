SELECT
	 T0."DocNum" AS "Sales Order",
	 T0."NumAtCard" AS "Customer PO#",
	 T0."CardName",
	 T1."ItemCode",
	 T1."Quantity",
	 T1."U_SWK_TargetDate",
	 T1."U_SWK_EarlyShipDate",
	 T1."U_SWK_BPNeedDate",
	 T0."DocDate",
	 T1."LineNum",
	 T1."LinePoPrss",
	 T2."OnHand",
	 T2."IsCommited",
	 T2."OnOrder",
	 T1."LineStatus" 
FROM ORDR T0 
INNER JOIN RDR1 T1 ON T0."DocEntry" = T1."DocEntry" 
INNER JOIN OITM T2 ON T1."ItemCode" = T2."ItemCode" 
WHERE T0."DocStatus" = 'O' 
AND T2."QryGroup59" = 'Y' 
AND T1."LinePoPrss" = 'N' 
AND T1."LineStatus" = 'O'
