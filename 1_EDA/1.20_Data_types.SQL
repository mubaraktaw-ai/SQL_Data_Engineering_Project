
 SELECT 
       job_id,
       CAST(job_work_from_home AS INT) AS job_work_from_home,
       job_posted_date,
       salary_year_avg 
FROM job_postings_fact
LIMIT 5;
/*
┌────────┬────────────────────┬─────────────────────┬─────────────────┐
│ job_id │ job_work_from_home │   job_posted_date   │ salary_year_avg │`
│ int32  │       int32        │      timestamp      │     double      │
├────────┼────────────────────┼─────────────────────┼─────────────────┤
│   4593 │                  0 │ 2023-01-01 00:00:04 │            NULL │
│   4594 │                  0 │ 2023-01-01 00:00:22 │            NULL │
│   4595 │                  0 │ 2023-01-01 00:00:24 │            NULL │
│   4596 │                  0 │ 2023-01-01 00:00:27 │            NULL │
│   4597 │                  0 │ 2023-01-01 00:00:38 │            NULL │
└────────┴────────────────────┴─────────────────────┴─────────────────┘
*/
SELECT 
                   job_id,
                   company_id,
                   CAST(job_work_from_home AS INT) AS job_work_from_home,
                   CAST(job_posted_date AS DATE) AS job_posted_date,
                   CAST(salary_year_avg AS DECIMAL(10,0)) AS salary_year_avg 
            FROM job_postings_fact
            WHERE salary_year_avg IS NOT NULL
            LIMIT 5;

     /*
┌────────┬────────────┬────────────────────┬─────────────────┬─────────────────┐    
│ job_id │ company_id │ job_work_from_home │ job_posted_date │ salary_year_avg │
│ int32  │   int32    │       int32        │      date       │  decimal(10,0)  │
├────────┼────────────┼────────────────────┼─────────────────┼─────────────────┤
│   4651 │       4651 │                  0 │ 2023-01-01      │          110000 │
│   4699 │       4699 │                  0 │ 2023-01-01      │           65000 │
│   4804 │       4804 │                  1 │ 2023-01-01      │           90000 │
│   4810 │       4810 │                  0 │ 2023-01-01      │           55000 │
│   4833 │       4833 │                  0 │ 2023-01-01      │          120531 │
└────────┴────────────┴────────────────────┴─────────────────┴─────────────────┘   
     */

   SELECT 
                   CAST(job_id AS VARCHAR) AS job_id,
                   CAST(company_id AS VARCHAR) AS company_id,
                   CAST(job_work_from_home AS INT) AS job_work_from_home,
                   CAST(job_posted_date AS DATE) AS job_posted_date,
                   CAST(salary_year_avg AS DECIMAL(10,0)) AS salary_year_avg 
            FROM job_postings_fact
            WHERE salary_year_avg IS NOT NULL
            LIMIT 5;
 /*        
┌─────────┬────────────┬────────────────────┬─────────────────┬─────────────────┐
│ job_id  │ company_id │ job_work_from_home │ job_posted_date │ salary_year_avg │
│ varchar │  varchar   │       int32        │      date       │  decimal(10,0)  │
├─────────┼────────────┼────────────────────┼─────────────────┼─────────────────┤
│ 4651    │ 4651       │                  0 │ 2023-01-01      │          110000 │
│ 4699    │ 4699       │                  0 │ 2023-01-01      │           65000 │
│ 4804    │ 4804       │                  1 │ 2023-01-01      │           90000 │
│ 4810    │ 4810       │                  0 │ 2023-01-01      │           55000 │
│ 4833    │ 4833       │                  0 │ 2023-01-01      │          120531 │
└─────────┴────────────┴────────────────────┴─────────────────┴─────────────────┘*/


   SELECT 
                   CAST(job_id AS VARCHAR) ||'-'|| CAST(company_id AS VARCHAR) AS job_company_id,
                   CAST(job_work_from_home AS INT) AS job_work_from_home,
                   CAST(job_posted_date AS DATE) AS job_posted_date,
                   CAST(salary_year_avg AS DECIMAL(10,0)) AS salary_year_avg 
            FROM job_postings_fact
            WHERE salary_year_avg IS NOT NULL
            LIMIT 5;
/*
┌────────────┬────────────────────┬─────────────────┬─────────────────┐
│ company_id │ job_work_from_home │ job_posted_date │ salary_year_avg │
│  varchar   │       int32        │      date       │  decimal(10,0)  │
├────────────┼────────────────────┼─────────────────┼─────────────────┤
│ 4651-4651  │                  0 │ 2023-01-01      │          110000 │
│ 4699-4699  │                  0 │ 2023-01-01      │           65000 │
│ 4804-4804  │                  1 │ 2023-01-01      │           90000 │
│ 4810-4810  │                  0 │ 2023-01-01      │           55000 │
│ 4833-4833  │                  0 │ 2023-01-01      │          120531 │
└────────────┴────────────────────┴─────────────────┴─────────────────┘
*/

SELECT CAST(i AS VARCHAR) AS i
FROM UNNEST(GENERATE_series(1, 5)) tbl(i) ;

SELECT i::DOUBLE AS i
FROM generate_series(1,5)tbl(i);

```--------------------------------------------------------------------------------------```

SELECT 
    CAST(job_id AS VARCHAR) || '-' || CAST(company_id AS VARCHAR) ,
    CAST(job_work_from_home AS INT) AS job_work_from_home,
    CAST(job_posted_date AS DATE) AS job_posted_date,
    CAST(salary_year_avg AS DECIMAL(10,0)) AS salary_year_avg
    FROM job_postings_fact
    WHERE salary_year_avg IS NOT NULL
    LIMIT 5;


   SELECT (3+5.5)::FLOAT; 
   /**/
   