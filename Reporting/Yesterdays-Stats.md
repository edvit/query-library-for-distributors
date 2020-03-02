### Yesterday's Stats

```sql
/*Quotes*/

SELECT
  *
FROM OQUT T0
WHERE T0."DocDate" = ADD_DAYS(CURRENT_DATE, -1)

/*Quote Lines*/

SELECT
  *
FROM OQUT T0
INNER JOIN QUT1 T1
  ON T0."DocEntry" = T1."DocEntry"
WHERE T0."DocDate" = ADD_DAYS(CURRENT_DATE, -1)

/*Orders*/

SELECT
 *
FROM ORDR T0
WHERE T0."DocDate"  = ADD_DAYS(CURRENT_DATE,-1)


/*Order Lines*/

SELECT
  *
FROM ORDR T0
INNER JOIN RDR1 T1
  ON T0."DocEntry" = T1."DocEntry"
WHERE T0."DocDate" = ADD_DAYS(CURRENT_DATE, -1)

/*Deliveries*/

SELECT
  *
FROM ODLN T0
WHERE T0."DocDate" = ADD_DAYS(CURRENT_DATE, -1)


/*Delivery Lines*/

SELECT
  *
FROM ODLN T0
INNER JOIN DLN1 T1
  ON T0."DocEntry" = T1."DocEntry"
WHERE T0."DocDate" = ADD_DAYS(CURRENT_DATE, -1)

/*Transfers*/

SELECT
  COUNT(T0."DocEntry")
FROM OWTR T0
INNER JOIN WTR1 T1
  ON T0."DocEntry" = T1."DocEntry"
WHERE T0."DocDate" = ADD_DAYS(CURRENT_DATE, -1)
AND "FromWhsCod" <> '01S'
AND "ToWhsCode" <> '01S'
AND T1."LineNum" = 0

/*Transfered Items*/

SELECT
  COUNT(T1."ItemCode")
FROM OWTR T0
INNER JOIN WTR1 T1
  ON T0."DocEntry" = T1."DocEntry"
WHERE T0."DocDate"  = ADD_DAYS(CURRENT_DATE,-1) 
AND "FromWhsCod" <> '01S'
AND "ToWhsCode" <> '01S'
```
