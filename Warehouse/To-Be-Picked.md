# Orders to be picked today

```sql
SELECT
  T0."PickDate",
  T0."AbsEntry" AS "PickList",
  T4."DocNum",
  T4."CardName",
  T5."TrnspName",
  (SELECT
    "U_NAME"
  FROM OUSR T12
  WHERE T4."UserSign" = T12."USERID")
  AS "Created By",
  T4."NumAtCard",
  COUNT(T2."ItemCode") AS "Number of Lines"

FROM OPKL T0
INNER JOIN PKL1 T1
  ON T0."AbsEntry" = T1."AbsEntry"
INNER JOIN PKL2 T2
  ON T0."AbsEntry" = T2."AbsEntry"
  AND T1."PickEntry" = T2."PickEntry"
LEFT OUTER JOIN OBIN T3
  ON T2."BinAbs" = T3."AbsEntry"
LEFT OUTER JOIN ORDR T4
  ON T1."OrderEntry" = T4."DocEntry"
LEFT OUTER JOIN OSHP T5
  ON T5."TrnspCode" = T4."TrnspCode"

WHERE T0."Status" NOT IN ('C', 'Y')
AND T4."BPLId" = 2
AND T0."PickDate" = CURRENT_DATE

GROUP BY T4."DocNum",
         T0."AbsEntry",
         T0."PickDate",
         T4."CardName",
         T5."TrnspName",
         T4."NumAtCard",
         T4."UserSign"
```
