# DT Manifest

### Description

​Delivery and order documents where the order number appears in the document remarks for the past seven days. Also compares the customer codes between the order and delivery, displays ‘ERROR’ when they are different.

### Intended Outcome

 Note: Might be specific to distributor shipping process.
​
Columns:

Delivery Document Numner, Order Document Number, Delivery Customer Code, Delivery Customer Reference (PO#), Delivery Document Number, Shipment Method Description, Order Customer Code, Order Customer Reference, ‘Error?’


```sql
SELECT
	 T0."DocNum" AS "Delivery Number" ,
	 T1."DocNum" AS "Transaction #" ,
	 T0."CardCode" AS "Ship To" ,
	 T0."NumAtCard" AS "Customer PO #" ,
	 T0."DocDate" ,
	 T3."TrnspName" ,
	 T1."CardCode" AS "Sales Order Ship To" ,
	 T1."NumAtCard" AS "Sales Order Customer PO" ,
	 CASE WHEN T1."CardCode" <> T0."CardCode" THEN 'ERROR' ELSE NULL END AS "Error?"
FROM ODLN T0
INNER JOIN ORDR T1 ON T0."Comments" LIKE CONCAT('%',CONCAT(T1."DocNum",'%'))
INNER JOIN OCRD T2 ON T0."CardCode" = T2."CardCode"
INNER JOIN OSHP T3 ON T0."TrnspCode" = T3."TrnspCode"
WHERE T0."DocDate" BETWEEN ADD_DAYS(CURRENT_DATE,-7)
AND CURRENT_DATE
```

GBS Subtopic: QTC_Quote to Cash

Source:

Used By:
