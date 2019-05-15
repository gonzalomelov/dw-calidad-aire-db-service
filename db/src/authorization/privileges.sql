\echo # Loading roles privilege

-- this file contains the privileges of all aplications roles to each database entity
-- if it gets too long, you can split it one file per entity

-- set default privileges to all the entities created by the auth lib
select auth.set_auth_endpoints_privileges('api', :'anonymous', enum_range(null::data.user_role)::text[]);

-- specify which application roles can access this api (you'll probably list them all)
-- remember to list all the values of user_role type here
grant usage on schema api to anonymous, webuser;

-- define the who can access todo model data
-- enable RLS on the table holding the data
alter table data.todo enable row level security;
-- define the RLS policy controlling what rows are visible to a particular application user
create policy todo_access_policy on data.todo to api 
using (
	-- the authenticated users can see all his todo items
	-- notice how the rule changes based on the current user_id
	-- which is specific to each individual request
	(request.user_role() = 'webuser' and request.user_id() = owner_id)

	or
	-- everyone can see public todo
	(private = false)
)
with check (
	-- authenticated users can only update/delete their todos
	(request.user_role() = 'webuser' and request.user_id() = owner_id)
);


-- give access to the view owner to this table
grant select, insert, update, delete on data.todo to api;
grant usage on data.todo_id_seq to webuser;


-- While grants to the view owner and the RLS policy on the underlying table 
-- takes care of what rows the view can see, we still need to define what 
-- are the rights of our application user in regard to this api view.

-- authenticated users can request/change all the columns for this view
grant select, insert, update, delete on api.todos to webuser;

-- anonymous users can only request specific columns from this view
grant select on api.todos to anonymous;
-------------------------------------------------------------------------------

-- define the who can access diasimportantes model data
-- enable RLS on the table holding the data
alter table data.diasimportantes enable row level security;
-- define the RLS policy controlling what rows are visible to a particular application user
create policy diasimportantes_access_policy on data.diasimportantes to api 
using (
  -- the authenticated users can see all his diasimportantes items
  -- notice how the rule changes based on the current user_id
  -- which is specific to each individual request
  (request.user_role() = 'webuser' and request.user_id() = owner_id)

  or
  -- everyone can see public diasimportantes
  (private = false)
)
with check (
  -- authenticated users can only update/delete their diasimportantes
  (request.user_role() = 'webuser' and request.user_id() = owner_id)
);


-- give access to the view owner to this table
grant select, insert, update, delete on data.diasimportantes to api;
grant usage on data.diasimportantes_id_seq to webuser;


-- While grants to the view owner and the RLS policy on the underlying table 
-- takes care of what rows the view can see, we still need to define what 
-- are the rights of our application user in regard to this api view.

-- authenticated users can request/change all the columns for this view
grant select, insert, update, delete on api.diasimportantes to webuser;

-- anonymous users can only request specific columns from this view
grant select on api.diasimportantes to anonymous;
-------------------------------------------------------------------------------

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

-- define the who can access contaminantes model data
-- enable RLS on the table holding the data
alter table data.contaminantes enable row level security;
-- define the RLS policy controlling what rows are visible to a particular application user
create policy contaminantes_access_policy on data.contaminantes to api 
using (
  -- the authenticated users can see all his contaminantes items
  -- notice how the rule changes based on the current user_id
  -- which is specific to each individual request
  (request.user_role() = 'webuser' and request.user_id() = owner_id)

  or
  -- everyone can see public contaminantes
  (private = false)
)
with check (
  -- authenticated users can only update/delete their contaminantes
  (request.user_role() = 'webuser' and request.user_id() = owner_id)
);


-- give access to the view owner to this table
grant select, insert, update, delete on data.contaminantes to api;
grant usage on data.contaminantes_id_seq to webuser;


-- While grants to the view owner and the RLS policy on the underlying table 
-- takes care of what rows the view can see, we still need to define what 
-- are the rights of our application user in regard to this api view.

-- authenticated users can request/change all the columns for this view
grant select, insert, update, delete on api.contaminantes to webuser;

-- anonymous users can only request specific columns from this view
grant select on api.contaminantes to anonymous;
-------------------------------------------------------------------------------

-- define the who can access industrias model data
-- enable RLS on the table holding the data
alter table data.industrias enable row level security;
-- define the RLS policy controlling what rows are visible to a particular application user
create policy industrias_access_policy on data.industrias to api 
using (
  -- the authenticated users can see all his industrias items
  -- notice how the rule changes based on the current user_id
  -- which is specific to each individual request
  (request.user_role() = 'webuser' and request.user_id() = owner_id)

  or
  -- everyone can see public industrias
  (private = false)
)
with check (
  -- authenticated users can only update/delete their industrias
  (request.user_role() = 'webuser' and request.user_id() = owner_id)
);


-- give access to the view owner to this table
grant select, insert, update, delete on data.industrias to api;
grant usage on data.industrias_id_seq to webuser;


-- While grants to the view owner and the RLS policy on the underlying table 
-- takes care of what rows the view can see, we still need to define what 
-- are the rights of our application user in regard to this api view.

-- authenticated users can request/change all the columns for this view
grant select, insert, update, delete on api.industrias to webuser;

-- anonymous users can only request specific columns from this view
grant select on api.industrias to anonymous;
-------------------------------------------------------------------------------

-- define the who can access metodos model data
-- enable RLS on the table holding the data
alter table data.metodos enable row level security;
-- define the RLS policy controlling what rows are visible to a particular application user
create policy metodos_access_policy on data.metodos to api 
using (
  -- the authenticated users can see all his metodos items
  -- notice how the rule changes based on the current user_id
  -- which is specific to each individual request
  (request.user_role() = 'webuser' and request.user_id() = owner_id)

  or
  -- everyone can see public metodos
  (private = false)
)
with check (
  -- authenticated users can only update/delete their metodos
  (request.user_role() = 'webuser' and request.user_id() = owner_id)
);


-- give access to the view owner to this table
grant select, insert, update, delete on data.metodos to api;
grant usage on data.metodos_id_seq to webuser;


-- While grants to the view owner and the RLS policy on the underlying table 
-- takes care of what rows the view can see, we still need to define what 
-- are the rights of our application user in regard to this api view.

-- authenticated users can request/change all the columns for this view
grant select, insert, update, delete on api.metodos to webuser;

-- anonymous users can only request specific columns from this view
grant select on api.metodos to anonymous;
-------------------------------------------------------------------------------

-- define the who can access estacionesdelared model data
-- enable RLS on the table holding the data
alter table data.estacionesdelared enable row level security;
-- define the RLS policy controlling what rows are visible to a particular application user
create policy estacionesdelared_access_policy on data.estacionesdelared to api 
using (
  -- the authenticated users can see all his estacionesdelared items
  -- notice how the rule changes based on the current user_id
  -- which is specific to each individual request
  (request.user_role() = 'webuser' and request.user_id() = owner_id)

  or
  -- everyone can see public estacionesdelared
  (private = false)
)
with check (
  -- authenticated users can only update/delete their estacionesdelared
  (request.user_role() = 'webuser' and request.user_id() = owner_id)
);


-- give access to the view owner to this table
grant select, insert, update, delete on data.estacionesdelared to api;
grant usage on data.estacionesdelared_id_seq to webuser;


-- While grants to the view owner and the RLS policy on the underlying table 
-- takes care of what rows the view can see, we still need to define what 
-- are the rights of our application user in regard to this api view.

-- authenticated users can request/change all the columns for this view
grant select, insert, update, delete on api.estacionesdelared to webuser;

-- anonymous users can only request specific columns from this view
grant select on api.estacionesdelared to anonymous;
-------------------------------------------------------------------------------

-- define the who can access diassemana model data
-- enable RLS on the table holding the data
alter table data.diassemana enable row level security;
-- define the RLS policy controlling what rows are visible to a particular application user
create policy diassemana_access_policy on data.diassemana to api 
using (
  -- the authenticated users can see all his diassemana items
  -- notice how the rule changes based on the current user_id
  -- which is specific to each individual request
  (request.user_role() = 'webuser' and request.user_id() = owner_id)

  or
  -- everyone can see public diassemana
  (private = false)
)
with check (
  -- authenticated users can only update/delete their diassemana
  (request.user_role() = 'webuser' and request.user_id() = owner_id)
);


-- give access to the view owner to this table
grant select, insert, update, delete on data.diassemana to api;
grant usage on data.diassemana_id_seq to webuser;


-- While grants to the view owner and the RLS policy on the underlying table 
-- takes care of what rows the view can see, we still need to define what 
-- are the rights of our application user in regard to this api view.

-- authenticated users can request/change all the columns for this view
grant select, insert, update, delete on api.diassemana to webuser;

-- anonymous users can only request specific columns from this view
grant select on api.diassemana to anonymous;
-------------------------------------------------------------------------------

-- define the who can access estacionesdelanio model data
-- enable RLS on the table holding the data
alter table data.estacionesdelanio enable row level security;
-- define the RLS policy controlling what rows are visible to a particular application user
create policy estacionesdelanio_access_policy on data.estacionesdelanio to api 
using (
  -- the authenticated users can see all his estacionesdelanio items
  -- notice how the rule changes based on the current user_id
  -- which is specific to each individual request
  (request.user_role() = 'webuser' and request.user_id() = owner_id)

  or
  -- everyone can see public estacionesdelanio
  (private = false)
)
with check (
  -- authenticated users can only update/delete their estacionesdelanio
  (request.user_role() = 'webuser' and request.user_id() = owner_id)
);


-- give access to the view owner to this table
grant select, insert, update, delete on data.estacionesdelanio to api;
grant usage on data.estacionesdelanio_id_seq to webuser;


-- While grants to the view owner and the RLS policy on the underlying table 
-- takes care of what rows the view can see, we still need to define what 
-- are the rights of our application user in regard to this api view.

-- authenticated users can request/change all the columns for this view
grant select, insert, update, delete on api.estacionesdelanio to webuser;

-- anonymous users can only request specific columns from this view
grant select on api.estacionesdelanio to anonymous;
-------------------------------------------------------------------------------

-- define the who can access horas model data
-- enable RLS on the table holding the data
alter table data.horas enable row level security;
-- define the RLS policy controlling what rows are visible to a particular application user
create policy horas_access_policy on data.horas to api 
using (
  -- the authenticated users can see all his horas items
  -- notice how the rule changes based on the current user_id
  -- which is specific to each individual request
  (request.user_role() = 'webuser' and request.user_id() = owner_id)

  or
  -- everyone can see public horas
  (private = false)
)
with check (
  -- authenticated users can only update/delete their horas
  (request.user_role() = 'webuser' and request.user_id() = owner_id)
);


-- give access to the view owner to this table
grant select, insert, update, delete on data.horas to api;
grant usage on data.horas_id_seq to webuser;


-- While grants to the view owner and the RLS policy on the underlying table 
-- takes care of what rows the view can see, we still need to define what 
-- are the rights of our application user in regard to this api view.

-- authenticated users can request/change all the columns for this view
grant select, insert, update, delete on api.horas to webuser;

-- anonymous users can only request specific columns from this view
grant select on api.horas to anonymous;
-------------------------------------------------------------------------------

-- define the who can access fechas model data
-- enable RLS on the table holding the data
alter table data.fechas enable row level security;
-- define the RLS policy controlling what rows are visible to a particular application user
create policy fechas_access_policy on data.fechas to api 
using (
  -- the authenticated users can see all his fechas items
  -- notice how the rule changes based on the current user_id
  -- which is specific to each individual request
  (request.user_role() = 'webuser' and request.user_id() = owner_id)

  or
  -- everyone can see public fechas
  (private = false)
)
with check (
  -- authenticated users can only update/delete their fechas
  (request.user_role() = 'webuser' and request.user_id() = owner_id)
);


-- give access to the view owner to this table
grant select, insert, update, delete on data.fechas to api;
grant usage on data.fechas_id_seq to webuser;


-- While grants to the view owner and the RLS policy on the underlying table 
-- takes care of what rows the view can see, we still need to define what 
-- are the rights of our application user in regard to this api view.

-- authenticated users can request/change all the columns for this view
grant select, insert, update, delete on api.fechas to webuser;

-- anonymous users can only request specific columns from this view
grant select on api.fechas to anonymous;
-------------------------------------------------------------------------------

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

-- define the who can access conteovehicular model data
-- enable RLS on the table holding the data
alter table data.conteovehicular enable row level security;
-- define the RLS policy controlling what rows are visible to a particular application user
create policy conteovehicular_access_policy on data.conteovehicular to api 
using (
  -- the authenticated users can see all his conteovehicular items
  -- notice how the rule changes based on the current user_id
  -- which is specific to each individual request
  (request.user_role() = 'webuser' and request.user_id() = owner_id)

  or
  -- everyone can see public conteovehicular
  (private = false)
)
with check (
  -- authenticated users can only update/delete their conteovehicular
  (request.user_role() = 'webuser' and request.user_id() = owner_id)
);


-- give access to the view owner to this table
grant select, insert, update, delete on data.conteovehicular to api;
grant usage on data.conteovehicular_id_seq to webuser;


-- While grants to the view owner and the RLS policy on the underlying table 
-- takes care of what rows the view can see, we still need to define what 
-- are the rights of our application user in regard to this api view.

-- authenticated users can request/change all the columns for this view
grant select, insert, update, delete on api.conteovehicular to webuser;

-- anonymous users can only request specific columns from this view
grant select on api.conteovehicular to anonymous;
-------------------------------------------------------------------------------

-- define the who can access datosmeteorologicos model data
-- enable RLS on the table holding the data
alter table data.datosmeteorologicos enable row level security;
-- define the RLS policy controlling what rows are visible to a particular application user
create policy datosmeteorologicos_access_policy on data.datosmeteorologicos to api 
using (
  -- the authenticated users can see all his datosmeteorologicos items
  -- notice how the rule changes based on the current user_id
  -- which is specific to each individual request
  (request.user_role() = 'webuser' and request.user_id() = owner_id)

  or
  -- everyone can see public datosmeteorologicos
  (private = false)
)
with check (
  -- authenticated users can only update/delete their datosmeteorologicos
  (request.user_role() = 'webuser' and request.user_id() = owner_id)
);


-- give access to the view owner to this table
grant select, insert, update, delete on data.datosmeteorologicos to api;
grant usage on data.datosmeteorologicos_id_seq to webuser;


-- While grants to the view owner and the RLS policy on the underlying table 
-- takes care of what rows the view can see, we still need to define what 
-- are the rights of our application user in regard to this api view.

-- authenticated users can request/change all the columns for this view
grant select, insert, update, delete on api.datosmeteorologicos to webuser;

-- anonymous users can only request specific columns from this view
grant select on api.datosmeteorologicos to anonymous;
-------------------------------------------------------------------------------

-- define the who can access contaminacion model data
-- enable RLS on the table holding the data
alter table data.contaminacion enable row level security;
-- define the RLS policy controlling what rows are visible to a particular application user
create policy contaminacion_access_policy on data.contaminacion to api 
using (
  -- the authenticated users can see all his contaminacion items
  -- notice how the rule changes based on the current user_id
  -- which is specific to each individual request
  (request.user_role() = 'webuser' and request.user_id() = owner_id)

  or
  -- everyone can see public contaminacion
  (private = false)
)
with check (
  -- authenticated users can only update/delete their contaminacion
  (request.user_role() = 'webuser' and request.user_id() = owner_id)
);


-- give access to the view owner to this table
grant select, insert, update, delete on data.contaminacion to api;
grant usage on data.contaminacion_id_seq to webuser;


-- While grants to the view owner and the RLS policy on the underlying table 
-- takes care of what rows the view can see, we still need to define what 
-- are the rights of our application user in regard to this api view.

-- authenticated users can request/change all the columns for this view
grant select, insert, update, delete on api.contaminacion to webuser;

-- anonymous users can only request specific columns from this view
grant select on api.contaminacion to anonymous;
-------------------------------------------------------------------------------

-- define the who can access mediciones model data
-- enable RLS on the table holding the data
alter table data.mediciones enable row level security;
-- define the RLS policy controlling what rows are visible to a particular application user
create policy mediciones_access_policy on data.mediciones to api 
using (
  -- the authenticated users can see all his mediciones items
  -- notice how the rule changes based on the current user_id
  -- which is specific to each individual request
  (request.user_role() = 'webuser' and request.user_id() = owner_id)

  or
  -- everyone can see public mediciones
  (private = false)
)
with check (
  -- authenticated users can only update/delete their mediciones
  (request.user_role() = 'webuser' and request.user_id() = owner_id)
);


-- give access to the view owner to this table
grant select, insert, update, delete on data.mediciones to api;
grant usage on data.mediciones_id_seq to webuser;


-- While grants to the view owner and the RLS policy on the underlying table 
-- takes care of what rows the view can see, we still need to define what 
-- are the rights of our application user in regard to this api view.

-- authenticated users can request/change all the columns for this view
grant select, insert, update, delete on api.mediciones to webuser;

-- anonymous users can only request specific columns from this view
grant select on api.mediciones to anonymous;
-------------------------------------------------------------------------------
