# DIST_MRO_Group

### Description

Defines product grouping based on BI coding for items

```sql

/*ALTER VIEW "DIST_MRO_Group" AS*/
/*CREATE VIEW "DIST_MRO_Group" AS*/

SELECT
  T0."ItemCode",
  T0."U_SWK_RangeCd" AS "Range Code",
  T1."BI Desc" AS "Product Range",
  T0."U_SWK_GroupCd" AS "Group Code",
  T2."BI Desc" AS "Product Group",
  T0."U_SWK_SeriesCd" AS "Series Code",
  T3."BI Desc" AS "Product Series",
  T0."U_SWK_SizeCd" AS "Size Code",
  T7."BI Desc" AS "Product Size",
  CASE
    WHEN T1."BI Desc" = 'Fittings' AND
      T7."BI Desc" IN ('3/4"',
      '1/16"', '1/8"', '3/16"', '1/4"', '5/16"', '3/8"', '7/16"',
      '1/2"', '9/16"', '5/8"', '1mm', '2mm', '3mm', '4mm', '6mm',
      '8mm', '10mm', '12mm', '14mm', '15mm', '16mm', '18mm') THEN '3/4 and Under'
    WHEN T2."BI Desc" IN ('Ball Valves', 'Needle Valves', 'Manifolds') AND
      T3."BI Desc" NOT IN ('VB04, VB05, MN01 & MN02 Process Interface Valves') THEN 'Instrument Valves'
    WHEN T2."BI Desc" IN ('Pressure Gauges', 'Hoses & Flexible Hoses', 'Flexible Hose', 'Flowmeters', 'Thermometers',
      'Quick-Connect', 'Pressure Regulators') THEN 'Measurement & Analytical'
    WHEN (T1."BI Desc" = 'Fittings' AND
      T7."BI Desc" IN ('7/8"', '1"',
      '1-1/8"', '1-1/4"', '1-1/2"', '2"', '3"', '4"', '20mm', '22mm', '23mm',
      '25mm', '28mm', '30mm', '32mm', '38mm', '50mm')) OR
      T3."BI Desc" IN ('Flange Adaptors',
      'VB04, VB05, MN01 & MN02 Process Interface Valves') OR
      T0."U_SWK_SalesDiscCode" = '4F' THEN 'Piping and Process'
    ELSE 'Not Assigned'
  END AS "MRO_Group"

FROM OITM T0
LEFT OUTER JOIN "DIST_BI_Desc" T1
  ON T0."U_SWK_RangeCd" = T1."BI Code"
  AND T1."BI Level" = 1
LEFT OUTER JOIN "DIST_BI_Desc" T2
  ON T0."U_SWK_GroupCd" = T2."BI Code"
  AND T2."BI Level" = 2
LEFT OUTER JOIN "DIST_BI_Desc" T3
  ON T0."U_SWK_SeriesCd" = T3."BI Code"
  AND T3."BI Level" = 3
LEFT OUTER JOIN "DIST_BI_Desc" T7
  ON T0."U_SWK_SizeCd" = T7."BI Code"
  AND T7."BI Level" = 7
```
