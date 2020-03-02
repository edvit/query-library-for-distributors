# Query by Logged In User

### Description

​After a bit of searching I was unable to find a way to query data based on the user logged into B1 with what we currently have access to in the interface as distributors. I was able to come up with a way to retrieve  the AWS logged in name and use it to create the value to query with.

### Intended Outcome

​GBS Discussion

```sql
SELECT
	 T0."DocNum",
	 T0."CANCELED",
	 T0."DocStatus",
	 T0."DocDate",
	 T0."CardCode",
	 T0."CardName",
	 T0."DocTotal",
	 T1."SlpName"
FROM OQUT T0
INNER JOIN OSLP T1 ON T0."SlpCode" = T1."SlpCode"
WHERE T1."U_SWK_UserCode" =(SELECT
	 CONCAT(LEFT(VALUE,1),
	 SUBSTRING(VALUE, INSTR(VALUE,'.')+1,100)) AS CURRENTUSER
	FROM M_SESSION_CONTEXT
	WHERE KEY='APPLICATION_OS_USER'
	and connection_id=current_connection)
AND T0."DocDate" > ADD_DAYS(CURRENT_DATE,
	-14)
ORDER BY T0."DocTotal" DESC
```

GBS Subtopic:

Source: CALGA

Used By: CALGA
