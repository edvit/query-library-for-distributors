# Shelf Life Report Query
 
### Description

​We received positive feedback during our most recent desk audit on the  way we manage our items with shelf life. We created an alert in B1 that  triggers on the first of the month that  generates something similar to a cycle count sheet. The way it is utilized is by reviewing all the product in inventory for a given part number and then recording the oldest cure date found within that part number. Just bear in mind that when printing it you'll want to print table and you may need to resize the window to get all the columns to print on one page.

### Intended Outcome

​GBS Discusion Thread

```sql
SELECT
	 T0."WhsCode" as "Warehouse",
	 T0."ItemCode" as "Item No.",
	 T1."BinCode",
	 CAST(SUM(T0."OnHand") as INT) as "On-Hand",
	 Case when T0."ItemCode" Like 'A%%' 
then '20 Years' when T0."ItemCode" Like 'B%%' 
then '5 Years' when T0."ItemCode" Like 'E%%' 
then '5 Years' when T0."ItemCode" Like 'N%%' 
then '5 Years' when T0."ItemCode" Like 'F%%' 
then '20 Years' when T0."ItemCode" Like 'K%%' 
then '20 Years' when T0."ItemCode" Like 'S%%' 
then '20 Years' when T0."ItemCode" Like 'C%%' 
then '20 Years' when T0."ItemCode" Like 'MS-SNOOP%%' 
then '5 Years' when T0."ItemCode" Like 'MS-RC-SNOOP%%' 
then '2 Years' when T0."ItemCode" Like 'SWS-M200-LBL-CCC' 
then '3 Years' when T0."ItemCode" Like 'MS-PTS%%' 
then '5 Years' when T0."ItemCode" Like 'MS-TFS%%' 
then '5 Years' 
end as "Max Shelf Life",
	 '' as "Oldest Cure Date" 
FROM OITW T0 
INNER JOIN OBIN T1 ON T0."DftBinAbs" = T1."AbsEntry" 
WHERE T0."OnHand" > 0 
and (T0."ItemCode" Like 'AF%%' 
	or T0."ItemCode" Like 'BC%%' 
	or T0."ItemCode" Like 'BN%%' 
	or T0."ItemCode" Like 'BFDA%%' 
	or T0."ItemCode" Like 'HNBR%%' 
	or T0."ItemCode" Like 'BTL%%' 
	or T0."ItemCode" Like 'NP%%' 
	or T0."ItemCode" Like 'NT%%' 
	or T0."ItemCode" Like 'NW%%' 
	or T0."ItemCode" Like 'EP%%' 
	or T0."ItemCode" Like 'ET%%' 
	or T0."ItemCode" Like 'EFDA%%' 
	or T0."ItemCode" Like 'EUSP%%' 
	or T0."ItemCode" Like 'FC%%' 
	or T0."ItemCode" Like 'FFDA%%' 
	or T0."ItemCode" Like 'FGF%%' 
	or T0."ItemCode" Like 'FGLT%%' 
	or T0."ItemCode" Like 'FSP%%' 
	or T0."ItemCode" Like 'FTFE%%' 
	or T0."ItemCode" Like 'FTFX%%' 
	or T0."ItemCode" Like 'FULT%%' 
	or T0."ItemCode" Like 'FUSP%%' 
	or T0."ItemCode" Like 'FS%%' 
	or T0."ItemCode" Like 'KZ%%' 
	or T0."ItemCode" Like 'SZ%%' 
	or T0."ItemCode" Like 'CR%%' 
	or T0."ItemCode" Like 'SL%%' 
	or T0."ItemCode" = 'SWS-M200-LBL-CCC' 
	or T0."ItemCode" Like 'MS-SNOOP%%' 
	or T0."ItemCode" Like 'MS-PTS%%' 
	or T0."ItemCode" Like 'MS-TFS%%') 
GROUP BY T0."WhsCode",
	 T1."BinCode",
	 T0."ItemCode" 
ORDER BY T0."WhsCode",
	 T1."BinCode",
	 T0."ItemCode"
```

GBS Subtopic:

Source:CAMBR

Used By:CAMBR
