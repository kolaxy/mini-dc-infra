### Postgres issue
```
CREATE USER conf WITH ENCRYPTED PASSWORD 'supersecure123'; 
-- since postgres 15 (before db creation) 
GRANT ALL ON SCHEMA public TO conf; 
-- now create objects 
CREATE DATABASE conf WITH ENCODING 'UNICODE' LC_COLLATE 'C' LC_CTYPE 'C' TEMPLATE template0; 
GRANT ALL PRIVILEGES ON DATABASE conf TO conf; 
-- also needed for postgres 15 
ALTER DATABASE conf OWNER TO conf;
```
