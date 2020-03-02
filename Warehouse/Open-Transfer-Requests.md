# Open Transfer Requests with Part Number

### Description

​Shows all Open Transfer Reqeusts and lists part number, ship from, and ship to warehouse so you can see if an item is still in transit.

### Intended Outcome

​Can be used as a quick overview to see what parts are being transfered to what branch.

```sql
SELECT
	 T1."DocNum",
	 T2."ItemCode",
	 T1."Filler" AS "Ship From",
	 T1."ToWhsCode" AS "Ship to" 
FROM OWTQ T1 
INNER JOIN WTQ1 T2 ON T1."DocEntry" = T2."DocEntry" 
WHERE T1."DocStatus" = 'O' 
AND T2."LineStatus" = 'O'
```

GBS Subtopic: ITD_Inventory to Delivery

Source: 

Used By: 
