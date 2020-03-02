SELECT
	 T0."DocNum",
	 T0."U_SWK_StatusCode",
	 T0."CardCode",
	 T0."CardName" 
FROM OPOR T0 
WHERE T0."DocStatus" = 'O' 
AND T0."CANCELED" <> 'Y' 
AND T0."U_SWK_StatusCode" = 'E'
