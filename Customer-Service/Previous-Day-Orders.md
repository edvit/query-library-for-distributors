# Previous Day Orders

### Description

​All orders from previous day. (Current date less one day)

### Intended Outcome

​All orders and customer codes from yesterday.

Columns:

User Name, Order Document Number, Customer Code, Document Date

```sql
SELECT
	 T1."U_NAME",
	 T0."DocNum",
	 T0."CardCode",
	 T0."DocDate"
FROM ORDR T0
INNER JOIN OUSR T1 ON T0."UserSign" = T1."USERID"
WHERE T0."DocDate" = ADD_DAYS (CURRENT_DATE,-1)
```

GBS Subtopic: QTC_Quote to Cash

Source:

Used By:
