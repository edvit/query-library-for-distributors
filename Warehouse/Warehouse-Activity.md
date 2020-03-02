# WHSE Activity

### Description

​All deliveries for today.

### Intended Outcome

​Today's open deliveries with user.

Columns:
User Name, Delivery Document Number, Customer Code

```sql
SELECT
	 T1."U_NAME",
	 T0."DocNum",
	 T0."CardCode" 
FROM ODLN T0 
INNER JOIN OUSR T1 ON T0."UserSign" = T1."USERID" 
WHERE T0."DocDate" =(CURRENT_DATE)
```

GBS Subtopic: ITD_Inventory to Delivery, QTC_Quote to Cash

Source: 

Used By:
