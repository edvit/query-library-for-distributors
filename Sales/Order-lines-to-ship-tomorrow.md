# Order Lines to Ship Tomorrow

### Description

​Open order lines for warehouse 01 where order line ship date is less than or equal to tomorrow.

### Intended Outcome

​Used to identify open order lines where the ship date is tommorow or earlier.

Columns:
Order Document Number, Customer Name, Item Code, Quantity, ‘Partially Delivered’, Ship Date, Swagelok Early Ship Date....

```sql
SELECT
	 T0."DocNum",
	 T0."CardName",
	 T1."ItemCode",
	 T1."Quantity",
	 T1."DelivrdQty",
	 CASE WHEN(T1."DelivrdQty">0) 
THEN 'Yes' 
ELSE 'No' 
END as "Partially Delivered?",
	 T1."ShipDate" as "SYS Ship Date",
	 T1."U_SWK_EarlyShipDate",
	 T1."U_SWK_AllocateDate",
	 T1."U_SWK_BPNeedDate",
	 T1."U_SWK_TargetDate",
	 T4."TrnspName" as "Ship Method",
	 CONCAT(T3."firstName",
	CONCAT(' ',
	T3."lastName")) as "Owner" 
FROM ORDR T0 
INNER JOIN RDR1 T1 ON T0."DocEntry" = T1."DocEntry" 
INNER JOIN OSLP T2 ON T0."SlpCode" = T2."SlpCode" 
INNER JOIN OHEM T3 ON T0."OwnerCode" = T3."empID" 
INNER JOIN OSHP T4 ON T0."TrnspCode" = T4."TrnspCode" 
WHERE T1."LineStatus" = 'O' 
and T1."ShipDate" <= ADD_DAYS(CURRENT_DATE,1) 
and T1."WhsCode" = '01' 
ORDER BY T0."DocNum",
	 T1."LineNum" 
```

GBS Subtopic: QTC_Quote to Cash

Source: 

Used By: 
