# POs in Will Advise

### Description

​Purchase Order Lines with Acknowledgement Type ‘WL’. Shows all POs that have not been Acknowledged by the Factory yet so purchasing can monitor if we need to reach out and find out the status.

### Intended Outcome

​All open purchase orders with Swagelok will advise status.

Columns:
Purchase Order Document Entry, Purchase Order Document Number, Item Code

```sql
SELECT
	 T0."DocNum",
	T1."DocEntry",
	 T1."ItemCode",
	 T1."Quantity",
	 T1."DiscPrcnt" 
FROM OPOR T0 
INNER JOIN POR1 T1 ON T0."DocEntry" = T1."DocEntry" 
WHERE T0."DocStatus" = 'O' 
AND T0."U_SWK_AckType" = 'WL'
```

GBS Subtopic: ITD_Inventory to Delivery

Source: DBORN

Used By: DBORN
