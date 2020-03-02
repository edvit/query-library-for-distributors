# Items with zero price on open deliveries

### Description

Shows open deliveries with zero unit price on ​individual line:

### Intended Outcome

​Used by Customer Services Manager -
Allows for update to customer order prior to invoicing

```sql
SELECT T0."DocNum",
T0."DocStatus",
T0."CardCode",
T0."CardName",
T2."lastName",
T1."ItemCode",
T1."Quantity",
T1."Price"
FROM ODLN T0
INNER JOIN DLN1 T1
  ON T0."DocEntry" = T1."DocEntry"
INNER JOIN OHEM T2
  ON T0."OwnerCode" = T2."empID"
WHERE T0."DocStatus" = 'O'
AND T1."Price" = 0
```

GBS Subtopic: QTC_Quote to Cash

Source: CHAR

Used By: CHAR
