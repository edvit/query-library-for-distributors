### All business partners missing industry 

```sql
SELECT 
  "CardCode", 
  "CardName", 
  "U_SWK_TradeCode", 
  "U_SWK_BPType" 
FROM 
  OCRD 
WHERE 
  "IndustryC" IS NULL 
  AND "CardType" = 'C'
```
