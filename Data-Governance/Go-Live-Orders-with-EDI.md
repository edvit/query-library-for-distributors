# Go Live Orders with EDI - not transmitting EDI invoices

## Description

​We found that any orders that were transitioned from DMS to SAP did not  bring enough information to allow the transmission of the EDI invoices  back to the customer. We wrote a query to identify those orders that  were from DMS and are EDI so they could be retransmitted.

### Intended Outcome

​GBS Discussion

You'll need to change the like '%%1119%%' to the prefix of your DMS  orders (ours all started with 1119). In addition, once you fix the  invoice if you type Updated in the Comments it will exclude it from the  query widget count. That way you can tell when you're done!

```sql
SELECT
	 T0."DocNum",
	 T0."DocDate",
	 T0."DocDueDate",
	 T0."CardCode",
	 T0."NumAtCard" 
FROM OINV T0 
WHERE T0."DocStatus" = 'O' 
AND T0."U_SWK_OrderMethod" ='EDI' 
AND T0."Comments" not like '%%Updated%%' 
AND T0."Comments" like '%%1119%%'
```

GBS Subtopic: 
Source: BOMBA
Used By:
