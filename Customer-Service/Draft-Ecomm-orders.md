# Draft Ecomm orders

### Description

​All draft order documents. Joins draft documents with order documents on order Document Draft Internal ID.	"​Note: All orders that came from a draft. Might need a date or status or other filter."

### Intended Outcome

Columns:
Draft Document Number, Draft Document Type, Draft Document Status, Draft Object Type

```sql
SELECT
	 T0."DocNum",
	 T0."DocType",
	 T0."DocStatus",
	 T0."ObjType",
	 T0."TransId",
	 T0."DocDate",
	 T0."CardCode",
	 T0."CreateDate",
	 T0."draftKey",
	 T0."DocEntry",
	 T0."NumAtCard" 
FROM ODRF T0 
INNER JOIN ORDR T1 ON T0."DocEntry" = T1."draftKey"
```

GBS Subtopic: QTC_Quote to Cash
Source: 
Used By: 

