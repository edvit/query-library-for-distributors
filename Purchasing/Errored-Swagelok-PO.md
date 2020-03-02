# Errored Swagelok PO

### Description

Purchase orders from SWGLK where the status code is 'E'

```sql
SELECT
	CONCAT(T2."firstName",CONCAT(' ',T2."lastName")) as "Owner",
	 T0."DocDate",
	 T0."DocNum" as "PO Number",
	 T0."CardCode" as "Vendor Code",
	 T0."CardName" as "Vendor Name",
	 T0."U_SWK_StatusCode",
	 T1."ItemCode",
	 T1."Quantity" 
FROM OPOR T0 
INNER JOIN POR1 T1 ON T0."DocEntry" = T1."DocEntry" 
LEFT OUTER JOIN OHEM T2 ON T0."OwnerCode" = T2."empID" 
WHERE T0."DocStatus" = 'O' 
and T0."CardCode" = 'SWGLK' 
and T0."U_SWK_StatusCode" = 'E'
```
