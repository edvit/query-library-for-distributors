# Inventory Overview by Part Number

### Description

​Gives a view of what is in stock, on a Sales Order, and on a PO for a specific part number in all branches. Similar to OBA in DMS and typically used by purchasing for a quick overview on a part when doing transfer reports.

### Intended Outcome

​This query will give you a quick view of what is in Item Master on the inventory tab for a part to help see inventory availability if the option isn't available in the screen you are in.

```sql
SELECT T0."ItemCode",
T0."WhsCode",
T0."OnHand",
T0."IsCommited" AS "On SO",
T0."OnOrder" AS "On PO"
FROM OITW T0
WHERE T0."ItemCode" = [%0]
ORDER BY T0."WhsCode"
```

GBS Subtopic: QTC_Quote to Cash, STP_Source to Pay

Source: DBORN

Used By: DBORN
