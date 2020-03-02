# Open Orders where shipment date has passed by

### Description

​Order lines where order line ship date is before the current date.

### Intended Outcome

​All order lines current date is greater than ship date.


Note: No filter on order status, add AND T0."DocStatus" = 'O' to WHERE clause if required. Also alter the 0 in:

add_days(current_date,0) if future or past dates are required.

Columns:

Document Number, Customer Code, Item Code, Item Description, Order Quantity….

```sql
SELECT
	 T0."DocNum",
	 T0."CardCode",
	 T1."ItemCode",
	 T1."Dscription",
	 T1."Quantity",
	 T1."OpenQty",
	 T1."ShipDate",
	add_days(current_date,0)
FROM ORDR T0
INNER JOIN RDR1 T1 ON T0."DocEntry" = T1."DocEntry"
WHERE T1."ShipDate" < add_days(current_date,0)
```

GBS Subtopic: QTC_Quote to Cash

Source:

Used By:
