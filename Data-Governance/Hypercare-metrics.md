# CUTOVER/HYPERCARE METRICS

## Description

Document Totals for Good Receipts, Purchase Invoices, Purchase Orders, Invoices, Orders and Quotes

### Intended Outcome

​Used to reconcile sales, purchasing and inventory data at go live.

Columns:
Document Number, Document Date, Document Total, Warehouse Code for select document types.

```sql
/*Legacy Reconciliation | Inventory - In Stock */

SELECT
	 T0."DocNum",
	 T0."DocDate",
	 T0."DocTotal",
	 T1."WhsCode" 
FROM OIGN T0 
INNER JOIN IGN1 T1 ON T0."DocEntry" = T1."DocEntry"

/*Legacy Reconciliation | Purchasing - AP Invoices*/

SELECT
	 T0."DocDate",
	 T0."DocNum" ,
	 T0."CardCode",
	 T0."DocTotal",
	 T0."VatSum",
	 T0."DocStatus" 
FROM OPCH T0 

/*Legacy Reconciliation | Purchasing - Purchase Orders */

SELECT
	 T0."DocDate",
	 T0."DocNum" ,
	 T0."CardCode",
	 T0."DocTotal",
	 T0."VatSum",
	 T0."DocStatus" 
FROM OPOR T0 

/*Legacy Reconciliation | Sales - AR Invoices */ 

SELECT
	 T0."DocDate",
	 T0."DocNum" ,
	 T0."CardCode",
	 T0."DocTotal",
	 T0."VatSum",
	 T0."DocStatus" 
FROM OINV T0 

/*Legacy Reconciliation | Sales - Orders */

SELECT
	 T0."DocDate",
	 T0."DocNum",
	 T0."CardCode",
	 T0."DocTotal",
	 T0."VatSum",
	 T0."DocStatus" 
FROM ORDR T0 

/*Legacy Reconciliation | Sales - Quotes */

SELECT
	 T0."DocDate",
	 T0."DocNum",
	 T0."CardCode",
	 T0."DocTotal",
	 T0."VatSum",
	 T0."DocStatus" 
FROM OQUT T0 
```

GBS Subtopic: N/A
Source: 
Used By: 
