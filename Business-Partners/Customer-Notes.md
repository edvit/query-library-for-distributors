### All notes for all business partners.

Customer name parameters optional (remove the '--')

```sql
SELECT
  T0."CardCode",
  T0."CardName",
  T0."Free_Text",
  T0."Notes" AS "General Tab Remarks",
  T0."U_SWK_CustNoteQuote",
  T0."U_SWK_CustNoteOrder",
  T0."U_SWK_CustNotePickList",
  T0."U_SWK_CustNotePackList",
  T0."U_SWK_CustNoteInvoice"
FROM OCRD T0

--WHERE T0."CardName" = [%0]
```
