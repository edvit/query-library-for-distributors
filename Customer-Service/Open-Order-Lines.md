# Open Order Lines

### Description

​All open order lines with employee name

### Intended Outcome

​Displays all open order lines by user.

Columns:
Order Document Number, Document Date, Customer Code, Customer Code, Salesperson Name, Concatenated Employee First Name and Last Name, ItemCode, Quantity...

```sql
SELECT
	 T0."DocNum",
	 T0."DocDate",
	 T0."CardCode",
	 T0."CardName",
	 T2."SlpName",
	 CONCAT(T3."firstName",
	CONCAT(' ',
	T3."lastName")) as "Owner",
	 T1."ItemCode",
	 T1."Quantity",
	 T1."DelivrdQty",
	 CASE WHEN(T1."DelivrdQty">0)
THEN 'Yes'
ELSE 'No'
END as "Partially Delivered?",
	 T1."U_SWK_EarlyShipDate",
	 T1."U_SWK_AllocateDate",
	 T1."U_SWK_BPNeedDate",
	 T1."U_SWK_TargetDate",
	T1."ShipDate" as "SYS Ship Date",
	 T4."TrnspName"
FROM ORDR T0  INNER JOIN
RDR1 T1 ON T0."DocEntry" = T1."DocEntry" INNER JOIN
OSLP T2 ON T0."SlpCode" = T2."SlpCode" INNER JOIN
OHEM T3 ON T0."OwnerCode" = T3."empID" INNER JOIN
OSHP T4 ON T0."TrnspCode" = T4."TrnspCode"
WHERE T1."LineStatus"  = 'O' ORDER BY T0."DocNum", T1."LineNum"
```

GBS Subtopic: QTC_Quote to Cash

Source:

Used By:
