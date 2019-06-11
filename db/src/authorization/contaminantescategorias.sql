-- define the who can access contaminantescategorias model data
-- enable RLS on the table holding the data
alter table data.contaminantescategorias enable row level security;
-- define the RLS policy controlling what rows are visible to a particular application user
create policy contaminantescategorias_access_policy on data.contaminantescategorias to api 
using (
  -- the authenticated users can see all his contaminantescategorias items
  -- notice how the rule changes based on the current user_id
  -- which is specific to each individual request
  (request.user_role() = 'webuser' and request.user_id() = owner_id)

  or
  -- everyone can see public contaminantescategorias
  (private = false)
)
with check (
  -- authenticated users can only update/delete their contaminantescategorias
  (request.user_role() = 'webuser' and request.user_id() = owner_id)
);


-- give access to the view owner to this table
grant select, insert, update, delete on data.contaminantescategorias to api;
grant usage on data.contaminantescategorias_id_seq to webuser;


-- While grants to the view owner and the RLS policy on the underlying table 
-- takes care of what rows the view can see, we still need to define what 
-- are the rights of our application user in regard to this api view.

-- authenticated users can request/change all the columns for this view
grant select, insert, update, delete on api.contaminantescategorias to webuser;

-- anonymous users can only request specific columns from this view
grant select on api.contaminantescategorias to anonymous;
-------------------------------------------------------------------------------

-- ALTER TABLE data.contaminantescategorias
--   OWNER TO superuser;
-- GRANT ALL ON SEQUENCE data.contaminantescategorias TO superuser;
-- GRANT USAGE ON SEQUENCE data.contaminantescategorias TO webuser;

-- ALTER TABLE data.contaminantescategorias
--   OWNER TO superuser;
-- GRANT ALL ON TABLE data.contaminantescategorias TO superuser;
-- GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE data.contaminantescategorias TO api;

-- ALTER VIEW api.contaminantescategorias
--   OWNER TO api;
-- GRANT ALL ON TABLE api.contaminantescategorias TO api;
-- GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE api.contaminantescategorias TO webuser;