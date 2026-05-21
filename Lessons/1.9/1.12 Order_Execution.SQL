
EXPLAIN ANALYZE
SELECT 
    cd.name AS company_name,
    count(jpf.job_id)AS posting_count

FROM  job_postings_fact AS jpf   
LEFT JOIN company_dim AS cd
   ON jpf.company_id = cd.company_id 
WHERE jpf.job_country = 'United States'
group by cd.name 

HAVING count(job_id)>3000 
ORDER BY posting_count DESC
LIMIT 10 ;


SELECT DISTINCT
     job_title_short
FROM
    job_postings_fact     
;


SELECT 
     DISTINCT job_country
FROM
    job_postings_fact  
    where job_country ='Kuwait';