## Count all warehouse for each item code 

Useful for knowing the next warehouse line number for DTW

```sql
SELECT
  "ItemCode",
  COUNT("ItemCode")
FROM OITW
GROUP BY "ItemCode"
ORDER BY "ItemCode"
```
