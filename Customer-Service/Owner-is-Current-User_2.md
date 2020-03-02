# Owner is Current User - Formatted Search

### Description

This query can be used in a formatted search to change the Owner on the Quote/Order/PO etc to the current user who is logged into SAP. First save the query. Then from the document type you want to created the formatted search click in the owner field. Then hold Shift + Alt + F2 to bring up the User-Defined Values - Setup. Select "Search in Existing User-Defined Values according to Saved Query and then click on "Open Saved Query" and select the query. Then select "Auto Refresh When Field Changes" and select Sales Employee or another field that makes sense for your distributorship. Select "Display Saved User-Defined Values" and then "OK". ​This will need to be done for each transaction type (Quote,Order, PO, etc.)

### Intended Outcome

Should change the Owner from the Salesperson on the BP master to the person who is currently logged into the system working on the transaction.

```sql
SELECT DISTINCT CONCAT(T0."lastName",
CONCAT(' ',T0."firstName")) AS "Owner"
FROM OHEM T0
WHERE T0."userId"=(SELECT T0."USERID" FROM OUSR T0 WHERE
t0.INTERNAL_K = $[USER])
```

GBS Subtopic: QTC_Quote to Cash

Source: DBORN

Used By: CHAR,DBORN
