# PO Due Date Past Late Ship Date

## Description

​Open order line items where Late Ship Date is before purchase order Ship Date and Swagelok Acknowledgment Type equals ‘O’. Helps to monitor open orders where it looks like the acknowledgment date is past the late ship date which would cause a delivery customer disappointment.

### Intended Outcome

​Open order lines that have items where the purchase order due date is later than the order line due date. Intended to prompt the user if an item might ship late to a customer due to a change in purchase order dates. The purchase order and order are only linked through the item code so the inventory on order is not necessarily intended for the order.

Columns:
Employee Last Name, Employee First Name, Swagelok Acknowledgment Type, Item Code, Quantity, purchase order Ship Date and order Target Date.

```sql
SELECT
	 T4."firstName",
	 T4."lastName",
	 T0."U_SWK_AckType" AS ACK,
	 T1."ItemCode",
	 T1."Quantity" AS QTY,
	 T1."ShipDate" AS AckDockDate,
	 T2."U_SWK_TargetDate" AS TargetDate,
	 CASE WHEN (T1."ShipDate" > T2."U_SWK_LateShipDate") 
THEN 'Problem?' 
ELSE 'OK' 
END AS Note,
	 T0."DocNum" AS PO ,
	 T3."DocNum" AS SO 
FROM OPOR T0 
INNER JOIN POR1 T1 ON T0."DocEntry" = T1."DocEntry" 
LEFT OUTER JOIN RDR1 T2 ON T1."ItemCode" = T2."ItemCode" 
LEFT OUTER JOIN ORDR T3 ON T2."DocEntry" = T3."DocEntry" 
LEFT OUTER JOIN OHEM T4 ON T3."OwnerCode" = T4."empID" 
WHERE T0."U_SWK_AckType" = 'O' 
AND T2."LineStatus" = 'O' 
AND (T1."ShipDate" > T2."U_SWK_LateShipDate")
```

GBS Subtopic: ITD_Inventory to Delivery;#QTC_Quote to Cash
Source: DBORN
Used By: DBORN
