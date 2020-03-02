SELECT T0."DocNum",
T1."DocEntry",
T1."ItemCode",
T1."Quantity",
T1."DiscPrcnt"
FROM OPOR T0
INNER JOIN POR1 T1
  ON T0."DocEntry" = T1."DocEntry"
WHERE T0."DocStatus" = 'O'
AND T0."U_SWK_AckType" = 'WL'
