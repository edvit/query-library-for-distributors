# SWK RSC Response

### Description

Developed by Vision33

RICEFW QTC-I-008

This query will show all regional stock checks with status = R (Received) and belonging to the user.​

### Intended Outcome

​Regional stock checks where regional stock check status is received. Requires changing the 'UserSign' value to the intended user code.

Cloumns: SWK_RSC Document Entry, Item Code, Requested Quantity, Request Status, Creator

```sql
/* Developed by Vision33 */ /* RICEFW QTC-I-008 */ /* This query will show all regional stock checks with status = R (Received)
and belonging to the user. */

SELECT
	 T0."DocEntry",
	 T0."U_SWK_ItemCode",
	 T0."U_SWK_RequestedQty",
	 T0."U_SWK_Status",
	 T0."Creator"
FROM "@SWK_RSC" T0
Where T0."U_SWK_Status" = 'R'and T0."Creator" = 'UserSign'
```

GBS Subtopic: QTC_Quote to Cash

Source:

Used By:
