SELECT 
    sd.skills,
    count(jpf.*) AS demand_count
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
   on jpf.job_id = sjd.job_id
inner join skills_dim AS sd
   on sjd.skill_id = sd.skill_id 
WHERE 
    jpf.job_title_short = 'Data Engineer'
    AND jpf.job_work_from_home = True 
 group by
         sd.skills
  ORDER BY demand_count DESC
LIMIT 10 ;


/*───────────┬──────────────┐
│   skills   │ demand_count │
│  varchar   │    int64     │
├────────────┼──────────────┤
│ sql        │        29221 │
│ python     │        28776 │
│ aws        │        17823 │
│ azure      │        14143 │
│ spark      │        12799 │
│ airflow    │         9996 │
│ snowflake  │         8639 │
│ databricks │         8183 │
│ java       │         7267 │
│ gcp        │         6446 │
└────────────┴──────────────┘
  10 rows         2 columns*/