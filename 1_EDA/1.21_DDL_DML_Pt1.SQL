--## DML AND DDL Commands##
-------------------------
/*Data Manipulation Language (DML) commands are used to manipulate data in a database. They include:
- SELECT: Retrieve data from a database.
- INSERT: Add new data to a database.
- UPDATE: Modify existing data in a database.
- DELETE: Remove data from a database.

Data Definition Language (DDL) commands are used to define and manage database structures. They include:
- CREATE: Create a new database or database object (e.g., table, view).
- ALTER: Modify an existing database object (e.g., add a column to a table).
- DROP: Delete a database or database object.
- TRUNCATE: Remove all data from a table while keeping the structure intact.
*/

-- .read 1.21_DDL_DML_Pt1.SQL

USE data_jobs;

DROP DATABASE IF EXISTS jobs_mart;


CREATE DATABASE IF NOT EXISTS jobs_mart;

SELECT * 
FROM information_schema.schemata
WHERE schema_name = 'jobs_mart';

CREATE SCHEMA jobs_mart.staging;

USE jobs_mart;

CREATE SCHEMA IF NOT EXISTS jobs_mart.staging;


CREATE TABLE IF NOT EXISTS jobs_mart.staging.preferred_roles(
    role_id INTEGER PRIMARY KEY ,
    role_name VARCHAR 
);

SELECT * 
FROM information_schema.tables
WHERE table_schema = 'jobs_mart' AND table_name = 'preferred_roles';



INSERT INTO staging.preferred_roles (role_id, role_name)
VALUES (1, 'Data Engineer'),
            (2, 'Senior Data Engineer'),
            (3, 'Software Engineer');


--SELECT * FROM  staging.preferred_roles ;

          

ALTER TABLE staging.preferred_roles
ADD COLUMN preferred_role BOOLEAN;

UPDATE staging.preferred_roles
SET preferred_role = TRUE
WHERE role_id = 1 OR role_id = 2;

--SELECT * FROM staging.preferred_roles;

UPDATE staging.preferred_roles
SET preferred_role = FALSE
WHERE role_id = 3 ;

ALTER TABLE staging.preferred_roles
RENAME TO priority_roles;


ALTER TABLE staging.priority_roles
RENAME COLUMN preferred_role TO priority_lvl;



ALTER TABLE staging.priority_roles
ALTER COLUMN priority_lvl TYPE INTEGER;




UPDATE staging.priority_roles
set priority_lvl = 3
WHERE role_id = 3;  

SELECT * FROM staging.priority_roles;
/*
.read 1.21_DDL_DML_Pt1.SQL

┌──────────────┬─────────────┬───┬────────────────────────────┬──────────┐
│ catalog_name │ schema_name │ … │ default_character_set_name │ sql_path │
│   varchar    │   varchar   │ … │          varchar           │ varchar  │
└──────────────┴─────────────┴───┴────────────────────────────┴──────────┘
                                  0 rows                                
┌───────────────┬──────────────┬───┬──────────┬───────────────┬───────────────┐
│ table_catalog │ table_schema │ … │ is_typed │ commit_action │ TABLE_COMMENT │
│    varchar    │   varchar    │ … │ varchar  │    varchar    │    varchar    │
└───────────────┴──────────────┴───┴──────────┴───────────────┴───────────────┘
                                    0 rows                                   
┌─────────┬──────────────────────┬──────────────┐
│ role_id │      role_name       │ priority_lvl │
│  int32  │       varchar        │    int32     │
├─────────┼──────────────────────┼──────────────┤
│       1 │ Data Engineer        │            1 │
│       2 │ Senior Data Engineer │            1 │
│       3 │ Software Engineer    │            3 │
└─────────┴──────────────────────┴──────────────┘*/

