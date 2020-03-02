### All inactive contacts

```sql
SELECT 
  T0."CardCode", 
  T0."Name", 
  T0."FirstName", 
  T0."LastName", 
  T0."E_MailL", 
  T0."Tel1", 
  T0."BlockComm" 
FROM 
  OCPR T0 
WHERE 
  T0."Active" = 'N'
```
