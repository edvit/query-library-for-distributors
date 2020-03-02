# Get Tracking Number by Sales Order

### Description

​Using the V33 Shipping Module pulls the tacking number for each sales order

### Intended Outcome

Delivery Number, Tracking Number

```sql
SELECT T0."U_DocNum", T0."U_TrackNum" FROM "@V33_SHIP_PLD"  T0
```

GBS Subtopic: ITD_Inventory to Delivery

Source: 

Used By: 
