/*Open production orders where target date is past*/

SELECT
  T0."DocNum",
  T0."CardName",
  T1."ItemCode",
  T2."U_SWK_RangeCd",
  T2."QryGroup59" AS "CS Flag",
  T1."U_SWK_TargetDate",
  T1."U_SWK_ActualDeliveryDate",
  DAYS_BETWEEN(T1."U_SWK_TargetDate", T1."U_SWK_ActualDeliveryDate") "Days Past Target"
FROM ORDR T0
INNER JOIN RDR1 T1
  ON T0."DocEntry" = T1."DocEntry"
LEFT OUTER JOIN OITM T2
  ON T1."ItemCode" = T2."ItemCode"
LEFT OUTER JOIN OCRD T3
  ON T0."CardCode" = T3."CardCode"
WHERE T2."QryGroup59" = 'Y'
AND T3."QryGroup1" = 'N'
AND T1."ItemCode" LIKE 'EDMON%'
AND T1."LineStatus" = 'O'
ORDER BY DAYS_BETWEEN(T1."U_SWK_TargetDate", T1."U_SWK_ActualDeliveryDate") DESC
