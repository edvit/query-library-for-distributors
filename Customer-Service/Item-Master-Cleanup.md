# Item Master Cleanup

### Description

​Item master data

### Intended Outcome

​Select item master properties for all items.

Columns:Item Code, Description, Item Group Code, Inventory Type Flags, Item Properties 56 to 64, Purchase and Sales Class Codes

```sql
SELECT
	 T0."ItemCode",
	 T0."ItemName",
	 T0."ItmsGrpCod",
	 T0."PrchseItem",
	 T0."SellItem",
	 T0."InvntItem",
	 T0."CardCode",
	 T0."QryGroup56",
	 T0."QryGroup57",
	 T0."QryGroup58",
	 T0."QryGroup59",
	 T0."QryGroup60",
	 T0."QryGroup61",
	 T0."QryGroup62",
	 T0."QryGroup63",
	 T0."QryGroup64",
	 T0."U_SWK_SalesDiscCode",
	 T0."U_SWK_PurDiscCode"
FROM OITM T0
```

GBS Subtopic: ITD_Inventory to Delivery, QTC_Quote to Cash

Source:

Used By:
