SELECT
	 T1."DocEntry",
	 T0."DocNum",
	 T0."CardCode",
	 T0."NumAtCard",
	T1."ItemCode",
	 T1."U_SWK_SpecItemInstruct" AS "Special Instructions" 
FROM ODRF T0 
INNER JOIN DRF1 T1 ON T0."DocEntry" = T1."DocEntry" 
WHERE T0."ObjType" = '22' 
and T0."DocStatus" = 'O' 
