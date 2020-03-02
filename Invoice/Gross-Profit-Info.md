### Gross Profit and Line Detail for Particular Item or Order

```sql
SELECT
  T1."DocEntry",
  T1."LineNum",
  T1."ItemCode",
  T1."Price",
  T1."DiscPrcnt",
  T1."Quantity",
  T1."LineTotal",
  T1."GrossBuyPr",
  T1."BasePrice",
  T1."GrossBase",
  T1."GrssProfit",
  T1."GTotal",
  T1."StockValue",
  T1."GPTtlBasPr"
FROM INV1 T1
WHERE T1."DocEntry" = [%0]
OR T1."ItemCode" = [%1]
```
