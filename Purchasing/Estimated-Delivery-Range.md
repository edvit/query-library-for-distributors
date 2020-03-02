### Open purchase order lines and estimated delivery 

```sql
SELECT
  T40."ItemCode",
  T40."U_SWK_OrgDelDateBT" AS "Estimated Delivery",
  CASE
    WHEN DAYS_BETWEEN(CURRENT_DATE, T40."ShipDate") <= 14 THEN 'Due in 2 Weeks'
    WHEN DAYS_BETWEEN(CURRENT_DATE, T40."ShipDate") < 30 THEN 'Due in 4 Weeks'
    WHEN DAYS_BETWEEN(CURRENT_DATE, T40."ShipDate") < 120 THEN 'Due in 4 - 12 Weeks'
    WHEN DAYS_BETWEEN(CURRENT_DATE, T40."ShipDate") > 120 THEN 'Due in 12 or more Weeks'
  END AS "Days Due",
  T40."Quantity" AS "On PO",
  T40."WhsCode"
FROM OPOR T30
INNER JOIN POR1 T40
  ON T30."DocEntry" = T40."DocEntry"
WHERE T40."LineStatus" = 'O'
```
