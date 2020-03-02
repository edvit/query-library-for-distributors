# Item Notes

### Description

​Item master properties and notes for all items

### Intended Outcome

​Customer facing notes for all inventory items.

Columns:
Item Code, Item Description, Item Group Code, Item Properties 62 - 63, Swagelok Discount Code, Swagelok Purchase Discount Code, Swagleok Customer Order, Picklist, Packing and Invoice Note

```sql
SELECT
	 T0."ItemCode",
	 T0."QryGroup62",
	 T0."QryGroup63",
	 T0."ItmsGrpCod",
	 T0."U_SWK_CustNoteQuote",
	 T0."U_SWK_CustNoteOrder",
	 T0."U_SWK_CustNotePickList",
	 T0."U_SWK_CustNotePackList",
	 T0."U_SWK_CustNoteInvoice"
FROM OITM T0
```

GBS Subtopic: ITD_Inventory to Delivery, QTC_Quote to Cash

Source:

Used By:
