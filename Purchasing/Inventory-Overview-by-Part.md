SELECT T0."ItemCode", T0."WhsCode", T0."OnHand", T0."IsCommited" AS "On SO", T0."OnOrder" AS "On PO"
FROM OITW T0
WHERE T0."ItemCode" = [%]
ORDER BY T0."WhsCode"

