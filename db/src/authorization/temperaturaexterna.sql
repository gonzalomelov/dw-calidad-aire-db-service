-- define the who can access temperaturaexterna model data
-- enable RLS on the table holding the data
alter table data.temperaturaexterna enable row level security;
-- define the RLS policy controlling what rows are visible to a particular application user
create policy temperaturaexterna_access_policy on data.temperaturaexterna to api 
using (
  -- the authenticated users can see all his temperaturaexterna items
  -- notice how the rule changes based on the current user_id
  -- which is specific to each individual request
  (request.user_role() = 'webuser' and request.user_id() = owner_id)

  or
  -- everyone can see public temperaturaexterna
  (private = false)
)
with check (
  -- authenticated users can only update/delete their temperaturaexterna
  (request.user_role() = 'webuser' and request.user_id() = owner_id)
);


-- give access to the view owner to this table
grant select, insert, update, delete on data.temperaturaexterna to api;
grant usage on data.temperaturaexterna_id_seq to webuser;


-- While grants to the view owner and the RLS policy on the underlying table 
-- takes care of what rows the view can see, we still need to define what 
-- are the rights of our application user in regard to this api view.

-- authenticated users can request/change all the columns for this view
grant select, insert, update, delete on api.temperaturaexterna to webuser;

-- anonymous users can only request specific columns from this view
grant select on api.temperaturaexterna to anonymous;
-------------------------------------------------------------------------------

-- ALTER TABLE data.temperaturaexterna_id_seq
--   OWNER TO superuser;
-- GRANT ALL ON SEQUENCE data.temperaturaexterna_id_seq TO superuser;
-- GRANT USAGE ON SEQUENCE data.temperaturaexterna_id_seq TO webuser;

-- ALTER TABLE data.temperaturaexterna
--   OWNER TO superuser;
-- GRANT ALL ON TABLE data.temperaturaexterna TO superuser;
-- GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE data.temperaturaexterna TO api;

-- ALTER VIEW api.temperaturaexterna
--   OWNER TO api;
-- GRANT ALL ON TABLE api.temperaturaexterna TO api;
-- GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE api.temperaturaexterna TO webuser;