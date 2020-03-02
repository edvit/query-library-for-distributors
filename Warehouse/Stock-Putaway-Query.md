# Stock Putaway Query

### Description

​Open Good Receipt PO document draft line items for vendor reference entered.

### Intended Outcome

Open good reciept draft lines given a purchase order number.

Note: Might depend on distributor inventory put away process.

​Columns:
Document Number, Vendor reference, Customer Code, Customer Name, Item Code, Quantity, Bin Location

```sql
SELECT
	 T0."DocNum",
	 T0."NumAtCard",
	 T0."CardCode",
	 T0."CardName",
	 T1."ItemCode",
	 T1."Quantity",
	 T3."BinCode" 
FROM ODRF T0 
INNER JOIN DRF1 T1 ON T0."DocEntry" = T1."DocEntry" 
INNER JOIN OITW T2 ON T1."WhsCode"=T2."WhsCode" 
and T1."ItemCode" = T2."ItemCode" 
INNER JOIN OBIN T3 ON T2."DftBinAbs" = T3."AbsEntry" 
WHERE T0."ObjType" ='20' 
and T0."DocStatus" ='O' 
AND T0."NumAtCard" = [%] 
```

GBS Subtopic: ITD_Inventory to Delivery

Source: DBORN

Used By: DBORN
