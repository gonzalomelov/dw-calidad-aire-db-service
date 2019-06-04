-- define the who can access camaras model data
-- enable RLS on the table holding the data
alter table data.camaras enable row level security;
-- define the RLS policy controlling what rows are visible to a particular application user
create policy camaras_access_policy on data.camaras to api 
using (
  -- the authenticated users can see all his camaras items
  -- notice how the rule changes based on the current user_id
  -- which is specific to each individual request
  (request.user_role() = 'webuser' and request.user_id() = owner_id)

  or
  -- everyone can see public camaras
  (private = false)
)
with check (
  -- authenticated users can only update/delete their camaras
  (request.user_role() = 'webuser' and request.user_id() = owner_id)
);


-- give access to the view owner to this table
grant select, insert, update, delete on data.camaras to api;
grant usage on data.camaras_id_seq to webuser;


-- While grants to the view owner and the RLS policy on the underlying table 
-- takes care of what rows the view can see, we still need to define what 
-- are the rights of our application user in regard to this api view.

-- authenticated users can request/change all the columns for this view
grant select, insert, update, delete on api.camaras to webuser;

-- anonymous users can only request specific columns from this view
grant select on api.camaras to anonymous;
-------------------------------------------------------------------------------

-- ALTER TABLE data.camaras_id_seq
--   OWNER TO superuser;
-- GRANT ALL ON SEQUENCE data.camaras_id_seq TO superuser;
-- GRANT USAGE ON SEQUENCE data.camaras_id_seq TO webuser;

-- ALTER TABLE data.camaras
--   OWNER TO superuser;
-- GRANT ALL ON TABLE data.camaras TO superuser;
-- GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE data.camaras TO api;

-- ALTER VIEW api.camaras
--   OWNER TO api;
-- GRANT ALL ON VIEW api.camaras TO api;
-- GRANT SELECT, UPDATE, INSERT, DELETE ON VIEW api.camaras TO webuser;