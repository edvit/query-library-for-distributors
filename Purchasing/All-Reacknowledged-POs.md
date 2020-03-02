### All purchase orders with re-acknowledgments

```sql
SELECT
  "DocEntry",
  "DocNum",
  "U_SWK_BTUpdCount",
  "U_SWK_BTAckTypeCode",
  "U_SWK_BTAckTypeDesc",
  "U_SWK_XRefKey"
FROM OPOR
WHERE "U_SWK_BTUpdCount" > 0
```
