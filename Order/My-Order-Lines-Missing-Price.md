### Orders where line price is less than $.05 

To use in widget for current user remove '--'

Filters items commonly priced at zero

```sql
SELECT
  T0."DocEntry",
  T0."DocNum",
  T1."ItemCode",
  T1."LineStatus",
  T1."Price"
FROM ORDR T0
INNER JOIN RDR1 T1
  ON T1."DocEntry" = T0."DocEntry"
WHERE T1."LineStatus" = 'O'
AND T1."Price" < .05
AND T1."ItemCode" NOT IN ('CERT OF COMPLIANCE',
'C.M.T.R.',
'S.S. TAG',
'STATUTORY DECLARATION',
'EMERGENCY SERVICE'
)--AND T0."UserSign" = $[USER]
```
