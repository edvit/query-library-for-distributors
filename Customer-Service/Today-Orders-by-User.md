# Today Orders by User

### Description

​All orders for today.

### Intended Outcome

​Today's orders by user.

Columns:

User Name, Order Document Number, Customer Code

```sql
SELECT
	 T1."U_NAME",
	 T0."DocNum",
	 T0."CardCode"
FROM ORDR T0
INNER JOIN OUSR T1 ON T0."UserSign" = T1."USERID"
WHERE T0."DocDate" =(CURRENT_DATE)
```

GBS Subtopic: QTC_Quote to Cash

Source:

Used By:
