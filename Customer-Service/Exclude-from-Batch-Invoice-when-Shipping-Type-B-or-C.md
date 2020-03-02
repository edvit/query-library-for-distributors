# Exclude deliveries from Batch Invoicing when Shipping Type = Pick Up B  or Deliver C

### Description

​Open delivery documents where shipping method is not ’83’ or ‘84’

### Intended Outcome

​Delivery documents that are not specific delivery methods.


Note: Might be specific to distributor shipping methods.


Columns:
Object Type (15), Customer Code, Delivery Document Entry, Delivery Document Entry, Document Date, Ship To Address ID, Document Total


```sql
SELECT
	 T0."ObjType",
	 T0."CardCode",
	 T0."DocEntry",
	 T0."DocNum",
	 T0."DocDate",
	 T0."ShipToCode",
	 T0."DocTotal"
FROM ODLN T0
WHERE T0."ObjType" = '15'
AND T0."DocStatus" = 'O'
AND T0."TrnspCode" <> '83'
AND T0."TrnspCode" <> '84'
```

GBS Subtopic: QTC_Quote to Cash

Source:

Used By:
