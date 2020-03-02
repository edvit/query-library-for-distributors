# ATP: Used to see a quick snapshot of a BOM for a particular assembly

### Description

​Bill of material lines for selected item with warehouse 01 and 01S information

### Intended Outcome

​Used to see a quick snapshot of a BOM for a particular assembly

Columns:
Production Item Code, Item Code, Quantity, Sum of On Hand, Sum of Committed,Sum of On Hand less Sum of Committed, Sum of On Hand

```sql
SELECT
	 T1."Code",
	 T0."Code",
	 T0."Quantity",
	 Sum(T2."OnHand") as "On Hand",
	 Sum(T2."IsCommited") as "Committed",
	 (Sum(T2."OnHand") - Sum(T2."IsCommited")) AS "Available",
	 Sum(T2."OnOrder") as "On Order" 
FROM ITT1 T0 
INNER JOIN OITT T1 ON T0."Father" = T1."Code" 
INNER JOIN OITW T2 ON T0."Code" = T2."ItemCode" 
and T2."WhsCode" in ('01',	'01S') 
WHERE T1."Code" =[%0] 
AND T0."Type" = 4 
Group by T1."Code",
	 T0."Code",
	 T0."Quantity" 
ORDER BY T0."Code" 
```

GBS Subtopic: MTC_Manufacture to Complete, QTC_Quote to Cash

Source: 

Used By:

