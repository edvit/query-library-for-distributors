### Count of closed orders divided by working days for 4 weeks

```sql
SELECT
  COUNT("DocEntry") / 20 AS "AverageCountOfClosedOrders"
FROM ORDR
WHERE "DocStatus" = 'C'
AND "CANCELED" = 'N'
AND "DocDate" > ADD_DAYS(CURRENT_DATE, -29)
AND "DocDate" < CURRENT_DATE
```
