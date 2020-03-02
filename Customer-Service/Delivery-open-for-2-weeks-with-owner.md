# Delivery open for 2 weeks with owner

### Description

Open deliveries with owner name where document date is 14 days older than the current date	"​Open deliveries that are over 2 weeks old.

### Intended Outcome

Owner Name, Delivery Document Date, Delivery Document Number, Customer Code, Customer Name, Customer Reference (PO#), Shipment Method, Document Total

```sql
SELECT
	 CONCAT(T1."firstName", CONCAT(' ',	T1."lastName")) AS "Owner",
	 T0."DocDate",
	 T0."DocNum" as "Delivery Note",
	 T0."CardCode" as "Customer Code",
	 T0."CardName" as "Customer Name",
	 T0."NumAtCard" as "Customer PO",
	 T2."TrnspName" as "Ship Method",
	 T0."DocTotal"
FROM ODLN T0
INNER JOIN OHEM T1 ON T0."OwnerCode" = T1."empID"
INNER JOIN OSHP T2 ON T0."TrnspCode" = T2."TrnspCode"
WHERE T0."DocStatus" = 'O'
and T0."DocDate" < ADD_DAYS(CURRENT_DATE,-14)
ORDER BY "Owner", T0."DocDate"
```

GBS Subtopic: QTC_Quote to Cash

Source:

Used By:
