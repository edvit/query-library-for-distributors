# Open PO Drafts

### Description

We have CSRs use the Allow Procurement Doc to create a PO draft for items they want drop shipped. They will fill in the address, and ship method, and collect number etc. and then save as draft to be reveiwed by purchasing. Purchasing monitors this as a widget to review drop ships for accuracy and to make sure there isn't another option before adding.

### Intended Outcome

​Open purchase order drafts.

Columns:

Document Entry, Document Number, Vendor Code, Vendor Reference (PO#), Item Code, Swagelok Special Instructions

```sql
SELECT
	 T1."DocEntry",
	 T0."DocNum",
	 T0."CardCode",
	 T0."NumAtCard",
	T1."ItemCode",
	 T1."U_SWK_SpecItemInstruct" AS "Special Instructions" 
FROM ODRF T0 
INNER JOIN DRF1 T1 ON T0."DocEntry" = T1."DocEntry" 
WHERE T0."ObjType" = '22' 
and T0."DocStatus" = 'O' 
```

GBS Subtopic: STP_Source to Pay

Source: DBORN

Used By: DBORN
