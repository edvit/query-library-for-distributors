# Get Open POs Contains Quality Notification (ReAck)

### Description

Retrieves a list of open purchase order items that have quality notifications (reAck). Purchasing will monitor and make notes in "Tex" UDF when CSR has been notified. Purchasing will create an activity for the CSR to follow up on when we receive these ReAcknowledgements that typically result in a customer disappointment.

### Intended Outcome

​Document Number, Item No. Row Delivery Date, Text

GBS Discussion Item


```sql
SELECT
	 T0."DocNum",
	 T1."ItemCode",
	 T1."ShipDate",
	 T0."U_SWK_Text" 
FROM OPOR T0 
INNER JOIN POR1 T1 ON T0."DocEntry" = T1."DocEntry" 
WHERE T0."U_SWK_Text" LIKE '%%Quality Notification%%' 
AND T0."DocStatus" = 'O' 
AND T1."LineStatus" = 'O'
```

GBS Subtopic: QTC_Quote to Cash;#STP_Source to Pay

Source: 

Used By: DBORN
