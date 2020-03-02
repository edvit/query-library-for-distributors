# Open Orders – unapproved or with ship block

### Description

​Open orders where order confirmed status equals ‘no’ or Swagelok shipping block equals ‘Y’ with document owner name.

### Intended Outcome

​Displays open orders that have a shipment block or not confimred.

Columns:
Document Owner Name, Document Date, Order Document Number, Customer Code, Customer Name, Order Confirmed Status, Swagelok Shipment Block Flag

```sql
SELECT
	 CONCAT(T1."firstName",	CONCAT(' ',	T1."lastName")) as "Owner",
	 T0."DocDate",
	 T0."DocNum",
	 T0."CardCode",
	 T0."CardName",
	 T0."Confirmed" as "Approved",
	 T0."U_SWK_ShippingBlock"
FROM ORDR T0
INNER JOIN OHEM T1 ON T0."OwnerCode" = T1."empID"
WHERE T0."DocStatus" = 'O'
and (T0."Confirmed" = 'N'
or T0."U_SWK_ShippingBlock" = 'Y')
ORDER BY CONCAT(T1."firstName", CONCAT(' ',	T1."lastName")),T0."CardName",T0."DocNum"
```

GBS Subtopic: QTC_Quote to Cash

Source:

Used By:
