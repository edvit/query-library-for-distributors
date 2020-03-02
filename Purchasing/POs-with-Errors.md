# POs with Errors

### Description

​Purchase Orders with Swagelok Status Code ‘E’. Widget that helps purchasing monitor if POs are rejected by Swagelok.

### Intended Outcome

All open purchase orders with a Swagelok error status.

Columns:
Purchase Document Order Number, Swagelok Status Code, Customer Code, Customer Name

```sql
SELECT
	 T0."DocNum",
	 T0."U_SWK_StatusCode",
	 T0."CardCode",
	 T0."CardName" 
FROM OPOR T0 
WHERE T0."DocStatus" = 'O' 
AND T0."CANCELED" <> 'Y' 
AND T0."U_SWK_StatusCode" = 'E'
```

GBS Subtopic: ITD_Inventory to Delivery

Source: DBORN

Used By: DBORN
