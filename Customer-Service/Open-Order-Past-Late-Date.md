# Open Order Past Late Date

### Description

​Open order lines where current date is greater than Late Ship Date

### Intended Outcome

​Select details on all open order lines past "U_SWK_LateShipDate"

Columns:
Order Document Number, Customer Code, Customer Name, Item Code, Employee Last Name, Swagelok Late Ship Date, Partial Delivery Flag, Shipment Block Flag

```sql
SELECT
	 T0."DocNum",
	 T0."CardCode",
	 T0."CardName",
	 T1."ItemCode",
	 T2."lastName",
	 T1."U_SWK_LateShipDate" AS "Late Date",
	 T0."PartSupply" AS "Partial Delivery",
	 T0."U_SWK_ShippingBlock" AS "Shipping Block"
FROM ORDR T0
INNER JOIN RDR1 T1 ON T0."DocEntry" = T1."DocEntry"
INNER JOIN OHEM T2 ON T0."OwnerCode" = T2."empID"
WHERE T1."U_SWK_LateShipDate" < CURRENT_DATE
AND T1."LineStatus" = 'O'
ORDER BY T0."DocNum"
```

GBS Subtopic: QTC_Quote to Cash

Source:

Used By: DBORN
