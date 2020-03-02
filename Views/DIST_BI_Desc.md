# DIST_BI_Desc

### Description

View used to assign description to BI catagory tier

```sql
/*ALTER VIEW "XXX_PB1"."DIST_BI_Desc"  AS*/
/*CREATE VIEW "XXX_PB1"."DIST_BI_Desc"  AS*/

SELECT
  T1."U_SWK_CatDescription" AS "BI Desc",
  T1."U_SWK_Code" AS "BI Code",
  T1."U_SWK_ParentCode" AS "Parent Code",
  T1."U_SWK_CatTier" AS "BI Level",
  CASE
    WHEN T1."U_SWK_CatTier" = 1 THEN 'Range'
    WHEN T1."U_SWK_CatTier" = 2 THEN 'Group'
    WHEN T1."U_SWK_CatTier" = 3 THEN 'Series'
    WHEN T1."U_SWK_CatTier" = 4 THEN 'Connection'
    WHEN T1."U_SWK_CatTier" = 5 THEN 'Number of Ports'
    WHEN T1."U_SWK_CatTier" = 6 THEN 'Measurement Unit'
    WHEN T1."U_SWK_CatTier" = 7 THEN 'Size'
    WHEN T1."U_SWK_CatTier" = 8 THEN 'Material'
    WHEN T1."U_SWK_CatTier" = 9 THEN 'Automated'
  END AS "BI Level Name"
FROM "@SWK_BICATEGORY" T1
```
