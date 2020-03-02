# Run Batch Invoicing for one specific customer

### Description

​Open delivery documents for a select customer code.

### Intended Outcome

​Open delivery documents for customer code entered.


Note: Might be specific to distributor batch invoice process.

Columns:
Object Type (15), Customer Code, Delivery Document Entry, Delivery Document Entry, Document Date, Ship To Address ID, Document Total

```sql
SELECT
	 T0."ObjType" ,
	 T0."CardCode",
	 T0."DocEntry",
	 T0."DocNum",
	 T0."DocDate",
	 T0."ShipToCode",
	 T0."DocTotal"
FROM ODLN T0
WHERE T0."ObjType" = '15'
AND T0."DocStatus" = 'O'
and T0."CardCode" = '[%0]'
```

GBS Subtopic: QTC_Quote to Cash

Source:

Used By:
