# Customer Sales Analysis Query (SCSR)

### Description

I know many distributors are on the cusp of migrating to B1 and I'm  sure that this is something that some will want, particularly those who are/were DMS sites. I don't know if a query like this has already been  shared, but I figured I'd share it just in case.

### Intended Outcome

​GBS Discussion Thread

*Note something strange happened with the character encoded on this post. Copy from the attached .txt if unable to run.

```sql
SELECT
     T3."CardCode" AS "Customer",
     T1."U_SWK_CatDescription" AS "Category",
     SUM(T2."LineTotal")AS "Total"
FROM OITM T0
LEFT JOIN "EDMON_PB1"."@SWK_BICATEGORY" T1 ON CONCAT(T0."U_SWK_GroupCd",
    T0."U_SWK_SeriesCd") = CONCAT(T1."U_SWK_ParentCode",
     T1."U_SWK_Code")
LEFT JOIN INV1 T2 ON T0."ItemCode" = T2."ItemCode"
LEFT JOIN OINV T3 ON T2."DocEntry" = T3."DocEntry"
WHERE T3."CANCELED" = 'N' AND T3."CardCode" = [%0] AND T3."DocDate" BETWEEN [%2] AND [%3] GROUP BY T1."U_SWK_CatDescription",T3."CardCode" ORDER BY T1."U_SWK_CatDescription"
```

GBS Subtopic: 

Source: CAMBR

Used By: CAMBR
