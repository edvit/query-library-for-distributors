# Open Customer disappointment

### Description

​Service calls where the subject equals 'Customer Disappointment' and status equals ‘-3’

### Intended Outcome

​Open service calls where the distributor has added a service call Subject of 'Customer Disappointment'.

Note: Service call subject can be specific to distributor.

Columns:
Service Call Document Number, Service Call Status, Customer Code, Customer Name, Customer Contact Name, Service Call Create Date...

```sql
SELECT
	 T0."DocNum" as "Service Call",
	 T8."Name" as "Status",
	 T0."customer",
	 T0."custmrName",
	 T1."Name",
	 T0."createDate",
	 T2."Name" as "Origin",
	 T3."Name" as "Category",
	 T4."Name" as "Cat. Subtype",
	 T7."U_NAME" as "Handled By",
	 T0."descrption" as "Remarks"
FROM OSCL T0
LEFT OUTER JOIN OCPR T1 ON T0."contctCode" = T1."CntctCode"
LEFT OUTER JOIN OSCO T2 ON T0."origin" = T2."originID"
LEFT OUTER JOIN OSCP T3 ON T0."problemTyp" = T3."prblmTypID"
LEFT OUTER JOIN OPST T4 ON T0."ProSubType" = T4."ProSubTyId"
LEFT OUTER JOIN OSCT T5 ON T0."callType" = T5."callTypeID"
LEFT OUTER JOIN OHEM T6 ON T0."technician" = T6."empID"
LEFT OUTER JOIN OUSR T7 ON T0."assignee" = T7."USERID"
LEFT OUTER JOIN OSCS T8 ON T0."status" = T8."statusID"
WHERE T0."subject" = 'Customer Disappointment'
and T0."status" = '-3'
ORDER BY T0."createDate",
	 T0."DocNum"
```

GBS Subtopic:

Source:

Used By:
