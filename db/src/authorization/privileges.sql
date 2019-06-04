\echo # Loading roles privilege

-- this file contains the privileges of all aplications roles to each database entity
-- if it gets too long, you can split it one file per entity

-- set default privileges to all the entities created by the auth lib
select auth.set_auth_endpoints_privileges('api', :'anonymous', enum_range(null::data.user_role)::text[]);

-- specify which application roles can access this api (you'll probably list them all)
-- remember to list all the values of user_role type here
grant usage on schema api to anonymous, webuser;

-------------------------------------------------------------------------------