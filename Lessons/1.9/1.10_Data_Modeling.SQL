SELECT 
    job_id,
    job_title_short,
    salary_year_avg,
    company_id
FROM
    job_postings_fact
LIMIT 10;         

SELECT 
    company_id,
    name
FROM
    company_dim
LIMIT 10;         

SELECT 
     * 
FROM
     company_dim
WHERE
     name IN ('Facebook','Tiktok');   

SELECT * 
FROM skills_job_dim
LIMIT 5;
                
SELECT *
FROM informati
WHERE table_catalog = 'data_jobs';

PRAGMA show_tables;

PRAGMA show_tables_expanded;
PRAGMA show_tables_expanded;
PRAGMA show_tables_expanded;
PRAGMA show_tables_expanded;
PRAGMA show_tables_expanded;
PRAGMA show_tables_expanded;
PRAGMA show_tables_expanded;

on_schema.table_constraints


