# SWK Block Shipment YES

### Description

​Open Orders with Swagelok Shipment Block equals yes.

### Intended Outcome

​Used for tracking shipment block status.

Columns:

Order Document Number, Customer Code, Customer Name, Document Date, ‘No’

```sql
SELECT
	 T0."DocNum",
	 T0."CardCode",
	 T0."CardName",
	 T0."DocDate",
	 T0."U_SWK_ShippingBlock"
FROM ORDR T0
WHERE T0."DocStatus" = 'O'
and T0."U_SWK_ShippingBlock" = 'Y'
```

GBS Subtopic: QTC_Quote to Cash

Source:

Used By:
