# POs in Will Advise Status

### Description

​Shows all PO's that have yet to be acknowledged from Swagelok and are still in Will Advise.

### Intended Outcome

​Can help to identify those PO's that you might need to follow up on because they have not been acknowledged.

```sql
SELECT T0."DocNum",
T1."DocEntry",
T1."ItemCode",
T1."Quantity",
T1."DiscPrcnt"
FROM OPOR T0
INNER JOIN POR1 T1
  ON T0."DocEntry" = T1."DocEntry"
WHERE T0."DocStatus" = 'O'
AND T0."U_SWK_AckType" = 'WL'
```

GBS Subtopic: STP_Source to Pay

Source: DBORN

Used By: DBORN
