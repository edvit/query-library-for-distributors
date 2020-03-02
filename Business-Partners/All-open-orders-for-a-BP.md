# All open orders for a BP

### Description

​Open order line information for select business partners.

### Intended Outcome

​Open order lines for the customer added to the prompt.

```sql
SELECT
	 T0."CardCode",
	 T0."CardName",
	 T0."DocStatus",
	 T0."DocNum",
	 T1."ItemCode",
	 T1."U_SWK_ATPQty",
	 T1."U_SWK_AllocateDate",
	 T1."U_SWK_EarlyShipDate",
	 T1."U_SWK_TargetDate"
FROM ORDR T0
INNER JOIN RDR1 T1 ON T0."DocEntry" = T1."DocEntry"
WHERE T0."DocStatus"='O'
AND T0."CardCode" Like '%%[%0]%%'
```

GBS Subtopic: QTC_Quote to Cash

Source:

Used By:
