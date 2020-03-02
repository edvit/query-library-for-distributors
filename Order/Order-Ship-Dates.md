### Ship dates on all orders past 30 days

```sql
SELECT
  T1."DocNum",
  T0."ItemCode",
  T1."DocDate",
  T0."U_SWK_EarlyShipDate",
  T0."U_SWK_LateShipDate",
  T0."U_SWK_ActualDeliveryDate",
  T0."U_SWK_OrigTargetDate",
  T0."U_SWK_TargetDate",
  DAYS_BETWEEN(T0."U_SWK_TargetDate", T0."U_SWK_ActualDeliveryDate") AS "Days Between Target and Ship"
FROM RDR1 T0
INNER JOIN ORDR T1
  ON T0."DocEntry" = T1."DocEntry"
WHERE DAYS_BETWEEN(T0."DocDate", CURRENT_DATE) <= 30
```
