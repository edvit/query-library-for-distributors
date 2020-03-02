# Rolling Monthly Sales Analysis by Sale Associate

### Description

​This is a query we developed to give us month-by-month sales analysis for a given sales ​associate.  Bear in mind that it's looking at the past twelve months of data so newer B1 sites (including us) won't have a full history until they've been on B1 for at least that long.  This query will have to be setup for each sales associate as we use it in conjunction with Crystal Reports and Visual Cut for automated report generation.  You'll want to pop it into notepad and find/replace Sales Associate to a given sales associate's name within B1.
Peter MacLauchlan

### Intended Outcome

​month-by-month sales analysis for a given sales ​associate, used in conjunction with Crystal Reports and Visual Cut for automated report generation.


```sql
SELECT T50."SlpName", T50."CardCode", T50."CardName", Sum(T50."12 Months Ago") as "12 Months Ago", Sum(T50."11 Months Ago") as "11 Months Ago", Sum(T50."10 Months Ago") as "10 Months Ago", Sum(T50."9 Months Ago") as "9 Months Ago", Sum(T50."8 Months Ago") as "8 Months Ago", Sum(T50."7 Months Ago") as "7 Months Ago", Sum(T50."6 Months Ago") as "6 Months Ago", Sum(T50."5 Months Ago") as "5 Months Ago", Sum(T50."4 Months Ago") as "4 Months Ago", Sum(T50."3 Months Ago") as "3 Months Ago", Sum(T50."2 Months Ago") as "2 Months Ago", Sum(T50."Last Month") as "Last Month" From

(

SELECT T1."SlpName", T0."CardCode", T0."CardName", Sum(T0."DocTotal"-T0."VatSum"-T0."TotalExpns") as "12 Months Ago", 0 as "11 Months Ago", 0 as "10 Months Ago", 0 as "9 Months Ago", 0 as "8 Months Ago", 0 as "7 Months Ago", 0 as "6 Months Ago", 0 as "5 Months Ago", 0 as "4 Months Ago", 0 as "3 Months Ago", 0 as "2 Months Ago", 0 as "Last Month"

FROM OINV T0 INNER JOIN OSLP T1 ON T0."SlpCode" = T1."SlpCode"

WHERE T1."SlpName" = 'Sales Associate' and T0."DocDate" between ADD_DAYS(LAST_DAY(ADD_MONTHS(CURRENT_DATE,-13)),1) and Last_Day(ADD_MONTHS(CURRENT_DATE,-12))

GROUP BY T1."SlpName", T0."CardCode", T0."CardName"

Union All

SELECT T1."SlpName", T0."CardCode", T0."CardName", 0 as "12 Months Ago", Sum(T0."DocTotal"-T0."VatSum"-T0."TotalExpns") as "11 Months Ago", 0 as "10 Months Ago", 0 as "9 Months Ago", 0 as "8 Months Ago", 0 as "7 Months Ago", 0 as "6 Months Ago", 0 as "5 Months Ago", 0 as "4 Months Ago", 0 as "3 Months Ago", 0 as "2 Months Ago", 0 as "Last Month"

FROM OINV T0 INNER JOIN OSLP T1 ON T0."SlpCode" = T1."SlpCode"

WHERE T1."SlpName" = 'Sales Associate' and T0."DocDate" between ADD_DAYS(LAST_DAY(ADD_MONTHS(CURRENT_DATE,-12)),1) and Last_Day(ADD_MONTHS(CURRENT_DATE,-11))

GROUP BY T1."SlpName", T0."CardCode", T0."CardName"

Union All

SELECT T1."SlpName", T0."CardCode", T0."CardName", 0 as "12 Months Ago", 0 as "11 Months Ago", Sum(T0."DocTotal"-T0."VatSum"-T0."TotalExpns") as "10 Months Ago", 0 as "9 Months Ago", 0 as "8 Months Ago", 0 as "7 Months Ago", 0 as "6 Months Ago", 0 as "5 Months Ago", 0 as "4 Months Ago", 0 as "3 Months Ago", 0 as "2 Months Ago", 0 as "Last Month"

FROM OINV T0 INNER JOIN OSLP T1 ON T0."SlpCode" = T1."SlpCode"

WHERE T1."SlpName" = 'Sales Associate' and T0."DocDate" between ADD_DAYS(LAST_DAY(ADD_MONTHS(CURRENT_DATE,-11)),1) and Last_Day(ADD_MONTHS(CURRENT_DATE,-10))

GROUP BY T1."SlpName", T0."CardCode", T0."CardName"

Union All

SELECT T1."SlpName", T0."CardCode", T0."CardName", 0 as "12 Months Ago", 0 as "11 Months Ago", 0 as "10 Months Ago", Sum(T0."DocTotal"-T0."VatSum"-T0."TotalExpns") as "9 Months Ago", 0 as "8 Months Ago", 0 as "7 Months Ago", 0 as "6 Months Ago", 0 as "5 Months Ago", 0 as "4 Months Ago", 0 as "3 Months Ago", 0 as "2 Months Ago", 0 as "Last Month"

FROM OINV T0 INNER JOIN OSLP T1 ON T0."SlpCode" = T1."SlpCode"

WHERE T1."SlpName" = 'Sales Associate' and T0."DocDate" between ADD_DAYS(LAST_DAY(ADD_MONTHS(CURRENT_DATE,-10)),1) and Last_Day(ADD_MONTHS(CURRENT_DATE,-9))

GROUP BY T1."SlpName", T0."CardCode", T0."CardName"

Union All

SELECT T1."SlpName", T0."CardCode", T0."CardName", 0 as "12 Months Ago", 0 as "11 Months Ago", 0 as "10 Months Ago", 0 as "9 Months Ago", Sum(T0."DocTotal"-T0."VatSum"-T0."TotalExpns") as "8 Months Ago", 0 as "7 Months Ago", 0 as "6 Months Ago", 0 as "5 Months Ago", 0 as "4 Months Ago", 0 as "3 Months Ago", 0 as "2 Months Ago", 0 as "Last Month"

FROM OINV T0 INNER JOIN OSLP T1 ON T0."SlpCode" = T1."SlpCode"

WHERE T1."SlpName" = 'Sales Associate' and T0."DocDate" between ADD_DAYS(LAST_DAY(ADD_MONTHS(CURRENT_DATE,-9)),1) and Last_Day(ADD_MONTHS(CURRENT_DATE,-8))

GROUP BY T1."SlpName", T0."CardCode", T0."CardName"

Union All

SELECT T1."SlpName", T0."CardCode", T0."CardName", 0 as "12 Months Ago", 0 as "11 Months Ago", 0 as "10 Months Ago", 0 as "9 Months Ago", 0 as "8 Months Ago", Sum(T0."DocTotal"-T0."VatSum"-T0."TotalExpns") as "7 Months Ago", 0 as "6 Months Ago", 0 as "5 Months Ago", 0 as "4 Months Ago", 0 as "3 Months Ago", 0 as "2 Months Ago", 0 as "Last Month"

FROM OINV T0 INNER JOIN OSLP T1 ON T0."SlpCode" = T1."SlpCode"

WHERE T1."SlpName" = 'Sales Associate' and T0."DocDate" between ADD_DAYS(LAST_DAY(ADD_MONTHS(CURRENT_DATE,-8)),1) and Last_Day(ADD_MONTHS(CURRENT_DATE,-7))

GROUP BY T1."SlpName", T0."CardCode", T0."CardName"

Union All

SELECT T1."SlpName", T0."CardCode", T0."CardName", 0 as "12 Months Ago", 0 as "11 Months Ago", 0 as "10 Months Ago", 0 as "9 Months Ago", 0 as "8 Months Ago", 0 as "7 Months Ago", Sum(T0."DocTotal"-T0."VatSum"-T0."TotalExpns") as "6 Months Ago", 0 as "5 Months Ago", 0 as "4 Months Ago", 0 as "3 Months Ago", 0 as "2 Months Ago", 0 as "Last Month"

FROM OINV T0 INNER JOIN OSLP T1 ON T0."SlpCode" = T1."SlpCode"

WHERE T1."SlpName" = 'Sales Associate' and T0."DocDate" between ADD_DAYS(LAST_DAY(ADD_MONTHS(CURRENT_DATE,-7)),1) and Last_Day(ADD_MONTHS(CURRENT_DATE,-6))

GROUP BY T1."SlpName", T0."CardCode", T0."CardName"

Union All

SELECT T1."SlpName", T0."CardCode", T0."CardName", 0 as "12 Months Ago", 0 as "11 Months Ago", 0 as "10 Months Ago", 0 as "9 Months Ago", 0 as "8 Months Ago", 0 as "7 Months Ago", 0 as "6 Months Ago", Sum(T0."DocTotal"-T0."VatSum"-T0."TotalExpns") as "5 Months Ago", 0 as "4 Months Ago", 0 as "3 Months Ago", 0 as "2 Months Ago", 0 as "Last Month"

FROM OINV T0 INNER JOIN OSLP T1 ON T0."SlpCode" = T1."SlpCode"

WHERE T1."SlpName" = 'Sales Associate' and T0."DocDate" between ADD_DAYS(LAST_DAY(ADD_MONTHS(CURRENT_DATE,-6)),1) and Last_Day(ADD_MONTHS(CURRENT_DATE,-5))

GROUP BY T1."SlpName", T0."CardCode", T0."CardName"

Union All

SELECT T1."SlpName", T0."CardCode", T0."CardName", 0 as "12 Months Ago", 0 as "11 Months Ago", 0 as "10 Months Ago", 0 as "9 Months Ago", 0 as "8 Months Ago", 0 as "7 Months Ago", 0 as "6 Months Ago", 0 as "5 Months Ago", Sum(T0."DocTotal"-T0."VatSum"-T0."TotalExpns") as "4 Months Ago", 0 as "3 Months Ago", 0 as "2 Months Ago", 0 as "Last Month"

FROM OINV T0 INNER JOIN OSLP T1 ON T0."SlpCode" = T1."SlpCode"

WHERE T1."SlpName" = 'Sales Associate' and T0."DocDate" between ADD_DAYS(LAST_DAY(ADD_MONTHS(CURRENT_DATE,-5)),1) and Last_Day(ADD_MONTHS(CURRENT_DATE,-4))

GROUP BY T1."SlpName", T0."CardCode", T0."CardName"

Union All

SELECT T1."SlpName", T0."CardCode", T0."CardName", 0 as "12 Months Ago", 0 as "11 Months Ago", 0 as "10 Months Ago", 0 as "9 Months Ago", 0 as "8 Months Ago", 0 as "7 Months Ago", 0 as "6 Months Ago", 0 as "5 Months Ago", 0 as "4 Months Ago", Sum(T0."DocTotal"-T0."VatSum"-T0."TotalExpns") as "3 Months Ago", 0 as "2 Months Ago", 0 as "Last Month"

FROM OINV T0 INNER JOIN OSLP T1 ON T0."SlpCode" = T1."SlpCode"

WHERE T1."SlpName" = 'Sales Associate' and T0."DocDate" between ADD_DAYS(LAST_DAY(ADD_MONTHS(CURRENT_DATE,-4)),1) and Last_Day(ADD_MONTHS(CURRENT_DATE,-3))

GROUP BY T1."SlpName", T0."CardCode", T0."CardName"

Union All

SELECT T1."SlpName", T0."CardCode", T0."CardName", 0 as "12 Months Ago", 0 as "11 Months Ago", 0 as "10 Months Ago", 0 as "9 Months Ago", 0 as "8 Months Ago", 0 as "7 Months Ago", 0 as "6 Months Ago", 0 as "5 Months Ago", 0 as "4 Months Ago", 0 as "3 Months Ago", Sum(T0."DocTotal"-T0."VatSum"-T0."TotalExpns") as "2 Months Ago", 0 as "Last Month"

FROM OINV T0 INNER JOIN OSLP T1 ON T0."SlpCode" = T1."SlpCode"

WHERE T1."SlpName" = 'Sales Associate' and T0."DocDate" between ADD_DAYS(LAST_DAY(ADD_MONTHS(CURRENT_DATE,-3)),1) and Last_Day(ADD_MONTHS(CURRENT_DATE,-2))

GROUP BY T1."SlpName", T0."CardCode", T0."CardName"

Union All

SELECT T1."SlpName", T0."CardCode", T0."CardName", 0 as "12 Months Ago", 0 as "11 Months Ago", 0 as "10 Months Ago", 0 as "9 Months Ago", 0 as "8 Months Ago", 0 as "7 Months Ago", 0 as "6 Months Ago", 0 as "5 Months Ago", 0 as "4 Months Ago", 0 as "3 Months Ago", 0 as "2 Months Ago", Sum(T0."DocTotal"-T0."VatSum"-T0."TotalExpns") as "Last Month"

FROM OINV T0 INNER JOIN OSLP T1 ON T0."SlpCode" = T1."SlpCode"

WHERE T1."SlpName" = 'Sales Associate' and T0."DocDate" between ADD_DAYS(LAST_DAY(ADD_MONTHS(CURRENT_DATE,-2)),1) and Last_Day(ADD_MONTHS(CURRENT_DATE,-1))

GROUP BY T1."SlpName", T0."CardCode", T0."CardName"

)

T50

GROUP BY T50."SlpName", T50."CardCode", T50."CardName"

ORDER BY T50."CardCode"
```

GBS Subtopic: MIS_Manage Information Service, RTR_Record to Report

Source: CAMBR

Used By: CAMBR
