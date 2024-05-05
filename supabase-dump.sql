--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Ubuntu 15.1-1.pgdg20.04+1)
-- Dumped by pg_dump version 15.6 (Homebrew)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: auth; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA auth;


ALTER SCHEMA auth OWNER TO supabase_admin;

--
-- Name: extensions; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA extensions;


ALTER SCHEMA extensions OWNER TO postgres;

--
-- Name: graphql; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql;


ALTER SCHEMA graphql OWNER TO supabase_admin;

--
-- Name: graphql_public; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql_public;


ALTER SCHEMA graphql_public OWNER TO supabase_admin;

--
-- Name: pgbouncer; Type: SCHEMA; Schema: -; Owner: pgbouncer
--

CREATE SCHEMA pgbouncer;


ALTER SCHEMA pgbouncer OWNER TO pgbouncer;

--
-- Name: pgsodium; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA pgsodium;


ALTER SCHEMA pgsodium OWNER TO supabase_admin;

--
-- Name: pgsodium; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgsodium WITH SCHEMA pgsodium;


--
-- Name: EXTENSION pgsodium; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgsodium IS 'Pgsodium is a modern cryptography library for Postgres.';


--
-- Name: realtime; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA realtime;


ALTER SCHEMA realtime OWNER TO supabase_admin;

--
-- Name: storage; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA storage;


ALTER SCHEMA storage OWNER TO supabase_admin;

--
-- Name: vault; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA vault;


ALTER SCHEMA vault OWNER TO supabase_admin;

--
-- Name: pg_graphql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_graphql WITH SCHEMA graphql;


--
-- Name: EXTENSION pg_graphql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_graphql IS 'pg_graphql: GraphQL support';


--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA extensions;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: pgjwt; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgjwt WITH SCHEMA extensions;


--
-- Name: EXTENSION pgjwt; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgjwt IS 'JSON Web Token API for Postgresql';


--
-- Name: supabase_vault; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS supabase_vault WITH SCHEMA vault;


--
-- Name: EXTENSION supabase_vault; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION supabase_vault IS 'Supabase Vault Extension';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: aal_level; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.aal_level AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);


ALTER TYPE auth.aal_level OWNER TO supabase_auth_admin;

--
-- Name: code_challenge_method; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.code_challenge_method AS ENUM (
    's256',
    'plain'
);


ALTER TYPE auth.code_challenge_method OWNER TO supabase_auth_admin;

--
-- Name: factor_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_status AS ENUM (
    'unverified',
    'verified'
);


ALTER TYPE auth.factor_status OWNER TO supabase_auth_admin;

--
-- Name: factor_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_type AS ENUM (
    'totp',
    'webauthn'
);


ALTER TYPE auth.factor_type OWNER TO supabase_auth_admin;

--
-- Name: action; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.action AS ENUM (
    'INSERT',
    'UPDATE',
    'DELETE',
    'TRUNCATE',
    'ERROR'
);


ALTER TYPE realtime.action OWNER TO supabase_admin;

--
-- Name: equality_op; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.equality_op AS ENUM (
    'eq',
    'neq',
    'lt',
    'lte',
    'gt',
    'gte',
    'in'
);


ALTER TYPE realtime.equality_op OWNER TO supabase_admin;

--
-- Name: user_defined_filter; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.user_defined_filter AS (
	column_name text,
	op realtime.equality_op,
	value text
);


ALTER TYPE realtime.user_defined_filter OWNER TO supabase_admin;

--
-- Name: wal_column; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_column AS (
	name text,
	type_name text,
	type_oid oid,
	value jsonb,
	is_pkey boolean,
	is_selectable boolean
);


ALTER TYPE realtime.wal_column OWNER TO supabase_admin;

--
-- Name: wal_rls; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_rls AS (
	wal jsonb,
	is_rls_enabled boolean,
	subscription_ids uuid[],
	errors text[]
);


ALTER TYPE realtime.wal_rls OWNER TO supabase_admin;

--
-- Name: email(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.email() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.email', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'email')
  )::text
$$;


ALTER FUNCTION auth.email() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION email(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.email() IS 'Deprecated. Use auth.jwt() -> ''email'' instead.';


--
-- Name: jwt(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.jwt() RETURNS jsonb
    LANGUAGE sql STABLE
    AS $$
  select 
    coalesce(
        nullif(current_setting('request.jwt.claim', true), ''),
        nullif(current_setting('request.jwt.claims', true), '')
    )::jsonb
$$;


ALTER FUNCTION auth.jwt() OWNER TO supabase_auth_admin;

--
-- Name: role(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.role() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.role', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'role')
  )::text
$$;


ALTER FUNCTION auth.role() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION role(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.role() IS 'Deprecated. Use auth.jwt() -> ''role'' instead.';


--
-- Name: uid(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.uid() RETURNS uuid
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.sub', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'sub')
  )::uuid
$$;


ALTER FUNCTION auth.uid() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION uid(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.uid() IS 'Deprecated. Use auth.jwt() -> ''sub'' instead.';


--
-- Name: grant_pg_cron_access(); Type: FUNCTION; Schema: extensions; Owner: postgres
--

CREATE FUNCTION extensions.grant_pg_cron_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_cron'
  )
  THEN
    grant usage on schema cron to postgres with grant option;

    alter default privileges in schema cron grant all on tables to postgres with grant option;
    alter default privileges in schema cron grant all on functions to postgres with grant option;
    alter default privileges in schema cron grant all on sequences to postgres with grant option;

    alter default privileges for user supabase_admin in schema cron grant all
        on sequences to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on tables to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on functions to postgres with grant option;

    grant all privileges on all tables in schema cron to postgres with grant option;
    revoke all on table cron.job from postgres;
    grant select on table cron.job to postgres with grant option;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_cron_access() OWNER TO postgres;

--
-- Name: FUNCTION grant_pg_cron_access(); Type: COMMENT; Schema: extensions; Owner: postgres
--

COMMENT ON FUNCTION extensions.grant_pg_cron_access() IS 'Grants access to pg_cron';


--
-- Name: grant_pg_graphql_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_graphql_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
DECLARE
    func_is_graphql_resolve bool;
BEGIN
    func_is_graphql_resolve = (
        SELECT n.proname = 'resolve'
        FROM pg_event_trigger_ddl_commands() AS ev
        LEFT JOIN pg_catalog.pg_proc AS n
        ON ev.objid = n.oid
    );

    IF func_is_graphql_resolve
    THEN
        -- Update public wrapper to pass all arguments through to the pg_graphql resolve func
        DROP FUNCTION IF EXISTS graphql_public.graphql;
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language sql
        as $$
            select graphql.resolve(
                query := query,
                variables := coalesce(variables, '{}'),
                "operationName" := "operationName",
                extensions := extensions
            );
        $$;

        -- This hook executes when `graphql.resolve` is created. That is not necessarily the last
        -- function in the extension so we need to grant permissions on existing entities AND
        -- update default permissions to any others that are created after `graphql.resolve`
        grant usage on schema graphql to postgres, anon, authenticated, service_role;
        grant select on all tables in schema graphql to postgres, anon, authenticated, service_role;
        grant execute on all functions in schema graphql to postgres, anon, authenticated, service_role;
        grant all on all sequences in schema graphql to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on tables to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on functions to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on sequences to postgres, anon, authenticated, service_role;

        -- Allow postgres role to allow granting usage on graphql and graphql_public schemas to custom roles
        grant usage on schema graphql_public to postgres with grant option;
        grant usage on schema graphql to postgres with grant option;
    END IF;

END;
$_$;


ALTER FUNCTION extensions.grant_pg_graphql_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_graphql_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_graphql_access() IS 'Grants access to pg_graphql';


--
-- Name: grant_pg_net_access(); Type: FUNCTION; Schema: extensions; Owner: postgres
--

CREATE FUNCTION extensions.grant_pg_net_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_net'
  )
  THEN
    IF NOT EXISTS (
      SELECT 1
      FROM pg_roles
      WHERE rolname = 'supabase_functions_admin'
    )
    THEN
      CREATE USER supabase_functions_admin NOINHERIT CREATEROLE LOGIN NOREPLICATION;
    END IF;

    GRANT USAGE ON SCHEMA net TO supabase_functions_admin, postgres, anon, authenticated, service_role;

    ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;
    ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;

    ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;
    ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;

    REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
    REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;

    GRANT EXECUTE ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
    GRANT EXECUTE ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_net_access() OWNER TO postgres;

--
-- Name: FUNCTION grant_pg_net_access(); Type: COMMENT; Schema: extensions; Owner: postgres
--

COMMENT ON FUNCTION extensions.grant_pg_net_access() IS 'Grants access to pg_net';


--
-- Name: pgrst_ddl_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_ddl_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  cmd record;
BEGIN
  FOR cmd IN SELECT * FROM pg_event_trigger_ddl_commands()
  LOOP
    IF cmd.command_tag IN (
      'CREATE SCHEMA', 'ALTER SCHEMA'
    , 'CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO', 'ALTER TABLE'
    , 'CREATE FOREIGN TABLE', 'ALTER FOREIGN TABLE'
    , 'CREATE VIEW', 'ALTER VIEW'
    , 'CREATE MATERIALIZED VIEW', 'ALTER MATERIALIZED VIEW'
    , 'CREATE FUNCTION', 'ALTER FUNCTION'
    , 'CREATE TRIGGER'
    , 'CREATE TYPE', 'ALTER TYPE'
    , 'CREATE RULE'
    , 'COMMENT'
    )
    -- don't notify in case of CREATE TEMP table or other objects created on pg_temp
    AND cmd.schema_name is distinct from 'pg_temp'
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_ddl_watch() OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_drop_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  obj record;
BEGIN
  FOR obj IN SELECT * FROM pg_event_trigger_dropped_objects()
  LOOP
    IF obj.object_type IN (
      'schema'
    , 'table'
    , 'foreign table'
    , 'view'
    , 'materialized view'
    , 'function'
    , 'trigger'
    , 'type'
    , 'rule'
    )
    AND obj.is_temporary IS false -- no pg_temp objects
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_drop_watch() OWNER TO supabase_admin;

--
-- Name: set_graphql_placeholder(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.set_graphql_placeholder() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
    DECLARE
    graphql_is_dropped bool;
    BEGIN
    graphql_is_dropped = (
        SELECT ev.schema_name = 'graphql_public'
        FROM pg_event_trigger_dropped_objects() AS ev
        WHERE ev.schema_name = 'graphql_public'
    );

    IF graphql_is_dropped
    THEN
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language plpgsql
        as $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;
    END IF;

    END;
$_$;


ALTER FUNCTION extensions.set_graphql_placeholder() OWNER TO supabase_admin;

--
-- Name: FUNCTION set_graphql_placeholder(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.set_graphql_placeholder() IS 'Reintroduces placeholder function for graphql_public.graphql';


--
-- Name: get_auth(text); Type: FUNCTION; Schema: pgbouncer; Owner: postgres
--

CREATE FUNCTION pgbouncer.get_auth(p_usename text) RETURNS TABLE(username text, password text)
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
    RAISE WARNING 'PgBouncer auth request: %', p_usename;

    RETURN QUERY
    SELECT usename::TEXT, passwd::TEXT FROM pg_catalog.pg_shadow
    WHERE usename = p_usename;
END;
$$;


ALTER FUNCTION pgbouncer.get_auth(p_usename text) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: vocab; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vocab (
    simplified text NOT NULL,
    pinyin text,
    hanviet text,
    cantonese text,
    english jsonb,
    wohok_link text
);


ALTER TABLE public.vocab OWNER TO postgres;

--
-- Name: TABLE vocab; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.vocab IS 'like a dictionary';


--
-- Name: get_vocab_by_category(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_vocab_by_category(category text) RETURNS SETOF public.vocab
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY 
    SELECT vc.*
    FROM vocab vc
    JOIN listing lt ON lt.simplified = vc.simplified
    WHERE lt.category = $1;
END;
$_$;


ALTER FUNCTION public.get_vocab_by_category(category text) OWNER TO postgres;

--
-- Name: apply_rls(jsonb, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer DEFAULT (1024 * 1024)) RETURNS SETOF realtime.wal_rls
    LANGUAGE plpgsql
    AS $$
    declare
        -- Regclass of the table e.g. public.notes
        entity_ regclass = (quote_ident(wal ->> 'schema') || '.' || quote_ident(wal ->> 'table'))::regclass;

        -- I, U, D, T: insert, update ...
        action realtime.action = (
            case wal ->> 'action'
                when 'I' then 'INSERT'
                when 'U' then 'UPDATE'
                when 'D' then 'DELETE'
                else 'ERROR'
            end
        );

        -- Is row level security enabled for the table
        is_rls_enabled bool = relrowsecurity from pg_class where oid = entity_;

        subscriptions realtime.subscription[] = array_agg(subs)
            from
                realtime.subscription subs
            where
                subs.entity = entity_;

        -- Subscription vars
        roles regrole[] = array_agg(distinct us.claims_role)
            from
                unnest(subscriptions) us;

        working_role regrole;
        claimed_role regrole;
        claims jsonb;

        subscription_id uuid;
        subscription_has_access bool;
        visible_to_subscription_ids uuid[] = '{}';

        -- structured info for wal's columns
        columns realtime.wal_column[];
        -- previous identity values for update/delete
        old_columns realtime.wal_column[];

        error_record_exceeds_max_size boolean = octet_length(wal::text) > max_record_bytes;

        -- Primary jsonb output for record
        output jsonb;

    begin
        perform set_config('role', null, true);

        columns =
            array_agg(
                (
                    x->>'name',
                    x->>'type',
                    x->>'typeoid',
                    realtime.cast(
                        (x->'value') #>> '{}',
                        coalesce(
                            (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                            (x->>'type')::regtype
                        )
                    ),
                    (pks ->> 'name') is not null,
                    true
                )::realtime.wal_column
            )
            from
                jsonb_array_elements(wal -> 'columns') x
                left join jsonb_array_elements(wal -> 'pk') pks
                    on (x ->> 'name') = (pks ->> 'name');

        old_columns =
            array_agg(
                (
                    x->>'name',
                    x->>'type',
                    x->>'typeoid',
                    realtime.cast(
                        (x->'value') #>> '{}',
                        coalesce(
                            (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                            (x->>'type')::regtype
                        )
                    ),
                    (pks ->> 'name') is not null,
                    true
                )::realtime.wal_column
            )
            from
                jsonb_array_elements(wal -> 'identity') x
                left join jsonb_array_elements(wal -> 'pk') pks
                    on (x ->> 'name') = (pks ->> 'name');

        for working_role in select * from unnest(roles) loop

            -- Update `is_selectable` for columns and old_columns
            columns =
                array_agg(
                    (
                        c.name,
                        c.type_name,
                        c.type_oid,
                        c.value,
                        c.is_pkey,
                        pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                    )::realtime.wal_column
                )
                from
                    unnest(columns) c;

            old_columns =
                    array_agg(
                        (
                            c.name,
                            c.type_name,
                            c.type_oid,
                            c.value,
                            c.is_pkey,
                            pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                        )::realtime.wal_column
                    )
                    from
                        unnest(old_columns) c;

            if action <> 'DELETE' and count(1) = 0 from unnest(columns) c where c.is_pkey then
                return next (
                    jsonb_build_object(
                        'schema', wal ->> 'schema',
                        'table', wal ->> 'table',
                        'type', action
                    ),
                    is_rls_enabled,
                    -- subscriptions is already filtered by entity
                    (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
                    array['Error 400: Bad Request, no primary key']
                )::realtime.wal_rls;

            -- The claims role does not have SELECT permission to the primary key of entity
            elsif action <> 'DELETE' and sum(c.is_selectable::int) <> count(1) from unnest(columns) c where c.is_pkey then
                return next (
                    jsonb_build_object(
                        'schema', wal ->> 'schema',
                        'table', wal ->> 'table',
                        'type', action
                    ),
                    is_rls_enabled,
                    (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
                    array['Error 401: Unauthorized']
                )::realtime.wal_rls;

            else
                output = jsonb_build_object(
                    'schema', wal ->> 'schema',
                    'table', wal ->> 'table',
                    'type', action,
                    'commit_timestamp', to_char(
                        ((wal ->> 'timestamp')::timestamptz at time zone 'utc'),
                        'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'
                    ),
                    'columns', (
                        select
                            jsonb_agg(
                                jsonb_build_object(
                                    'name', pa.attname,
                                    'type', pt.typname
                                )
                                order by pa.attnum asc
                            )
                        from
                            pg_attribute pa
                            join pg_type pt
                                on pa.atttypid = pt.oid
                        where
                            attrelid = entity_
                            and attnum > 0
                            and pg_catalog.has_column_privilege(working_role, entity_, pa.attname, 'SELECT')
                    )
                )
                -- Add "record" key for insert and update
                || case
                    when action in ('INSERT', 'UPDATE') then
                        jsonb_build_object(
                            'record',
                            (
                                select
                                    jsonb_object_agg(
                                        -- if unchanged toast, get column name and value from old record
                                        coalesce((c).name, (oc).name),
                                        case
                                            when (c).name is null then (oc).value
                                            else (c).value
                                        end
                                    )
                                from
                                    unnest(columns) c
                                    full outer join unnest(old_columns) oc
                                        on (c).name = (oc).name
                                where
                                    coalesce((c).is_selectable, (oc).is_selectable)
                                    and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                            )
                        )
                    else '{}'::jsonb
                end
                -- Add "old_record" key for update and delete
                || case
                    when action = 'UPDATE' then
                        jsonb_build_object(
                                'old_record',
                                (
                                    select jsonb_object_agg((c).name, (c).value)
                                    from unnest(old_columns) c
                                    where
                                        (c).is_selectable
                                        and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                                )
                            )
                    when action = 'DELETE' then
                        jsonb_build_object(
                            'old_record',
                            (
                                select jsonb_object_agg((c).name, (c).value)
                                from unnest(old_columns) c
                                where
                                    (c).is_selectable
                                    and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                                    and ( not is_rls_enabled or (c).is_pkey ) -- if RLS enabled, we can't secure deletes so filter to pkey
                            )
                        )
                    else '{}'::jsonb
                end;

                -- Create the prepared statement
                if is_rls_enabled and action <> 'DELETE' then
                    if (select 1 from pg_prepared_statements where name = 'walrus_rls_stmt' limit 1) > 0 then
                        deallocate walrus_rls_stmt;
                    end if;
                    execute realtime.build_prepared_statement_sql('walrus_rls_stmt', entity_, columns);
                end if;

                visible_to_subscription_ids = '{}';

                for subscription_id, claims in (
                        select
                            subs.subscription_id,
                            subs.claims
                        from
                            unnest(subscriptions) subs
                        where
                            subs.entity = entity_
                            and subs.claims_role = working_role
                            and (
                                realtime.is_visible_through_filters(columns, subs.filters)
                                or action = 'DELETE'
                            )
                ) loop

                    if not is_rls_enabled or action = 'DELETE' then
                        visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
                    else
                        -- Check if RLS allows the role to see the record
                        perform
                            set_config('role', working_role::text, true),
                            set_config('request.jwt.claims', claims::text, true);

                        execute 'execute walrus_rls_stmt' into subscription_has_access;

                        if subscription_has_access then
                            visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
                        end if;
                    end if;
                end loop;

                perform set_config('role', null, true);

                return next (
                    output,
                    is_rls_enabled,
                    visible_to_subscription_ids,
                    case
                        when error_record_exceeds_max_size then array['Error 413: Payload Too Large']
                        else '{}'
                    end
                )::realtime.wal_rls;

            end if;
        end loop;

        perform set_config('role', null, true);
    end;
    $$;


ALTER FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: build_prepared_statement_sql(text, regclass, realtime.wal_column[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) RETURNS text
    LANGUAGE sql
    AS $$
      /*
      Builds a sql string that, if executed, creates a prepared statement to
      tests retrive a row from *entity* by its primary key columns.
      Example
          select realtime.build_prepared_statement_sql('public.notes', '{"id"}'::text[], '{"bigint"}'::text[])
      */
          select
      'prepare ' || prepared_statement_name || ' as
          select
              exists(
                  select
                      1
                  from
                      ' || entity || '
                  where
                      ' || string_agg(quote_ident(pkc.name) || '=' || quote_nullable(pkc.value #>> '{}') , ' and ') || '
              )'
          from
              unnest(columns) pkc
          where
              pkc.is_pkey
          group by
              entity
      $$;


ALTER FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) OWNER TO supabase_admin;

--
-- Name: cast(text, regtype); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime."cast"(val text, type_ regtype) RETURNS jsonb
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    declare
      res jsonb;
    begin
      execute format('select to_jsonb(%L::'|| type_::text || ')', val)  into res;
      return res;
    end
    $$;


ALTER FUNCTION realtime."cast"(val text, type_ regtype) OWNER TO supabase_admin;

--
-- Name: channel_name(); Type: FUNCTION; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE FUNCTION realtime.channel_name() RETURNS text
    LANGUAGE sql STABLE
    AS $$
select nullif(current_setting('realtime.channel_name', true), '')::text;
$$;


ALTER FUNCTION realtime.channel_name() OWNER TO supabase_realtime_admin;

--
-- Name: check_equality_op(realtime.equality_op, regtype, text, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE
    AS $$
      /*
      Casts *val_1* and *val_2* as type *type_* and check the *op* condition for truthiness
      */
      declare
          op_symbol text = (
              case
                  when op = 'eq' then '='
                  when op = 'neq' then '!='
                  when op = 'lt' then '<'
                  when op = 'lte' then '<='
                  when op = 'gt' then '>'
                  when op = 'gte' then '>='
                  when op = 'in' then '= any'
                  else 'UNKNOWN OP'
              end
          );
          res boolean;
      begin
          execute format(
              'select %L::'|| type_::text || ' ' || op_symbol
              || ' ( %L::'
              || (
                  case
                      when op = 'in' then type_::text || '[]'
                      else type_::text end
              )
              || ')', val_1, val_2) into res;
          return res;
      end;
      $$;


ALTER FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) OWNER TO supabase_admin;

--
-- Name: is_visible_through_filters(realtime.wal_column[], realtime.user_defined_filter[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$
    /*
    Should the record be visible (true) or filtered out (false) after *filters* are applied
    */
        select
            -- Default to allowed when no filters present
            $2 is null -- no filters. this should not happen because subscriptions has a default
            or array_length($2, 1) is null -- array length of an empty array is null
            or bool_and(
                coalesce(
                    realtime.check_equality_op(
                        op:=f.op,
                        type_:=coalesce(
                            col.type_oid::regtype, -- null when wal2json version <= 2.4
                            col.type_name::regtype
                        ),
                        -- cast jsonb to text
                        val_1:=col.value #>> '{}',
                        val_2:=f.value
                    ),
                    false -- if null, filter does not match
                )
            )
        from
            unnest(filters) f
            join unnest(columns) col
                on f.column_name = col.name;
    $_$;


ALTER FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) OWNER TO supabase_admin;

--
-- Name: list_changes(name, name, integer, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) RETURNS SETOF realtime.wal_rls
    LANGUAGE sql
    SET log_min_messages TO 'fatal'
    AS $$
      with pub as (
        select
          concat_ws(
            ',',
            case when bool_or(pubinsert) then 'insert' else null end,
            case when bool_or(pubupdate) then 'update' else null end,
            case when bool_or(pubdelete) then 'delete' else null end
          ) as w2j_actions,
          coalesce(
            string_agg(
              realtime.quote_wal2json(format('%I.%I', schemaname, tablename)::regclass),
              ','
            ) filter (where ppt.tablename is not null and ppt.tablename not like '% %'),
            ''
          ) w2j_add_tables
        from
          pg_publication pp
          left join pg_publication_tables ppt
            on pp.pubname = ppt.pubname
        where
          pp.pubname = publication
        group by
          pp.pubname
        limit 1
      ),
      w2j as (
        select
          x.*, pub.w2j_add_tables
        from
          pub,
          pg_logical_slot_get_changes(
            slot_name, null, max_changes,
            'include-pk', 'true',
            'include-transaction', 'false',
            'include-timestamp', 'true',
            'include-type-oids', 'true',
            'format-version', '2',
            'actions', pub.w2j_actions,
            'add-tables', pub.w2j_add_tables
          ) x
      )
      select
        xyz.wal,
        xyz.is_rls_enabled,
        xyz.subscription_ids,
        xyz.errors
      from
        w2j,
        realtime.apply_rls(
          wal := w2j.data::jsonb,
          max_record_bytes := max_record_bytes
        ) xyz(wal, is_rls_enabled, subscription_ids, errors)
      where
        w2j.w2j_add_tables <> ''
        and xyz.subscription_ids[1] is not null
    $$;


ALTER FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: quote_wal2json(regclass); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.quote_wal2json(entity regclass) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
      select
        (
          select string_agg('' || ch,'')
          from unnest(string_to_array(nsp.nspname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
        )
        || '.'
        || (
          select string_agg('' || ch,'')
          from unnest(string_to_array(pc.relname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
          )
      from
        pg_class pc
        join pg_namespace nsp
          on pc.relnamespace = nsp.oid
      where
        pc.oid = entity
    $$;


ALTER FUNCTION realtime.quote_wal2json(entity regclass) OWNER TO supabase_admin;

--
-- Name: subscription_check_filters(); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.subscription_check_filters() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    /*
    Validates that the user defined filters for a subscription:
    - refer to valid columns that the claimed role may access
    - values are coercable to the correct column type
    */
    declare
        col_names text[] = coalesce(
                array_agg(c.column_name order by c.ordinal_position),
                '{}'::text[]
            )
            from
                information_schema.columns c
            where
                format('%I.%I', c.table_schema, c.table_name)::regclass = new.entity
                and pg_catalog.has_column_privilege(
                    (new.claims ->> 'role'),
                    format('%I.%I', c.table_schema, c.table_name)::regclass,
                    c.column_name,
                    'SELECT'
                );
        filter realtime.user_defined_filter;
        col_type regtype;

        in_val jsonb;
    begin
        for filter in select * from unnest(new.filters) loop
            -- Filtered column is valid
            if not filter.column_name = any(col_names) then
                raise exception 'invalid column for filter %', filter.column_name;
            end if;

            -- Type is sanitized and safe for string interpolation
            col_type = (
                select atttypid::regtype
                from pg_catalog.pg_attribute
                where attrelid = new.entity
                      and attname = filter.column_name
            );
            if col_type is null then
                raise exception 'failed to lookup type for column %', filter.column_name;
            end if;

            -- Set maximum number of entries for in filter
            if filter.op = 'in'::realtime.equality_op then
                in_val = realtime.cast(filter.value, (col_type::text || '[]')::regtype);
                if coalesce(jsonb_array_length(in_val), 0) > 100 then
                    raise exception 'too many values for `in` filter. Maximum 100';
                end if;
            else
                -- raises an exception if value is not coercable to type
                perform realtime.cast(filter.value, col_type);
            end if;

        end loop;

        -- Apply consistent order to filters so the unique constraint on
        -- (subscription_id, entity, filters) can't be tricked by a different filter order
        new.filters = coalesce(
            array_agg(f order by f.column_name, f.op, f.value),
            '{}'
        ) from unnest(new.filters) f;

        return new;
    end;
    $$;


ALTER FUNCTION realtime.subscription_check_filters() OWNER TO supabase_admin;

--
-- Name: to_regrole(text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.to_regrole(role_name text) RETURNS regrole
    LANGUAGE sql IMMUTABLE
    AS $$ select role_name::regrole $$;


ALTER FUNCTION realtime.to_regrole(role_name text) OWNER TO supabase_admin;

--
-- Name: can_insert_object(text, text, uuid, jsonb); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO "storage"."objects" ("bucket_id", "name", "owner", "metadata") VALUES (bucketid, name, owner, metadata);
  -- hack to rollback the successful insert
  RAISE sqlstate 'PT200' using
  message = 'ROLLBACK',
  detail = 'rollback successful insert';
END
$$;


ALTER FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) OWNER TO supabase_storage_admin;

--
-- Name: extension(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.extension(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
_filename text;
BEGIN
	select string_to_array(name, '/') into _parts;
	select _parts[array_length(_parts,1)] into _filename;
	-- @todo return the last part instead of 2
	return reverse(split_part(reverse(_filename), '.', 1));
END
$$;


ALTER FUNCTION storage.extension(name text) OWNER TO supabase_storage_admin;

--
-- Name: filename(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.filename(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[array_length(_parts,1)];
END
$$;


ALTER FUNCTION storage.filename(name text) OWNER TO supabase_storage_admin;

--
-- Name: foldername(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.foldername(name text) RETURNS text[]
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[1:array_length(_parts,1)-1];
END
$$;


ALTER FUNCTION storage.foldername(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_size_by_bucket(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_size_by_bucket() RETURNS TABLE(size bigint, bucket_id text)
    LANGUAGE plpgsql
    AS $$
BEGIN
    return query
        select sum((metadata->>'size')::int) as size, obj.bucket_id
        from "storage".objects as obj
        group by obj.bucket_id;
END
$$;


ALTER FUNCTION storage.get_size_by_bucket() OWNER TO supabase_storage_admin;

--
-- Name: list_multipart_uploads_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, next_key_token text DEFAULT ''::text, next_upload_token text DEFAULT ''::text) RETURNS TABLE(key text, id text, created_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(key COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                        substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1)))
                    ELSE
                        key
                END AS key, id, created_at
            FROM
                storage.s3_multipart_uploads
            WHERE
                bucket_id = $5 AND
                key ILIKE $1 || ''%'' AND
                CASE
                    WHEN $4 != '''' AND $6 = '''' THEN
                        CASE
                            WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                                substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                key COLLATE "C" > $4
                            END
                    ELSE
                        true
                END AND
                CASE
                    WHEN $6 != '''' THEN
                        id COLLATE "C" > $6
                    ELSE
                        true
                    END
            ORDER BY
                key COLLATE "C" ASC, created_at ASC) as e order by key COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_key_token, bucket_id, next_upload_token;
END;
$_$;


ALTER FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text) OWNER TO supabase_storage_admin;

--
-- Name: list_objects_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, start_after text DEFAULT ''::text, next_token text DEFAULT ''::text) RETURNS TABLE(name text, id uuid, metadata jsonb, updated_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(name COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                        substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1)))
                    ELSE
                        name
                END AS name, id, metadata, updated_at
            FROM
                storage.objects
            WHERE
                bucket_id = $5 AND
                name ILIKE $1 || ''%'' AND
                CASE
                    WHEN $6 != '''' THEN
                    name COLLATE "C" > $6
                ELSE true END
                AND CASE
                    WHEN $4 != '''' THEN
                        CASE
                            WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                                substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                name COLLATE "C" > $4
                            END
                    ELSE
                        true
                END
            ORDER BY
                name COLLATE "C" ASC) as e order by name COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_token, bucket_id, start_after;
END;
$_$;


ALTER FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text) OWNER TO supabase_storage_admin;

--
-- Name: search(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
  v_order_by text;
  v_sort_order text;
begin
  case
    when sortcolumn = 'name' then
      v_order_by = 'name';
    when sortcolumn = 'updated_at' then
      v_order_by = 'updated_at';
    when sortcolumn = 'created_at' then
      v_order_by = 'created_at';
    when sortcolumn = 'last_accessed_at' then
      v_order_by = 'last_accessed_at';
    else
      v_order_by = 'name';
  end case;

  case
    when sortorder = 'asc' then
      v_sort_order = 'asc';
    when sortorder = 'desc' then
      v_sort_order = 'desc';
    else
      v_sort_order = 'asc';
  end case;

  v_order_by = v_order_by || ' ' || v_sort_order;

  return query execute
    'with folders as (
       select path_tokens[$1] as folder
       from storage.objects
         where objects.name ilike $2 || $3 || ''%''
           and bucket_id = $4
           and array_length(objects.path_tokens, 1) <> $1
       group by folder
       order by folder ' || v_sort_order || '
     )
     (select folder as "name",
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[$1] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where objects.name ilike $2 || $3 || ''%''
       and bucket_id = $4
       and array_length(objects.path_tokens, 1) = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


ALTER FUNCTION storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW; 
END;
$$;


ALTER FUNCTION storage.update_updated_at_column() OWNER TO supabase_storage_admin;

--
-- Name: secrets_encrypt_secret_secret(); Type: FUNCTION; Schema: vault; Owner: supabase_admin
--

CREATE FUNCTION vault.secrets_encrypt_secret_secret() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
		BEGIN
		        new.secret = CASE WHEN new.secret IS NULL THEN NULL ELSE
			CASE WHEN new.key_id IS NULL THEN NULL ELSE pg_catalog.encode(
			  pgsodium.crypto_aead_det_encrypt(
				pg_catalog.convert_to(new.secret, 'utf8'),
				pg_catalog.convert_to((new.id::text || new.description::text || new.created_at::text || new.updated_at::text)::text, 'utf8'),
				new.key_id::uuid,
				new.nonce
			  ),
				'base64') END END;
		RETURN new;
		END;
		$$;


ALTER FUNCTION vault.secrets_encrypt_secret_secret() OWNER TO supabase_admin;

--
-- Name: audit_log_entries; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.audit_log_entries (
    instance_id uuid,
    id uuid NOT NULL,
    payload json,
    created_at timestamp with time zone,
    ip_address character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE auth.audit_log_entries OWNER TO supabase_auth_admin;

--
-- Name: TABLE audit_log_entries; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.audit_log_entries IS 'Auth: Audit trail for user actions.';


--
-- Name: flow_state; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.flow_state (
    id uuid NOT NULL,
    user_id uuid,
    auth_code text NOT NULL,
    code_challenge_method auth.code_challenge_method NOT NULL,
    code_challenge text NOT NULL,
    provider_type text NOT NULL,
    provider_access_token text,
    provider_refresh_token text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    authentication_method text NOT NULL,
    auth_code_issued_at timestamp with time zone
);


ALTER TABLE auth.flow_state OWNER TO supabase_auth_admin;

--
-- Name: TABLE flow_state; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.flow_state IS 'stores metadata for pkce logins';


--
-- Name: identities; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.identities (
    provider_id text NOT NULL,
    user_id uuid NOT NULL,
    identity_data jsonb NOT NULL,
    provider text NOT NULL,
    last_sign_in_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    email text GENERATED ALWAYS AS (lower((identity_data ->> 'email'::text))) STORED,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE auth.identities OWNER TO supabase_auth_admin;

--
-- Name: TABLE identities; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.identities IS 'Auth: Stores identities associated to a user.';


--
-- Name: COLUMN identities.email; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.identities.email IS 'Auth: Email is a generated column that references the optional email property in the identity_data';


--
-- Name: instances; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.instances (
    id uuid NOT NULL,
    uuid uuid,
    raw_base_config text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE auth.instances OWNER TO supabase_auth_admin;

--
-- Name: TABLE instances; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.instances IS 'Auth: Manages users across multiple sites.';


--
-- Name: mfa_amr_claims; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_amr_claims (
    session_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    authentication_method text NOT NULL,
    id uuid NOT NULL
);


ALTER TABLE auth.mfa_amr_claims OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_amr_claims; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_amr_claims IS 'auth: stores authenticator method reference claims for multi factor authentication';


--
-- Name: mfa_challenges; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_challenges (
    id uuid NOT NULL,
    factor_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    verified_at timestamp with time zone,
    ip_address inet NOT NULL
);


ALTER TABLE auth.mfa_challenges OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_challenges; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_challenges IS 'auth: stores metadata about challenge requests made';


--
-- Name: mfa_factors; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_factors (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    friendly_name text,
    factor_type auth.factor_type NOT NULL,
    status auth.factor_status NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    secret text
);


ALTER TABLE auth.mfa_factors OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_factors; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_factors IS 'auth: stores metadata about factors';


--
-- Name: refresh_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.refresh_tokens (
    instance_id uuid,
    id bigint NOT NULL,
    token character varying(255),
    user_id character varying(255),
    revoked boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    parent character varying(255),
    session_id uuid
);


ALTER TABLE auth.refresh_tokens OWNER TO supabase_auth_admin;

--
-- Name: TABLE refresh_tokens; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.refresh_tokens IS 'Auth: Store of tokens used to refresh JWT tokens once they expire.';


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE; Schema: auth; Owner: supabase_auth_admin
--

CREATE SEQUENCE auth.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth.refresh_tokens_id_seq OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: supabase_auth_admin
--

ALTER SEQUENCE auth.refresh_tokens_id_seq OWNED BY auth.refresh_tokens.id;


--
-- Name: saml_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_providers (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    entity_id text NOT NULL,
    metadata_xml text NOT NULL,
    metadata_url text,
    attribute_mapping jsonb,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    name_id_format text,
    CONSTRAINT "entity_id not empty" CHECK ((char_length(entity_id) > 0)),
    CONSTRAINT "metadata_url not empty" CHECK (((metadata_url = NULL::text) OR (char_length(metadata_url) > 0))),
    CONSTRAINT "metadata_xml not empty" CHECK ((char_length(metadata_xml) > 0))
);


ALTER TABLE auth.saml_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_providers IS 'Auth: Manages SAML Identity Provider connections.';


--
-- Name: saml_relay_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_relay_states (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    request_id text NOT NULL,
    for_email text,
    redirect_to text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    flow_state_id uuid,
    CONSTRAINT "request_id not empty" CHECK ((char_length(request_id) > 0))
);


ALTER TABLE auth.saml_relay_states OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_relay_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_relay_states IS 'Auth: Contains SAML Relay State information for each Service Provider initiated login.';


--
-- Name: schema_migrations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE auth.schema_migrations OWNER TO supabase_auth_admin;

--
-- Name: TABLE schema_migrations; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.schema_migrations IS 'Auth: Manages updates to the auth system.';


--
-- Name: sessions; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sessions (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    factor_id uuid,
    aal auth.aal_level,
    not_after timestamp with time zone,
    refreshed_at timestamp without time zone,
    user_agent text,
    ip inet,
    tag text
);


ALTER TABLE auth.sessions OWNER TO supabase_auth_admin;

--
-- Name: TABLE sessions; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sessions IS 'Auth: Stores session data associated to a user.';


--
-- Name: COLUMN sessions.not_after; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.not_after IS 'Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.';


--
-- Name: sso_domains; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_domains (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    domain text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "domain not empty" CHECK ((char_length(domain) > 0))
);


ALTER TABLE auth.sso_domains OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_domains; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_domains IS 'Auth: Manages SSO email address domain mapping to an SSO Identity Provider.';


--
-- Name: sso_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_providers (
    id uuid NOT NULL,
    resource_id text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "resource_id not empty" CHECK (((resource_id = NULL::text) OR (char_length(resource_id) > 0)))
);


ALTER TABLE auth.sso_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_providers IS 'Auth: Manages SSO identity provider information; see saml_providers for SAML.';


--
-- Name: COLUMN sso_providers.resource_id; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sso_providers.resource_id IS 'Auth: Uniquely identifies a SSO provider according to a user-chosen resource ID (case insensitive), useful in infrastructure as code.';


--
-- Name: users; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.users (
    instance_id uuid,
    id uuid NOT NULL,
    aud character varying(255),
    role character varying(255),
    email character varying(255),
    encrypted_password character varying(255),
    email_confirmed_at timestamp with time zone,
    invited_at timestamp with time zone,
    confirmation_token character varying(255),
    confirmation_sent_at timestamp with time zone,
    recovery_token character varying(255),
    recovery_sent_at timestamp with time zone,
    email_change_token_new character varying(255),
    email_change character varying(255),
    email_change_sent_at timestamp with time zone,
    last_sign_in_at timestamp with time zone,
    raw_app_meta_data jsonb,
    raw_user_meta_data jsonb,
    is_super_admin boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    phone text DEFAULT NULL::character varying,
    phone_confirmed_at timestamp with time zone,
    phone_change text DEFAULT ''::character varying,
    phone_change_token character varying(255) DEFAULT ''::character varying,
    phone_change_sent_at timestamp with time zone,
    confirmed_at timestamp with time zone GENERATED ALWAYS AS (LEAST(email_confirmed_at, phone_confirmed_at)) STORED,
    email_change_token_current character varying(255) DEFAULT ''::character varying,
    email_change_confirm_status smallint DEFAULT 0,
    banned_until timestamp with time zone,
    reauthentication_token character varying(255) DEFAULT ''::character varying,
    reauthentication_sent_at timestamp with time zone,
    is_sso_user boolean DEFAULT false NOT NULL,
    deleted_at timestamp with time zone,
    is_anonymous boolean DEFAULT false NOT NULL,
    CONSTRAINT users_email_change_confirm_status_check CHECK (((email_change_confirm_status >= 0) AND (email_change_confirm_status <= 2)))
);


ALTER TABLE auth.users OWNER TO supabase_auth_admin;

--
-- Name: TABLE users; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.users IS 'Auth: Stores user login data within a secure schema.';


--
-- Name: COLUMN users.is_sso_user; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.users.is_sso_user IS 'Auth: Set this column to true when the account comes from SSO. These accounts can have duplicate emails.';


--
-- Name: listing; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.listing (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    category text DEFAULT ''::text NOT NULL,
    simplified character varying NOT NULL
);


ALTER TABLE public.listing OWNER TO postgres;

--
-- Name: vocab_sandbox; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vocab_sandbox (
    simplified character varying NOT NULL,
    pinyin character varying,
    hanviet character varying,
    cantonese character varying,
    english jsonb,
    wohok_link character varying
);


ALTER TABLE public.vocab_sandbox OWNER TO postgres;

--
-- Name: TABLE vocab_sandbox; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.vocab_sandbox IS 'This is a duplicate of vocab';


--
-- Name: broadcasts; Type: TABLE; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE TABLE realtime.broadcasts (
    id bigint NOT NULL,
    channel_id bigint NOT NULL,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE realtime.broadcasts OWNER TO supabase_realtime_admin;

--
-- Name: broadcasts_id_seq; Type: SEQUENCE; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE SEQUENCE realtime.broadcasts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE realtime.broadcasts_id_seq OWNER TO supabase_realtime_admin;

--
-- Name: broadcasts_id_seq; Type: SEQUENCE OWNED BY; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER SEQUENCE realtime.broadcasts_id_seq OWNED BY realtime.broadcasts.id;


--
-- Name: channels; Type: TABLE; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE TABLE realtime.channels (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE realtime.channels OWNER TO supabase_realtime_admin;

--
-- Name: channels_id_seq; Type: SEQUENCE; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE SEQUENCE realtime.channels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE realtime.channels_id_seq OWNER TO supabase_realtime_admin;

--
-- Name: channels_id_seq; Type: SEQUENCE OWNED BY; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER SEQUENCE realtime.channels_id_seq OWNED BY realtime.channels.id;


--
-- Name: presences; Type: TABLE; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE TABLE realtime.presences (
    id bigint NOT NULL,
    channel_id bigint NOT NULL,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE realtime.presences OWNER TO supabase_realtime_admin;

--
-- Name: presences_id_seq; Type: SEQUENCE; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE SEQUENCE realtime.presences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE realtime.presences_id_seq OWNER TO supabase_realtime_admin;

--
-- Name: presences_id_seq; Type: SEQUENCE OWNED BY; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER SEQUENCE realtime.presences_id_seq OWNED BY realtime.presences.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE realtime.schema_migrations OWNER TO supabase_admin;

--
-- Name: subscription; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.subscription (
    id bigint NOT NULL,
    subscription_id uuid NOT NULL,
    entity regclass NOT NULL,
    filters realtime.user_defined_filter[] DEFAULT '{}'::realtime.user_defined_filter[] NOT NULL,
    claims jsonb NOT NULL,
    claims_role regrole GENERATED ALWAYS AS (realtime.to_regrole((claims ->> 'role'::text))) STORED NOT NULL,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);


ALTER TABLE realtime.subscription OWNER TO supabase_admin;

--
-- Name: subscription_id_seq; Type: SEQUENCE; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE realtime.subscription ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME realtime.subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: buckets; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets (
    id text NOT NULL,
    name text NOT NULL,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    public boolean DEFAULT false,
    avif_autodetection boolean DEFAULT false,
    file_size_limit bigint,
    allowed_mime_types text[],
    owner_id text
);


ALTER TABLE storage.buckets OWNER TO supabase_storage_admin;

--
-- Name: COLUMN buckets.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.buckets.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: migrations; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.migrations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    hash character varying(40) NOT NULL,
    executed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE storage.migrations OWNER TO supabase_storage_admin;

--
-- Name: objects; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.objects (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    bucket_id text,
    name text,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    last_accessed_at timestamp with time zone DEFAULT now(),
    metadata jsonb,
    path_tokens text[] GENERATED ALWAYS AS (string_to_array(name, '/'::text)) STORED,
    version text,
    owner_id text
);


ALTER TABLE storage.objects OWNER TO supabase_storage_admin;

--
-- Name: COLUMN objects.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.objects.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: s3_multipart_uploads; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads (
    id text NOT NULL,
    in_progress_size bigint DEFAULT 0 NOT NULL,
    upload_signature text NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    version text NOT NULL,
    owner_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.s3_multipart_uploads OWNER TO supabase_storage_admin;

--
-- Name: s3_multipart_uploads_parts; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads_parts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    upload_id text NOT NULL,
    size bigint DEFAULT 0 NOT NULL,
    part_number integer NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    etag text NOT NULL,
    owner_id text,
    version text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.s3_multipart_uploads_parts OWNER TO supabase_storage_admin;

--
-- Name: decrypted_secrets; Type: VIEW; Schema: vault; Owner: supabase_admin
--

CREATE VIEW vault.decrypted_secrets AS
 SELECT secrets.id,
    secrets.name,
    secrets.description,
    secrets.secret,
        CASE
            WHEN (secrets.secret IS NULL) THEN NULL::text
            ELSE
            CASE
                WHEN (secrets.key_id IS NULL) THEN NULL::text
                ELSE convert_from(pgsodium.crypto_aead_det_decrypt(decode(secrets.secret, 'base64'::text), convert_to(((((secrets.id)::text || secrets.description) || (secrets.created_at)::text) || (secrets.updated_at)::text), 'utf8'::name), secrets.key_id, secrets.nonce), 'utf8'::name)
            END
        END AS decrypted_secret,
    secrets.key_id,
    secrets.nonce,
    secrets.created_at,
    secrets.updated_at
   FROM vault.secrets;


ALTER TABLE vault.decrypted_secrets OWNER TO supabase_admin;

--
-- Name: refresh_tokens id; Type: DEFAULT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('auth.refresh_tokens_id_seq'::regclass);


--
-- Name: broadcasts id; Type: DEFAULT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.broadcasts ALTER COLUMN id SET DEFAULT nextval('realtime.broadcasts_id_seq'::regclass);


--
-- Name: channels id; Type: DEFAULT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.channels ALTER COLUMN id SET DEFAULT nextval('realtime.channels_id_seq'::regclass);


--
-- Name: presences id; Type: DEFAULT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.presences ALTER COLUMN id SET DEFAULT nextval('realtime.presences_id_seq'::regclass);


--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.audit_log_entries (instance_id, id, payload, created_at, ip_address) FROM stdin;
\.


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.flow_state (id, user_id, auth_code, code_challenge_method, code_challenge, provider_type, provider_access_token, provider_refresh_token, created_at, updated_at, authentication_method, auth_code_issued_at) FROM stdin;
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id) FROM stdin;
\.


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.instances (id, uuid, raw_base_config, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_amr_claims (session_id, created_at, updated_at, authentication_method, id) FROM stdin;
\.


--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_challenges (id, factor_id, created_at, verified_at, ip_address) FROM stdin;
\.


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_factors (id, user_id, friendly_name, factor_type, status, created_at, updated_at, secret) FROM stdin;
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.refresh_tokens (instance_id, id, token, user_id, revoked, created_at, updated_at, parent, session_id) FROM stdin;
\.


--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_providers (id, sso_provider_id, entity_id, metadata_xml, metadata_url, attribute_mapping, created_at, updated_at, name_id_format) FROM stdin;
\.


--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_relay_states (id, sso_provider_id, request_id, for_email, redirect_to, created_at, updated_at, flow_state_id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.schema_migrations (version) FROM stdin;
20171026211738
20171026211808
20171026211834
20180103212743
20180108183307
20180119214651
20180125194653
00
20210710035447
20210722035447
20210730183235
20210909172000
20210927181326
20211122151130
20211124214934
20211202183645
20220114185221
20220114185340
20220224000811
20220323170000
20220429102000
20220531120530
20220614074223
20220811173540
20221003041349
20221003041400
20221011041400
20221020193600
20221021073300
20221021082433
20221027105023
20221114143122
20221114143410
20221125140132
20221208132122
20221215195500
20221215195800
20221215195900
20230116124310
20230116124412
20230131181311
20230322519590
20230402418590
20230411005111
20230508135423
20230523124323
20230818113222
20230914180801
20231027141322
20231114161723
20231117164230
20240115144230
20240214120130
20240306115329
20240314092811
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sessions (id, user_id, created_at, updated_at, factor_id, aal, not_after, refreshed_at, user_agent, ip, tag) FROM stdin;
\.


--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_domains (id, sso_provider_id, domain, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_providers (id, resource_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at, confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at, email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at, phone_change, phone_change_token, phone_change_sent_at, email_change_token_current, email_change_confirm_status, banned_until, reauthentication_token, reauthentication_sent_at, is_sso_user, deleted_at, is_anonymous) FROM stdin;
\.


--
-- Data for Name: key; Type: TABLE DATA; Schema: pgsodium; Owner: supabase_admin
--

COPY pgsodium.key (id, status, created, expires, key_type, key_id, key_context, name, associated_data, raw_key, raw_key_nonce, parent_key, comment, user_data) FROM stdin;
\.


--
-- Data for Name: listing; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.listing (id, category, simplified) FROM stdin;
68c4f64c-5fd1-4636-9060-b0f1fe7ce125	hsk1	爱
d1925f20-e8a0-43f6-b91e-e7cfdebd1379	hsk1	八
fe2a2ab3-eb8d-41e0-a57d-5cca7e88caf7	hsk1	爸爸
e6088a53-6ef6-46ab-97fc-98b34d462160	hsk1	北京
55f33a2c-aa4a-4428-bd6e-9bc3f5de71ac	hsk1	杯子
cb48672c-ecee-431a-8040-737068ce59fd	hsk1	本
86eca2d6-ee95-4865-8013-3c398abcbe92	hsk1	不
352ff653-f37a-48f7-aad4-d77f77e40713	hsk1	不客气
d27cf152-7610-4a3c-abb9-0b296f387282	hsk1	菜
ddc6c9c2-2ff3-467b-9c46-694e195a9f63	hsk1	茶
6d46313b-346b-45ab-9715-5f356d595d72	hsk1	吃
ffac25a8-54fd-4f44-a6d1-3bc7b1272ca2	hsk1	出租车
0dc9006c-079a-4b89-aa77-205639ac5b6c	hsk1	大
e4c618d3-208b-4f1a-ab9a-75dc455cd1d2	hsk1	打电话
5044f0ed-f15f-47a1-a27f-130e31af487b	hsk1	的
4e203b98-d394-451d-be5e-cfebdd1bd2e1	hsk1	点
71da11a6-c497-4624-b4d2-69e741b2e15d	hsk1	电脑
8828f742-a583-48da-acec-9326c5096f1e	hsk1	电视
435ad1fb-e663-44bc-91e7-7cb9296b1b64	hsk1	电影
0bb2ae94-0d4c-42e8-befa-a4f6e5c27edc	hsk1	东西
40b52d40-aecb-45c9-a9a9-0db725d51557	hsk1	都
1e73f416-a743-4558-9e00-5283780ef699	hsk1	读
c247584f-9dac-4691-93e5-2e4cefde235a	hsk1	对不起
22b63700-a413-4e89-903e-88c09280d980	hsk1	多
4f0901b9-781f-4a29-9f19-a93866dfdf82	hsk1	多少
94cca082-cbe8-4b8e-90c2-32455ff6e8d1	hsk1	二
f681041d-def9-4d38-a994-a0b3fb0fcc4f	hsk1	儿子
7b24e758-9d09-4bad-9be2-fffda8fdae10	hsk1	饭馆
3bb21652-f630-481e-9275-1c8e0ba39cdc	hsk1	飞机
e4799209-991f-4929-8528-2d566e71ec55	hsk1	分钟
fd6f9b03-9132-4098-a8f7-01f48740c4fb	hsk1	高兴
718c34a9-1598-4e13-937f-6eaea395fe54	hsk1	个
4169e195-8433-47ab-abe4-9bcfb68d34c6	hsk1	工作
08569766-8b94-4a25-84ea-68e82e5c5e23	hsk1	狗
f051c694-3920-4ee0-9a9f-a166d5069165	hsk1	汉语
897cf754-630f-4d1f-ace9-4b95b73d56d0	hsk1	好
7c9872b9-6a83-49de-b924-c1cf181b7b6b	hsk1	和
250b4fa3-f0ff-4b95-bff1-4b22af74b580	hsk1	喝
c56969b1-e0a3-4525-9dfa-1e75f251ef47	hsk1	很
bc2eebf1-2631-4f6a-a10a-f6e839da6cf8	hsk1	后面
94296332-165c-4220-83b5-fc52115fc1f3	hsk1	回
d2823444-5b3c-40c3-9a1d-4e597eb26e23	hsk1	会
c5341d14-752c-4c07-b00c-f606417f19a7	hsk1	火车站
ff8d8c5c-7d6a-4741-8344-fb579d8a5b2e	hsk1	几
6f06f0ea-2a24-43db-b927-2c91932ace35	hsk1	家
cc8a6cd0-1aaa-4341-bc12-1553d314f9e0	hsk1	叫
a0946b7d-f886-4230-8ec8-22cfc1e5e6f5	hsk1	今天
c2821785-ae67-4a0b-85d3-5d3d1a1adefb	hsk1	九
7ec01943-5ddb-45b1-b678-c542ec9320db	hsk1	开
44c72c50-7c99-4c00-8f4c-86782052eebf	hsk1	看
33133620-6182-4176-aee7-03174e857141	hsk1	看见
8d98dfff-6a4d-4ba0-acea-63d20db4c9ca	hsk1	块
0fb14296-e5ae-453d-93bf-63012079fc09	hsk1	来
c727868b-48cf-4e95-a5c1-78d136579e31	hsk1	老师
78830076-61e7-40d0-91a4-a944c4d79ba6	hsk1	了
28b9e6be-054f-4bfa-81af-6541969650ad	hsk1	冷
694385a2-539d-4456-b52b-07cb93482477	hsk1	里
ef67abdf-945c-4a3f-80e1-e68cb1b25e77	hsk1	零
8039b8fd-f43f-4d52-8c35-728257cfa2ea	hsk1	六
7a406b76-b7a8-4963-a15b-af874d8bcf7a	hsk1	吗
0add9077-c6af-4d26-8f26-281f37de5e71	hsk1	妈妈
b9dbcd35-0dab-41ae-abd0-42c0344a3e39	hsk1	买
44479686-bb84-449c-b2e8-e172ed648135	hsk1	猫
4b434fe7-fe9e-431b-8f38-5a313b359ce2	hsk1	没
8a277d89-880f-46a3-aac5-7be1e7577695	hsk1	没关系
1affc569-fc92-495f-993a-03afedb8de0f	hsk1	米饭
1bfe2eb4-ed22-4f0a-be31-870e432076f0	hsk1	明天
8924a622-fba5-447a-a411-7885c104eb8e	hsk1	名字
7a407bc5-31a9-4897-a49f-6cdb40897a74	hsk1	那
cb07c148-1011-4e94-ba67-31ea994c45d8	hsk1	哪
ffd228b9-e879-465c-9b37-c817671f8fe5	hsk1	呢
f9a37312-f02b-4a3d-a61f-6ce26719f257	hsk1	能
bd6e8361-a740-41dc-b6ec-36cb5e89a9ec	hsk1	你
dbcf40d9-662c-4f58-9a27-170fe32d5d3c	hsk1	年
9b8d8ae1-7e84-422f-9622-4ab5c6915291	hsk1	女儿
d5a49d0a-af23-4b8f-b4c2-9df44713f018	hsk1	朋友
c8a4c073-16ea-43b4-8db7-2029c849540c	hsk1	漂亮
a97e5d96-a236-46bd-83eb-8213647c8835	hsk1	苹果
b79c2489-ec26-4169-8263-fa1c9574c5d6	hsk1	七
a1d681f7-6ba2-4828-bd4a-96e19addee14	hsk1	钱
44bba71d-269c-40c6-a19c-bf49b0cc220c	hsk1	前面
77ab5b61-bc6e-4e08-a877-2b000037c033	hsk1	请
c1c7ad13-712a-40dc-b419-1c5ef575cfe0	hsk1	去
5e68ccc5-ea9d-4a8f-b2a2-27c9b46e7fce	hsk1	热
f3f319e5-ae3e-4ff4-90ab-1926ce3da036	hsk1	人
6e8f5013-f9ac-4826-813b-be607ea9e57f	hsk1	认识
9fa4b759-cf88-4303-a940-63975f7477a2	hsk1	日
85e109d1-bb45-4b8f-8e3c-a1c9e624b03f	hsk1	三
fa042bc1-8fd3-4d12-b484-8391867c813b	hsk1	上
dcac151d-c0f3-49f9-ab96-0adb4e7ee021	hsk1	商店
eebc6a34-1a45-491b-9d11-f02cab39723b	hsk1	上午
708642b8-b958-4246-a5db-42d685ef8a82	hsk1	少
2d8cd3d4-e5c3-49fd-bab3-8a353185e804	hsk1	谁
e745d3f2-c78c-4e0d-a7f2-04602cb1f5e6	hsk1	什么
d46669e6-c6c8-4e5c-9c90-d1d457cf52cc	hsk1	十
72aea767-4360-4738-9471-fde656ff751e	hsk1	是
2f642a85-ad9e-4e99-9736-763e105aee5e	hsk1	时候
cab57ca1-0d92-4aa0-a01c-0b06569e6153	hsk1	书
8403c076-4405-4d1e-adbd-b25c9a090a2b	hsk1	水
21900863-08e0-4dad-9bbb-1b2cf949b648	hsk1	水果
0a406cb2-2fae-45d3-9b11-f3bb867d3354	hsk1	睡觉
936a6b7d-682a-4fa8-8c16-75e648642699	hsk1	说话
c057bb35-ec84-4e8f-bd48-8dbc33eaf965	hsk1	四
7183cadc-beb0-433f-8ed8-f506bfde986a	hsk1	岁
c31b787b-f999-467c-9172-f8f99fa56b34	hsk1	他
2a3eebd1-9807-4dc5-b1b6-da08eb3aed39	hsk1	她
43ba294c-5ec9-4761-b24f-6c7aad315c07	hsk1	太
a3cffec4-5f57-44f2-90bb-0673ab5958aa	hsk1	天气
c6c8ea93-fe7f-43aa-b655-e23d1a4c44c8	hsk1	听
672f3961-71ef-43d4-ab56-71b4c7dfb379	hsk1	同学
24ea788d-9e31-4983-a92f-b18d645b5e8b	hsk1	喂
9153e96a-7d44-4b7d-aeb0-df2cdab752c7	hsk1	我
ebffd4cc-b2d8-48b7-bc48-47820c29336c	hsk1	我们
8c7fd3e7-2f09-40ea-9589-e0dc5ee41891	hsk1	五
f99617ca-0e46-4e47-a9f7-92fe558b7441	hsk1	喜欢
6d4646e2-bb8f-46bd-868e-5511682a564f	hsk1	下
fc88d9a7-2ee8-4817-b6fb-088c5535d1d8	hsk1	下午
889ceed1-8725-4f24-815e-18b7f1cd7275	hsk1	下雨
fc6f2acd-4cec-4682-b565-e935b3595606	hsk1	先生
fa128f89-f854-43d7-abd8-7202e4f17d3a	hsk1	现在
2bcddbe3-2c03-4387-98e1-b821b4352d19	hsk1	想
019da714-78e6-45b7-9a72-f1176a79f3b6	hsk1	小
e2c0030e-5e7e-478d-a751-ef961ad960f8	hsk1	小姐
e1b31a52-5684-4ed9-b6f7-476fd8fe940d	hsk1	写
369ff7f4-c404-479f-84e3-99b4cd287460	hsk1	些
ee3d1aa4-a831-47a6-ba37-a80d3d64200b	hsk1	谢谢
881f1618-7b23-4448-a04c-b72583ec7506	hsk1	星期
86e73f8e-f6d5-4589-9396-2995256016d6	hsk1	学生
63067d1c-4402-4953-9c07-464446df8759	hsk1	学习
be81d5a7-4451-4f3a-8c63-dda15ffa85d0	hsk1	学校
cd80c77a-713f-4665-8342-d65317d7943f	hsk1	一
48a31004-76ab-480e-98de-5fb79ab25c47	hsk1	衣服
43e8058a-076e-4dea-a261-d6e00106d020	hsk1	医生
3c6a87fe-889b-4aeb-9656-22f052be6a91	hsk1	医院
3d14975a-9c82-409c-add6-ce69b4116914	hsk1	椅子
b481d38f-ae29-421f-ae4f-ad9c3fadf029	hsk1	有
4ccf97a1-65eb-44b1-b924-99d46e24c022	hsk1	月
e43e4656-1875-4266-8889-b0f78f212920	hsk1	在
8836e7ac-19a2-42a0-9875-ff6126c0d5af	hsk1	再见
2f3c7cd0-0fc0-450e-bf8e-2d53e3199a6a	hsk1	怎么
83a384af-2c1b-44a6-be1d-c6c5415ce250	hsk1	怎么样
35f120e8-8cbd-45f3-b87f-8ecd7ee22b6b	hsk1	这
cc5bea1a-5aec-4f3d-ae7c-12673643d756	hsk1	中国
a6f5a8c3-0ac5-431e-94fe-7cdcc2194613	hsk1	中午
3acf81c5-5f13-4e3f-9f21-73424846f254	hsk1	住
3fd084cd-619d-490b-8fd5-79d8ffbb126f	hsk1	桌子
5481cb8b-e6db-4cf4-ac8c-52a188572112	hsk1	字
ec19b860-baaa-4954-bde6-c8eddbe9aa23	hsk1	做
71e6f1de-38ae-4f12-b532-21ec47eac81e	hsk1	坐
e329b524-7e9c-4385-8d93-349ff13131c5	hsk1	昨天
79156c33-e1ba-473a-8bdd-bc4b712a8798	hsk3	啊
2eafddd9-2f34-4b8b-8a18-5919bf156293	hsk3	阿姨
89dd6d0a-ecc8-4fd2-b55f-210c9be0c8d8	hsk3	矮
c6fc7751-6ea8-4659-bacc-2af5e39eecc8	hsk3	爱好
aed368cc-172b-4608-9ef4-cece2ef61170	hsk3	安静
85627600-8467-476c-8e57-250b0e984d12	hsk3	把
59af4b94-2fb6-421e-960e-e72bd8a86a18	hsk3	半
82f9c1cc-60b4-4dd3-adbd-2d31500a0b44	hsk3	搬
50975ffa-80bd-450f-9bd6-c3aa18eec88b	hsk3	班
a1bbfb94-29af-41e3-b1d0-ef99efdb58b8	hsk3	办法
6f7fd2ea-17c8-44a1-ad81-1eea54f8af1d	hsk3	办公室
6b811152-5baa-41eb-a864-0bd62ea78831	hsk3	帮忙
49815d9e-1142-4445-8b01-140252c8c3cd	hsk3	饱
ae9e4536-06c7-4f03-b395-7c905b0260ca	hsk3	包
0ff840a7-1a4d-41ea-85d4-ffb43741edb3	hsk3	被
e7f21b54-02d7-40bb-9d6b-5d3221a1b001	hsk3	北方
3458f9d9-2aab-4a42-a2c2-dce0d8b28a4b	hsk3	比较
cbb49148-29d0-40e9-9096-0adc4a4021d7	hsk3	比赛
feb7a2cf-4b7d-48eb-8e38-4399f0427502	hsk3	必须
4b643242-27d3-4827-9a35-6c74358090aa	hsk3	鼻子
63d1dfef-a826-4fb8-b67e-13c69cbff9cb	hsk3	变化
607ecfeb-9800-414f-9122-cc484999de94	hsk3	表示
7c710871-ebad-4acb-8886-4867854dbd8d	hsk3	表演
2281759d-e57c-4d5a-a5f8-0f738e842eee	hsk3	别人
37a539d9-8008-4136-b22f-b4d1dda438b9	hsk3	宾馆
7920539d-bd7b-42ee-8f78-0c9ee16f316a	hsk3	冰箱
31232f21-04ca-4bf8-808d-a51a1c91dcf2	hsk3	才
1edccd86-d44b-461f-b095-482e8f608a21	hsk3	菜单
8058e98a-58b3-4d3d-bfc7-692f71850c38	hsk3	参加
4e8345ea-1961-4a1e-a02f-242814f792fa	hsk3	草
e19416aa-e7e6-4e38-b7cd-42b372a2d246	hsk3	层
b8937fb7-ab07-4141-849b-94bdd0c36464	hsk3	差
fd86fcb4-02c4-472c-9479-151124b9592a	hsk3	超市
6fc76906-503a-46c6-a5be-34faafc85ac3	hsk3	衬衫
dcb84513-5b2b-45e9-b959-f862f1b340a7	hsk3	成绩
c86703ac-320e-4702-aba9-390808f6a542	hsk3	城市
ad709c41-8984-41b5-a0d3-13ccbb0b8b62	hsk3	迟到
9128da48-f243-44bd-873f-9055150b57b9	hsk3	厨房
2637c1b3-df31-4659-adcf-be1ff9cf1033	hsk3	除了
8560716c-8d95-41be-9814-684027ab9207	hsk3	出现
e96402b5-4502-496c-9423-e9ccd952665d	hsk3	春
7cea220b-8907-4460-9866-143026837204	hsk3	词语
e6371dd4-01fe-4070-961b-c1ef62e4dc53	hsk3	聪明
2ca19043-f096-49b9-a69d-73f2d651caf9	hsk3	打扫
ebe66422-475d-4390-b02e-ca6a11285415	hsk3	打算
a180e633-6445-4839-958f-ca12c25fe6ec	hsk3	带
7bb98aab-eeac-4800-88fc-305fe4f18efe	hsk3	蛋糕
96839da0-c663-4fd3-a592-4b2055209a3a	hsk3	担心
0e5fe6da-4a34-4088-9f17-5937dfa54120	hsk3	当然
98807fa9-2b03-4da7-980f-11ee0551b215	hsk3	地
f2ac0fde-3b9a-4e9c-9cf2-d6a2d0f072d6	hsk3	灯
ec7c679b-f954-424b-b895-b73460494367	hsk3	低
a682dd42-b6a6-4862-8c2e-1c5ae322eb0c	hsk3	地方
baea1882-893b-45fe-8b57-a5786687442f	hsk3	地铁
cf58431b-4437-4d84-9e93-31f8cc2698eb	hsk3	地图
a49b12c3-a4fc-4731-ae82-e571c4a56ee6	hsk3	电梯
6a4d61ce-0c30-4e5e-9492-7408e3a24089	hsk3	电子邮件
fafb28b6-679c-4e87-b8ec-247d2aa917f3	hsk3	东
21ab07fb-6857-49b8-9e17-6e216acf3d13	hsk3	冬
806c25a9-d2ac-46eb-9d8b-c2dc93f4f377	hsk3	动物
b6e83d41-5065-4ffd-8e87-27f6dbcf087f	hsk3	段
d67dee93-6092-4e76-8af3-0bc098891aa4	hsk3	短
e0b1ada8-4f02-410e-bb31-0de0205111e7	hsk3	锻炼
a58305e3-a774-4da9-860d-699aab887815	hsk3	多么
65c95cf4-4cc6-47c3-8b59-25e41105385f	hsk3	饿
fd093f0c-8081-4320-a21a-9a41755085b0	hsk3	耳朵
bc459485-21a0-4af7-ada9-d63ce4b1048e	hsk3	而且
f424466e-7ad8-4be7-8017-42a202409a7d	hsk3	发烧
56f6612c-56b5-4686-b284-5620f2118732	hsk3	发现
9e2b1ee6-5178-48b3-85bd-b98909836df3	hsk3	放
e1826033-e5db-445c-9734-d4c76547c786	hsk3	方便
f58f7fd0-8b29-4874-ad6d-196efc5a9b6f	hsk3	放心
c2bddc28-211f-4e4e-ade2-ebc5cdc2fdf8	hsk3	分
2b5ad4e9-de6d-4649-b6e6-14501ed45cd6	hsk3	附近
bdd43653-5036-44c4-b481-e3142f6a6b33	hsk3	复习
19788eb9-70aa-4bd9-b92c-4dc55e28169a	hsk3	敢
ca0f83d1-13e2-4667-bf0a-6b71d31ff029	hsk3	干净
077338b3-25fb-49ab-9061-5b76702b7efb	hsk3	感冒
d79c4220-798a-46fb-935a-fe3c2b52a39c	hsk3	刚才
cbb545c7-421b-4455-8dfc-013618f9670e	hsk3	跟
e9cad566-af0f-46e6-93ab-252197864ad8	hsk3	根据
31711577-28ba-49ea-b2d4-1778a2f1645f	hsk3	更
97fbdb6d-24d0-4b6c-9929-2dc950151470	hsk3	公园
6602c6c9-b691-4195-93c7-708d38a1e505	hsk3	故事
1043cc20-fee9-41ab-88cf-2bcfdfcb17b8	hsk3	刮风
2d597486-c285-40d6-8475-3a7ee2793e7e	hsk3	关
7bdd0df5-9287-4710-9565-11945eda42ec	hsk3	关系
1b08cb74-d909-47ff-8dd8-f059f6d43cc9	hsk3	关心
8a1f9ae7-b7bc-46c1-a56f-1bbd1507e4e4	hsk3	关于
53366de8-ee88-484d-865d-017a6ebfb3f3	hsk3	国家
6c75b7f6-8073-4555-8e95-9ec0ed77a1e9	hsk3	过去
3c3b4146-61e1-4731-bc90-f7883d530c56	hsk3	果汁
11119055-1239-492f-a253-54e044cd6399	hsk3	害怕
3f48fb49-4ca6-4988-a1ec-463ccabc358c	hsk3	还是
d395261a-4f08-442c-8381-b84ab777dc72	hsk3	河
99804201-3cba-477d-a502-a50203e1d16f	hsk3	黑板
79cf244b-decf-4c44-9642-54557fe9f32b	hsk3	护照
06a48c02-97d9-45a0-9536-aeea14edcadd	hsk3	画
ad69229d-a5ff-4ad8-827d-9d63a0700760	hsk3	花
a9018789-cf6d-4046-b670-654fcb701017	hsk3	花园
fe3ed091-9c4b-4163-a710-becd658d3302	hsk3	坏
c59c8f8c-cee0-4da5-9036-353de0ae2aae	hsk3	还
ccc2b5ca-8209-4bb4-9ce6-d508c6ab8e4f	hsk3	换
d55833d2-ba65-41e2-80e7-b3a9ac88518d	hsk3	环境
effd13f7-313d-425d-951e-5db795d80764	hsk3	黄
7c073285-c6c7-4de0-a92d-bf24b2aace49	hsk3	会议
5042ffd3-dc1e-477b-926b-081c385b78ff	hsk3	或者
fa8b9238-befa-48cc-b672-2a358469d1f9	hsk3	极
4d023bf3-2a1c-4f6c-87a7-aca105f136b6	hsk3	记得
399c913d-690f-49e6-b09b-402b420f4f57	hsk3	几乎
452c439a-2f4a-466c-a59e-8a0311a28265	hsk3	机会
7f82e37e-7740-4a73-8695-b066f6b4d665	hsk3	季节
f26eeb0c-7272-4835-95b3-867c62da43cf	hsk3	检查
3290a180-c97e-499c-a0b7-698444832661	hsk3	简单
a1a22e36-5486-4105-be04-9c06a9be3478	hsk3	健康
d267c38e-18b7-4317-9d32-f4a8a7e20efb	hsk3	见面
f012e105-08e8-4f79-bf22-33ffa11275a3	hsk3	讲
3cd30f95-47bf-4fb9-8b2e-983a81ef5065	hsk3	脚
67b04da7-7cb9-4856-89e0-0c143fd2e3c8	hsk3	角
48dc357c-c8bd-443f-b46a-799d325593d4	hsk3	教
1359a384-e567-4687-9689-d1d701d20342	hsk3	借
00903638-4691-46bd-9f42-0640b8090949	hsk3	接
a18a1dac-9c52-4490-a3e8-4846d88533f7	hsk3	街道
5802618e-6076-438b-9632-261b9bb43bd0	hsk3	结婚
8466adc8-d10a-4855-bf48-b23e69d71662	hsk3	解决
01a0dea0-cacb-4eb2-a753-b69b5bad884b	hsk3	节目
ce5b2927-68e1-4ad6-ba7e-ec1509132fe5	hsk3	节日
cf0f4e5d-6fad-47b5-af7c-327b3cccb6ef	hsk3	结束
6a153a95-0d41-4729-a263-7d4a6f8db1c3	hsk3	经常
17bda2db-9acb-423b-af00-c5ab7a14395e	hsk3	经过
855926f1-e84b-4323-9ece-e03d25d4ba58	hsk3	经理
1432d09a-d37d-4cbc-b2d2-478d26751117	hsk3	旧
70bde4cf-f120-4ff9-a601-070a455f6d82	hsk3	久
15ef3840-9826-4411-ac7e-1249710366af	hsk3	举行
66727b46-af5b-4d3d-b12f-ca0c4d7db315	hsk3	句子
a140632d-1889-46f1-a56f-9e4453f32231	hsk3	决定
a1f9476a-a7a0-4890-a604-1e3253f15d73	hsk3	刻
4c124823-9db4-4b23-834f-d9a7a10888e1	hsk3	渴
5374ef3f-2bd9-43c8-a8a3-b15f0e6bfd24	hsk3	可爱
1cdce0a4-ea23-49e2-9575-c3942304926b	hsk3	客人
4cf3e4db-da83-44bf-901c-906828ae5456	hsk3	空调
2b3b3929-0bcb-4dba-8873-0010584d25a7	hsk3	口
3353229f-a981-4906-b3ae-25b4933126a4	hsk3	哭
a6f65e85-d82f-4eed-83d4-8d667e939d18	hsk3	裤子
f229329f-d6fa-4ff4-9897-71f3343d5223	hsk3	筷子
586c186f-0049-4f54-8b52-54cad9913168	hsk3	蓝
323a91a5-c92e-4642-8bd2-b0fe011e2f7a	hsk3	老
a09e61fc-aa89-4590-982d-f819427f7372	hsk3	离开
b845d9cb-8a35-4bfb-9522-a82348bc93ff	hsk3	历史
77ea2aba-683d-4337-b4c5-40b2f6cdec1f	hsk3	礼物
2c74f63b-2ed4-4101-8d5d-cd7698b56d31	hsk3	脸
b83fc984-4fcf-48dd-9b8c-9c9b39f87310	hsk3	练习
570bd6a0-2e9d-41b4-999b-fa5f51952483	hsk3	辆
d3c3aa83-c43a-460c-a15e-22660e1d770b	hsk3	了解
bfd0f8b9-26b3-471b-9ee7-867f3a9085d0	hsk3	邻居
e80c96b0-d774-40be-929f-c6b4cb7c585f	hsk3	楼
a8f80c2b-a75f-4a7b-ad65-b1e9232b59c1	hsk3	绿
319af9e0-35a2-4ff9-b098-e2b7c82e93ce	hsk3	马
da7f01af-bb6f-4998-bb6d-bcc178959d7e	hsk3	马上
70f608f5-51a1-4818-bad8-064ef4255c28	hsk3	满意
1bc7fcef-805f-4341-8ced-3ba7a2d6e768	hsk3	帽子
606c24b3-3b89-4443-a038-082383da5ff4	hsk3	米
425de801-7f18-4db2-8333-2892fbb24226	hsk3	面包
ef8a0ff2-4bc6-4c5c-873e-f7d30df45a05	hsk3	面条
83c562bd-df59-4758-a92f-f04e052f1c64	hsk3	明白
834cab7b-c359-4451-8a86-d33c38d563c3	hsk3	拿
8b45d2aa-599b-43c3-aeb8-c4100825f92a	hsk3	奶奶
710ae67d-fd52-46b6-90a3-016be101ed1c	hsk3	南
9c34e8c0-5694-4c93-b29a-641b58890378	hsk3	难
5d225608-6abd-4827-b06f-410205b76458	hsk3	难过
ce8ac6a5-41e8-491c-b6f7-7d9b0a1c2b21	hsk3	年级
a2df4c48-1658-4eeb-acc3-673e719fcfdb	hsk3	年轻
07f5651c-0526-4404-af01-f5a22083c8a4	hsk3	鸟
1243f346-3eb3-4b51-9cba-dbfba0d169e5	hsk3	努力
0cd09b0c-6dc1-4750-bada-92fe367ed8c7	hsk3	爬山
498ea025-ea3a-4002-9c11-d2e70c9fe6b1	hsk3	盘子
1eb43c42-64c4-40fc-827c-f9e9be408a39	hsk3	胖
d6990ccd-1e02-4988-b03b-091300fa17d4	hsk3	啤酒
9e0b5a9f-e06f-45eb-b199-7d83f60e020a	hsk3	葡萄
495af38a-78d4-4c7e-9fbf-633a17edb748	hsk3	普通话
154e1bc5-21d6-4886-8975-f0f39adae3cc	hsk3	骑
9b06b97a-052b-4d95-ac79-d6b2f89914b5	hsk2	吧
82337f7b-af46-42ae-b0bd-3d0069541b42	hsk2	白
a5192bbc-97dd-4069-88a9-62b87698bf94	hsk2	百
c4a00b2f-4a64-414e-9003-526a3b6e811b	hsk2	帮助
db057006-94c3-4964-93af-6ebec404cd6c	hsk2	报纸
97c01f33-d0f7-4099-8c00-72de8ade50e8	hsk2	比
47e78dd4-396b-4c4a-956c-1f3fd808d53e	hsk2	别
5fb5fd2e-df9b-4e6c-b18e-51dfc4c56f8c	hsk2	长
185465cf-d4e9-4f48-a7b9-065802ae403c	hsk2	唱歌
7f39eb51-9508-4304-8beb-7502d313eda8	hsk2	出
5c42336b-a034-42d3-a7d2-cb7104b63ee2	hsk2	船
eed20371-4b9c-4e38-9aec-053e389e2cab	hsk2	穿
e43f47ff-0bfa-4dba-81e0-829d4213b9e9	hsk2	次
f176c7d4-6009-4f45-85dc-b746bbb2a38f	hsk2	从
a3ae8f15-a4c1-434e-bff3-3e72d0ede0bd	hsk2	错
30fb2662-5e45-4217-a86e-48efd81765d6	hsk2	大家
8e48a302-e81f-47dc-8cdd-c222f9caa723	hsk2	打篮球
a3ee6ddc-ee1e-46a0-a14e-4d5a198878a6	hsk2	但是
e9df3b8d-5adb-47be-8166-945980265f08	hsk2	到
5b932116-a365-4c5a-9991-8d5e537ee45b	hsk2	得
076c08c8-a78a-472f-b88e-400c85dfa07c	hsk2	等
70f0cbf7-3d57-4467-a90d-08aaadbc039f	hsk2	弟弟
bc82d21f-e99e-418a-83d1-bd1d68ea9d75	hsk2	第一
937ee958-c04f-45b6-a4a5-228d6a177345	hsk2	懂
d7d13ce4-b472-4ee4-96d9-5aa23c14dbe8	hsk2	对
df87b1e8-2e0e-43b7-a321-db7e809df153	hsk2	房间
037acb80-ced1-46ab-b79a-9ce5051331fc	hsk2	非常
0a5bdb2e-222c-4168-aa26-6ea84c048994	hsk2	服务员
22a61955-392b-44bf-928a-ccc48fe04029	hsk2	高
c9279b54-8ec8-4508-86a6-03cf9fc198f3	hsk2	告诉
3e7380cb-1f17-4cd7-84fe-994e77675b65	hsk2	哥哥
d12e08fb-d1da-495f-ac47-48bcd1a9e4bf	hsk2	给
7cd01a58-9be7-4c99-8cef-d9e1ff1c0217	hsk2	公共汽车
64843b1d-8ce2-4e06-85cb-e7b9069572e3	hsk2	公斤
311034b8-85fa-44b7-8179-df8da52b8aa5	hsk2	公司
4d607214-9dc8-44d7-a2de-3d0a5c3a7953	hsk2	贵
bd16a338-181b-4323-8270-5738fe45b425	hsk2	过
987e8049-a1f2-42cf-b668-68f2d3285b49	hsk2	还
8c429463-4396-4ccb-9652-cdd3fe5f8d3b	hsk2	孩子
a2681f7f-c0ad-4f14-9e5f-78afafcdc95f	hsk2	号
617a8af5-a165-40f1-a692-7c5d76b05493	hsk2	好吃
74bc3dce-03b3-4ef4-8f31-fe491f52a71f	hsk2	黑
8a1f997b-dd8f-4851-86f5-3fd8f19658fb	hsk2	红
7db100ef-97bd-40f6-ae90-777586962fb0	hsk2	欢迎
669772df-4b1a-4ad5-96c0-ff0d30164610	hsk2	回答
11aba9f0-e632-498a-ad39-621f9a3b4320	hsk2	机场
92d50c54-abbd-490e-b358-a96fc05b2b86	hsk2	鸡蛋
8089fb81-065d-4bd8-aeb6-8c4630887f16	hsk2	件
9c47e44d-d7bf-4d85-b3f4-30b91f9d36c3	hsk2	教室
dbfaf89c-618a-4858-912f-964db08918ea	hsk2	姐姐
84e525e2-1777-4ed3-aeff-0ca9160ad9ac	hsk2	介绍
08af84b3-f795-43cb-a1cf-df2ddb6b0177	hsk2	进
169d79e9-8a19-4d95-a12b-16690ec42409	hsk2	近
3219e558-2e08-4e3a-b38b-5a345d323cfc	hsk2	就
230b0925-f014-4648-bf90-44f34cfab575	hsk2	觉得
80c59257-2129-4950-9665-fcaf55d602e3	hsk2	咖啡
7a9015cb-9a9d-42b2-a5d1-e4326787bc58	hsk2	开始
492b2e75-87df-4114-94cc-aa4c1d7831d1	hsk3	奇怪
52b4bc8b-93ea-402e-9537-d0c68a6f55d8	hsk3	其实
2a18b364-7e73-4ca2-89db-8b88b22e3389	hsk3	其他
025c3921-94fc-4c25-b1bc-4cfddcb4c71f	hsk3	铅笔
577ebd34-112c-4fce-b8ec-1c65c93581bc	hsk3	清楚
f4aa98c3-1174-476b-ac89-e4bb612b1855	hsk3	秋
6e79b550-6b38-4c00-bb04-d073dd9ebb6b	hsk3	裙子
351c29a2-3f39-4c57-b04c-d66c77e1461e	hsk3	然后
03eda453-24e2-4453-93bd-a3f695a9f71a	hsk3	热情
9082019c-4fff-4617-8d93-581b83df71b9	hsk3	认为
ba409304-6b31-45af-8577-14fc5255d5e7	hsk3	认真
21580952-b8a3-459b-b6d3-fad32e1d3338	hsk3	容易
0feedd03-3e01-4623-91b9-4fe7bcb5bc0d	hsk3	如果
a50ee652-a4b8-47f1-acc8-abaceb3ac1ca	hsk3	伞
368b7e34-baeb-4a40-b194-c7813d5395e7	hsk3	上网
294a66a3-5377-42f1-8f07-5fc334c3c4f8	hsk3	生气
73d64344-e952-4cb6-ac77-007603b0f5c8	hsk3	声音
9dcd04c7-d3f1-40fc-9c93-66504728e7ad	hsk3	使
22358b0d-e4e8-491c-8e29-5861856826af	hsk3	世界
53fa3b40-5aa8-4dfc-bc6d-009f2fcd8799	hsk3	瘦
b1d6d08b-aac9-4d21-b811-ec36680e7b6c	hsk2	考试
1e900b88-7e8a-4ae8-a87d-66fd1de9ff1f	hsk2	课
9a44b6e6-fe74-4795-9321-0c164c3cfb25	hsk2	可能
0c089d50-d862-4a66-b5de-826a26edf364	hsk2	可以
26e98a5f-b09a-4a6a-ae34-e85bd0edd001	hsk2	快
f62ee5e2-c100-4f91-9a0f-e9ad328e6efb	hsk2	快乐
7e63b866-ef41-4258-b60f-0531b19fe06f	hsk2	累
42720b28-e7db-4a93-a781-a73f9bec316c	hsk2	离
1ceba4b4-e3c2-4904-852b-26d82938b3c7	hsk2	两
e4b78dca-323f-4b24-abbe-b94311a21b9a	hsk2	路
c4aafc85-f187-4915-b7ba-36b17765ccd5	hsk2	旅游
fb86b82c-f756-4028-9519-b29e85e88d1e	hsk2	卖
6d6cf5c5-d46d-4884-9721-1bee342e7f89	hsk2	慢
26850986-0f3c-481a-85da-c66303b6b20a	hsk2	忙
59e5c245-c1ce-4dfb-a297-3725999466f8	hsk2	每
063be81f-57e3-4793-9e1a-0a5ea9f6ddf4	hsk2	妹妹
b6ccc04a-11ce-4bf5-8def-eeefc1477462	hsk2	门
9b299779-ea38-401c-8bbf-2a20772c48f4	hsk2	男人
3c4c2154-a953-4fc4-b308-2cb453e0f34c	hsk2	您
03ab0e5c-a512-4c58-9329-ebe55581dc7b	hsk2	牛奶
e6712d4d-0e7d-44f0-8454-712e674f4712	hsk2	女人
8d1d241e-601b-4fa0-bef7-30c5f9a5409b	hsk2	旁边
e27d0970-4286-4a83-b552-c872f10c26ce	hsk2	跑步
dc539e84-8fb9-4fad-b638-1b90ef40bbce	hsk2	便宜
fc11519d-13b3-4937-b605-18ebb12de6bb	hsk2	票
6b958cd2-a1da-400b-90ae-8440d75061ab	hsk2	起床
37d4e042-6d70-49be-9821-88c2295e4ff2	hsk2	妻子
b84337ca-ce14-4928-8020-55de47d443a2	hsk2	千
a33604d4-1156-4a49-94c2-c84967f652f1	hsk2	晴
9a4f2064-abfa-42fe-98c1-508d7807d99c	hsk2	去年
8b0f0d95-5d9a-4386-8987-b5fac626ee14	hsk2	让
d56e0ec3-3479-45c9-af52-7cb6a2724da5	hsk2	上班
cd095e45-9c09-46c1-aa1e-28de6c055f89	hsk2	身体
9fe4573c-b74c-4ac2-bcfe-9b70977015c8	hsk2	生病
6af665b3-87c3-4122-b816-f797b0de3777	hsk2	生日
110e9065-8c2b-4375-acdb-c52e6a20de4f	hsk2	时间
55f69449-a1a9-4ae9-9b2d-86d003c6be00	hsk2	事情
b70c6022-a3a6-41fc-a4a3-30795a60cf7a	hsk2	手表
8e1781b3-f9d2-461d-8c9f-f06f68ce0790	hsk2	手机
b61d74ed-e162-48ac-993f-ef89428c1cb3	hsk2	送
479064f0-ccd7-4c82-96bb-e98ac9c34af3	hsk2	所以
778d925c-90b3-41be-b264-ed60fc4c3127	hsk2	它
795552dd-78dd-4941-835e-dd47ad937524	hsk2	题
0415bda6-2f1b-45da-9102-e63974cdc793	hsk2	踢足球
8797365b-5017-4016-8509-554f532ff87e	hsk2	跳舞
6d320d00-296e-481f-b467-107fdbfcd726	hsk2	外
c6bfef14-bae1-4bc1-8d2d-7ae75da663e6	hsk2	完
d5cd3a83-6aea-4ea0-8b8a-81e042d4e507	hsk2	玩
c2ae987a-1815-47fa-8cf6-01a1d03d01cf	hsk2	晚上
180ba2ea-b885-464b-ac64-f8b9b403c3dd	hsk2	为什么
6d3637f5-658d-4ef7-b57f-731f909ba6da	hsk2	问
7a58bc3c-0b76-4b81-8ea7-5bdb3daeb7d4	hsk2	问题
e46724c2-5bfd-44a4-a32a-c821c2aa756a	hsk2	洗
88084df2-2c4a-478b-bca1-c0bd8f567247	hsk2	西瓜
6d8cd891-d706-4517-84a9-75c763fe25df	hsk2	希望
78fe7cf4-ad5c-495a-8182-e2eff3ac40e8	hsk2	向
623daa44-d16c-411b-9a5c-788b85647165	hsk2	笑
ed03d2fd-fe51-4c31-8daf-8f11d4a43908	hsk2	小时
eb87d7ea-8d4c-43a2-bb21-52518444ba23	hsk2	新
ab34d7d5-a454-4ce7-a8a0-994ece7aa6f7	hsk2	姓
4dbfdf01-72d8-4e8a-b5af-3ce2aaa1ea6a	hsk2	休息
c2fd49ae-de53-43b1-a61b-5c1c6f89bed1	hsk2	雪
14554470-a9c7-4278-8103-090344a50692	hsk2	眼睛
617147e8-4341-4f95-b3d8-426725e170bc	hsk2	颜色
f41bd759-4bfc-4754-8ccf-f65137ec0cd7	hsk2	羊肉
ab252016-608e-4985-bdfe-839860808560	hsk2	药
7d6c150e-9dcb-4cc9-b00b-2ac68292239d	hsk2	要
169d50c5-335c-4260-b58d-7c5426c9b0b3	hsk2	也
07736451-40fe-4b16-a5d5-2d64aa449796	hsk2	已经
fdb35616-eb8e-4b54-859b-be94c781f76b	hsk2	一起
0bdce818-8d6b-44f1-bed7-a754b9c69610	hsk2	意思
21b494b3-4594-4829-9d1e-610ea7fdafae	hsk2	阴
86c01742-1e5c-4f64-a5dd-2183c790a49b	hsk2	因为
44e875af-0f60-433e-88b0-9ee0afea5fbe	hsk2	右边
4c9f201a-d0d2-4a21-87d7-724aced675b7	hsk2	游泳
6c2a7dd4-1701-4533-a304-97b1a8d9fa42	hsk2	鱼
e78a258a-3540-4157-97db-4db7aca3b89e	hsk2	元
7ff9b39f-c61a-4113-86d4-472e8e6c8d84	hsk2	远
392435fe-84c6-4174-b93c-48f01de54d46	hsk2	运动
1a1065d5-fdfa-4bc2-bbc5-d2360160991e	hsk2	再
7125a8e8-2736-4216-bb61-69656f721658	hsk2	早上
0c175700-bdc0-4490-b6e9-6163491cd213	hsk2	张
99bb21cb-d133-4418-8516-7dbccd06b2bc	hsk2	丈夫
707a97c9-e971-4975-bee6-062a33579e6b	hsk2	找
13e8e5bf-94a3-4cf0-acab-99807ed9348b	hsk2	着
b8625971-f6f1-42dd-a4df-b79259f7e21d	hsk2	真
915d4a3e-1226-445f-83bd-f1bb2d9ac11e	hsk2	正在
c5c4646f-44c7-4a36-b8cf-799eb303cbda	hsk2	知道
041a22e6-67d4-43f6-9f1e-a7a48aa40654	hsk2	准备
3e0c66ed-4f15-4109-b21d-981398b6a31f	hsk2	自行车
c7a81983-f0e5-47ca-b76d-bebf6e1d2b07	hsk2	走
5a8e784f-2230-442d-ba24-0aeff7b4a4bf	hsk2	最
8d21f4c0-a24c-4ef7-ac17-b326e3ea85eb	hsk2	左边
619e1b61-2918-4a32-9c55-c2a4609103eb	hsk3	树
5ab0524c-8a31-4833-821d-119082144181	hsk3	舒服
c2431110-776c-4d4c-8fb1-fad0f5733f13	hsk3	叔叔
9002b48d-e76e-44c7-b315-882026bd1111	hsk3	数学
b60a3580-0098-4e24-b0ef-4343cb781f5b	hsk3	刷牙
f0d3465a-e383-4d79-aacf-282e4e361a54	hsk3	双
8c5bae55-61f7-46a2-ad3f-6d04ff2236a2	hsk3	水平
9b9be4ed-d309-4681-99ea-865d6df3c4b1	hsk3	司机
84ca9c82-8362-41e8-868e-e7a83042e15f	hsk3	虽然
3d01221f-0108-4bbe-9b05-e0e89c17bbbc	hsk3	太阳
30fd71e8-5e6d-4baf-b6a1-bb39d5ed6569	hsk3	糖
a0d2b42a-2f23-4150-b4a2-7099a5797016	hsk3	特别
6ce1448c-95ad-491e-9579-ad92439bacee	hsk3	疼
d2ff37ba-3935-418c-a88c-30767775564c	hsk3	提高
89e64d0c-42cf-4724-918d-16e4027d4d19	hsk3	体育
aa675cf8-77c8-4e5f-95e7-416cdb282e52	hsk3	甜
ac3fdc52-6b6e-4b10-8a25-787194ce4cbc	hsk3	条
dbacf08e-b1ee-466f-a88f-45448ca74f22	hsk3	同事
fb543533-f694-4e1d-a035-8760eab6cdc7	hsk3	同意
e6b62eaa-2a97-4f1d-ac5a-f8f484c8c1b2	hsk3	头发
d495b475-aa71-4556-ad98-0712eb6e0a4a	hsk3	突然
ac3fb4ab-d87e-42b8-922f-28e9cd8163c3	hsk3	图书馆
5d8bfc69-0962-4e8c-a96d-d5e7e5676cee	hsk3	腿
b97af243-7f8c-4371-a26b-04d3bc6fedcc	hsk3	万
7f997d8e-5421-4bf5-99ee-d60a1d6148fc	hsk3	碗
3b57f6ec-7d33-4080-b0a9-4047a1861486	hsk3	完成
a161a89d-fb3d-4669-af40-e8b4e56a14f8	hsk3	忘记
324469e8-5840-43e5-b207-13d58ab203da	hsk3	为
30680d42-794b-470f-86fe-bf430bc2eb41	hsk3	位
956cc0ca-a738-42de-a564-a24486044e7b	hsk3	为了
4d97d53d-fc49-4fb9-9f19-619389ed6159	hsk3	文化
59e81a96-1e96-4c82-ae23-ff1c61567085	hsk3	西
405488af-ff4b-46fe-a4e9-1c3d8f251dfb	hsk3	习惯
a7258174-4a79-4990-a37d-b64f706ae7e9	hsk3	洗手间
6ee97fcd-0753-4a7a-9573-998e899272ec	hsk3	洗澡
e4649286-5c90-40bb-b51c-fe55fc84b1fd	hsk3	夏
340b1091-a6e5-45d3-9d1c-8865600235c4	hsk3	先
c1797baa-a5af-4078-b61d-a65e8fd9893c	hsk3	像
36e3be08-18d9-4aa1-b83f-eb4ee9ddcadc	hsk3	香蕉
03891e06-14af-4e2c-9803-f68914048e87	hsk3	相同
021031d2-bb68-49ef-a64c-d285b01f474a	hsk3	相信
97ac716e-402a-46bc-aa7a-216a59ed03d0	hsk3	小心
9e423f02-41a1-4857-a831-1602cbd0b227	hsk3	校长
033cad50-f36e-4e3a-a911-b9d0ca7bea5c	hsk3	鞋
cf498978-797a-46f3-ad77-5e5ef2df8580	hsk3	信
dbeea4b6-1431-44a6-be78-c90dca221850	hsk3	新闻
0f8ede42-b071-4b84-af1b-2c2bd76b710d	hsk3	新鲜
3a06dd6b-fc10-405e-85c8-79abcbf97e6a	hsk3	行李箱
1c538755-15f9-4923-9b85-c6f9241b069e	hsk3	兴趣
10ef1cf8-6841-4047-b436-9cf41ad321c0	hsk3	熊猫
733c9b2a-0429-4ebe-89d8-0487a1f25e94	hsk3	需要
45fb695f-fc0a-4906-ab3a-500219d87bbe	hsk3	选择
b01076c0-22bd-4600-b714-dffabc80f908	hsk3	眼镜
740b94b6-8711-4220-83fc-9c76c9b3a6ba	hsk3	要求
894138aa-f0bd-4c11-a9b6-8f76b089acfd	hsk3	爷爷
db52a70f-d559-40ff-9a98-323201780397	hsk3	一般
7af700b4-0a89-4595-a76b-5ee455a92260	hsk3	一边
e0c36e7f-05a1-4753-b19d-04dd6966fe57	hsk3	一定
51af5a6c-f029-4271-b92c-d94f9f5aef35	hsk3	一共
0c428d03-379d-4f3c-9be1-1353d95b0884	hsk3	以后
a7ee1637-7f84-4165-ae68-a5b74ffb2bf7	hsk3	一会儿
73552b34-75b6-49fb-b15a-ac412dd0b95e	hsk3	以前
3b6d6c88-9d2b-4113-a1aa-061034af5f3c	hsk3	以为
38f58c9d-45ea-4a37-8e3a-23bbacbd9861	hsk3	一样
d722403c-81a9-45d4-8a2f-63781de87a6d	hsk3	一直
bbcd399d-cdcd-41b0-aeb4-0974ba4b8589	hsk3	银行
10bddb47-e434-4c3c-bf51-ac5507afbc10	hsk3	音乐
0626446e-e661-4fd6-b9ca-e989c767075f	hsk3	应该
be667e02-a778-41cf-88e9-97137f35432b	hsk3	影响
a1d83ac7-ea7c-44ac-bcd2-c53603a463fa	hsk3	用
14da9927-e639-445e-9dbf-ce1ca4700ad4	hsk3	又
bdd6470e-98fe-4dfc-9ba8-dabaecc0ae2d	hsk3	有名
1f662396-afe3-45da-a259-65d3ab97f36c	hsk3	游戏
583329d3-581a-4a8a-8054-ea96d55ea29d	hsk3	遇到
e7c11820-6601-42b6-bc71-5be9cdd49b15	hsk3	愿意
74b08b50-9dc8-470d-9ce1-b62920769f68	hsk3	越
c4da9692-918c-4ce8-a369-fe6194f79451	hsk3	月亮
d6768702-89c0-4839-8435-d0c60fd85ae9	hsk3	云
bda0d364-d289-405d-bd8e-1919fbb07793	hsk3	站
3ccf44bc-03df-432b-a318-b57e4a84ab27	hsk3	长
4a6d16e5-811d-4632-a850-9d94c615752b	hsk3	照顾
02267b1d-62c8-4492-9ae8-2f3dc2a9831d	hsk3	着急
a40c1d72-7d8b-4b5c-98aa-428e2f637eb5	hsk3	照片
db57d7df-197f-4d26-b407-094a6b47723a	hsk3	照相机
7efa2051-9fdc-47a7-93b1-ae1ebab22ec7	hsk3	只
05985b9c-c0f4-4d8f-8a48-c2675ab1d4b5	hsk3	种
73fd4c82-80ca-4344-9a32-92b8c90f36b6	hsk3	中间
1a479b02-8d98-4192-9f53-dfa60492a2ad	hsk3	重要
f9e390f6-a005-4482-9fb3-96143faaddb6	hsk3	终于
7593a4fc-a868-4f19-888b-3adcb24b2601	hsk3	周末
ffad0e60-637e-47d4-89f1-7d5ec08947f8	hsk3	祝
c8816b25-5d46-4a8b-8635-1ffea95ec948	hsk3	主要
39273597-3ae0-4984-9c01-27decd1056db	hsk3	注意
d25dc5b1-85f6-4aa2-851e-10771119fd2d	hsk3	字典
24abbacc-71c2-4cce-a4fc-f1f06f5ae872	hsk3	自己
8f8bc857-aa5a-41e9-a7a4-75a9b1c01ce8	hsk3	总是
f061d4da-f14e-41c4-8711-4be48ce5d0da	hsk3	最近
8ffa812f-1098-44c0-b316-733f3c10fe05	hsk3	作业
5e747144-cbda-4182-aee7-1d1a538166a9	hsk3	作用
85abfcf9-fcdf-47dc-9370-26f0351a4c08	hsk4	爱情
43438e48-3e4a-4264-911f-a1dfb3ce8fa4	hsk4	暗
d53f2092-63d3-4a31-b117-6d2a42c900f2	hsk4	安排
3c6d9a32-138a-49c7-a2f9-5194f4589541	hsk4	安全
9d57a753-cda6-4399-8641-dbec5dcaf426	hsk4	按时
6d40da4a-bef2-4ef9-b401-caa5a8039e9e	hsk4	按照
35936fbc-7268-43fe-ae18-6462c40dc75d	hsk4	抱
2f84069b-5fc8-4e80-948d-1ac558351f90	hsk4	报道
adda2ed0-1442-44a6-8f36-d8c45361a696	hsk4	保护
a80038fb-3b1a-400a-a425-cae5ac7750cf	hsk4	包括
38f21b14-a660-4d20-aa92-4bebdf61fa90	hsk4	报名
ac48f72c-38c1-4cf1-9e7e-ffa6d731c6e2	hsk4	抱歉
105d3a90-90ae-4149-be2c-4182bf520103	hsk4	保证
9df7e400-a613-4a17-8403-8342c4f558b1	hsk4	倍
081c5ccc-87c9-4529-8fdd-bace3c444ef7	hsk4	笨
8c3fce0c-4a41-4c71-9e0d-b70623f35f4d	hsk4	本来
f8b8ac8c-1a58-4766-883b-3994b14f1c34	hsk4	笔记本
df8a2e46-3c87-4618-b511-3979eb1c827e	hsk4	毕业
d4da3401-8bac-4bc0-971b-40dfbf8b4629	hsk4	遍
5d2f4c43-7e99-477d-a936-d5b497d5f160	hsk4	表达
8eebbd21-dea3-4a85-92e8-0c1eab5fea02	hsk4	表格
3b9b0e91-9454-404f-9e81-9d01e657e98a	hsk4	表扬
dc8b7a5c-8f01-4a02-a1da-c00436523567	hsk4	标准
e59720d2-c9fc-4544-875e-efe921a3632d	hsk4	饼干
04fd73c4-29e6-44b3-94cb-9891ccb23dbc	hsk4	并且
f9329a5b-41cb-4c25-9853-4e9b08b75851	hsk4	博士
6dd87499-8cba-4c66-936f-928a9d6cecb8	hsk4	不但
091b3e21-dcc4-4762-9a25-8763dd037e36	hsk4	不得不
e419bd99-c40f-40a2-baf1-f1e9a51ec291	hsk4	部分
689adf9b-82ec-4711-946f-cc2b478ef1ff	hsk4	不管
9c4001db-94c3-4cde-9ddf-e9c7f1496676	hsk4	不过
c29fe1c2-dd68-4d77-a63b-44e9b7cf8cb2	hsk4	不仅
cb49d613-6350-4080-8cbe-088e8db30252	hsk4	擦
85187949-e4ce-4676-b705-228669663b34	hsk4	猜
fd6791fa-d027-4bb9-a7bc-9417cf977383	hsk4	材料
1cd42291-018d-4c8f-a0d8-c50dba1d3470	hsk4	参观
137201a2-4340-4cc7-9084-7df2edcdec31	hsk4	差不多
74091420-8a32-4092-8fa2-ea8676395b5a	hsk4	尝
6151f426-a780-4237-8aee-560a377d4938	hsk4	场
6473645d-b146-480e-8389-3ef469ee1108	hsk4	长城
9831ae10-a218-43a8-bd2f-4cf941586541	hsk4	长江
1afb8749-720f-4a53-b96e-7a5629394cef	hsk4	吵
120ce614-3663-4b55-8206-7b952e1f80eb	hsk4	超过
34e18e89-8ae0-4b4a-8b04-470067cdfccc	hsk4	成功
de196c13-5ad6-4ecb-b92d-c6a876813611	hsk4	诚实
014ed96c-c8fa-48bd-a7ec-4eb6b942bf2d	hsk4	成熟
636b0aac-0a8e-43f5-8a5e-6c93def99676	hsk4	成为
31b2719a-bf5d-4f9b-9be1-a4b222886a1d	hsk4	乘坐
3751aa45-9f97-4ae8-b067-33435ec0a539	hsk4	吃惊
2016dd91-4484-452b-8234-7c01a8a9c670	hsk4	重新
15b3c313-98d1-4de2-b4cf-abce189ef242	hsk4	抽烟
d9ffb8f0-13ef-4738-8784-5037508002b6	hsk4	出差
15c57623-cda6-44ef-bf23-99a003fe0d8f	hsk4	出发
d32c621f-a8a5-44ee-a305-a7c0882bb3be	hsk4	出生
311988a3-1072-4b45-bfac-47592c085b25	hsk4	传真
ae811af5-64f7-4525-af02-49f409042807	hsk4	窗户
0704149c-b7c6-4be0-bb2c-b40f03c4d26d	hsk4	词典
aac14a1b-c84e-44bc-b398-d95cf8185473	hsk4	从来
8ce28dc9-86bc-486b-b4c0-7df57e884a59	hsk4	粗心
bcbca08e-9280-4992-8dce-6d8311f65678	hsk4	答案
4816b576-bb61-43c4-8254-ba47103e69c3	hsk4	打扮
a9252690-cf17-4fda-b85c-4d7349c0087d	hsk4	大概
f80d65f4-13f8-491b-a165-f47b0c993220	hsk4	打扰
caa31f12-9afc-4581-8811-e81b5e311110	hsk4	大使馆
66e97043-f67f-402f-912a-0fafc007b25e	hsk4	打印
9a1826bd-9a02-4abd-93a8-714b81e56cac	hsk4	大约
20210ac5-98af-4cf1-bff7-783e0674a20f	hsk4	打折
09ea76dc-24b3-4460-a1c7-413cf3761035	hsk4	打针
a9dc3ca5-fc48-46f1-9013-d7b1c00ac885	hsk4	戴
482c9c2d-2378-4241-ad61-46e4b93de91e	hsk4	代表
b86776d7-c892-45ea-8670-fd75c7389b74	hsk4	大夫
b6109371-9e8a-490a-ab0c-01c8f1dc0d15	hsk4	代替
b1b207ae-5bd4-4bbf-a9a6-226cc3700640	hsk4	当
62ec113a-e72b-47c0-86dc-8afdb6273bcc	hsk4	当地
14dfa6e6-d1c6-4168-8889-b89af5cbc1b8	hsk4	当时
bc3eb5fc-7bfc-4786-a9a3-11ab6e7bbe68	hsk4	刀
bd08b1b7-587b-4b30-a3ab-427462d3b2be	hsk4	到处
f5db3d9c-4cff-419b-b679-55753b013745	hsk4	到底
8984044b-9531-414a-a875-9f01f4432028	hsk4	道歉
6f4cc69f-b691-416f-a761-a555edaf9a79	hsk4	导游
eb121fe1-3bf7-4aca-a260-d2856a407801	hsk4	得意
ac9d4a37-41ff-4138-918d-71e39448f0e0	hsk4	得
245c9c8b-fe82-4f15-a432-7ec0d5abd640	hsk4	等
015b9ebc-3e0e-4172-a9be-21df725f04cd	hsk4	底
a3a85de9-c8b6-4b34-b837-eaa651dff8da	hsk4	地球
f1201d2a-ceac-4820-9c84-5c30d238e442	hsk4	地址
46c7040c-4800-49dc-8567-1977f02428c6	hsk4	掉
818b2f10-f86a-4023-b94f-dd652848cf2f	hsk4	调查
426b683d-da20-4cae-b2fe-f94e7094fcd0	hsk4	丢
744729d1-8b31-4a34-ab6f-eb6cbb5ad436	hsk4	动作
4b6838d3-5834-4535-bfc9-2fc762d42f4b	hsk4	堵车
867bb557-d56b-42ed-be14-ad1ad606a937	hsk4	肚子
4f837a91-0b63-468c-a06c-ce9eab7a9cc2	hsk4	断
aa631351-618a-41a7-9813-9e83d6f14dca	hsk4	对
6b5e6ca6-1976-4ad8-90fb-8961dfca17fc	hsk4	对话
e4307642-2123-49aa-b35d-b3f07a27ebb3	hsk4	对面
d3da01e7-9bf6-4bf7-bb41-b70efe01e484	hsk4	顿
16328b58-5a4f-4337-a998-a3d4dc0b5072	hsk4	朵
beed50ee-6ec5-4f4f-b31c-d773df0ec300	hsk4	而
6dca80c8-0c50-4967-abd1-498fa001639e	hsk4	儿童
faf84dba-18de-4708-b80d-d2b83142a5c0	hsk4	发
f9f1c70e-9479-4df0-85b6-62a16457ac1f	hsk4	法律
2514c352-1cdf-43f3-9e63-973cc59e29f4	hsk4	发生
4e566bdd-33f4-4222-9202-93d6dc9c8c37	hsk4	发展
3c6efc49-badf-406a-a456-8cad7737c142	hsk4	反对
d7e018a5-0747-4163-877a-e8f5fede8da5	hsk4	烦恼
c4342e5f-9912-47ca-867b-89daa7eb25d6	hsk4	范围
c2290645-d08f-496e-9330-583fa8cc3075	hsk4	翻译
8b63f08c-ffa9-4c13-896d-706de2c37bde	hsk4	反映
83617155-acf7-4f4a-8b6e-f2f81ef1ca3f	hsk4	方法
ecc8b6eb-a5e1-489b-a404-dd2993b39433	hsk4	方面
b9d081ad-9918-47e3-940b-6301db5ce738	hsk4	放弃
35538756-0534-4aaa-ae74-f2ccdaac7957	hsk4	放暑假
2343b23b-a0bc-4a90-8849-c2b95ea3c59d	hsk4	访问
9b13abb1-a050-419f-ba5e-dc1125b6ae94	hsk4	方向
8267fe38-6ec9-4536-bc70-7d1f5bfca4b6	hsk4	份
d9afc33a-e4df-410d-b9e3-9e4c9291f8ef	hsk4	分之
3b50f185-86a1-4f77-bcc6-92f0c3862341	hsk4	丰富
aad2756b-0318-4f1d-8b10-7d927851d6e9	hsk4	风景
c44bfb43-a5d6-41cf-84a5-e3bf102899d2	hsk4	否则
2eae14e7-3f41-489a-9ed4-3e869347e766	hsk4	富
739dfa9f-a4fb-4494-821b-dd1bfbb33df4	hsk4	符合
76fb1cc0-5d18-481b-b917-688bb6fb38c8	hsk4	父亲
afdd9bae-41f0-4d55-9543-7c6bdba76fdd	hsk4	复印
1abce92e-ae52-4a35-9a9e-9fcff50a6a8d	hsk4	复杂
f15459fd-9431-437c-8787-dfabe1645173	hsk4	负责
5591378b-f510-4493-82cf-ad08bc62d8d0	hsk4	改变
ca916086-6a19-44d3-90b7-d080987fb3a5	hsk4	干
fc24c8b0-56fb-477c-8087-5afbf7073eb4	hsk4	干杯
0e3ce024-1d1e-4400-8fa4-3f6c1389ee99	hsk4	感动
25cdc041-8831-437c-9338-0473cd62e56d	hsk4	感觉
d14a4d8f-536c-4ff3-b790-006c8f0e7feb	hsk4	感情
1d85bec9-14fa-4f18-80c2-4fabc87928cb	hsk4	感谢
5362895c-b573-48b6-bd1d-97ad732d968d	hsk4	干燥
76e7e12b-aa72-4d68-a2ce-d5f75c86872c	hsk4	刚刚
01718cb3-937e-47fe-bb0f-d358fe751ffb	hsk4	高级
b038a686-db83-4505-a23a-58180cfe7b3c	hsk4	各
aa3f8a1e-73f2-4d33-a3bd-17c702d707e0	hsk4	个子
ead0927c-8140-46e9-9965-62d5a6707330	hsk4	工具
94d7c3b4-a7c9-4d17-a8df-ba59f71a4198	hsk4	公里
a4145d53-4ded-4703-a943-4ae128e7586d	hsk4	共同
5d8ed8e5-6ff0-464a-aafa-4f6904e032f5	hsk4	工资
67c03ada-16d5-4f32-8472-4d3524fa4abd	hsk4	够
b006a91e-9bb2-4031-a826-c0c3013a70e1	hsk4	购物
78939abf-e81c-4e96-a438-0e55da497a30	hsk4	孤单
6c01e471-f85a-4a47-b710-686bbe2817de	hsk4	估计
0428487f-a9e4-4f22-89eb-dbf8737e2fd1	hsk4	顾客
9bd2aac8-522f-4835-9c59-73196f270146	hsk4	鼓励
e4113635-a340-4a4f-b0f5-7190b257f257	hsk4	故意
612b40be-ff31-4f9c-b819-4f75e4d7e0e4	hsk4	鼓掌
8abcfdea-30fc-430e-baa8-55ae0e4a9219	hsk4	挂
7254d235-0fd9-40ac-a703-f5cdcc125228	hsk4	关键
822986b4-c859-4475-aac4-3fc0d8abe2cd	hsk4	管理
64670d97-f2d6-4483-ac7a-90c352be6257	hsk4	观众
5d029fa9-e867-49f0-b18a-2bd2ef06c30e	hsk4	逛
2c1b3bee-0f4a-48c8-8173-f296abac9008	hsk4	光
63ce113d-d276-47d6-9771-2d720358688b	hsk4	广播
8d38c795-523c-413f-a2f7-b814205a8c67	hsk4	广告
7bc40a8b-0533-4baf-82e4-495d628b248f	hsk4	规定
251e9c63-a1e9-475f-a5f8-e0bd7b315a55	hsk4	过
4bb67de1-3136-4cc8-91a6-6b6beb33308e	hsk4	过程
867ced51-4579-4b49-b643-e4249323ceae	hsk4	国际
de16cea8-ab77-4989-b7fd-ff23e4584f24	hsk4	果然
49c4d66f-af5a-4f73-ba90-f567e43d6024	hsk4	害羞
218d4a4e-b316-4781-a62a-36cc01264cb0	hsk4	海洋
12e4a984-d79d-4632-b4c5-223f83e468dd	hsk4	汗
c8e33a36-75be-4b12-84c3-ac7da0208464	hsk4	寒假
b402e19b-7d74-4a1c-b414-6366ebdcc13c	hsk4	航班
4c4fff61-ad0e-4fd6-95f6-64473ab2a297	hsk4	好处
4e9f963d-8394-4d67-a31e-924bce84459a	hsk4	号码
438b9238-a897-4ae1-9de6-49b32c5f9dc3	hsk4	好像
7389e659-cd17-4f2b-b1b8-a77a45948aa7	hsk4	合格
5ee9e2ad-79bf-4ef8-8630-861953f4171f	hsk4	合适
a8e3b115-2cb2-429b-a670-80051b296621	hsk4	盒子
b29a49b7-e936-4466-a435-55703f6da6c1	hsk4	厚
1e3cc874-f91e-481a-b8e6-fe88f8752554	hsk4	后悔
c5fe0d61-efa1-41a8-8d61-ab3431ca702e	hsk4	后来
f0a18756-6b0c-4087-bd4f-8ce8a67ced75	hsk4	猴子
3afa18e6-5b80-4f5a-8893-d071e632aa22	hsk4	忽然
64a6a8b0-742d-4b4e-b49d-3c75553791db	hsk4	护士
cb8d0837-fedc-4196-bc67-423a0cd00303	hsk4	互相
766a9b1f-0e63-4801-8c22-cd0549ac1103	hsk4	怀疑
723bdf17-c5a7-4adc-9e2e-beb3abd24739	hsk4	回忆
a01cff78-0394-4a87-9071-e5bb191ec996	hsk4	火
c7f191b9-ac40-4e54-a720-f7bd7d269256	hsk4	获得
d71b0077-66e6-4668-8327-a16ad8482093	hsk4	活动
fdf30791-98eb-49f7-aa9a-ab0e3c3f0841	hsk4	活泼
86d191c2-972f-4d08-a75d-1308486af5fc	hsk4	寄
a3da752c-c602-438e-b843-141e7eb13898	hsk4	基础
99c30372-07f0-4127-b870-a0f5898f6cfa	hsk4	激动
d079d146-42ce-4075-ba3c-794b2c5bbd9f	hsk4	集合
327c08f5-3422-4bad-a85d-0ffed9d1ccc5	hsk4	计划
6fae2e3e-2f56-4e55-8feb-f93557e54187	hsk4	积极
f7871434-30f8-4b02-ab3f-72d41c35d44c	hsk4	积累
2942bfa4-0c3d-47de-a450-fade72e23f20	hsk4	极其
3e121a6e-f421-4b04-9097-2aaefdc0537e	hsk4	既然
953d3964-5b35-4b74-86cd-7acec3c55327	hsk4	及时
19b538d0-98e5-4301-b450-d854c0f8ae8a	hsk4	即使
2a47765b-d9f8-4802-8cf5-b6102715ee51	hsk4	技术
d82505b0-3a49-4a34-9263-89eec13a4958	hsk4	继续
d2d4d478-3e25-4642-8367-f73a46ae5873	hsk4	记者
805ae56e-cfc3-421f-8c32-d59480bfba89	hsk4	假
43b3cff2-095e-48c4-8f6c-572d887a51b4	hsk4	加班
2c68cad3-dc61-4120-8be7-9700630b8ec4	hsk4	价格
cdaf9f7e-5e1c-4583-8268-41f10c78d02d	hsk4	家具
6c6cfa4c-ea01-4983-91ac-bf73b9ad46e5	hsk4	加油站
0ebf1f8f-115b-4a0a-b766-88a3aa291c92	hsk4	坚持
d4e6c3da-4fcf-452c-a33b-57d04c1044a4	hsk4	减肥
5755d2be-27f4-4d32-a781-d8d40d26e5da	hsk4	减少
fd137bee-6588-45be-be8c-a504de9af826	hsk4	降低
6072f92a-cc25-4be7-9f99-69718204795a	hsk4	奖金
188f81f8-c469-4c08-a513-462e9ab4ba65	hsk4	将来
cf9ada6c-dd66-4cb2-a30c-a3ea3fef578f	hsk4	交
0747299d-d2a3-42c8-9425-faa282f692aa	hsk4	骄傲
5c730367-2447-4ddd-823e-d510a07b4885	hsk4	交流
7b91c172-be78-485b-819d-9953ad8e8254	hsk4	教授
7426a2a7-c2ca-4f8a-b40a-0de06b9457b7	hsk4	交通
4ac8e154-beed-4a14-8130-858a831c8384	hsk4	教育
9305784d-43a1-411c-a286-0fa8a4a4d2a9	hsk4	饺子
6859f7d6-7bce-4633-8b2b-6c4583e465d3	hsk4	结果
5a207753-39ea-4315-94fb-018a7dda1e13	hsk4	解释
9cfc40af-4513-4d33-9350-a5b3ec7612d7	hsk4	接受
841600a4-a127-4e56-9c51-b6443fde3c1f	hsk4	节约
773a8c89-df3d-4959-b918-6b32e8f9f3f6	hsk4	尽管
f645c7f1-6dae-4ca1-b8b5-4069a3aa6597	hsk4	进行
94a1fa41-17a5-43cb-a768-a07a4d2b9f5b	hsk4	紧张
7e597575-aa1f-448f-a6ce-cdc7ec70c1a4	hsk4	禁止
b27160ab-96bb-482c-9af2-7e502de39f41	hsk4	精彩
5fdfc034-0d4a-4880-adee-a9ef69780657	hsk4	警察
fb174add-5e66-4fcf-abfb-dbaa4f02ecfb	hsk4	经济
f2d83217-c9e1-4e5c-b796-4d82cb0e55fc	hsk4	京剧
bef0aef0-83a3-4d36-99e0-c81b1bf3d1ce	hsk4	经历
874f0ce3-d130-4a8a-a25b-aab4303889f1	hsk4	竟然
16378809-e829-441f-9a3b-89eea14d5f3c	hsk4	精神
c63ed306-d602-4555-b3f0-091225c1321e	hsk4	经验
1bcf40f6-cc47-48f7-b044-72308968d037	hsk4	竞争
759ee905-63e4-4e02-86d8-9c9ead8c09bd	hsk4	镜子
83b93f1f-f2fa-4ece-bc0a-de1ada08526b	hsk4	究竟
80fd7e06-2062-46d8-8f16-9310f0e6b2d7	hsk4	举办
96324f3a-f7b0-4753-a8a9-ce495cdec464	hsk4	拒绝
3dc72be1-5194-4e21-ab5d-fd335a077bb3	hsk4	距离
5a49c9bb-a33f-4fdd-ba5d-a33d5dc440f9	hsk4	开玩笑
8700e929-3b7b-404f-a2d1-c4d0d48203de	hsk4	看法
9b3e8392-bd9c-43b0-bae9-a4cb98498750	hsk4	考虑
3e741055-1e7d-4541-b30d-77e5e36e4308	hsk4	棵
5023ec20-b6ab-4425-a85f-12432d48c7c8	hsk4	可怜
38e27a69-9640-4ab4-9e7e-735dd32b1e5c	hsk4	可是
5b87d793-950c-4550-9df7-6aae90ff69cf	hsk4	咳嗽
dcc3e356-4caf-40c9-9a33-7b163ea0f19d	hsk4	可惜
7cea9446-78e6-4db8-893d-34f70ee03940	hsk4	科学
23aa522b-b226-4ca9-80ff-34f9fd177c1a	hsk4	肯定
69939bd2-e567-4379-9c31-59f386a20ef7	hsk4	恐怕
bfc70af3-8a16-46f2-8725-d871d7e894bf	hsk4	空气
106c6b1f-6443-470a-a15a-8e636daa8a2c	hsk4	苦
d2436e95-f120-4bfb-b681-3d3a1ec4bb71	hsk4	宽
a6e18540-b8ea-4c5d-8b2e-f2bd664e6a81	hsk4	困
41fa9b6e-6b0d-4422-be83-181ad8d8fd73	hsk4	困难
28321fbc-5a7d-414a-b9ee-668490e2bac2	hsk4	扩大
7d2ba326-61ef-4e00-ad0b-d0327f2bf8ca	hsk4	辣
3f9bcdda-299a-400b-8a48-c2097f3d970f	hsk4	拉
a70ae463-8b94-4fd2-ac8e-492bde778f6f	hsk4	垃圾桶
8ce9cc50-ac2d-46b2-887c-8bc33bb2a181	hsk4	来不及
5f49cfc9-d18e-4766-a400-4aaa98170964	hsk4	来得及
d9aab874-5ec8-44f3-9c1d-d4740aa0063a	hsk4	懒
4c9aab3e-a620-40a6-9e31-347d8ead2f47	hsk4	浪费
a7cd9100-b95a-41c6-8ecd-78acc8ff5786	hsk4	浪漫
9309189c-03e4-4e65-9f35-6aaf6773a5a1	hsk4	老虎
14b7b007-e85d-4039-95cc-5b5800a74b34	hsk4	冷静
968fdd7e-4140-4b3b-b0f0-732009150b8b	hsk4	理发
4488672f-f3ac-4580-896f-133014949e42	hsk4	厉害
a388af43-95d9-45c6-a100-3ba49ee50c0f	hsk4	理解
e0c7c7ba-3944-4d8e-be32-3e615bf2db9c	hsk4	礼貌
a71bb40d-03e1-4492-8cb1-1c2e6ca55126	hsk4	力气
902e0bc2-517e-4666-8510-600237378d0f	hsk4	例如
2bce5074-a481-4fcb-a1f2-c416defd0c50	hsk4	理想
3ff8ad0d-169d-439f-a395-91e61d4af3e5	hsk4	俩
014a0d57-2725-4ad5-9a2b-fee53c79330a	hsk4	连
13ce5f88-abc5-4e5b-853e-dba698467b13	hsk4	联系
74ca9924-a240-43df-a0eb-4dd4c910b862	hsk4	亮
c8d3ac3e-6188-4a1e-a7a7-e61f54a33e00	hsk4	凉快
5dc6ad33-a223-479f-b7c9-58d989daf52d	hsk4	聊天
3f5d78da-3653-476d-8546-404fb5fb8406	hsk4	另外
4d205b36-6207-4693-bfa6-ffe14a3e02ca	hsk4	留
21156d4f-a624-47fb-b38d-dfeb56c526fa	hsk4	流泪
ee7605ae-84ad-48eb-a9d2-91aa1419760c	hsk4	流利
9fde145e-4821-43c9-b5fb-0ca689b4f8c8	hsk4	流行
a5e6beb9-6a3e-4d56-9eeb-adb061f15a98	hsk4	留学
03d299d6-2c9f-490d-9e5c-b932be13bf3c	hsk4	律师
2c1f6942-f9cc-4636-9ccb-101b69d7d37c	hsk4	乱
27d4fad4-53d5-491f-b5b5-53796c8a1d32	hsk4	麻烦
7d5fc459-e1bc-44d3-8f6a-b05417385e86	hsk4	马虎
5253700c-ac0e-48e0-b6a9-17b38b9e4a6b	hsk4	满
25370e78-8467-4c6f-bde3-eae6af8a3770	hsk4	毛巾
5318c6c0-c87a-4d71-9c92-c775755e25ef	hsk4	美丽
9d9365da-7172-464c-887a-57b11c86ec40	hsk4	梦
018bbbb0-36c4-4ae3-85c7-add638fe3188	hsk4	密码
26eebfb9-37c1-4de3-b33b-4580537560d8	hsk4	免费
889c65a6-668c-4ffe-94b8-089e19037b1f	hsk4	民族
0114d85c-68f9-48d6-972c-a6084e9743d6	hsk4	目的
c0bc504e-5420-4056-9a64-7f682186307b	hsk4	母亲
f2d7a932-fdb7-44d1-9b49-8d609c89549f	hsk4	耐心
c6f37d2a-2c52-41ef-8f41-e3ffbf4380b0	hsk4	难道
d8adc11b-cb4a-4cc7-841c-53024140912f	hsk4	难受
02eef2a4-eae0-4def-b851-d97310330216	hsk4	内
92dfd5e7-44ce-4749-a94f-9cb36124c29f	hsk4	内容
3020bac0-ad01-41e5-b69b-5edac90b7c86	hsk4	能力
0a794bbb-33c8-43bb-840c-803527af0f56	hsk4	年龄
5b13af19-ac92-4da4-ab9a-25ff52ce9215	hsk4	弄
47e9ac32-d310-4e00-8c6e-6c55a4f8514c	hsk4	农村
e2b64883-35da-4091-83aa-427dc88c23de	hsk4	暖和
2771703a-8fb7-4b68-bdc2-c559d0e7f3eb	hsk4	偶尔
30ebf6f7-69e8-438e-82f8-20e58068319c	hsk4	排列
9b671c4e-bf3d-479e-a7ff-a5a74b817199	hsk4	判断
5d5b57ea-05db-4bac-a201-6e37f745ef3d	hsk4	陪
7c809c99-f595-48fb-8b75-2fa951e8219c	hsk4	皮肤
888782b5-ea08-426f-ae09-7a1b226dd7c0	hsk4	批评
833e0019-f4ab-4e47-bbf1-4699d9005f33	hsk4	脾气
48003eec-8ea2-44ec-83ee-76358806d10f	hsk4	骗
20410458-53e2-4501-9a95-cf3cfd70d4bc	hsk4	篇
2d518b4e-3d93-4a59-8b15-acc5e064b86c	hsk4	乒乓球
74282ce5-30df-48aa-b46f-69e010585ed5	hsk4	平时
17ebf333-27e0-4a06-aec0-3ec4d10e6e36	hsk4	瓶子
654a7d1b-b23f-43d3-801b-9873e300db88	hsk4	破
4eeadba9-fce4-425c-b3d5-bc1e7d63abfa	hsk4	普遍
4245e3ce-ea4c-440f-a318-33e04f15a458	hsk4	其次
26c6a1c2-ed45-43ce-8a09-a1238675e82f	hsk4	起飞
45faf9c8-014d-4ec2-8943-b7786de726ab	hsk4	气候
d9ba1c35-4fdf-40bc-a556-c06eb287d18f	hsk4	起来
51f5b6d0-6b15-44e6-9a75-d3a2574367a9	hsk4	其中
d2546927-13eb-4174-b094-8b3203adfd4a	hsk4	千万
7f9a3c4b-5e6e-4fd2-b869-8b52917adba4	hsk4	签证
25fcb584-3885-45d1-bd82-a47aed4946b1	hsk4	墙
18360178-3790-4936-9170-bf057ea89ff8	hsk4	桥
08721940-b790-423e-ad81-6f91efe6f185	hsk4	敲
31b516fe-554f-4fa8-b10b-8936b5fc8977	hsk4	巧克力
f83b7685-1a85-4c29-9c09-65f06a03e1fc	hsk4	亲戚
65c5636a-e87b-4950-8ceb-911f24397aaa	hsk4	轻
20da89c6-f0e7-4396-baac-88d4e2135130	hsk4	请假
b2dfb2d4-fd8f-448b-93cc-a8ec199f2e60	hsk4	请客
fbdcc1ad-bdfd-49c0-a6f9-c822984bb4c6	hsk4	情况
88a4279c-552a-4d26-8674-0a94df5dfcd6	hsk4	轻松
2d7836e7-9b59-4e0b-bc0e-e90a54736c2f	hsk4	穷
c9eaebb5-e98c-4ca6-aad7-8d92fe900cf6	hsk4	取
f95a3246-e5cb-4777-904b-9cbfa177fde1	hsk4	区别
aedc849e-81c7-4227-a623-a90c028c3ca0	hsk4	全部
368c9071-cb5a-4af9-ad0a-195f541d46a9	hsk4	却
f421f2c7-3488-43c6-be5d-09c26fe542a7	hsk4	缺点
b62591b0-7b43-4b8a-ac51-1116ac0b5df2	hsk4	缺少
0d599d23-7edd-4cd1-9cf6-7727e41047ef	hsk4	确实
339da27e-add7-4e07-b042-f778817f57a8	hsk4	群
8e212bee-1c47-41ff-aa11-ea18d46cad2a	hsk4	然而
760a30fd-7272-4b7a-9621-ff7f3491dbac	hsk4	热闹
6dd46e03-ea85-4cb4-90ea-e0295cb7c6df	hsk4	任何
374a6982-98c9-48c8-a6f8-6fe4fcc5a73e	hsk4	人民币
077d71c0-6dc6-4fc3-ab86-adae72eea064	hsk4	任务
883e586c-6c27-4f72-9fc9-3899d52ad648	hsk4	扔
7277ebd9-c88f-436c-822d-dca354952fe6	hsk4	仍然
ffd68095-127c-44be-95f5-ac920d11afd7	hsk4	日记
23abd0dd-a674-465e-a6e3-b8a7a43a80bd	hsk4	入口
6a48af66-b36f-4e66-9074-4d471f26f6cc	hsk4	软
8ff4f0d1-76d8-4bea-bc09-28fcbeba159b	hsk4	散步
ff8db2f0-85fd-466b-9031-da1ffef99c42	hsk4	森林
de50f004-4d3a-4294-b7eb-4d56a717f260	hsk4	沙发
6bd1ec3a-c71c-4abb-8868-15545b311fda	hsk4	商量
848bc319-6da1-4d2d-a417-767d675d67c5	hsk4	伤心
63c2c504-2b96-4084-97db-f176108bbc84	hsk4	稍微
6acfa0b1-d817-4338-927d-0d0adab6616f	hsk4	社会
bad7e2e1-f527-488e-a33a-6bf7189a3b15	hsk4	深
839ceb6d-ff17-4cef-ad54-9957668f7f14	hsk4	申请
45fbf20e-3d8d-4488-908b-1dfd7a667b89	hsk4	甚至
705b492b-d6c9-4a6b-ba4f-eb9ae90c040c	hsk4	剩
834f48cd-ef8e-4966-ac09-ffe9b9f8b1ca	hsk4	省
9d199881-d295-4ddb-a3ce-f93fa4297568	hsk4	生活
d5dbcfb3-c019-4253-80d8-bb870f0646ad	hsk4	生命
7f917ea6-0d5a-4f10-b728-929138c78cdf	hsk4	试
68938fd1-862e-4fcd-ace3-5474481c2588	hsk4	失败
d17d3da8-3f29-4a34-a39b-04b7252da2e0	hsk4	市场
73e4fb4e-2fa6-442a-b63b-cba8aeb1332f	hsk4	十分
06e9371d-fbd9-4c08-8e2c-f877c85ba4a9	hsk4	师傅
ab720c43-47f9-4684-8f44-351db2cba49b	hsk4	适合
88a3a682-aabc-422b-a87f-edba50c7b90d	hsk4	实际
90280ed9-67fb-4c93-9fb4-386f37e5c552	hsk4	世纪
8baf45c6-3416-4fd3-a1a2-d0a2770d7ed1	hsk4	食品
decb8b09-faaf-41e2-880c-93e360892cf4	hsk4	湿润
1cd9b14e-f348-4c86-8020-4d6bc7846cb9	hsk4	失望
09e1ebc1-608a-470c-bd33-0f2fb46a649e	hsk4	适应
b2014e26-524e-4bb7-8903-10a936cd9072	hsk4	使用
ee0c468e-0834-41af-b071-ac3c26359066	hsk4	实在
64b134cb-6581-4e96-a20f-958d293ad02c	hsk4	狮子
55529f85-e7af-43f7-ada2-bd070c67c630	hsk4	收
05709ea6-96da-497b-ba2c-50ad652acadb	hsk4	受不了
334b29f1-f6b3-4e2b-b939-2b23ce8db951	hsk4	受到
94acb06f-2b94-4d24-825d-bb301a458e06	hsk4	首都
50aea0a9-5593-45a1-885f-1773bd582503	hsk4	售货员
e91291bb-4c9e-4923-aa7f-de281190e7b6	hsk4	收入
5f53af69-7fb6-4d0d-84ba-fff7ecfc624e	hsk4	收拾
32a8dde4-3997-404a-8f30-6b1b0fe7ec21	hsk4	首先
c79196ec-cd51-48d5-ac33-adeaef74f1cf	hsk4	输
d7386378-6435-4f44-b28a-0e01006bf68f	hsk4	数量
1cea9ba9-3965-40e6-bcf3-fd4b2971da0e	hsk4	熟悉
ede80ac9-403e-47ca-a864-3b4107b0aaed	hsk4	数字
97d172bb-c225-4295-9a58-0666ba64097a	hsk4	帅
d57d784a-7e83-4a4d-933f-4d400104e46c	hsk4	顺便
7b38198f-9dc1-4ce5-bbf7-bbc9995f81ef	hsk4	顺利
60af81b6-058f-407b-aede-34e5351af873	hsk4	顺序
6bc4930e-e86e-4cab-89cd-31873ecd2696	hsk4	说明
3ac6af7a-e54c-471d-945b-7b45ea0d0fc7	hsk4	硕士
42bdc5b6-c4fe-4b43-bb01-7efaf803aeff	hsk4	死
5952f8d8-f9a4-4598-8eb5-c1ccbabce6eb	hsk4	速度
040d3a44-55c3-4b88-8485-bac413f727e6	hsk4	塑料袋
f585290c-c673-410a-88bf-cdcfb74a3ae2	hsk4	算
b564fbf5-e489-44a3-9564-1f1c6c01d3c7	hsk4	酸
06c3aaac-6b25-4241-98a5-bef2ea3ce2cf	hsk4	随便
a36ea65b-3431-40d1-9607-794a0b2a2c89	hsk4	随着
050273d3-230a-4712-bafb-82a2da729fee	hsk4	孙子
b71dc900-4aaa-45c1-aff1-3a14dbf994f4	hsk4	所有
06cf3bc7-b01c-4f5d-9329-94afd47455b4	hsk4	台
4d2ee534-0bef-48d2-b470-7fbb0caa58f2	hsk4	抬
7b09ba14-42db-43f6-81b4-cc0ac3d54829	hsk4	态度
8e92166c-2562-44c3-899c-371e7a6809a5	hsk4	谈
7ece2a51-8f7f-4724-a7c4-de812bf58a80	hsk4	弹钢琴
f71bbb73-a9d7-4bde-a0c4-237bcdf34ad7	hsk4	趟
07723eb8-e367-4437-8a27-36ced6d619ee	hsk4	躺
24963fb2-6ad0-47ab-96d8-07642cf2f602	hsk4	汤
b52a9334-a7e6-4f96-b820-e6e85cef06d1	hsk4	讨论
30fcea2c-63ae-4d21-b954-8613efc9954e	hsk4	讨厌
ff4e814d-d45b-4308-823e-78c27b80c464	hsk4	特点
e88aa450-93cd-485a-893a-2b380eef52e2	hsk4	提供
43ff40f9-a9a6-4144-9c86-92d3fc18c0d6	hsk4	提前
26b1c59c-072d-463f-8a58-c64fba6af42f	hsk4	提醒
967df692-9a4c-494e-803a-2580f12c5064	hsk4	填空
280ca5d9-14ad-42b3-82fb-8000994ebb1d	hsk4	条件
a1b48e35-4328-4fad-bd9e-35c15d53719e	hsk4	挺
ce4fdbdf-038d-4032-bcdb-66ee1becd455	hsk4	停止
8047ef4f-77b0-4edd-8882-c92157b04e4c	hsk4	通过
4f4afb17-fd40-4290-a62f-e6c9191e79be	hsk4	同情
b715883d-5f94-41c4-aeb8-a4d5afd9b72a	hsk4	通知
b458b0d4-5168-4762-b598-df00b57f00c2	hsk4	推
afdc5263-14de-485f-9aba-b14993d9eb5e	hsk4	推迟
c6aed24a-5709-4357-80cf-05aeb4417962	hsk4	脱
0e6d8de5-6689-4674-a463-1a716cf63b84	hsk4	袜子
6f217b99-028e-4324-b1d8-f29ca6209933	hsk4	完全
8f4a9736-72f3-440d-831f-477a0ac1baac	hsk4	往
1aaa29aa-4ebd-4679-9641-9131dc87e3eb	hsk4	网球
b412eed0-48c0-4c35-998e-2c49b1c426e7	hsk4	往往
bebbbb8e-4d9b-4dfd-9260-dc520b6ffb48	hsk4	网站
f476b62e-5ffb-4458-a31c-6d0ed86c68ee	hsk4	味道
fe78e68d-59c5-4519-a9dd-01fbf497e8cb	hsk4	危险
8425d454-e21a-4499-b56c-84f33e8ffb8f	hsk4	温度
f6d420de-5774-4dbc-8679-af2b8f64985b	hsk4	文章
1d282cbc-6225-48d7-b49c-347a016709b9	hsk4	握手
e9a58297-b943-421b-9fe3-52881c20ef45	hsk4	无
7534f495-3d15-424c-98dd-bf18c325cdf2	hsk4	误会
b1c39a2d-8ff7-411e-bb1a-5cdffd794c3c	hsk4	无聊
d9ce224c-ea2e-45d7-ac2d-aa4f037f6f7a	hsk4	无论
9de227bf-477c-4cf1-a1cc-09bdbaee1ff6	hsk4	污染
e7efd758-368b-4648-9fed-f5786ca1124e	hsk4	西红柿
414a7708-d593-46b0-a6a7-21c70a42ea23	hsk4	洗衣机
d4186200-3882-4893-b38d-e9f0dd681ea2	hsk4	吸引
02b367c0-7b09-46e4-937e-64aa7803240d	hsk4	咸
a879c7a4-a969-4975-8e6d-7c6131dd464d	hsk4	现代
2ce7d203-33b3-41be-8e5e-b06851a4a6a9	hsk4	羡慕
f9228306-acff-442a-ab5c-db17757125de	hsk4	限制
0b8908f0-b8b4-423a-8a1c-59127fa436ec	hsk4	响
5a37d99e-6b9c-4d9d-9c53-1fc3f65fcec5	hsk4	香
ef150bb1-75c5-490d-925c-4956153c4c54	hsk4	相反
61df8475-d170-468d-917b-9525424b5b26	hsk4	详细
49b30886-e7b5-405b-811c-e15151734dd2	hsk4	效果
e3ff71af-629a-4a2d-863a-30969f2c215c	hsk4	笑话
e28874b8-48a3-478e-92f8-0b6f97b51201	hsk4	小说
b4c9dd79-e461-4df9-933b-dee7cd596180	hsk4	消息
d64ee946-cc67-4513-9538-7837f24422ed	hsk4	辛苦
61282c4e-1e07-4c6d-93e8-72ceda303329	hsk4	心情
e479302b-b9c7-4bcb-8d33-ff6d61996598	hsk4	信任
48b88b7e-01f8-4426-bbe8-7729b87d136e	hsk4	信心
7ed7a3ba-dd94-41b3-8034-b7da7a39e3fa	hsk4	信用卡
fb158f51-a777-4319-af87-708c61d5dbeb	hsk4	行
00126209-365d-4afc-974c-faaa9fc055bb	hsk4	醒
d55f540a-4210-45f6-a897-c804aee87646	hsk4	性别
2e1445ea-5ef2-45d9-a601-0d528a3e3cec	hsk4	兴奋
ef1ae691-c9d1-4176-b969-639806e0f49d	hsk4	幸福
1be4b2ba-335d-40f4-9e80-5315921f0584	hsk4	性格
afd685b5-8297-4013-976a-3678f4771448	hsk4	修
b6127e70-8eb7-4c57-8a1f-cc4dbc87c835	hsk4	许多
af6d06da-d932-46ef-80f4-a0d196d3f5fa	hsk4	血
99ee5016-1d98-424f-920e-a16130abb87a	hsk4	呀
b599b09e-977f-48e8-964c-cfcc85af7277	hsk4	牙膏
5c6ff3a1-17ce-4c30-9f87-0061c8d9b605	hsk4	压力
4cb584dd-9071-461f-8a8b-f097ec55e745	hsk4	亚洲
3cd30988-e46b-45d3-8ddb-06ac2a5257b7	hsk4	盐
c30038ef-1bad-4a0f-99cc-1a99ec72782a	hsk4	演出
c5c46dbd-28d3-4f92-ad1d-587a90df6d20	hsk4	严格
eea8538f-a00a-4fb1-b932-9a23614df42e	hsk4	研究生
e70b5bb3-4006-496f-adb8-db7df38fe301	hsk4	演员
9bd8f153-697f-4123-acfa-b13823362e40	hsk4	严重
24e87d01-2a84-477d-b487-9d1fc98d6c96	hsk4	养成
5be8ddfd-5f26-4a90-83e4-ba8d1f8fac93	hsk4	阳光
8d6a7c15-30de-4610-ab29-05fb98851108	hsk4	样子
8088f4d9-6759-42cc-8d45-5cbc6664ab92	hsk4	邀请
05151a08-913a-4c1e-8bfb-19cf7236a988	hsk4	钥匙
a4a8becc-5487-4a2a-b3ab-eb8c8568d6ca	hsk4	页
d38d86bc-32ed-41ed-9bb2-6df1fcf85fa0	hsk4	也许
e5968c88-b878-4e04-a1a1-344da60dc5bc	hsk4	叶子
5f024081-92f3-477b-8bc8-39b58c19ff81	hsk4	亿
e57bb1b3-3eba-4bdd-a136-09025946ae35	hsk4	以
5d6194d1-40b6-4b9e-97dd-565dfa21eba1	hsk4	意见
94ee27ce-bda1-4396-beb1-cd5e66746e7f	hsk4	一切
5793ba77-0637-4d3e-aa4c-f719789e0fd4	hsk4	艺术
ea5e9848-3c6f-4c3e-b040-7fcc7aecf1b3	hsk4	因此
fcf2ded5-4ee7-4697-8a90-1645b1d7926e	hsk4	饮料
da0eaeab-7f87-4234-8330-12071cd728ad	hsk4	引起
7e46d1d3-281f-4d00-a9c1-a3ecf002fdfb	hsk4	印象
a207c2e9-6901-4e0c-87e7-1f2c6a0bad7c	hsk4	赢
10becb02-2a2a-4d0a-9373-1699533f0f76	hsk4	硬
1f9b2020-67f4-49d2-8210-8be4657b4639	hsk4	勇敢
a605958e-4783-4c8e-8f7c-7f6bae663204	hsk4	永远
f8515169-2ed7-40b5-9f08-84c70d8dd559	hsk4	由
727d2a99-a1c0-4876-bbac-71b9e9585940	hsk4	优点
f230cbd8-fb05-454b-a195-ecbba44ed62d	hsk4	友好
5ab676b1-2a19-4512-9743-cc574f03a957	hsk4	幽默
dff9c9ec-ddbd-4491-b127-13b6fc0a994a	hsk4	尤其
95c9df61-03f9-4c85-87f8-620cfbb6e74e	hsk4	有趣
54af0092-962d-439e-bfda-911434249cf6	hsk4	优秀
94669e1b-e750-484c-bf10-2a481fd80c2d	hsk4	友谊
aeeb3b23-211d-4f5a-a4eb-575702123da0	hsk4	由于
cb4b9eca-9338-4c7e-add1-974ae7a2dca2	hsk4	与
d23f9cae-8294-4384-b26c-18c0d7cb192b	hsk4	语法
29b1d6c9-57ce-4cf0-8b08-9050b4ee830a	hsk4	愉快
c42ef89e-458e-41b2-8d26-44f176e243de	hsk4	羽毛球
2eeb596f-5e94-4238-a6e0-47a86e0c1d22	hsk4	于是
3d92d01e-fae2-4a2d-881f-f9aca86e2821	hsk4	预习
329ebabd-2e12-4cc4-b981-6fae1a998a0a	hsk4	语言
1162795d-34ea-48b0-8bfd-32a8c51bc74a	hsk4	圆
05997f84-3b8a-41aa-8666-2288ce91ceaf	hsk4	原来
96a5d8f1-279b-4cc1-b3e2-47275ef5996f	hsk4	原谅
e9365281-08bb-4583-8872-c8f966f34478	hsk4	原因
814af766-df22-40ed-ad8a-946496aeb240	hsk4	阅读
bf3649ae-3191-4549-ba12-e948d41e4d66	hsk4	约会
eef1eed1-d4ac-4570-9b7e-5ae55a939c58	hsk4	允许
fb17fa97-6b17-462c-9080-de635d34b1a4	hsk4	杂志
3d4cc43a-5796-4baa-9651-4e465fb81d33	hsk4	咱们
43568384-1a56-4520-ac04-5576b334fdcb	hsk4	暂时
fdbd16f2-d38a-4efd-96b9-d1a16fe4ce13	hsk4	脏
125f8044-18ad-435e-b0d4-133f258e97bb	hsk4	责任
1257ad63-8a07-4d50-aa26-b77ae7e4a25c	hsk4	增加
8ee53842-54f7-4766-9bb8-3b78ab401b32	hsk4	增长
e1cb7014-f3fa-4551-826a-25e7815a621c	hsk4	窄
c0654006-ca77-4f56-8bba-dc16ea19cb05	hsk4	招聘
e6f64163-9f06-473c-bf96-785f0c492135	hsk4	真正
60145271-89ae-48da-8fda-793685902f97	hsk4	正常
242d9602-97bd-46e9-8332-f64d69054e70	hsk4	正好
d320137d-2afa-4864-aa09-b6eb51a1bce9	hsk4	整理
f74fabab-e1ec-44df-b192-4a7eb1f0a87b	hsk4	证明
19bdfe9f-d247-482b-8721-58f5ee728fbc	hsk4	整齐
c49dcfc8-c56e-409e-b340-b204114a7001	hsk4	正确
40ec3400-2baa-41c4-9580-c9edfb5c0e30	hsk4	正式
fd4ecfd4-5a82-4caf-9473-82be22095e79	hsk4	指
d3403bdf-be91-4f98-b9df-5dbfc01dab11	hsk4	之
e213c305-bfc8-4988-bc3b-f152892c9252	hsk4	只
5f4239f2-961b-44b4-a724-f3c0bf1d6e50	hsk4	支持
aa7417dc-4d26-4c02-a11e-afaf1cc84edf	hsk4	值得
c8349086-453f-48e2-ad35-ea4c9c33b09b	hsk4	只好
11573132-90c6-46ae-9d46-056329b9d919	hsk4	直接
5098a539-c350-468f-89e5-010ff3479dd5	hsk4	质量
4eb84709-ad80-465e-ae5f-965c26bdf903	hsk4	至少
215fa4e7-4e83-467d-8133-f9599e379d40	hsk4	知识
d55bb5ba-035e-4745-adc4-bddc85e8ff2b	hsk4	植物
4b02badc-5ab3-4822-96ee-e536edc322b7	hsk4	只要
9acd9091-8988-47cc-b4fd-a8a3583fb39b	hsk4	职业
ce5acad3-1c02-4b80-99a4-1af573fd9e1c	hsk4	制造
351d1ac4-48af-4b8a-87c6-800d6d192b3b	hsk4	重点
14796813-b55f-4c98-a974-59a0356694a3	hsk4	重视
47894167-a2f4-4e5b-9cdb-5dafe8ae01c6	hsk4	中文
73e7e39b-536e-43d0-9324-905909761689	hsk4	周围
09c08d40-2a96-4f00-874e-b26a291dec75	hsk4	猪
89afaeaf-984f-4307-9c6d-a7a2f0626bf7	hsk4	主动
fe2b0013-d793-43f0-a3f3-d3fd97ce82a2	hsk4	祝贺
f1486bfb-3b76-47ca-b0c8-f4587c946286	hsk4	逐渐
e664c73a-0512-4535-b389-7dd3d1e4913e	hsk4	著名
15a4768d-da7f-4930-ac8d-8d73be97a676	hsk4	主意
a5b2563c-7418-4a72-a99b-5265545ab0c1	hsk4	赚
10118753-842b-436d-b964-6e5198dc4046	hsk4	专门
28d8fafb-f12e-4cee-97ee-84a1ef3ae185	hsk4	专业
879cfeb8-f663-47e1-8ec5-2eb1a2c9dd6c	hsk4	撞
81656343-51b9-43b4-a0d3-c68ab74c8e7c	hsk4	准确
a08dad7a-5f78-440a-9208-98e612a618a4	hsk4	准时
78e43d39-a21c-4672-bcba-007f4e12ee4c	hsk4	自然
c67ae94d-97ba-432d-9ed1-3d11775d06bc	hsk4	仔细
fb5547ef-fd8e-4186-9943-98d780571463	hsk4	总结
4f66c6a4-022b-4111-83e9-452bb1f0c0fd	hsk4	租
07239496-ad47-4b9a-bdc6-dc2a4ce76c91	hsk4	组成
5d85a3a6-28b5-4ae4-9997-be70971d363a	hsk4	组织
e29d7fa8-ab75-4d8f-99fc-6b6076f588f2	hsk4	嘴
03070743-5271-47fb-94a8-5d457388286e	hsk4	最好
8413685d-02a4-4e1b-9bd7-d20b1e74c1ff	hsk4	最后
18706a0a-4151-4f8a-a1d5-21316b91f43d	hsk4	尊重
915a14c6-1b09-4b0c-80b1-5d44d3edd46b	hsk4	座
28fde940-8da3-4745-bc23-8930dd6b0550	hsk4	做生意
08620745-8a62-488e-b49f-34894e9a0eb9	hsk4	座位
35a675b8-c2f5-446f-80cb-25143704ec41	hsk4	作者
98e14b73-78fa-4227-9df8-950a7015a3ee	hsk5	唉
00ec219b-aef4-43e1-9c3f-73e8d537e557	hsk5	爱护
383fead0-114e-42fb-94b2-4895236e2955	hsk5	爱惜
2124f7c9-b80c-48a0-9880-5a77c7468c47	hsk5	爱心
f89926b7-ca7c-45e6-bfba-2002f2a01ede	hsk5	岸
b76215d3-3a44-43a1-b89f-745d3dd80559	hsk5	安慰
1655df5c-8aa6-4dbf-a5aa-9da5c16deeee	hsk5	安装
5ed96cb3-48cd-4a94-adb9-6e9fa566fbe8	hsk5	把握
54ebbf62-a0d2-4b3b-baa0-cc75b3ad020f	hsk5	摆
a65e3e3e-0411-4cac-8fff-54364897a04f	hsk5	办理
e73275e0-e2c8-4534-b70d-5d58c34a0abc	hsk5	班主任
1424e1a0-fcf8-4464-b742-27457ad815f3	hsk5	棒
68641d3b-fb13-4098-aa02-f4e8d8dc0340	hsk5	傍晚
b912f7a2-fc84-45df-a358-a78f0b91182c	hsk5	薄
eeedeb33-ffe0-4b82-8549-c5640d7e3530	hsk5	宝贝
78991a29-b8d3-44e8-b370-127639a44026	hsk5	保持
92773af1-8203-491b-95cd-f949e70ce423	hsk5	保存
8a55cba9-7dc9-4a2f-b4ad-1ea5549c4844	hsk5	报告
8a6e59e4-945b-4131-a871-f3952b215401	hsk5	宝贵
b2fb3229-0f3a-4a77-9955-e23ec9d53605	hsk5	包裹
c245a4fb-83a3-4e13-8289-a1991997d11d	hsk5	包含
92fb0ccb-ebb0-41a6-a99a-335cdb082076	hsk5	保留
cd57db93-26e8-4162-a532-6a8d4378aaa3	hsk5	保险
d0476633-da55-4bb0-a99c-fe315facbc4a	hsk5	包子
9237ba1c-573f-4e25-8f2a-f0367ecd1d73	hsk5	背
c99aa457-dd93-4805-8da3-a0cbddd959ce	hsk5	悲观
d272d4d6-b0a9-4f79-8a1c-71a70c073656	hsk5	背景
c8153f9e-3ff1-4f7c-b77a-992448691f93	hsk5	被子
93b9cc39-9881-4281-ac3a-082538a609aa	hsk5	本科
e287b295-4394-4e96-9e0b-82951401fc43	hsk5	本领
92e96bd3-06d6-4d3b-8355-fa1e95b39b5e	hsk5	本质
f00c667f-84a1-4be6-841d-5aeb2edd3a78	hsk5	彼此
efac41fc-b297-4750-aa8d-3ed0bdf3b219	hsk5	毕竟
473ee8e8-993a-4d1e-9686-74cdbbf478d5	hsk5	比例
2933d0b9-cbf0-4ded-9d85-154f9b7f1c34	hsk5	避免
c0c17f9a-ea43-40b6-bbf8-a7e4b8cf2d48	hsk5	必然
bf4e0c80-d21f-4b04-9b63-93d8de9a8410	hsk5	比如
02eac148-4b8d-43dc-a761-1b89ef6ada5b	hsk5	必需
fb4ccbed-4286-4873-8915-989dbd73b06d	hsk5	必要
d9fc6610-deca-4dbe-8097-6122babf52af	hsk5	便
eccafedc-e964-46f8-9f4e-8e26f106b483	hsk5	编辑
de845d47-51bd-4a17-af34-e80564ee6b7d	hsk5	辩论
75728089-f8da-4579-bb24-de01f604c8f1	hsk5	鞭炮
54efcbf2-597f-4b79-9eaf-e58fada52b27	hsk5	标点
ede5590f-02c5-4bcb-9157-722e7bf8814d	hsk5	表面
4a4db723-263d-4edc-9c40-eadabfa33f68	hsk5	表明
105efe4d-7332-4d0c-a873-1645aff9cb05	hsk5	表情
fd2dba00-330d-4c16-a476-2f01b88b87ee	hsk5	表现
36398194-851c-42f3-913a-075936cff599	hsk5	标志
5f3ed581-d316-4fe3-9682-0c74def38e7f	hsk5	丙
e7c6641a-dd70-460c-9d5d-0e0496365fb3	hsk5	病毒
cbbb9333-d1f4-4efa-aa20-4e80ff6e4e33	hsk5	玻璃
c4082297-d88c-4d2d-b2a6-ccd465981454	hsk5	博物馆
2fc05cae-4bcb-4800-bea2-e7d97db17228	hsk5	脖子
8a084b92-fcde-4ab8-9410-ddfcb8bc1ff6	hsk5	布
ecc0c609-f7f1-4edb-b708-033fee07c116	hsk5	不安
59237259-ce70-4ef6-943f-ffde14c07fb5	hsk5	不必
1ff26690-4964-45fb-8728-30c696684ac2	hsk5	补充
e9b34fb0-03ac-4dec-8a20-e257a5a713e4	hsk5	不得了
62603af6-32ed-4a75-9535-4233155d8d0f	hsk5	不断
ecdf390b-7767-4f92-b998-bc37984c1d88	hsk5	不好意思
990aeee8-8a33-4e1b-949c-0f142d88e102	hsk5	不见得
98699c07-37c9-4299-a3bc-4fd5f2ca0361	hsk5	部门
7dfef060-8996-4294-966a-866a80a14342	hsk5	不免
6587892f-7c9b-4b8f-ac61-3f057514a312	hsk5	不耐烦
4b2dde84-6dda-478a-a1c7-fedbeb804bb3	hsk5	不然
7725ae68-d918-49ed-a13c-e969bcf05c9a	hsk5	不如
8b221cf3-3fee-4bb5-b63e-b274412e221e	hsk5	不要紧
150e9714-7e01-413b-ab63-5fdea0819532	hsk5	步骤
9444a9f6-51ae-45e8-aee6-1e6e96148a8f	hsk5	不足
52944f15-ac59-47b0-a2e1-cd8d53958dfd	hsk5	踩
41db5d7f-2b5c-4162-b2e6-3a199e5a58d1	hsk5	财产
0db15212-8c47-412b-8187-52f898ae5540	hsk5	采访
6e06b05e-4a33-4fc4-af53-1bb0d6c0d0f2	hsk5	彩虹
deabdfde-38c4-441d-9c02-2f8826dd8842	hsk5	采取
73f35c3c-49ef-4498-ab4a-9413d619deec	hsk5	残疾
3d7fe60f-0bb2-4148-9576-cff309438a68	hsk5	参考
2f605e73-6bbe-44ee-85b0-4adafdfcb1ec	hsk5	惭愧
2031db9b-00be-4ce6-bc75-a48d0813f2a8	hsk5	餐厅
6a16197b-da06-444c-b440-3fc39cd18c98	hsk5	参与
d87f00aa-9a87-4b51-89fc-6fd898ad3946	hsk5	操场
3b572030-10ae-40e1-9b68-a5e6d4847940	hsk5	操心
f385fb0b-8bbf-42f3-87dd-1cdea3d08b4e	hsk5	册
722ed87d-09eb-483d-804b-9c0fef99b4f8	hsk5	厕所
eb50c2ad-ea60-4f61-bc16-613fa456a960	hsk5	测验
2da3a5f8-e99e-4e44-b931-9fe3be3528f5	hsk5	曾经
0b197e7b-1d82-46b3-a720-7d56a7811c35	hsk5	插
154fa82e-db97-4824-8135-fb0edddcaf26	hsk5	差别
b3334cec-c5c4-4052-8b3d-68acd963d911	hsk5	叉子
ab164c25-3e35-4767-8b71-c71b37981519	hsk5	拆
0aefea7f-e817-45d8-a1aa-c279f72411ae	hsk5	产品
a7ebaefc-e2de-459f-815a-50c7019c8591	hsk5	产生
20e977b3-3b03-4ca7-8494-f91e71fb3e7c	hsk5	常识
889f79d3-0634-4b0b-b433-95990e264f34	hsk5	长途
19d61932-6a86-4488-bd32-c1e4c34ee1a4	hsk5	朝
c228287b-cd86-46e7-af97-95d4164e7dd7	hsk5	炒
3e75e9da-bc97-43e1-b134-9d70396f6640	hsk5	抄
b6696b89-3bc3-453e-83c2-e2057bf38ea6	hsk5	朝代
c2a0bc7a-b7a0-40f8-aff5-fcdc0b889fdc	hsk5	吵架
34f76798-224a-439c-bece-790280f543b3	hsk5	彻底
f4da4d87-2bc1-4302-a724-32ab6831b0e2	hsk5	车库
36344bc8-b5eb-452a-ba9f-d9b92c802be0	hsk5	车厢
02e0f32b-0ccf-41e6-9003-b22fbbc281e3	hsk5	趁
3c0fecce-9ebc-46a9-b212-f4a1a8eeb539	hsk5	沉默
cd92a304-955a-470d-ab22-f2dcb8bb3625	hsk5	乘
b530018a-6a24-4b36-b0f1-b97a66843858	hsk5	称
0893e3e1-3e72-4356-bc21-5e8301098092	hsk5	承担
ee46a048-2791-4dd4-8a55-46ca854b80e4	hsk5	程度
e67ae9f9-f795-4267-9167-8087ed5468fb	hsk5	成分
830b6c12-55ff-4a8e-971f-79d8ad34be3f	hsk5	成果
1db7b864-638b-4fcc-9ec7-cb1dad691c1c	hsk5	称呼
27594100-a1b9-4cc9-9941-f9352be4e375	hsk5	成就
b54acbab-006c-4334-b56b-0fdc6c705668	hsk5	诚恳
fd8e132f-a4e5-4495-a831-e1ca568953a7	hsk5	成立
4eddd31e-7090-47be-969d-01b1b19084da	hsk5	承认
a6e313ec-632d-4e10-8eda-692be08cf534	hsk5	承受
b5cf864e-dd89-4142-8c97-410c739921fd	hsk5	程序
538cfe14-d358-40ae-959a-1e9a78c3079e	hsk5	成语
d7e75484-5cd0-4da1-940a-903b5855885d	hsk5	称赞
00c55c2c-369b-4b75-bad2-f980497de1dd	hsk5	成长
f5c90712-04ee-42ef-977d-23fcabaa5a10	hsk5	翅膀
d01c54ea-7a74-4e33-aa3e-57e408423a8a	hsk5	吃亏
cf87d71e-4f78-491c-abcb-afac44f68dde	hsk5	持续
bc2cae17-07ea-4462-ba21-c169e80e7c37	hsk5	池子
c56aeb81-deff-4063-8d8e-96bf90f25c5c	hsk5	尺子
6fbd3dec-d45d-4c25-b81d-e1630c4f15bd	hsk5	冲
58b5f3d0-07ec-46be-8295-25259e7cd693	hsk5	充电器
e9a2da4f-8c74-4615-bcd3-ce1ebbb0a941	hsk5	充分
9ad93d75-46df-404e-a5f8-e2f81edcd7af	hsk5	重复
ea5966cc-9b28-447b-b799-a30e94361c4b	hsk5	充满
7e84fa69-4f9f-4ea8-88ef-72e36f235b0b	hsk5	宠物
c63b9895-00e5-4cf1-afb2-9753424ebd27	hsk5	臭
b600724f-7568-4804-8c91-2b86ee0c62fd	hsk5	丑
e01361db-dead-4a4d-80a2-e0b23e73444c	hsk5	抽屉
dd72371c-0d9f-4c56-bb99-40fc02f68e61	hsk5	抽象
fb25fd5e-e8c5-49e5-a783-38193a5f7592	hsk5	除
5470bfa9-1733-447c-ab73-0a8496b4e6e0	hsk5	出版
e1270ee8-9256-45f9-99ac-ec587b43d780	hsk5	除非
ecde7807-d764-4801-9e84-42b74fc99eb2	hsk5	初级
091c32b2-99b5-4bdb-b2b9-3824586d75f9	hsk5	出口
f16ab18c-6549-49da-ab23-694471328a67	hsk5	处理
fa473c43-041a-455a-8ef3-bffd2816a1af	hsk5	出色
20168be8-831a-4dd3-aa52-7214d92b0383	hsk5	除夕
468f87ae-2008-4d30-98f6-74be2705065d	hsk5	出席
e3bc53cd-dab1-45dd-9c6f-8ed1214482fa	hsk5	传播
85f2788e-609c-4000-a8aa-bbae7158cb3a	hsk5	传递
8f5270c9-7af6-4b7c-972a-70d41b24cbb3	hsk5	传染
911cabb4-9144-42c4-97fc-8cca3ae029c8	hsk5	传说
86ac5338-45c7-45fd-a354-04cdb1a4ee0c	hsk5	传统
dccf1a77-80e1-4665-be48-2f9b3c990324	hsk5	闯
444cc27d-6c00-4ca3-bc6e-59c73ad0ef81	hsk5	窗帘
169b3f23-2102-4491-becc-aabc689d9ea5	hsk5	创造
9610f752-02bc-4b3b-9618-2d6a8108ee6b	hsk5	吹
b833fc59-0725-460a-a8bb-f91e28b6b8bd	hsk5	磁带
c736f8a2-f91d-4a34-8e99-4722803b28cd	hsk5	刺激
a3da2a56-7c0a-4d84-8dab-ce261d2af2d3	hsk5	此外
d1d0f640-c5c0-477c-b6a5-99efa9f296cc	hsk5	次要
4cd02bc8-c221-4879-adc4-8f1266df65f0	hsk5	辞职
204157e6-8f87-4d29-bd48-198c0ae03102	hsk5	从此
c847425f-30ef-4442-91a3-7eff20728d91	hsk5	从而
06d11ce2-c8f8-4b11-95c5-180a68fee16f	hsk5	匆忙
0bb7c955-c9bc-4142-80e0-3ffd03c2398b	hsk5	从前
2219bc62-320a-4cbd-8edd-de6298491988	hsk5	从事
b56c3bc8-49a0-4aab-96a0-657386d49588	hsk5	醋
7225b860-80c2-4691-9975-992e41cfec06	hsk5	促进
86fc47ff-dc70-47e3-af59-52a8335ae405	hsk5	促使
3bb00b79-895c-49c0-8520-b28dd3cf7344	hsk5	催
b3d14a26-40bc-4911-945f-9f9e5910cc8f	hsk5	存
c2e87b3c-a084-4989-b4c1-3009a2f9c378	hsk5	存在
19fabd0d-44c3-4765-a50e-003478dae83f	hsk5	措施
77453d6f-fd12-4a34-b2d2-e45c0d727940	hsk5	错误
579f3040-7414-4b8f-8ff2-20c53cbac1a9	hsk5	达到
3295122e-4752-4a93-93d2-a9cc20a04d62	hsk5	大方
7a69b844-7421-4017-93a5-e246d9a7975f	hsk5	打工
460cef2a-0d2f-4919-a87c-50c77464db50	hsk5	打交道
836d559f-d3ab-4aad-bd43-5cb92563f406	hsk5	打喷嚏
26741dd2-e8ae-409f-9e3d-cfa1d139789a	hsk5	打听
676cb997-68be-4eb3-be4a-26e984359c9f	hsk5	大象
3ce6b6f0-70fd-42d1-8805-69f5626335a3	hsk5	大型
ea2f64da-e57c-4f71-897d-da49b3b698d4	hsk5	答应
6f2cdb70-42be-4b58-92a4-c28ed57fa526	hsk5	打招呼
e38f9f37-c484-4458-a8d7-d3e29907177c	hsk5	呆
7e994e9b-929c-44b3-af59-4a8fd83ecdb2	hsk5	贷款
8e2c4842-fcc3-4333-999c-4e3f9a695c11	hsk5	待遇
c55563b3-7772-405a-a21b-8db9fcc0a698	hsk5	淡
847a26a5-ecc7-4f34-8f88-f0b36b2bfe57	hsk5	单纯
ff28884a-fb33-4c14-8745-8780c33df562	hsk5	单调
7529767d-ecd5-4f76-9f26-44037aedfd1a	hsk5	单独
009108bd-a85e-492d-b3ab-53f042f74b41	hsk5	担任
98a57867-ce7b-4b1f-b82d-060099d1de49	hsk5	单位
87007ab1-ad06-4e0b-8932-de272d26cfec	hsk5	耽误
cc361f0f-4cbe-4ac6-beb4-b3deaf1320b4	hsk5	胆小鬼
86a90c80-360d-4004-898c-2fd7b505b482	hsk5	单元
5ed74948-1074-4b83-8e3a-6c175334b1c5	hsk5	挡
8c266031-717c-481f-a739-49727e91e067	hsk5	当代
4d84fd5d-89a9-41ee-9595-085008a04fd2	hsk5	倒
e0c9f4c5-1238-4c4a-92ce-61cf877da02a	hsk5	岛
e56c0631-5c5b-42da-89b3-6bed8992c765	hsk5	到达
8d7cff9b-6d62-4bdc-843a-2c5d75ba6f19	hsk5	道德
c4fed408-5675-4b41-a611-42044bb98881	hsk5	道理
4d9dd29a-6bf4-4b82-9b32-5cbacdf0ce3e	hsk5	倒霉
c7ad3aaa-cdbd-46cc-ac4c-91420fd6a7f8	hsk5	导演
05d66abf-7f40-46bb-aa61-e38183e69cd4	hsk5	导致
80c72a50-86cb-4580-b696-4488bd6735b6	hsk5	等待
6e5cc2a4-76fd-4f2c-a4f2-76cbae622f9c	hsk5	等候
26851683-fbf0-42b0-9845-9e1cff830028	hsk5	登记
46334b97-5450-4262-b2f7-601a8a3b1f75	hsk5	登机牌
aace4f15-161b-41aa-880a-a9af4e2a1d5c	hsk5	等于
35db953c-5068-4990-947a-337c7210c8ed	hsk5	递
b674d5b5-eec5-42b7-97d4-13bd17d74fc8	hsk5	滴
5daea79c-a01f-49cf-9b91-5495de593443	hsk5	地道
6ae05b66-315f-421e-8f32-b0070eb21a13	hsk5	地理
15f2b6c6-e669-4e30-b790-8bbf877cc3ad	hsk5	地区
c2bcc993-f2e2-4d4d-9e91-13fd667bc96e	hsk5	的确
54f3b2f9-0f0e-4139-ba6a-918b0bf3d21e	hsk5	敌人
61e7a88f-d8d9-455c-bd6b-3165e8dd82f6	hsk5	地毯
ff218aad-c951-4a5f-8009-4dbdad4a6d14	hsk5	地位
86a48350-f344-410f-8e9b-fc38bb9ee5d1	hsk5	地震
95202865-45f5-4453-8b36-f9b0ccaa4cf7	hsk5	电池
d545f5c4-a3af-41f5-a99f-f43c110026f8	hsk5	电台
05480309-288e-47ec-9659-c3b7280d91d4	hsk5	点头
0699c04b-ff6d-4329-9cb3-04beb85694fb	hsk5	点心
46a6d824-aa4b-438f-836c-31b1eb75dd5f	hsk5	钓
b281fc79-1dbf-40d3-b011-612f4567ad4f	hsk5	顶
88d3253b-b880-4721-b277-744428d4a83e	hsk5	丁
1ddf2712-24ef-429a-94c0-b0202195bcba	hsk5	冻
b685de4b-489f-41b3-852b-6bac0e8862e6	hsk5	洞
bc943f45-9e90-4e58-aa20-b36e0eac9241	hsk5	动画片
62c05714-68f1-4d34-bacb-0fd2bf0d233e	hsk5	逗
77771fbc-8078-403f-9f34-b9c4e760e1fb	hsk5	豆腐
97d371d3-d5ac-4149-8236-de9cdcc6864a	hsk5	度过
40019037-0e36-4c60-962f-ec3d478c6f06	hsk5	独立
ef8ed9ec-1605-4962-a08d-392d2bd4b3ec	hsk5	独特
c903192f-1dc6-43d9-861e-b929391acbf3	hsk5	短信
5535042f-6ce9-4a9d-9ea1-dda39ea0308d	hsk5	堆
191f95b0-4470-4ab7-ade7-01c53349b4ea	hsk5	对比
9741768f-9f76-4d00-a2e6-20757bcbb54c	hsk5	对待
592c59c0-f6cd-4727-af21-dc6469cb3807	hsk5	对方
babf2ecc-0a03-464b-af8e-7997c0a0f82e	hsk5	对手
5aa009fa-f842-4eae-8cf0-5b1bcb1ac4a3	hsk5	对象
0b57b6bc-b626-4bba-9401-7243bee40307	hsk5	对于
208519b3-80c9-4f23-a7c3-28c3e952eee3	hsk5	吨
2341c9c1-6502-43e2-be34-d5f275bba3aa	hsk5	蹲
6e9a1654-2973-472e-b69f-dec5e1b31092	hsk5	躲藏
67b58941-08f5-4a6f-b762-8f4ad342a3cd	hsk5	多亏
715fe036-7f49-4a06-a13a-e04c4c53726e	hsk5	多余
f688a8e5-02a2-4171-9d54-a3b8ee29d50d	hsk5	恶劣
520799b9-60b8-479d-8aa7-48ad3adac4c8	hsk5	发表
64245bef-8b08-41e4-a806-c8f3147da865	hsk5	发愁
8b2a6172-c72d-4d02-b8e2-ad20a31f7ab3	hsk5	发达
8f503956-293c-4141-a5b8-c37f8257d216	hsk5	发抖
bb80e5c6-67b6-4a83-91a2-3f668d101a4f	hsk5	发挥
32463cfe-dc74-4249-8609-fe2082eb0847	hsk5	罚款
166fdead-6a04-4eac-921b-00b8f71fa6bc	hsk5	发明
8727509f-c6d2-4975-889e-f223c79d4475	hsk5	发票
2beab050-4597-4ce8-8bda-eeabbf55ba30	hsk5	发言
70c6f316-aa49-4743-8aa6-5a240b6e2b9c	hsk5	法院
0830c5eb-3ee7-439c-9673-c55327aa76e8	hsk5	翻
bd21a5cc-3f08-442c-9a2f-3640e7463509	hsk5	反而
0666cd51-3f59-4b7e-810c-c509fdd7e957	hsk5	反复
0478f9d0-f02d-462b-ab9b-bb0112c9d2b4	hsk5	繁荣
ef822cee-c309-4686-b9c7-1f7c28bc968d	hsk5	凡是
1bf51324-bdef-4fb7-8c54-7f1c63212544	hsk5	反应
db27d1ce-b280-4699-b8f4-eca44836f343	hsk5	反正
9f7a87cb-dc81-4504-82c5-e128e9b47ac6	hsk5	方
e15f88eb-50f3-4eb0-8abc-347de50a325c	hsk5	妨碍
a5bd68e6-fcea-45ed-a4c4-72d3bd652448	hsk5	方案
4adf8d2d-0bcc-4c86-b3d8-fd5783648456	hsk5	房东
4bbd4be4-1b59-4ee8-9c6a-26ec93a0c6e2	hsk5	仿佛
3961d94b-9efc-4eb6-b1be-229ca67229bb	hsk5	方式
3d0b1ef9-bf03-4770-a671-a5728d0c5a93	hsk5	放松
d5709820-28e9-41b8-841f-09857e48058e	hsk5	肺
63a7c825-5ad1-4bcf-8c99-732b5464730f	hsk5	非
db6a95c5-db20-4043-a7c9-f71573a45197	hsk5	废话
37d0fad4-7692-4f69-8a90-dea3c18b9717	hsk5	费用
adcd4e39-125b-4814-a7eb-da2147bae918	hsk5	肥皂
7dbbf8e1-950e-4d5d-83fd-b695c1f7789a	hsk5	分别
838ab1f7-1b79-440d-b9d2-39ff5e112bd2	hsk5	分布
78a90908-7d42-44ad-8565-55caecce6e60	hsk5	奋斗
67a5eca0-0e50-4fb0-bd1c-d9fdfb772574	hsk5	纷纷
28252a82-75bd-43cb-a63a-ba376cd755fb	hsk5	愤怒
913971dd-5b9e-454c-af18-8959e7627970	hsk5	分配
47c37a1f-17c8-4391-809a-0a035d8e70ba	hsk5	分析
5432e9a0-03ca-4d33-9bc3-b3cd55486824	hsk5	讽刺
563ecab3-1ca0-4d06-b3ef-15bc775d307c	hsk5	风格
f854312f-f661-489b-89d4-33a1b5a5daf5	hsk5	疯狂
8c96c8bb-cd66-4672-a7c2-c99869e3f182	hsk5	风俗
899a840d-413f-4d2b-aa6a-27bd955802f6	hsk5	风险
866826e1-2a7d-4d1d-a677-16b25f1b44a8	hsk5	否定
ef128a43-41d5-437e-882c-8f7594987c4e	hsk5	否认
1379b714-44b9-4ec5-93b6-5545920f3cb1	hsk5	幅
9f0d5962-ab5c-46a2-b5ab-c6b735155c60	hsk5	扶
d41e3f85-3bf4-4b88-ba50-be938248a55b	hsk5	服从
6b06f496-3c62-41f5-bcb3-2dabbec2ba79	hsk5	辅导
8aae0d9d-b295-4262-85fd-f0ed7966f0f6	hsk5	付款
c216db3c-64dc-4d9e-9104-19b9bfe72d9d	hsk5	妇女
e089bda0-4e1a-4da4-b63b-a51eb58cd5eb	hsk5	复制
dbd03023-3e2f-4d78-9f59-38bd415847e7	hsk5	服装
384773b3-2105-4e53-bead-26eb5b7ecde5	hsk5	盖
b821fa1e-a1c7-44ab-bfc3-8686cb71e0e2	hsk5	改革
bea820f5-74c0-4d0b-b6ac-efc52a3d497d	hsk5	改进
34610a5f-a3fe-4bd0-aba2-4aa4d76ccf09	hsk5	概括
6534dd6b-740d-46b4-a93a-e8dd787be5a2	hsk5	概念
8b0cf39b-6e6a-4c37-bb5c-dcb6e1b80787	hsk5	改善
887d6550-76e6-4544-9f48-58a228506b0a	hsk5	改正
b534c5e2-ae6c-4e2a-a092-84fa5b3ad588	hsk5	干脆
dac29c03-5f60-4630-b99e-c8fd81ddf71f	hsk5	干活儿
5fd9ddcb-3468-4098-b30c-f29c9e6790dc	hsk5	感激
5df2880b-1c51-4a64-a747-60b007649a83	hsk5	赶紧
ee5d2948-430b-4c17-b8b3-7f0379f3c977	hsk5	赶快
081f4622-d268-4a8e-9f3c-3323c400abda	hsk5	感受
576ccd34-272a-4cfe-a75f-15fc2cc92893	hsk5	感想
ec8c1b45-ff1f-4e60-9580-009e35ee2187	hsk5	钢铁
7d80ad39-1184-4ad8-9d30-1f1046d1be13	hsk5	搞
cffe5657-5d5d-4a6f-bad5-65769bf39358	hsk5	告别
d337e50e-aab5-4c4a-b682-e349326c2f3f	hsk5	高档
8ba43066-b086-4633-b31b-1c607736bf11	hsk5	高速公路
28bdb651-a922-4d9a-b9e7-fb76c77dbc5e	hsk5	隔壁
38a1aaaf-af6c-47cd-95c9-5fa281adbe67	hsk5	个别
3d168d38-b9de-4f16-b9b3-890082dc2bca	hsk5	胳膊
3d010b54-d4e0-47ab-8152-5eea7dcb53ff	hsk5	革命
d54828ea-d07b-4884-a30f-c3af82e660fe	hsk5	个人
86c57355-e8be-4f87-bb22-600a0a637c0c	hsk5	格外
b8c01a5a-980f-45a4-a9d9-ff7bf866905e	hsk5	个性
c5f9a2da-4faa-477a-8196-a63ca2f287f9	hsk5	鸽子
8c2ba165-a09f-4c11-80c3-2b0d4e607300	hsk5	各自
8edb06d1-8bea-4c3d-b1ff-b6c81bf7008e	hsk5	根
d710860b-69c6-4908-9d74-ca2f695cbc9c	hsk5	根本
073a6057-aad4-40b1-a1fc-7509c392bb24	hsk5	更加
5345e2bb-c4a3-4614-a2fb-2a652bde5fbd	hsk5	公布
eca62816-2597-4c3e-bd9f-5f1bd0aa4bfe	hsk5	工厂
d6af3910-2397-484c-81a2-e77c7674c879	hsk5	工程师
77f5346d-e5b5-4321-9b22-49a7a1bc62df	hsk5	功夫
527edb7d-7b93-4583-825c-d52e72d2a5c9	hsk5	公开
d05768f2-72a3-4ec3-b479-7edc5ef2aafc	hsk5	功能
33be3be2-f1cd-43d7-a4b4-944cc8d49375	hsk5	公平
7f233cf1-8fa4-4ebc-8907-7e115b80b0b3	hsk5	工人
3fb51a88-8d7f-482a-b7b2-743a2774036c	hsk5	贡献
722c80d9-d86e-4ef4-a09b-e7066cff5187	hsk5	工业
94fb9a10-7477-4940-a420-3d0342b5ebd9	hsk5	公寓
15550278-b213-4885-928d-817c73653106	hsk5	公元
f28de8c3-f3a6-466a-bd75-886e8e729d4e	hsk5	公主
5fb25c48-b739-4954-9357-de2ea28fa274	hsk5	构成
3074c0a6-f26d-4791-a69a-8028dd0da0de	hsk5	沟通
56b0e6eb-cf29-45f1-954c-bf3237b343f2	hsk5	古代
ace6883c-f85e-4ea7-8019-5ee90b96a15b	hsk5	古典
eb555679-7fb0-4519-980d-a22a621c7576	hsk5	固定
54703264-25d6-49ac-9499-820acf0c7786	hsk5	姑姑
c360d7ad-0231-4b99-8811-d5bf92452c85	hsk5	古老
884c1cce-0ca3-4718-acea-9b713ac2aac4	hsk5	姑娘
91a18ebd-3c83-43a3-9fb7-83e3c1fcfba5	hsk5	股票
8741dfdf-36b1-4661-bd81-9db436b1c1dd	hsk5	固体
9615fd59-d8a9-498d-9f9a-4b27f145ea61	hsk5	骨头
b82c85d5-31c1-4eaa-9b91-d8f38e114a8f	hsk5	鼓舞
9a946301-71df-431d-ad25-588a5aea21a3	hsk5	雇佣
3065672c-19be-4a1b-8177-28e22a0b4a93	hsk5	挂号
6e9750c0-9bac-46b2-a37e-e5be8081455e	hsk5	乖
75560c10-0cbb-4770-8614-c50415227e89	hsk5	怪不得
c5c66582-66da-47eb-a70c-42ca77ef50f3	hsk5	拐弯
7fc4a6b0-4272-4d1f-8a57-86651ba5e058	hsk5	官
8a7a4209-3c3e-41cc-a8c4-a22b22724e7c	hsk5	关闭
933dbce5-7668-4cfe-b203-4ce4691d9d69	hsk5	观察
438c94ac-57fa-4529-b8d9-6f5d93312f1c	hsk5	观点
4d0842bf-15be-4be9-9a8b-ae17ed4f25fe	hsk5	关怀
ab4d3898-e4cf-4b30-8409-e9599dd0daee	hsk5	冠军
910a8133-e347-4e46-ac05-83e3ca325197	hsk5	观念
164b74f4-070a-48a0-8fe2-9193821219cb	hsk5	罐头
215ac3fc-63a5-4987-b5a8-40bd88b0946c	hsk5	管子
fe37a9c9-a097-4cc2-a488-fc5df2023697	hsk5	广场
d4361dda-4516-4f74-998b-f85184ee9961	hsk5	广大
69a59577-51b7-4e9e-bb76-65c1e8c07c8a	hsk5	广泛
b38832f5-68c0-4a78-ac78-dc16176fec01	hsk5	光滑
02a3baa5-963d-49f9-b780-ec42383e4529	hsk5	光临
531878d3-b97d-46c8-8114-4b1765c23ec5	hsk5	光明
f4178855-b1c4-452c-a83f-6fa998ca6710	hsk5	光盘
8f1c7eff-e7da-4007-bf56-c6842394c2da	hsk5	光荣
63323732-e086-4b11-8564-2862f4b12c70	hsk5	规矩
fba60aa6-a14b-4794-956d-64d25129163a	hsk5	规律
98dcf523-cb73-485d-a4be-8b2d86420fa7	hsk5	规模
6864d590-f55b-42a9-ae23-f9ae6208661a	hsk5	柜台
8921aa18-b81b-48b7-b84e-4445c64ea0eb	hsk5	规则
981b7c8d-b50d-4e85-8513-3bee7ac5642c	hsk5	滚
afe7cf87-a2a3-4b2c-8019-9c5d66db472a	hsk5	锅
cc9a79b5-eb0a-4329-8601-063534c9d7bb	hsk5	过分
b3c51533-929f-42af-a0a3-f06ca25f40ad	hsk5	国籍
b88c555c-78ad-4b27-9137-507d26f4cf33	hsk5	过敏
6878a386-487e-4f69-b91b-e47270e89be1	hsk5	过期
9415d2a9-0678-4664-a4d8-2d0ef6379c5c	hsk5	国庆节
7a8248ee-8df3-4c5a-9c0f-dbeaf150fc2f	hsk5	果实
3608fd26-f3f6-4696-bc63-9e29c5b42cf7	hsk5	哈
e220e2ab-b054-4af5-a868-96b722445cf3	hsk5	海关
7311e6c9-7db8-428a-9d89-51a20a60f1a5	hsk5	海鲜
7cdebdbd-b149-4a20-a9c9-f14789471ce7	hsk5	喊
b561aa9c-e2fc-4ec6-af12-7b955964c224	hsk5	行业
7ac98a9f-0bed-4d43-a4db-c84d7d0fa095	hsk5	豪华
b086a990-41e3-4677-9aeb-0b425d1e0846	hsk5	好奇
9f84cad3-4dab-4cb3-b3a7-15d12815e2b9	hsk5	何必
b1dbb5cc-fd7a-4916-902f-8a797a4b3621	hsk5	合法
be98b45f-7fdb-4af5-b615-ecafc7b0bc45	hsk5	何况
569bb221-4604-4f90-9455-a352fef0830a	hsk5	合理
74e8f0d0-c28d-49a1-8897-a859efbdcf71	hsk5	和平
095f198a-d211-4b6b-a263-e64c3a4c0948	hsk5	合同
e5362d56-54c9-4baa-8385-6ab8f7da8b46	hsk5	核心
982e39df-3b74-4866-9149-07f9fdd2fdea	hsk5	合影
e9f64eb6-ecea-4df4-b1ca-486fb1a16dfe	hsk5	合作
687ce0f2-5314-4e72-9bac-c2a97b80685c	hsk5	恨
f8c46b80-e1a8-469e-bd94-667e5e0fb811	hsk5	横
438fec67-177a-4432-8172-61c4b5b65806	hsk5	后果
2764d3c5-0036-4c27-b0d9-c874cb47e644	hsk5	壶
a930774f-a7c9-439c-b26a-e131497b943f	hsk5	蝴蝶
c39dfa98-d0b7-4c13-86f6-464b1322ba1f	hsk5	忽视
e5a30096-8adf-4164-be74-36b387a29842	hsk5	胡说
ec09fd03-f48b-484f-b21a-da5dca45ec0c	hsk5	胡同
37367eb1-8e29-49f6-bf54-da31e41239c5	hsk5	糊涂
6a74e664-c2eb-4671-8f02-d10406869f6e	hsk5	呼吸
9795665e-aa18-4f65-89de-482387f109c8	hsk5	胡须
ebaf6f6c-c342-4b3f-8fed-fdcc5b69d7e8	hsk5	滑冰
4536fe73-7dcf-441d-86ae-98c843158aac	hsk5	划船
9deed919-b796-45f8-a0cf-5402f200e037	hsk5	花生
08d30802-049c-4511-8b13-80e089c3064f	hsk5	话题
a2de5a83-cfc6-43c3-bd32-6ef1f242e804	hsk5	化学
7271862b-b341-4d07-a129-5e4cc5e502ab	hsk5	华裔
f5c8b603-c539-4da4-a12b-5fa374c37d63	hsk5	怀念
912d0c73-2d7b-480e-a3fd-5e48166a688a	hsk5	缓解
d640ea31-5fbd-44b9-a3ec-52367ab0e547	hsk5	幻想
bf3f3177-69ce-4f12-94ed-29f1e7219bb4	hsk5	皇帝
a45ebd49-504a-4ce8-b998-1b65bd0d3ef6	hsk5	黄瓜
6abe9cc5-a661-4802-be80-bdede8c95179	hsk5	皇后
e144c327-7b72-4246-938b-55652722358c	hsk5	黄金
f439a402-57b6-46d4-99fc-8f9a1c810fdc	hsk5	慌张
06d2763a-461d-4a8a-8d9b-a7fa62902304	hsk5	挥
00d5372f-0912-4d5d-8b33-dc312bf763cb	hsk5	灰
43bc6697-aeae-4ccf-aba7-353fa66bf7bc	hsk5	灰尘
6a78cf68-d055-4801-9c8e-5dbee34b6a56	hsk5	恢复
0cbec61a-2343-4030-9744-abbdad8188cb	hsk5	汇率
9900e26f-7e18-4474-962a-3ed983faaa06	hsk5	灰心
2fac6d29-3535-4c5e-aea1-89ecdc7cce5d	hsk5	婚礼
4a4c3aea-10a9-481c-ae08-59efe551637d	hsk5	婚姻
c73e681d-7415-4520-851a-9074d8a4ec96	hsk5	伙伴
59311719-0592-4f87-9dfd-fdc06d5fc8bb	hsk5	火柴
d5f7cd5d-62b6-46a0-b186-3895ecb913e1	hsk5	活跃
feaab92f-c3ad-4679-b124-f44bd2a3421e	hsk5	基本
04bed5e4-5059-4a1b-a55e-05de6a0cef0a	hsk5	及格
87b2dcff-2858-49af-8c21-b1f530510d68	hsk5	激烈
648e463c-f370-499c-8115-03a509641e84	hsk5	系领带
1777557d-d2e8-48a9-ad60-8609b3acdba7	hsk5	纪录
60b4794e-a1c6-41c3-9399-105b5d875e5c	hsk5	记录
d23e4b99-7158-48da-82b9-924c113476b5	hsk5	纪律
e0da1e22-838b-4916-8c59-bfc7e7cb5d33	hsk5	急忙
1dfa20eb-b180-4026-a058-a34109a54e13	hsk5	寂寞
d910c6dd-7950-4539-a4a5-630a1245f786	hsk5	纪念
35fe0f69-f48c-4a08-a25b-f4ba2368b06d	hsk5	机器
b6d4b1be-4ba4-4900-984d-f9580dfc237d	hsk5	肌肉
73138679-e7ae-4fd3-8228-5c351b8c1462	hsk5	计算
a5d0200b-22bc-4f4a-9a1e-7f1885ac334b	hsk5	集体
5428a29e-cc00-44bf-96cc-fc382b7fbbdc	hsk5	记忆
0c4da523-2c13-428f-a1a1-c363763e1f48	hsk5	集中
203613bb-0e39-4f7f-862b-87ba5ce0dd39	hsk5	嫁
5932bdc6-2fd6-43c2-ba95-68934cf7ce38	hsk5	甲
e7010357-7208-47e0-ac3b-1d7db1294a15	hsk5	嘉宾
15211d6a-c6cb-48d1-a51a-b45051ac11be	hsk5	假如
7ceefeda-ceec-413d-80d9-d8ebce0d0213	hsk5	驾驶
c3c68762-2d73-4335-9d83-62dc755f4f18	hsk5	家庭
d4d63d47-5e1c-4d51-af3b-377dfb49e887	hsk5	家务
6cb1f220-321d-4c29-af06-8092c274850d	hsk5	家乡
0d3d3d4e-2f89-42e8-b3c0-6d700f75ff37	hsk5	价值
d5ccd798-e3f6-42db-abe0-dfa0d3e2693b	hsk5	假装
5efa8bd6-322b-4c8b-be47-ba883eaf4565	hsk5	夹子
aa08c113-2eb0-4ea9-a921-c406e610e784	hsk5	捡
6962e968-03b2-4be9-9d46-cab64e868bbd	hsk5	煎
b44c70e1-d68e-4a99-833d-a8910db9dcdf	hsk5	肩膀
faaedc57-3cec-417d-8ad6-a4f87007d9e9	hsk5	剪刀
be3aefd7-03f5-4def-a4bb-d9c65405e2f0	hsk5	艰巨
8be07e0b-baa1-40c3-b9b9-71d168e37ab1	hsk5	坚决
5f25090c-40e9-468c-9f41-deb3f93132c7	hsk5	艰苦
c79965c9-60bf-4b33-bc92-e6bf3f6d8dcb	hsk5	建立
e5f2d693-95e8-41a5-a886-8af9be9ba847	hsk5	简历
1825dfad-96d2-42cf-9e03-5ca722a4ac18	hsk5	键盘
173bc0f7-3970-4d63-bdad-4446b98f3986	hsk5	坚强
4137ba89-a7fc-4403-b245-0619fd807b04	hsk5	尖锐
69aa1ad4-874c-46fe-973a-5c627374f187	hsk5	建设
43982c49-55e2-463a-a1ff-c6898e22b0c9	hsk5	健身房
1ba3c521-7776-4731-84d2-58fb94e317b4	hsk5	建议
73afb5fb-5b1a-404d-b17a-e25037fb1660	hsk5	简直
899615ff-011a-4efc-a9ec-8ebbd406c51a	hsk5	建筑
f71a0d9e-510c-4651-bff8-94578ade332f	hsk5	讲究
31a8f14e-1b0c-4259-8854-851ab0b4f006	hsk5	降落
b57c624b-a1fc-466a-bfdd-c374d7107edc	hsk5	酱油
82266d0f-9c16-49c4-8617-2413958d1892	hsk5	讲座
4f33fd62-2ff0-4442-977e-c84ffac4f914	hsk5	浇
4e01a407-b90a-4292-ad79-877802d1e66b	hsk5	教材
e6b3e843-3ab9-4f27-9564-e3aeed11ce58	hsk5	角度
5cd27cfe-e236-48cf-bbe0-1272ff9f7317	hsk5	狡猾
21ab8031-ccf3-4a22-bae9-d24636ff99b3	hsk5	交换
18d3a0dc-b845-4357-81ac-e0b0cc265bc8	hsk5	交际
77a778bd-9b2e-47fd-9f1b-ced355ef33d1	hsk5	教练
2f7fdf85-bd3b-48e4-8bdf-637e993d927e	hsk5	郊区
46d648e3-73e6-47c8-aff7-8f9bf6b2b73f	hsk5	胶水
cf1498c8-de46-459c-aa4f-0e8dd0d1ea07	hsk5	教训
6e8ffb8f-7f2a-4348-9b85-298d4e6f081b	hsk5	节
5c3415a5-7f74-4134-8669-d708b18f8aec	hsk5	届
452c1998-68b5-4bd1-a691-40e5e35779dc	hsk5	接触
21604003-9bd3-4473-a4e8-6690da16dfd3	hsk5	接待
f6f02d9c-2f18-42b6-84ad-b7338c7a2952	hsk5	阶段
3089d183-ec2a-49a9-bbd6-ad7e6768a64f	hsk5	解放
ecbbec50-caba-405c-98d0-b12b64d90cc9	hsk5	结构
311231f5-774b-4e19-9fe2-c4f89eb4728e	hsk5	结合
41006418-8b81-4615-a33b-7876262ed190	hsk5	接近
d6a11ef6-1d97-4ec1-a984-04704d92e5de	hsk5	借口
7276a75d-873f-4163-b98e-ec699a556a9e	hsk5	结论
8e5fc939-b433-4f70-b1b9-b4dbb4a36106	hsk5	节省
2e8ddd7f-622f-471f-adcd-44643e8d71c2	hsk5	结实
4e75a6ba-3f88-4696-8e55-946c6c628116	hsk5	解说员
e8fc7d7f-29ee-4dfd-98a5-ea7389adc7b0	hsk5	戒烟
f67bdb40-903b-43d8-95d3-144ffc0b1471	hsk5	结账
c8b87c3a-c041-4810-a837-da70057e4a1b	hsk5	接着
da91edc0-571a-4e75-88f5-fcf5a42f451b	hsk5	戒指
88304ca0-b62f-49e3-9531-b1719fd5173b	hsk5	紧
25eccafd-1c19-4701-9944-5f8a98b57cb3	hsk5	进步
4df9ba23-6803-4950-8670-87ff11d684a3	hsk5	近代
4cff1f21-dcbd-438a-8d08-456c4e5e06f9	hsk5	紧急
2eae4261-11f1-4a5e-b212-84a9a622f6a9	hsk5	进口
17537386-3ad6-4329-9b9c-1a229353eae0	hsk5	尽力
9aa45ecd-9ea1-4793-b70d-57f67745c991	hsk5	尽量
6cbe5f4d-5bf5-4648-a2ea-6e3dfef689a6	hsk5	谨慎
b2f5ac8a-3132-4c92-be8f-d7ead3f86fbf	hsk5	金属
57e79119-eee9-4a22-b63b-0bb6289207f4	hsk5	敬爱
f52586bb-6a45-4c66-beea-a94f72e5540b	hsk5	经典
c1067550-326f-41b9-861e-511baf253395	hsk5	精力
cb015369-c437-4822-b7c8-f8215afae221	hsk5	景色
fa1428e2-6aab-48be-9873-2a804da09ffb	hsk5	经营
d0f970d0-e81b-46a7-b7f7-ec9c59f0e210	hsk5	救
404a4ffb-2430-4c8f-b571-3da09f142782	hsk5	酒吧
769fb1e4-103e-4c9f-81e0-5da5c7adb91a	hsk5	救护车
bc612bc8-f2ce-400d-b23d-08d54844a040	hsk5	舅舅
2893a92a-3a3e-4f9a-9ed5-ed04eee0248d	hsk5	举
29a18fc9-fc13-475d-9878-2b63701db5b9	hsk5	具备
579436ca-a79b-4e82-8c4a-676a6784ab1a	hsk5	巨大
6d388224-9291-41b1-a753-77ee1e40e1a0	hsk5	聚会
4a0b92ec-fb78-4e40-9cb7-98b1ee7ee470	hsk5	俱乐部
cdd35d25-6d70-4b6d-afa7-e862cb06c3e8	hsk5	居然
343e8da7-8349-4b91-a231-4c73eddb79b3	hsk5	据说
66c2e871-47e2-4fda-904b-c28e8d62b53b	hsk5	具体
fbbea87b-8c96-49b0-a9aa-508cdd4d433f	hsk5	桔子
6586774d-4008-4062-93d1-7bb48c3853e9	hsk5	捐
fd3589aa-3206-4798-a07a-7696ce57c53c	hsk5	卷
bf968d48-cc15-438a-a959-af856094bf25	hsk5	绝对
ae3a030b-cadc-4773-90e6-5fdda43817dd	hsk5	决赛
5ffc87ec-c8af-42d0-a5bc-08815b9b8e15	hsk5	角色
6387e303-8234-4a9c-8f64-25dbdf69b58d	hsk5	决心
24a36cea-c81e-43e0-984d-b7d5eafdaccf	hsk5	军事
e114a4c7-484b-4d25-8140-d3690278986f	hsk5	均匀
98985bbe-3735-4dd3-a1e7-48bf58db1b09	hsk5	卡车
edb72d97-507f-4ac5-a842-4547740ae428	hsk5	开发
8ec5bd04-a87a-4c14-a97c-692bc6e66f2a	hsk5	开放
293d3b2d-02a6-46bf-bd5f-e987abdccdf0	hsk5	开幕式
b834a8f7-b165-4a3c-813d-0112c9464290	hsk5	开心
207dffec-9b61-432a-95f8-18e5c1ce48a4	hsk5	砍
b66b2695-70e6-43a1-a0c5-cdd525e9bc13	hsk5	看不起
f7bb69b1-c71b-46a8-a54f-5fd60dd7abae	hsk5	看来
9af87c18-c31b-453b-a955-dd4b44268aad	hsk5	抗议
b8c10e5b-fe5d-4be0-84f4-a67c4e25da6a	hsk5	烤鸭
9e14e633-daa5-4bae-a5ba-91903ac47bf5	hsk5	克
0146a20f-a99a-4d46-a002-f17c0323f4ef	hsk5	颗
16489738-f8f5-4e61-9c74-755f6c277cb5	hsk5	课程
a17e66a9-c9f6-4175-b0a7-456600bddee8	hsk5	克服
54c7b451-9371-48af-854b-905f8726572b	hsk5	客观
c8fd8a9d-9d04-4e6c-ba8e-79faf5af2510	hsk5	可见
1fb38c6e-96c2-4db9-b850-a238bb246435	hsk5	可靠
6c659d8b-7797-4006-aef0-05e11c05bcf8	hsk5	刻苦
28872b0f-02b2-41b7-a5bc-5bb3fbc55e91	hsk5	可怕
afb3aa9c-0475-4f8f-bfb0-c1eacbe68966	hsk5	客厅
1ece0a8d-69b6-4a6e-b8d0-a08dc1ea098b	hsk5	恐怖
06ba97ee-7432-4030-bbca-0ed93147307f	hsk5	空间
1334e93e-7e3a-4be2-a43a-5d69e4076ea5	hsk5	空闲
60f19c07-b0b1-403e-a5a9-d6153ea9b6e6	hsk5	控制
6170897e-32d5-41d7-ba03-2df9272a823d	hsk5	口味
5f6b01ab-9cb1-4326-9b61-2f4d7bc47f0a	hsk5	夸
83dbf701-f7e6-467e-8aaa-bb4517254282	hsk5	会计
b7a7a3ea-ac3d-4f4f-ae63-4330129883f6	hsk5	矿泉水
2fa05140-8360-451f-bccd-1a32c5f2ac9c	hsk5	辣椒
2448373f-0911-485f-bc7c-58ef17c0d1b6	hsk5	蜡烛
d507e9de-07f7-488d-b6c9-183ebf81bae2	hsk5	来自
e3597bf3-85c9-439a-b86d-04a2affa4723	hsk5	拦
1839be2d-be6f-4a8d-ab40-45fb087c5e46	hsk5	烂
0783d58f-9720-4df7-868d-86d02012ebd7	hsk5	狼
81c766a0-b1bf-4115-9e4e-488b7d3be711	hsk5	老百姓
b2e9a2e8-0470-431a-86cc-8edd96904cdc	hsk5	老板
e4189abb-4b94-481c-a9e2-ffa98da8c28e	hsk5	劳动
d4c2f4ae-9bf1-4926-ae26-43822610675a	hsk5	劳驾
e7950ba2-9f89-4186-89d7-40d4aa055815	hsk5	姥姥
30f7ba11-19e2-4223-b00a-e18f2391041f	hsk5	老实
46842ecb-bb83-4135-aab8-1548b7c091b6	hsk5	老鼠
ca49a1e7-5320-4a7b-b19b-53ff4cf62c6d	hsk5	乐观
c804619f-00cd-45d4-ad31-52f858663c3c	hsk5	雷
e46f910b-fab4-46d9-b72f-4f74b36da2b9	hsk5	类
c905dc48-55e6-491e-94d8-72395ea4ce14	hsk5	梨
383b9238-a818-4e11-b4db-2282de9b2dc4	hsk5	粒
feb2b483-e355-4d12-9da9-90260762ff08	hsk5	礼拜天
00557961-0d69-4365-abbd-4c19cd461042	hsk5	立方
e4fdb74a-77f8-4b15-bd84-654c2a95ca95	hsk5	离婚
09bd7685-9e38-4599-9e3a-d42ae449e652	hsk5	立即
294365b4-fa29-46a2-8bb1-0346c16b8b78	hsk5	立刻
358b4ff5-0c5e-4c2a-a9de-a5568f4e6ace	hsk5	力量
f8b285b4-0fad-4737-9cf2-71422bb8f67a	hsk5	理论
5e318e44-7586-4a9a-8546-d38c233ac27a	hsk5	厘米
1bcff024-f5b5-41ae-89ef-b8f4eb05a841	hsk5	利润
227bb11c-2581-42ac-bfdd-523d891809e6	hsk5	利息
c4bcb301-426b-4f3c-90da-f7b497e6bbf1	hsk5	利益
005736eb-2d91-4b64-bf23-a4c7e1ae438e	hsk5	利用
b370b1b0-221f-411f-960c-72a847a2ab44	hsk5	理由
c47bfdb2-40f4-44ca-ac94-f99f994e7ef1	hsk5	恋爱
8d3bc631-3b27-4ed0-b9ba-af497b9a6fa3	hsk5	联合
617a09ea-0f15-49fc-a228-42765218bcf8	hsk5	连忙
4b83108a-9bf2-4b99-89f0-3cdea3b430ca	hsk5	连续剧
4786fdc0-89a7-4b11-83b8-5e83ac57de96	hsk5	良好
f74fe626-2fdf-4df6-8d41-e56719c2b27b	hsk5	粮食
e817af12-4d1b-4ee3-8c4b-f6575ff7d75f	hsk5	了不起
e43aafa5-3ea7-46ca-98f6-7203a3f07082	hsk5	临时
e6be0835-6f94-4003-bad2-f79869fdd052	hsk5	铃
440014ee-64ca-415f-8dd6-7698d90d25a3	hsk5	领导
b9cb63cb-11c0-4da0-a8f7-45a1895dba51	hsk5	灵活
57388986-3f49-437e-afe6-6ed15fd31d09	hsk5	零件
6d840ba9-f7a1-423e-a0ab-5af6c9bb426f	hsk5	零钱
b2dd6f2b-2854-4226-936d-96ec1e7022f0	hsk5	零食
43a24f76-5f3f-482b-9961-2478c32428ee	hsk5	领域
512cc64e-68bd-4b7e-8d1f-f01c38ec374f	hsk5	流传
4625d1da-08a6-4a00-b2d1-3d936b6b614f	hsk5	浏览
9893ce5d-6743-460c-b1eb-d4694f7a3787	hsk5	龙
966343dc-ccd7-422d-a095-b034b8d193be	hsk5	漏
e1207559-bf78-46dd-87b2-2cb88f9a93ed	hsk5	露
0a43a28f-8886-4856-8915-fbd5d6339684	hsk5	陆地
7ba7ec63-0823-41b1-8f12-3ba72911ec80	hsk5	录取
1216a57d-4e51-4c35-aa50-b47f0e500c12	hsk5	陆续
cae89e4d-475e-4214-a5d0-b419db7c68b0	hsk5	录音
835232cc-0ede-4853-9748-32eb6aa3d90e	hsk5	轮流
5fb5ed04-5eee-4449-a59d-d9b71a0f93d5	hsk5	论文
02405c24-b93a-41f8-9558-0359cfdb35f4	hsk5	落后
8a17b2cb-cab0-4de1-82b2-d44dae7d54ae	hsk5	逻辑
a45909d4-90fc-4183-b9d5-931aea7273a0	hsk5	骂
ae321536-e93a-4b31-9fbf-64b58712a56f	hsk5	麦克风
f100e742-f840-4e2c-8dc8-eb2a628e337d	hsk5	馒头
0543b0b3-ccdf-4cc7-9f7f-0c1bfcab5c68	hsk5	满足
8c8ead5e-5ec6-422b-a5c3-ee525df632cd	hsk5	毛
79a396ec-672b-4c05-8bf9-3203b6a654d5	hsk5	毛病
cbe57aca-08ab-4b66-8dc1-c8c3ceebd781	hsk5	矛盾
f90874dd-6596-488c-ac4d-4e4627d143e4	hsk5	冒险
54d578bc-9d10-4e2e-ab8a-4af5a48c2819	hsk5	贸易
d0713734-c16a-4710-ac30-ff3f06f3706a	hsk5	魅力
84532784-693c-4c9d-805d-428a2fea6c86	hsk5	眉毛
291f9e5c-d81c-40ab-9a5b-6ad9aa36b079	hsk5	美术
4f7984a7-7512-4506-8aec-9252850b419e	hsk5	煤炭
887ca44c-1d1b-4203-97c2-aebbf1f9182e	hsk5	蜜蜂
353135dc-b0de-4ade-832d-5943af55771a	hsk5	迷路
90d65f54-fa1d-4b12-8f2e-01dfbc319f5c	hsk5	秘密
7941c909-6208-4213-ab40-2d4be8406114	hsk5	密切
ca67ccaf-a156-49ac-887b-6c3f5f3db745	hsk5	秘书
34eea3b2-4f02-4a7b-bfaa-26d0aad25798	hsk5	谜语
caa88a5a-9f6f-4bef-918e-e13d700bfa2d	hsk5	面对
086a8adb-3cfd-455d-bd5c-fd94a0b30c4e	hsk5	棉花
b0b398b5-f2a5-4d58-8667-97e840ecb59a	hsk5	面积
99ca6315-e0db-499e-8dba-f0ade4e099e6	hsk5	面临
dee54019-713a-4b30-b02b-d1c7244d1abd	hsk5	秒
4315ea36-1e2e-4827-9bd7-181b242f857c	hsk5	苗条
abe2f330-00c3-44ca-8090-30fa195c86be	hsk5	描写
3617f768-58a1-430a-9118-34e5bf6ffa95	hsk5	民主
8c6b17b0-370a-406f-b35c-33bc721bd1b0	hsk5	命令
d14832fb-83a3-4c9c-8038-7514f66f6698	hsk5	名牌
fe06b586-0db5-4d1c-a01a-d57e8938ef05	hsk5	名片
e7bc54f7-43ce-48fa-8976-7ab52322f64b	hsk5	明确
9bff7301-a9f1-4145-a2c5-1935203d6bf1	hsk5	名胜古迹
fcecf103-fdd8-4224-af95-ee89ae432ef8	hsk5	明显
a13e18da-5fb8-4056-b48c-3432776afdb0	hsk5	明信片
0ed7caeb-f4be-45b1-bfdf-55c90d2450b6	hsk5	明星
dc619f23-e0e3-4d1c-88f4-326446a23773	hsk5	命运
7f00883b-edb7-4ef8-ad2c-28de12789056	hsk5	摸
a535736b-58b8-449c-9077-87559a6ed41a	hsk5	模仿
ff0e71ff-5c1e-4604-a0b7-90de80712bc8	hsk5	模糊
9fd5545e-2201-485f-b539-f57813a1347c	hsk5	陌生
859b5f99-771d-4a0c-bdad-4d95f3bcd21d	hsk5	摩托车
ec480999-18bf-46d5-a5ca-20f8830b47ad	hsk5	某
986966fa-f505-440c-ab29-8a36d673743a	hsk5	目标
b75a9947-a605-49b4-99a9-60c236dbb44e	hsk5	目录
c94dde81-6df8-4b1c-8291-8ff51d2ce158	hsk5	目前
5aad77a6-39e0-445a-9a39-eb271b347280	hsk5	木头
2334a39a-2d22-40b8-ab99-5ac0fa82dc97	hsk5	哪怕
4947f352-b315-420d-a06b-4b65e79570bb	hsk5	难怪
bcee5ff7-0379-4f48-a7d4-515f28c47fab	hsk5	难看
49e8fed8-32e2-4c75-8cd1-1035cc53dd1b	hsk5	脑袋
5295c244-1dd3-4d80-b6dc-61a31ac38069	hsk5	内科
eb1a226f-1135-4a9a-8d13-7e6d9a52a10a	hsk5	嫩
5622ebe1-c33a-4244-ac41-b62494e3cd7f	hsk5	能干
2eb93212-b316-4404-bfe5-ce1c0f8bbb5c	hsk5	能源
73709356-228c-4c6c-a12d-5e7dd2d4fd11	hsk5	念
02d3cc64-0cde-43bb-bc3a-ae5a8b686cad	hsk5	年代
8c7c9ad1-597a-46f2-be7e-120cba179812	hsk5	年纪
5dfec30b-2b3f-4f95-ad8c-2125e7c164b3	hsk5	宁可
3bd8de2c-02e1-487b-be05-0aacdf5e162c	hsk5	牛仔裤
fc1a2c22-81a3-446b-a3ad-a7392abaf894	hsk5	浓
692e022f-e7e7-4384-b158-b8ddccd0b178	hsk5	农民
fd941d6a-4fa2-42ea-b416-48f6f2f834c3	hsk5	农业
1eabac77-bca9-4973-8ad3-73c91586bb8a	hsk5	女士
6df071b0-516a-4387-afb5-941907f125ef	hsk5	偶然
a43ced88-9a84-4ea7-997f-47c24cc4ac3c	hsk5	派
02b80342-85a7-4e13-8362-77b31b02e6da	hsk5	拍
b9851b15-5914-4ee2-bb13-e369e500c3c6	hsk5	排队
20925979-2b93-49de-b3ab-66d8c4c11aec	hsk5	排球
b8f3c5d7-e601-4d16-ab8c-7b90285e0fe7	hsk5	盼望
ddd1420d-f87b-4a93-9f22-366ba37a2f81	hsk5	赔偿
f4a3e813-f7d8-4004-bc84-8b2d10536c97	hsk5	佩服
9674cda9-22c2-4a4c-9998-4d0e600b3f3a	hsk5	配合
d3f073dc-8daf-4a33-b56f-135f12099b7c	hsk5	培养
72178f10-aaae-4169-aa0f-7d126e54bf0d	hsk5	盆
d3a84cd1-d561-43ea-be3f-e3850a5f8a83	hsk5	碰见
42f1d447-ae14-48da-b98c-7d231f49a458	hsk5	匹
26ae21ad-60cb-402e-90c6-0ae896f9986d	hsk5	批
af53427a-a438-49e4-aeda-617adabd97b0	hsk5	披
0a5e1968-30f0-42d4-8c96-62f7f41d77e2	hsk5	疲劳
1da3e9d0-2fb7-4ae8-a7c6-33248f658126	hsk5	皮鞋
de1c15db-05fb-4d09-9592-3cb4c5c66344	hsk5	批准
d9a1105d-93f5-4189-a12a-8fc827d6d9a9	hsk5	片
fbb98a6c-8e27-4034-9da8-c19a25110d5a	hsk5	片面
cfc844c5-5273-4a2c-b188-86651c034bfa	hsk5	飘
7bad225b-15e0-42af-a37f-7be51f782237	hsk5	频道
9dfe104d-6a15-4228-bcae-60c40203c924	hsk5	品种
fb62cf34-7faf-4a44-b2d0-36052aca626c	hsk5	凭
31d21e5d-cd76-4f76-bb45-69c14d0f2e33	hsk5	平
f77b33d4-2a29-4532-b39c-a39a9f708d5d	hsk5	平常
54366413-70ae-4ea2-b079-16f89244eaa4	hsk5	平等
47988b94-39fe-41f1-8604-0ff493b42dcc	hsk5	平方
bd8a93a1-81bd-443b-85bd-81b1d26a03dc	hsk5	平衡
fc9e1879-4b87-4a5a-94be-4d9aab85ce31	hsk5	评价
1780fa85-4b86-46d5-97eb-f14e057fd56c	hsk5	平静
d10deb83-254c-4ad9-92eb-5c0f06f6fe78	hsk5	平均
d2758643-5522-4584-8323-2996c02aaf39	hsk5	破产
1d0fafca-c3b2-4cc1-ba13-1f7d93ea3d30	hsk5	破坏
da30d33e-311e-4ba2-b3f1-f2f8a60db937	hsk5	迫切
553d0d31-b344-487a-8ad4-da43dc9615bd	hsk5	朴素
9af4718b-f97f-4cde-9f46-46a8b1a9639d	hsk5	期待
efefb04d-1f69-4039-b153-b8065c29380d	hsk5	启发
5df3ce73-d66f-45ad-ad16-382924fbf7a2	hsk5	气氛
f3271da2-6230-4d35-9d82-d945c39bb2e8	hsk5	奇迹
4aa393cb-8c11-4aac-abb4-a722183c1a65	hsk5	期间
65de6bf6-d5c4-4bfd-9fc7-6304c19d3a26	hsk5	企图
e109c848-3988-482b-88f1-ba79dbed2071	hsk5	企业
5cd99547-bd5b-421f-928f-919209e7a878	hsk5	汽油
145a3663-30fd-432d-bde8-51634adbec15	hsk5	其余
b845cf3a-cf79-4da0-bef5-298810a19786	hsk5	欠
d1dbaeb9-d6bf-4dbc-82e4-8e1bedd45532	hsk5	浅
9cf6a0c8-4dd7-4515-8711-4a039dce090d	hsk5	牵
0fcae671-7eac-4520-ba32-90c7bc82ef63	hsk5	前途
f6f665f0-1110-443e-8125-f19f1c97425a	hsk5	谦虚
2f7357a9-63ee-41e9-965c-3b4a30d7060c	hsk5	签字
0d5a21c3-f858-4621-a0ca-54ffcc8fe5e7	hsk5	抢
ecff04cf-6fcb-40aa-9fdb-50bc89b57be7	hsk5	枪
ceb44ca8-bf2e-4e19-bf88-aa4a6426cc2a	hsk5	强调
9452ea1e-d7ab-42e9-9710-551d83735a32	hsk5	强烈
86569791-7558-4b66-ab76-359f5c229423	hsk5	瞧
401dc4f5-db94-4e05-b988-5a236f2b892d	hsk5	巧妙
5877c221-4bc3-46a7-b8b3-b8d09010bfa1	hsk5	悄悄
44d3aa95-bcad-40d2-b45f-3623bc0aacb8	hsk5	切
2aedb394-cded-4ebb-b8ca-c36eaddbbcdd	hsk5	亲爱
71b7062f-c3fb-4b1c-b54b-e76355adfe11	hsk5	勤奋
6a423af8-a126-471e-8c7c-6c5a12f103a4	hsk5	勤劳
d5d13129-1154-480a-a05d-c4e2823c624e	hsk5	侵略
e737a113-1ee9-4d24-a31d-c42955db735e	hsk5	亲切
8c188e2c-adb1-4dea-9e95-89f43bc72176	hsk5	亲自
1d62d95b-349d-4e54-b2f2-ba7f1897b9ec	hsk5	青
130bfcdb-369e-4fb8-9173-a16289a765c4	hsk5	青春
ab6a180e-e960-4f1d-9be0-a54393a27810	hsk5	清淡
a33da396-e8b6-4993-bca4-8258fad65505	hsk5	情景
5b9a0d23-3742-4763-9de0-2adf3acd58cb	hsk5	请求
1939a2f1-f1f7-48f9-a95d-3c7351ecb33d	hsk5	青少年
bcfe1bbd-f515-4326-9c12-321533734ae4	hsk5	轻视
7ca61b95-a7c8-4375-94ac-bf168feda0c2	hsk5	情绪
96accbec-2261-4322-93ec-7ec01ca70dde	hsk5	庆祝
ac1246a9-b634-4756-8c8e-b31deb4e3730	hsk5	球迷
7c4a7f36-7e37-4733-ba70-05ceb12d96af	hsk5	娶
e2a1c479-2ded-44fc-a2cf-239ec7369571	hsk5	去世
a70aeeaf-fc9f-4645-9dcf-5e39e9a47523	hsk5	趋势
de184f99-2123-4c49-9c09-c33bb4399093	hsk5	取消
b206d44b-c82e-4a18-a946-99d5f9dfaf5e	hsk5	劝
b2cc1c3f-8894-4e5c-bbc7-382c9c7b9355	hsk5	圈
b20ff7ce-032d-4727-92b2-3473364e16bc	hsk5	权利
805a45b9-3108-4804-8c51-170601d95f48	hsk5	权力
56751311-da44-426c-8b65-166c90ab72f1	hsk5	全面
9f2bcfad-e102-433d-9d16-4924ccb04ed0	hsk5	确定
1b8d1345-4b1b-4710-a267-66c1beae1acf	hsk5	缺乏
424d040c-5ec1-4243-a8a4-df074e351544	hsk5	确认
488bc080-11b8-4b4d-bdc8-3078b30cc876	hsk5	燃烧
2feb9dd6-83f7-490a-9960-6b8fb0dd4ef6	hsk5	嚷
b4ee7b47-71e8-41ee-b086-c09bf95c9987	hsk5	绕
a663247f-6d60-4302-9a4c-3f2fa42aa7cc	hsk5	热爱
1a057cbe-cfdb-4df4-be54-b5a3e8c92ad6	hsk5	热烈
605dd95b-ed1d-4631-bcf1-c86f30122911	hsk5	热心
36da2c59-de32-408f-aadf-23c00bbfa5ba	hsk5	忍不住
84f79efd-6cdf-4872-b51c-4c600aae3a25	hsk5	人才
7822e087-e84d-4239-b848-a27f8a536de7	hsk5	人口
600c0991-099a-4647-8571-e6aeab31c801	hsk5	人类
484eb47e-0b08-47e1-b1e7-4caf1b475b40	hsk5	人生
fc06ad14-0581-4890-9939-3f198c16bc23	hsk5	人事
ee081904-3002-4499-a059-5cc493d25aa5	hsk5	人物
d7105798-c7ca-46e4-a025-2ad2240bee2d	hsk5	人员
ef6bfa58-0aae-4a2c-923c-e34c497d5c3f	hsk5	日常
82c2cfdb-d1d8-4399-b903-7cdfa203e46d	hsk5	日程
b29d7fcf-4d5f-42a3-ab4d-76531bb206b8	hsk5	日历
bbb7a5a4-33cb-40c0-997f-944c95148960	hsk5	日期
036cb75b-85d3-47f4-b12e-f7a33522cc42	hsk5	日用品
2b02fef8-214f-4121-a23a-83f1ed90bd08	hsk5	融化
5fac1f40-637b-422f-a045-6e0c575d4d6e	hsk5	荣幸
155f837f-3ad4-4e9d-a749-898ee5e504d4	hsk5	荣誉
6e1a347c-7c76-4ae3-bff1-c02538d8d33e	hsk5	如何
3f9f7449-35f0-42da-abe0-289d520557b5	hsk5	如今
be2cd789-801f-4354-a17f-de43299146a3	hsk5	软件
8c893e21-ffaa-4dcf-883f-9cf168a34964	hsk5	弱
6a181795-7fb0-4136-a64f-332bdc8a4a60	hsk5	洒
59324894-0cae-432b-ac3c-a3d8ccbebafe	hsk5	嗓子
5d9bc5e5-8965-4c01-a432-f0b6827b8080	hsk5	傻
a62b9733-5578-4eb8-9cda-13631b7e767c	hsk5	杀
a913b0be-f4b7-4fde-bad3-a83eb6a4693c	hsk5	沙漠
d19f5085-72c7-4009-b013-7de79f06654c	hsk5	沙滩
3f59b3c1-fe81-47a1-8d07-51ba9c3c6204	hsk5	晒
a8c9c321-62c1-41ec-89e3-a20f42c8b434	hsk5	删除
8c474443-4a9c-4287-9381-00e8ab929a5c	hsk5	闪电
a65c13cd-def1-4046-aba1-fbc415cd0dbb	hsk5	善良
1f5606a3-4406-48de-9a0b-de709d8b5a90	hsk5	善于
f2d009c7-1c33-4bfe-ba87-8455b27b76e2	hsk5	扇子
0b56b344-4821-4724-b4c2-75dc1ba7dc0d	hsk5	上当
8a4ac1f4-9cae-4ed6-9221-abd8b3335be2	hsk5	商品
343ddaee-e00b-4e93-9de2-32ea2ad15ee5	hsk5	商业
273b5951-226e-43f6-999c-e78590616ede	hsk5	勺子
53033488-9ee5-485c-b689-6fac4902d78f	hsk5	蛇
71debae9-284b-404e-9084-11bc592cbd06	hsk5	设备
6ed87f7f-066b-460e-b0a5-66dccbdfc92a	hsk5	舍不得
7b04d2a0-24ca-4e57-a333-8fdb553566ac	hsk5	设计
d7030729-cdb9-4970-9577-a66881d0aac4	hsk5	射击
d3f40fd0-be8c-4048-89ea-5179f5818d58	hsk5	设施
a1671949-fb09-499e-b728-e23d86198684	hsk5	舌头
620ab72f-afb8-442f-8dcd-ef4794aaa161	hsk5	摄影
04cac303-bef1-4b06-84ed-16f618ee7354	hsk5	伸
fb79f2b8-166b-4854-957d-b2e60dd8f1dd	hsk5	身材
8771af97-9f8b-4be7-933c-d894011f48d5	hsk5	身份
33eac8d4-9ac0-4780-b029-18eb37bb03cf	hsk5	神话
100918df-68d0-4485-b867-9560ad2a7f54	hsk5	神经
9b858f7f-61e4-4b34-8ef5-fde822bda1aa	hsk5	深刻
52b3ec33-4785-4c92-a7e5-adbbe85dba48	hsk5	神秘
427199aa-fedd-45bf-aae2-70ca47970511	hsk5	升
de98d5a1-cafd-49f4-9ddf-3a6236135962	hsk5	生产
05fc40a6-0698-4511-a897-f4a08fb278a9	hsk5	声调
b1d0328c-97e9-479c-8393-a3fb9355de72	hsk5	生动
9b444db5-cc34-4ddd-9a76-1a14f3628913	hsk5	胜利
2e391541-a9e7-4d86-822b-015956eb7aa1	hsk5	省略
9157c752-0294-4d0e-a1d8-c2b2839e52e9	hsk5	绳子
ad4b4344-8073-4d9a-bf68-360f69c81efb	hsk5	诗
51983dc3-920b-449d-a9b0-e21c91e84f1c	hsk5	士兵
0d51a2ad-7cdd-4bea-921f-f96f88dcc532	hsk5	时代
38ad65e2-5db5-4374-9e00-9a26e2ea3d85	hsk5	似的
6f0d7659-dd66-4a99-a274-bbd0e8fd9d74	hsk5	是否
a9bd9fb3-2b00-4838-9408-17a985513f1e	hsk5	实话
85b0c214-4b88-49b3-b86d-3fde44b1d187	hsk5	实践
bbd76dbf-d76b-47aa-a0ba-2b5f5c10c7c0	hsk5	使劲儿
f7064254-d556-4c19-b40f-82cb09b659cb	hsk5	试卷
968c0bfa-117d-4c14-80e7-29e8a84c15ab	hsk5	时刻
e364a416-543a-4c7a-8fa6-0a1d20ae016c	hsk5	时髦
6e79e819-924d-4847-8d4a-56d95af6a246	hsk5	失眠
b680e925-b213-4687-b571-36ef2bca9694	hsk5	时期
e10f79fc-0365-4ab8-ade9-b80cf8facaba	hsk5	失去
b96bdac8-1176-437b-a45b-fdf5bb18317c	hsk5	时尚
299fe2b9-69b2-4a81-b0e3-5bb1389b8944	hsk5	事实
1050d5e2-8d9c-4626-9669-fc32a9361a78	hsk5	石头
91da2104-5af1-4ebc-9850-ff3cf59c08fd	hsk5	食物
51792349-80db-4c1b-8bd3-a051d7997c03	hsk5	事物
7504b0fc-4894-45aa-8645-6f81dde6fb7e	hsk5	实习
f9894f42-0cbc-49e6-9671-b527f01d651f	hsk5	实现
b67b21cf-32f9-469e-a807-c1216bdb49bc	hsk5	事先
06495b21-0cb3-4538-8b8d-4bb46538436b	hsk5	实行
4af06eba-1122-4c70-a073-a9f1d3d3dcaa	hsk5	实验
52d0ed07-6be8-4852-8064-0e7933ab7e91	hsk5	失业
1fa1d7a6-e38d-4b80-81df-b30c3e4f64ca	hsk5	实用
1bb8522b-f736-4e5f-949d-cd938923d633	hsk5	始终
77086169-1304-4ce6-8183-cc1cdd5490c1	hsk5	手工
0c5ac404-359c-4b99-8f33-5256ee178db7	hsk5	收获
70b9d262-4d04-4a8a-b04d-b9b7df7db0c4	hsk5	收据
466be373-82ef-4d4a-9858-2b28e33fe58c	hsk5	寿命
4b73410e-b479-40a2-9ed3-f325237693ba	hsk5	受伤
f2ff2ef4-c358-4b1c-bbdf-11cc2d4e1c7b	hsk5	手术
2cdd5fbf-11e8-4203-838a-957d786c0d01	hsk5	手套
31917677-4838-44aa-b70e-7d64a139c540	hsk5	手续
d32d10ab-3517-44b3-88c3-f8cbe9214a5b	hsk5	手指
3f21906c-b624-4b5f-a6b6-00d540c88e1e	hsk5	鼠标
db0f1074-6f1d-4228-ad64-69efb527a8c1	hsk5	蔬菜
89d121a6-3466-4a06-80ce-d97b8095f3c4	hsk5	书架
1e25ba17-0f25-4fc9-b86d-1939e6482fb9	hsk5	数据
2c12588e-6474-4ca6-a756-8ecb695344a0	hsk5	熟练
2d951954-7126-4087-aea6-563100c68fe6	hsk5	数码
9f3e2f7d-bc9b-4d1b-8e34-30f72858f5d7	hsk5	输入
18de3dca-87fe-4db9-8b45-a5feeda443d9	hsk5	舒适
e305b2ce-638d-4dcc-b05d-904f6d29ea64	hsk5	属于
56b2b451-d3b9-48cf-ae72-d2b83f7e34e3	hsk5	梳子
8bb5a6ac-9bc8-4a1a-b9bb-75f67be3c41e	hsk5	甩
339c941d-07d8-4a02-be27-2a26ffed62db	hsk5	摔
e82e4c8d-a9c0-44e2-bd38-e48bc1afc439	hsk5	双方
d0e4bea4-6b7a-41a9-9212-02a19d937c8d	hsk5	税
dc802831-18e0-4b86-9182-8c860e50518c	hsk5	说不定
f109ee59-e432-4e18-ba57-9e42bfca0357	hsk5	说服
6047dcad-a868-48b4-b0a7-13a8258c3b60	hsk5	撕
d2dad9ef-a916-4d9b-8f02-883f3f59d4f0	hsk5	丝绸
8b89c9e5-eec4-44b2-8728-df54cdbb88d5	hsk5	丝毫
e1ed7c34-2de9-4e01-bcd2-c30d800e5496	hsk5	似乎
dc47ade5-3b48-47f3-96e3-63386069c3bf	hsk5	思考
b3224b34-cc15-491e-b2ca-9667e9493563	hsk5	寺庙
239af5af-96c1-4e2c-b5f1-f06515000151	hsk5	私人
93eabff2-4cae-44db-b0f2-f20d909884f4	hsk5	思想
c6fefbbd-03bc-4bc4-96f3-70ae5c26e078	hsk5	宿舍
4ea9240f-3b71-45b9-8920-a06884a7cbe8	hsk5	碎
46b2b418-ff4f-44e4-bfb9-37d65afda1a8	hsk5	随时
b217d24e-5142-468e-a6a7-361536f18040	hsk5	损失
05987a25-0761-4186-a0a0-10448c2fc362	hsk5	所
1d079f1c-bd6c-454c-a1d7-91d945ea5a13	hsk5	锁
fb7baf85-eaea-47bf-8d30-b28fce7d0bba	hsk5	缩短
f9a31ba5-ae74-40ed-b13d-adca4ba2931f	hsk5	所谓
d2a1e88c-f1ba-4a88-93eb-862fe1a1bb34	hsk5	缩小
9ec837b7-c01f-44cd-ac05-455923e389db	hsk5	塔
0804a253-8513-4523-8dcf-5e12083f4dd4	hsk5	太极拳
5a258fa6-0150-4c95-bf53-c0fd0d4c3c1a	hsk5	台阶
bd4ac9b4-cc1d-4684-9eeb-35b5b215e2aa	hsk5	太太
f40ac279-4bf1-4e4b-940b-3dce9d84cdab	hsk5	谈判
4ca393d4-504b-4fb2-90da-df69540e3947	hsk5	坦率
eebaf639-6923-46c1-90c5-6b5965adb102	hsk5	烫
7ad3ce5a-f25a-4e95-8105-a7a6eb30428d	hsk5	桃
39a0cf7e-3a4d-489e-8d20-5c3cc4b61073	hsk5	逃
2d722f2e-8cb1-49d7-839f-852a6c721fcc	hsk5	套
eb8f6b98-be9e-4b9e-a67e-2f24e553bb86	hsk5	逃避
6948b133-f0e6-44bd-8047-1a30adfd0599	hsk5	特殊
88b64395-3436-49bd-8f16-d69c67f9c2a3	hsk5	特意
9f15b30b-3022-4ca1-855e-8e8e4ba346c5	hsk5	特征
92c78d40-6c7f-4a68-bd8d-29b9b8e531d7	hsk5	疼爱
5cf8f2be-c40c-413d-aa79-89afd540acbf	hsk5	提
7cff0a4d-bc6b-4efd-9f6c-594064ff5bb5	hsk5	提倡
34397e8d-44b1-47f0-9530-9702985054f5	hsk5	提纲
cdf82c6d-bdcb-44da-848f-645d30d95b73	hsk5	体会
0e41e6db-6e53-4a01-a522-1399bfc8afcd	hsk5	体积
97bbdf17-c58f-4a13-99f6-2e249f6818b2	hsk5	题目
586bd299-c6d7-4f52-9b36-03f16e331d3c	hsk5	体贴
cf562141-16b8-43ab-808e-468d929207a4	hsk5	提问
10d71d5f-8b4d-44ec-9cc2-c88b2c1526a1	hsk5	体现
678d3ac7-9092-472c-bd02-0a8a01e65802	hsk5	体验
941fa2d6-6a92-4750-9b86-96e712a4694e	hsk5	天空
d67a84ea-bfdb-46bb-9d5c-9b448bf58f6d	hsk5	田野
d53fd12d-c22f-4519-8718-1db8b1f394c1	hsk5	天真
ef4a9176-df88-4dc7-b64a-eae2c02d4c3f	hsk5	调皮
b2b0de08-a51d-43c0-8ddc-1d82ddd3cfb1	hsk5	挑战
cdd70c81-c145-4b3c-bc0f-475b2f960f0a	hsk5	调整
68893b20-cdeb-425f-bc0f-2ca7e76637b6	hsk5	铜
28287cf7-ed59-4bed-bb06-5711eb990636	hsk5	通常
86c769a7-74e8-4cac-a50c-3e2457c6777d	hsk5	痛苦
c7d95b22-ef2d-43b7-a543-1d18dd79d9bd	hsk5	痛快
99709080-587b-4744-9ba6-085a3dcfc102	hsk5	同时
b60ace0a-fc18-42ac-b514-97c6d0c10f6a	hsk5	通讯
db4f3d45-e0fa-4ed2-a7f2-04b3478830f4	hsk5	统一
16258f4d-e145-4ca2-9ec9-77175962bcf3	hsk5	统治
92274027-4007-4981-ab16-466e60507648	hsk5	透明
a63d5ce9-ad91-4f2f-b79c-7952c9ac8bc4	hsk5	投资
484fbdb2-66a3-4f51-8223-f3245c744253	hsk5	吐
d9a6b698-17a1-4dbb-ae7f-1ce45fd87f35	hsk5	突出
f9157c1f-2f8c-4447-ab2a-eb9b717f2d97	hsk5	土地
b76eea92-36ef-45d4-99ff-90218acd76e1	hsk5	土豆
710c490c-1a87-4d9d-93e9-4ecef0e67104	hsk5	兔子
bef5fd3b-f6b6-4fe9-94c1-09cf845c00ee	hsk5	团
7972bf1a-3eb3-471e-b8b1-5aa366fbb35f	hsk5	退
4dfaff59-3e16-420f-b03f-070802ee2b3b	hsk5	退步
16422c9e-57f0-454a-b800-52037f5527e8	hsk5	推辞
b8325815-e600-44f9-a34c-2b734571cc70	hsk5	推广
3f422493-4146-4790-a231-1a8bd0a83d07	hsk5	推荐
3db0b194-ca1d-4d62-84fc-5c5a2192b32d	hsk5	退休
f750e7a7-60ac-4464-8652-3044c6dc20b0	hsk5	歪
aed24e7f-3330-4551-9689-34451740e5b3	hsk5	外交
19cc3920-cd82-4772-8f24-38be7080a805	hsk5	弯
74604ce7-8d63-4c15-a657-7540938291e9	hsk5	玩具
d81fef5b-315b-4c14-8f63-e62c79f3978a	hsk5	完美
dca95d0f-29dc-4209-8260-eb330edc899e	hsk5	完善
61f9d64a-d85f-4fea-8241-5039797a5c15	hsk5	万一
12faab0b-4955-479d-8b54-c75cabf517c1	hsk5	完整
792faf87-2c3a-4228-8260-13bd63e817aa	hsk5	往返
c1cc143d-d649-441b-83d9-7e821fecc21b	hsk5	王子
6e249c48-3599-46c6-a6c2-1d271b56ca41	hsk5	胃
d7665a47-969e-487c-8ab9-c091513dbf44	hsk5	尾巴
3f251fb1-230c-4dde-b65f-634934a12a37	hsk5	未必
4c914d67-3d10-4ef4-b863-ad090ad7cd8d	hsk5	伟大
f3e17882-3758-4849-9da8-73e3104d9985	hsk5	违反
99689429-5028-412d-9774-30c6a29f352a	hsk5	危害
dbd6b8ab-0313-41ee-9f56-06113773ead4	hsk5	维护
734f2013-6c94-414c-a748-672b65a6cb9e	hsk5	围巾
89b97712-9e36-4964-9303-1f6502888802	hsk5	未来
42611c6f-badd-402e-81ea-a12ad9ff0b6c	hsk5	委屈
a93e713f-56a1-45be-865d-3f94a6ca6c67	hsk5	围绕
862490de-4a91-4d7e-8f14-35518507af51	hsk5	卫生间
d2e5725d-cfab-4d9b-951a-2e6aae1add08	hsk5	委托
33783041-fd10-4983-a13f-c8e1f75ea1d4	hsk5	微笑
bb61c2a4-6125-40a9-9f45-c09cbca78142	hsk5	威胁
5cb99e26-92fd-4d1d-b548-cc1194f3b741	hsk5	唯一
95260077-ff2b-460b-8f4d-0ace65ac2ee4	hsk5	位置
7eab7fde-d966-4972-b547-1c870f8ec6a6	hsk5	闻
e217058d-2716-4611-86af-729c2f6ec7fd	hsk5	吻
45a26cc4-9115-4089-b191-140904d80899	hsk5	稳定
1c560dca-2f2b-469b-9c78-760ee34c816a	hsk5	问候
cd762608-a934-4961-b556-94dce4e7574a	hsk5	文件
3e72722e-8840-4be2-ae1a-82050323e5f8	hsk5	文具
e22f7220-7302-4791-9a40-ba28a6889114	hsk5	文明
f1419e4e-2ba7-472a-b6f9-fac76cccb37f	hsk5	温暖
8af130a2-bfec-4e2f-bbcd-ed9d8d35427f	hsk5	温柔
e0e595b7-bd34-4874-9424-7b8b99815aaa	hsk5	文学
ee109505-3a60-4503-9a82-6d8c643047a6	hsk5	卧室
52f3e65a-cde3-4f68-a64e-5dfc79eb8af8	hsk5	雾
73c6d826-db1b-4b23-a73b-533609076da3	hsk5	物理
5e5f380f-3bcf-4924-809b-7c8d42453597	hsk5	无奈
b2404a54-7f78-4f1f-8fc5-77c0e80f966a	hsk5	武器
7d5e7b83-c3ef-45c2-b01b-8904975c6b5c	hsk5	无数
1d6781d2-c07c-4b25-9c67-cdd73b59d0a8	hsk5	武术
c08c06ba-15de-4af4-9a5f-5eb345dc9c7c	hsk5	物质
916f6705-d72b-4a24-899f-41d859eba4c2	hsk5	屋子
68c1e938-68f2-4d3a-b83c-f855b233cd9f	hsk5	系
4634504a-6be2-4ad1-9693-c20c6bb6a2d2	hsk5	细节
31493f7a-7b64-4674-b555-e8201a42a024	hsk5	戏剧
6264c713-a7d8-4db0-8d3a-31d72165aaf0	hsk5	吸收
1ff1cf01-06e8-4514-af84-dde15b7a0bad	hsk5	系统
31aa8079-87f5-4c50-8827-43f1eba6547d	hsk5	吓
47376acd-eca3-4ea2-8093-94e77784cbc7	hsk5	瞎
acf5dbde-1b84-42ed-95a1-9362bcde75a2	hsk5	下载
79c2fced-728f-4e0f-a67a-576ee8000b85	hsk5	县
2f85349d-b3c1-4adb-8ad7-cecc79b26590	hsk5	显得
67a28daf-67b0-4078-965d-180918e41891	hsk5	现金
ba56a502-98f0-4d4e-805f-39b6aebecb79	hsk5	显然
8f09e7e0-8801-41ea-8b08-90f796896cc7	hsk5	现实
025f8a9e-1077-4f07-89de-f874cce5d678	hsk5	显示
732579f0-6f1a-4474-9661-aa49b8c21825	hsk5	现象
9472ad09-d36b-4cb3-a0a7-86514c580397	hsk5	鲜艳
44327437-05e1-41a8-99f1-6dee21a3a78d	hsk5	项
d3aed3cf-15c8-4ea5-a4dd-e83463bd17b5	hsk5	相处
0c8d9cb9-cac6-452a-b64c-997c375033ed	hsk5	相当
c7c35fba-7023-42e7-a4e7-b1a379de2425	hsk5	相对
e988c170-fd7a-434c-9406-d94abebb827b	hsk5	相关
b751d0ca-3a74-4fb5-9f52-05dcf1f5c819	hsk5	项链
4d9617cd-9df5-4a94-a3c7-02eefc5cb709	hsk5	项目
56a44120-0526-45aa-8f99-cf8150bf1fa9	hsk5	想念
49a5829f-2bd1-4607-bad0-fbbfd75e80dc	hsk5	橡皮
981215f8-ae55-409c-ac37-fa6aa54d8060	hsk5	象棋
c444bc80-5942-41f0-802d-579207eb2c94	hsk5	享受
dc07b3b7-681b-4949-99ee-83ad349cd866	hsk5	相似
63850880-55cd-489e-b614-bd195a4688f3	hsk5	想象
eacdd1f4-db5d-4b26-b16a-6d87c5e556db	hsk5	象征
482cece0-050e-4e93-9667-ed614bd2e8dc	hsk5	小吃
5c07d5c4-40b9-4df1-b074-37ad6be2b095	hsk5	消费
984120ec-d256-4800-9f3f-fee58b1868cd	hsk5	消化
a9255993-958f-42aa-bb00-feb110e8ff58	hsk5	小伙子
a661ad17-b17f-4245-9de0-8f74edc504e9	hsk5	效率
096459f1-3f3c-4185-a804-5444b7d0d782	hsk5	小麦
f6e5040c-4c3b-44f7-9e82-80c8a6ee3739	hsk5	消灭
40edcb2d-c5a9-4f0e-9844-249e9c3f76ff	hsk5	小气
1167787b-f942-43a0-8785-ff4298dcfa29	hsk5	消失
e5e6bfb6-ca53-4087-9091-bb5774530c0d	hsk5	销售
9ba72db2-5e2b-4801-b832-01953cfb9d82	hsk5	孝顺
0b7c215f-ec6a-428c-8725-6a86c01b5c30	hsk5	小偷
4c565798-5825-47f8-94ba-16ca8b23c9a9	hsk5	斜
f1bbda4c-824e-412e-80ff-728f469215d9	hsk5	歇
c6e2f5d8-24f4-4c0b-a664-9d339ce37def	hsk5	协调
00513e89-90be-4c9a-8d08-84660877f89b	hsk5	信封
eca86a5f-57af-4650-8958-6dad0e577efe	hsk5	信号
9946bcce-0c9d-46aa-a5fe-9a613424348c	hsk5	心理
7e9f28a6-8b61-4a41-9685-ff5b68843c93	hsk5	欣赏
d14b8dd7-5900-4788-b318-e99ca861c83e	hsk5	信息
039b3235-119a-4416-afbb-82a227f0cbec	hsk5	心脏
3b71dddb-f0bb-4c55-81ea-d0cbc5945c2c	hsk5	形成
a76972d1-0281-45b4-a43d-dfbedf372e14	hsk5	行动
d0581f56-5498-469b-b512-a2215c1e5ad3	hsk5	幸亏
a29fbdff-8241-4fc7-b6da-cbcf1a7da402	hsk5	行人
732e4b55-e2fb-42a5-97b4-341bc486d3f8	hsk5	形容
5d81e9f9-d5f1-467b-a506-61c05639cc5c	hsk5	形势
316a9b8d-9fac-4fdf-b20c-28b96b3336d1	hsk5	形式
13363241-cc91-405a-abf3-2e0292989172	hsk5	行为
3166d73f-9087-4485-beae-8f2187efbbdf	hsk5	形象
dd62c201-d78d-4851-8af0-d0579298bb45	hsk5	幸运
ffca6478-1cae-4641-a561-9ebdf9cd09ee	hsk5	性质
25b36167-ef4e-46da-b242-8d38809fc2cf	hsk5	形状
6ee436d1-3d30-4273-b8e4-4eb8d832c269	hsk5	胸
032be8e2-b71a-41c0-bd82-3127a1379d70	hsk5	兄弟
54de8f00-9880-402b-a4ca-52d7fcad77ad	hsk5	雄伟
ebce3997-79ea-4121-9bae-80534904ed20	hsk5	修改
8e727096-a63f-405f-b2db-2cbb40abd031	hsk5	休闲
c618c50e-f0f1-47d6-8200-d1ab585e0661	hsk5	叙述
dfa01248-8cd3-471b-9e18-fa90f6f70a1a	hsk5	虚心
fa3ae89f-327c-4657-9479-e039acb6749c	hsk5	宣布
6934e709-33d2-4bba-94dc-f5bc882fc114	hsk5	宣传
bc417e17-7e66-4fbb-86cf-bd1e2a3943df	hsk5	选举
76c262ec-eb57-4ddb-ad07-9afbcd8c5ff6	hsk5	学期
cfae8564-d78e-4372-8305-b013a50f34e2	hsk5	学术
d7a05a46-19c0-4b2b-b05c-58a5e3b944cc	hsk5	学问
7f0c8fd0-5bcc-4bbf-a467-1fd4e429935f	hsk5	训练
e831e518-847f-43d9-b8e3-1b3e005895f3	hsk5	迅速
57cf1a3d-b6d6-40bd-a2ae-4e14ef64a6ca	hsk5	询问
6885a8c8-54a9-4c64-ba8a-daf48632316b	hsk5	寻找
d00a4110-2a4e-4ff5-8f53-3c2d2fbfb745	hsk5	延长
8db14935-167e-48c6-b47d-808bbe4c5186	hsk5	宴会
0fa6666b-c73a-426b-99f7-66e652e5acff	hsk5	严肃
ab2d6fa8-293a-4bc5-9aa6-d284847933fd	hsk5	痒
eb802ce6-44d9-4572-bf17-380e19e2230e	hsk5	样式
f37d27a8-090d-4a0e-beb4-776e636bd26d	hsk5	阳台
c1253c41-b177-40dd-80fb-3e71f001f8fe	hsk5	摇
9b531e97-e0fb-418a-b85b-2ba92409d1ce	hsk5	咬
66665477-6846-4bde-bed0-924c616248e8	hsk5	腰
0b10ac48-1b93-4701-a2f4-7e63cfce8063	hsk5	要不
c7f3d587-f691-4010-af81-1d5cc6b794d1	hsk5	要是
0da8a013-137b-4a92-8c51-1d2431468558	hsk5	夜
499f69b5-7ff9-413c-8ff1-a28ff40075ca	hsk5	液体
a4396287-0cf9-40a4-8115-01007b95737a	hsk5	业务
dce437dc-9660-4adc-837f-a52b01a15b8e	hsk5	业余
368fa391-cd31-4fa7-8390-af9f01732249	hsk5	乙
6edec02a-31c1-4c5c-a7ce-4d98631c33b9	hsk5	一辈子
4273785c-0684-4888-9d8e-cf329b97963f	hsk5	一旦
abea5b8e-0d68-467d-9506-49d20b228eb0	hsk5	移动
713b7643-02d6-4c2c-aabd-ac2c0f26dae0	hsk5	遗憾
6dcea49a-e4b9-4357-a3cf-38c3717c13cf	hsk5	以及
7ce5c0ad-543b-4f11-93f6-b81f3b7f879c	hsk5	以来
0ba8585c-f761-4e2a-bd98-4154189980c7	hsk5	一路平安
e3fd8a0d-ab1c-46b2-87f1-860818031300	hsk5	议论
7a94dabe-934c-447e-8bcc-053a89b3bc95	hsk5	移民
fdc3607d-d914-4545-a2cc-3ce1bb0bdc93	hsk5	依然
fc71de4d-ca02-44cf-9707-17a6974d3295	hsk5	意外
dc271d67-885a-4527-b219-95111f74d50d	hsk5	疑问
4b4c0f19-3fa0-429a-8afa-7dbdfcd90175	hsk5	义务
9f5220db-5694-4ffc-8d7a-3ce18a1ee90e	hsk5	意义
1115bbe7-fb3a-4eb1-9821-f929bd08dfa3	hsk5	一致
93b05240-bac1-432a-b920-18fc47fb3dc5	hsk5	银
58dbd6dc-880b-463b-be64-a19ea503c95d	hsk5	因而
251a1136-7a7a-4b15-854e-ff49e3d29eb9	hsk5	因素
70c6f40f-142d-461c-b007-a041d32fcf05	hsk5	硬币
c5b34a29-4272-43e2-bca9-3df431e1a874	hsk5	应付
e62af66c-f25d-4740-916a-288008323f94	hsk5	硬件
b7325fc6-8af2-46a0-b28a-37dc54883751	hsk5	迎接
8e949805-8aee-4356-acac-e0d0c7d1e19a	hsk5	英俊
e0ce6ee7-0612-459e-88c3-8c5810b73c07	hsk5	应聘
faa8ca65-6628-40cb-adf6-f7b01340d18d	hsk5	英雄
d55d4a95-4bf7-4cfb-b242-675f9ef075dd	hsk5	营养
a9a26b54-6585-4c00-b5a6-96b5d7f5e59b	hsk5	营业
1effe612-bac7-49ec-8c56-936eb34b19a0	hsk5	应用
90aa344a-bd46-42e0-8d5c-ae74ab1dc200	hsk5	影子
c9fd14e5-0aae-4343-8b84-cf423a4883ab	hsk5	拥抱
778db260-1486-4fdc-ac4d-ab860a4d60f1	hsk5	拥挤
0f2eaa9f-5667-4953-9a53-61ad77caab2f	hsk5	勇气
f426ea83-2c8c-4d35-9ceb-daa7f9717def	hsk5	用途
6b42e789-0631-44ed-b8ed-4aa3dbecc33b	hsk5	幼儿园
43c06b54-c101-4161-818e-fd21249b0ca8	hsk5	优惠
f2e7785f-0e8f-4afd-9f4a-5c1c6c19509e	hsk5	悠久
99cc4884-41ef-4b36-b28b-07219a629379	hsk5	邮局
fe3b5719-420b-4605-ab06-5ed5721088db	hsk5	游览
f35b9b01-b5a7-4dc1-a1e4-090b9d2cd994	hsk5	有利
f09bd223-52c1-4035-82f4-47d2f4852ea3	hsk5	优美
6ced7f74-01a2-4cb0-a87d-aa75792debc5	hsk5	优势
33004fa4-f9c0-46b1-bc76-bd8bfd3e9fc1	hsk5	犹豫
cb76f65d-c14b-4cc6-a290-d8ccde27fc55	hsk5	油炸
95c42df8-2014-4f71-a596-80ddf75b6335	hsk5	预报
89150264-aede-4827-b8f7-ca4fcc7aece7	hsk5	预订
bcc70b3c-baf4-4770-9a9f-b1e92ad953c4	hsk5	预防
ed4e48ab-0ab5-435d-94e8-424188945348	hsk5	娱乐
7ee9cef6-cb4d-48ca-b164-d73d5dd43234	hsk5	玉米
88c1fb77-533f-4295-96a0-b526604e9bb1	hsk5	与其
cf4b3d5c-1077-4cc2-b6f0-8522f69b6ff2	hsk5	语气
5dc4dc6e-419b-4371-8c00-631f5d25b1e0	hsk5	宇宙
34ae3ac9-9c4f-44cf-be87-3f3ae7b63512	hsk5	元旦
23ccd80d-e7d1-4e05-93aa-6e4876cf2763	hsk5	缘故
7bbd5fe2-9a6d-4489-8b16-4b8667966b9b	hsk5	原料
a74c537d-7535-4ae6-a87c-95c79c64a9f1	hsk5	愿望
e767e4a6-dfa8-499b-a69e-8ea32a829c5e	hsk5	原则
03ddb639-8ab1-4859-acbe-058b70be0388	hsk5	晕
2605b534-2837-4742-bb26-4b36327459ce	hsk5	运气
2d3cfd74-0aca-4a36-83bf-7e787db4e57f	hsk5	运输
b9c7119e-a985-431b-a310-10b89ef2c4c3	hsk5	运用
5132d112-86aa-4dc3-a5f1-a31f581c05c7	hsk5	灾害
c8a3ccd9-61e7-4c67-95bf-f31c6d5e2111	hsk5	再三
3a508e8a-16e0-4b1e-b3a0-11e670b8f2b0	hsk5	赞成
34daf325-2bfb-45a3-8184-a7896df81d5a	hsk5	赞美
8dfe4f48-0f32-47b7-9e3e-88644bfdf7cc	hsk5	造成
ca796203-a49f-4296-b476-16645255918d	hsk5	糟糕
84c44660-8437-4c2b-9cb4-5746f85db558	hsk5	则
f0e6d0d2-8065-4e90-9a67-5f2d368765d9	hsk5	责备
a14fe82e-d477-41d6-8279-d60b20fd5efc	hsk5	摘
3b3a449e-4335-4fc7-9dbe-226b13632cf1	hsk5	展开
5bc1d547-3c66-4593-9a3a-d442416ac6d2	hsk5	展览
b72b668c-ae8b-4310-8819-5f65252d0117	hsk5	粘贴
2ee738e8-3299-455d-a04e-6459dfc54095	hsk5	占线
3966d33c-23be-462a-89ff-2369efb1e379	hsk5	战争
fdb916a6-71c0-4d1a-b087-6c5f57cfbed6	hsk5	涨
a572f842-11c2-440a-9163-f286e248529e	hsk5	账户
b098be86-829a-4424-bd43-c119cdb41518	hsk5	掌握
eaf66fb2-0ca7-4af6-b459-862edce222e8	hsk5	照常
cec8fe58-c28b-4ef4-8099-312430b143cc	hsk5	招待
972bcdee-90e6-4b5e-94ff-8522ad318695	hsk5	召开
d6af9b9f-1eea-4fa9-8d6c-0ea2302e8884	hsk5	着凉
5b9cc5ca-e1af-442d-a7b2-7650f2a75009	hsk5	哲学
7d2cf602-39aa-4762-ab4a-7ae1a53fefad	hsk5	阵
de282e6b-c622-4d2a-93fe-8d7481230b93	hsk5	振动
c60d9f16-6dbc-41ba-b2e4-e9d11c029755	hsk5	诊断
172d5f49-73f8-4777-ae2d-b82ef38d824c	hsk5	针对
1bd3f3cb-d94d-43c1-933b-b44effd0c59b	hsk5	真理
da164f77-b102-4fb4-a46a-0c6909e33860	hsk5	真实
f2dfe92e-ef2d-4c0e-88c9-31b6db14b257	hsk5	枕头
1db3e8b5-09d3-4454-badc-462737aba1e8	hsk5	珍惜
cf07b059-3df6-4f0f-bb49-d067f9855d3b	hsk5	正
a217af38-689e-45d1-b0ed-5abaa975f662	hsk5	睁
b79db66d-b8fb-4498-80c0-da7ac990d674	hsk5	政策
98008d61-3b6e-4369-b147-fbd43235f1e4	hsk5	政府
3aeea77c-b13c-4448-b679-a4274e736c7a	hsk5	整个
74694bd8-6d9d-40af-a8f8-6a4d71e87b96	hsk5	证件
0a5bef05-f43d-4bd9-a5c6-b92cacbb3ce4	hsk5	证据
d90d2f56-fa0e-4c6d-83e9-36071a0be344	hsk5	争论
9bbf0d67-8152-456a-8a46-14561ddd1aca	hsk5	挣钱
b908d8a5-1c87-4b6c-a089-132c93df998b	hsk5	征求
153cd7f5-df31-4337-b7dc-9404763fe1f5	hsk5	争取
80864d72-8c33-4d4c-a970-edadee6f257f	hsk5	整体
db3fe414-479d-4439-8b9c-4e3126b5173a	hsk5	政治
1af1e7d8-1710-4ca5-8bf4-307a41337768	hsk5	直
cdd2c41f-a17f-477c-8af8-be5a04beae20	hsk5	支
fd230b2d-394a-4a9c-9702-b1347f2370ff	hsk5	指导
494d3f8c-035c-4675-a08b-bb3af773164b	hsk5	制定
3041ffaf-8f18-4e2d-b3c5-30b1c9942eeb	hsk5	制度
795375f2-be20-4237-a5b1-fcdd5d8ea6c6	hsk5	智慧
7f4f47f9-5bf1-45c6-9c22-2e4b9b83dfb6	hsk5	指挥
f08e9d29-291a-44c2-afa4-6c171caf5f59	hsk5	至今
049a18b0-3bad-433e-bd34-872ef032b80a	hsk5	治疗
a3a0fd91-2270-49bc-adc6-0cc590a94d86	hsk5	支票
b012088d-238a-4b12-8a58-255baa3ee4ed	hsk5	执行
4d12294b-9e13-477e-854f-95d92eaa0d6b	hsk5	秩序
8637cce6-2bc5-41ef-86bb-85cb707209c5	hsk5	至于
f74594fa-1905-45b6-b4d5-12a06653c979	hsk5	志愿者
9b3066b8-29de-4590-990a-5cd2217ce542	hsk5	执照
dafb72c0-882d-4264-8fec-0d64eb98cc3f	hsk5	制作
6a1dc339-3b73-45a8-b6f5-91d2bc6df8d2	hsk5	重
936356cc-28fe-4b7d-b75f-befb297e62fd	hsk5	钟
8c8bf901-88fc-4997-8b31-7b5a9a70e9ed	hsk5	中介
7bb20d4a-c15d-4e80-8aec-eef424403f44	hsk5	重量
9720391e-254f-4120-ab1c-1aec0f6147df	hsk5	中心
4ee40eff-1be1-460d-a668-bed6e5edc4ab	hsk5	中旬
cef79002-fcdb-4c93-964b-5cad7f58aa23	hsk5	周到
da1203c8-a237-41b1-b3b5-39a47a310dbf	hsk5	煮
dc747ec7-1b77-4f29-b415-223f829aadb9	hsk5	逐步
9904447a-eafa-4308-873c-4641f9a38b39	hsk5	注册
45546795-34d8-47ee-9cd1-1f673640bcfb	hsk5	主持
d498c29a-4380-4eb7-aa6c-2d7ab3a27650	hsk5	祝福
db075824-f013-4b39-85e4-a8d43337472a	hsk5	嘱咐
f427d9ec-c210-4eb5-bd25-8b8f6b642c42	hsk5	主观
af165159-3d3f-4fce-902b-cb463633a36b	hsk5	主人
115e9c3c-8890-45c1-b4a7-c41107e26a76	hsk5	主席
5a92d4c6-efd3-495d-aea0-0e8850022af8	hsk5	主张
952c0935-607c-4baa-b892-f19d2a22669a	hsk5	竹子
44df49c7-d0bb-48af-8885-1451141f816a	hsk5	抓紧
3f4add40-f487-4d60-9423-dfff8da9fb31	hsk5	转变
eee12251-6d66-4ab1-8f9f-755cf50b7c29	hsk5	转告
990fd5db-cf94-43e9-9cf1-29bba9a82de9	hsk5	专家
a25f0fa4-20b0-4f5b-aba1-ea2487fd7952	hsk5	专心
86dbd289-d979-41ab-b8f8-0ece5b9bd014	hsk5	装
b763fa3a-645f-4b7b-9a0e-34fa84e49d6c	hsk5	状况
9e581877-2289-429c-8475-28c1880737e5	hsk5	装饰
17377c69-769d-411a-b857-5c21f7c84488	hsk5	状态
c84449b3-998f-413d-910b-4871db8d84c3	hsk5	追求
72e63ba9-ecdb-49ee-8e94-8400806e32bf	hsk5	紫
0e87d8a2-902e-4552-973a-30d8b20d0010	hsk5	自从
2e6006e5-d52b-425b-b0ec-4336f37c5db6	hsk5	自动
98e37d3d-d81b-42c5-bc95-7fcfd29900bf	hsk5	资格
867fb79b-2e55-4b05-929c-29d825aaf10b	hsk5	自豪
78cb78e8-6c3c-4538-ac02-4dcae795825a	hsk5	资金
e2d3e16f-e86a-4119-b0ed-d8cb0235b77c	hsk5	自觉
e1941c1b-f641-4efa-8353-aaabec676cfa	hsk5	资料
48aedfba-3343-44f6-926a-e10ece4d70ca	hsk5	字幕
a78e62db-ccab-4ce3-8fc3-14c2a1231a27	hsk5	姿势
cdf8eae0-98a0-4fbf-9d64-6ec64b111a77	hsk5	自私
75c25c38-341d-4288-9d36-a99b768ca10a	hsk5	自信
9c576122-26f7-4a7b-88d1-2666e777107a	hsk5	咨询
18f67014-794d-4649-a61b-8e86281bce6e	hsk5	自由
95fb8e06-894a-4350-87fd-dddce6044ff9	hsk5	自愿
e892e3c3-ad1d-4ad6-8848-9885c4855153	hsk5	资源
7c4a085d-44d4-4875-a9e1-83108971151b	hsk5	总裁
df86a737-647c-4d48-b31f-b1b36a17bd34	hsk5	总共
9d3c1ead-9fc3-44df-bf4b-ebb720d22d48	hsk5	综合
5b09d524-56a2-423e-9c9f-e0699db98327	hsk5	宗教
8cd11275-d6f5-46f3-b479-b9b9e3d10841	hsk5	总理
a73bcba5-6b2d-4cf0-b872-5323889a7d12	hsk5	总算
7d889ee7-e403-47d2-8a1e-f8900386c90e	hsk5	总统
56efc4a0-92a2-4106-bb75-3bbbca5b10da	hsk5	总之
120e2c5f-706e-46cd-b1f6-8e758644afd0	hsk5	祖国
b3022fb6-3fb9-4191-a2c0-6d761f74a5fe	hsk5	组合
ad4bf48e-e0da-4262-bae5-018931860516	hsk5	祖先
04d9481c-8b17-4793-babb-1af21d6835de	hsk5	阻止
34465b3b-36cf-406e-97d8-27a02552cabb	hsk5	醉
149de9e6-c378-463b-9378-c57131838150	hsk5	最初
c587dc9b-34c6-4fa7-b4bc-2285741e93e0	hsk5	罪犯
ff33ebed-fd06-4377-ab2b-01eb047fcff7	hsk5	尊敬
4c21a77d-23b7-42fc-b5fd-320788c6a946	hsk5	遵守
5218c877-f769-443f-b163-65f03e455095	hsk5	作品
5c63cd80-1c14-4909-8219-7eb944de963b	hsk5	作为
47e2bda0-f0aa-4901-be97-e964ac851e49	hsk5	作文
26f04153-0ca4-46c3-8212-daf86e2e0a14	duolingo2.1	房子
6bfdab95-44d0-4791-b361-05c90309eb5e	duolingo2.1	厨房
f5641474-e03a-49d3-a835-2bcfd0e5c7ef	duolingo2.1	房间
a0ecf34a-9526-4e45-940b-45555fdb1e2c	duolingo2.1	客厅
724fcd1c-a00a-4a10-a1d7-c42873d7d2d5	duolingo2.1	公寓
c96387b5-5049-4989-ab8a-d2014b1c8c1a	duolingo2.1	小
b15c7f28-c453-49ce-ba99-3c300b85ef25	duolingo2.1	漂亮
c0944086-c89e-46ba-9c80-be6f0a16b4a8	duolingo2.1	早
f136df2e-36de-4b34-8693-e44d5d5dcb03	duolingo2.1	沙发
53705bc9-b563-49c9-abe5-95daceec3b31	duolingo2.1	床
4fa493ce-3106-4659-adc5-cc7b87c82faf	duolingo2.1	多
dfb2d065-a7d2-41f6-85ee-45579876f4e7	duolingo2.1	空调
d52674d5-19e7-42e3-844d-679ca3559284	duolingo2.1	电视
376a86e8-05a4-4c70-a847-f106e688d03c	duolingo2.1	北京
d67a7ff2-528b-49ff-8a1a-7302c83a81f4	duolingo2.1	走
c7ee4003-62be-4fd1-adcd-05441007a182	duolingo2.1	飞机
f81c48ae-6523-45b3-b0fe-9aac4e3b2e1b	duolingo2.1	坐
c69d44bf-d340-45f9-bbb0-ae31662537cb	duolingo2.1	机场
8e821259-2212-4433-9a26-563c32e569b5	duolingo2.1	出租车
fdf56f08-3425-4616-b7be-4c40ce7db880	duolingo2.1	地铁
51ebe7c6-b2cc-474e-a21b-a591f3c87665	duolingo2.1	故宫
fe8803b7-0901-45eb-bc69-5c241ff691ed	duolingo2.1	长城
5e3abf0d-660b-443d-8421-292738ed1593	duolingo2.1	公交车
fbd10ec2-31b4-4add-b350-7b2fba97f429	duolingo2.1	便宜
5b0a2d8d-bf63-4723-ad69-16cef432eb99	duolingo2.1	怎么
\.


--
-- Data for Name: vocab; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vocab (simplified, pinyin, hanviet, cantonese, english, wohok_link) FROM stdin;
全面	quán miàn	toàn diện	cyun4 min6	[{"meaning": "all-around, overall, comprehensive", "part_of_speech": "adjective"}]	\N
确定	què dìng	xác định	ding6 jing4	[{"meaning": "to make sure, to define, to determine", "part_of_speech": "verb"}]	\N
缺乏	quē fá	khuyếch phạm	kyut3 fat6	[{"meaning": "shortage", "part_of_speech": "noun"}, {"meaning": "to be short of, to lack", "part_of_speech": "verb"}]	\N
确认	què rèn	xác nhận	king4 jing6	[{"meaning": "confirmation", "part_of_speech": "noun"}, {"meaning": "to confirm, to verify", "part_of_speech": "verb"}]	\N
燃烧	rán shāo	nhiên thiêu	yin4 siu1	[{"meaning": "to burn, to kindle", "part_of_speech": "verb"}]	\N
嚷	rǎng	nhang	joeng1	[{"meaning": "to blurt out, to shout", "part_of_speech": "verb"}]	\N
绕	rào	nhạo	jo2	[{"meaning": "to wind, to coil (around), to go around", "part_of_speech": "verb"}]	\N
热爱	rè ài	nhiệt ái	jit6 oi3	[{"meaning": "to love ardently, to adore", "part_of_speech": "verb"}]	\N
热烈	rè liè	nhiệt liệt	jit6 lit6	[{"meaning": "warm (welcome, etc.), enthusiastic", "part_of_speech": "adjective"}]	\N
热心	rè xīn	nhiệt tâm	jit6 sam1	[{"meaning": "enthusiasm", "part_of_speech": "noun"}, {"meaning": "enthusiastic, ardent, warmhearted", "part_of_speech": "adjective"}]	\N
忍不住	rěn bu zhù	nhẫn bất chứng	yan2 bat1 zung6	[{"meaning": "cannot help, unable to bear", "part_of_speech": "verb"}]	\N
人才	rén cái	nhân tài	yan4 coi4	[{"meaning": "talent, talented person", "part_of_speech": "noun"}]	\N
人口	rén kǒu	nhân khẩu	yan4 hau2	[{"meaning": "population", "part_of_speech": "noun"}]	\N
人类	rén lèi	nhân loại	yan4 lai6	[{"meaning": "humanity, mankind", "part_of_speech": "noun"}]	\N
人生	rén shēng	nhân sinh	yan4 saang1	[{"meaning": "life, human life", "part_of_speech": "noun"}]	\N
人事	rén shì	nhân sự	yan4 si6	[{"meaning": "human affairs, personnel", "part_of_speech": "noun"}]	\N
人物	rén wù	nhân vật	yan4 mat6	[{"meaning": "character, protagonist", "part_of_speech": "noun"}]	\N
人员	rén yuán	nhân viên	yan4 jyun4	[{"meaning": "staff, personnel", "part_of_speech": "noun"}]	\N
日常	rì cháng	nhật thường	jat6 soeng4	[{"meaning": "daily", "part_of_speech": "adjective"}]	\N
日程	rì chéng	nhật trình	jat6 cing4	[{"meaning": "schedule", "part_of_speech": "noun"}]	\N
日历	rì lì	nhật lịch	jat6 lik6	[{"meaning": "calendar", "part_of_speech": "noun"}]	\N
日期	rì qī	nhật kỳ	jat6 kei4	[{"meaning": "date", "part_of_speech": "noun"}]	\N
日用品	rì yòng pǐn	nhật dụng phẩm	jat6 jung6 ban2	[{"meaning": "articles for daily use", "part_of_speech": "noun"}]	\N
融化	róng huà	dung hoá	jung4 faa3	[{"meaning": "to melt, to thaw", "part_of_speech": "verb"}]	\N
荣幸	róng xìng	danh hưởng	wing4 hang6	[{"meaning": "honoured", "part_of_speech": "adjective"}]	\N
荣誉	róng yù	danh dự	wing4 jyu6	[{"meaning": "honour, glory", "part_of_speech": "noun"}]	\N
如何	rú hé	như hà	jyu4 ho4	[{"meaning": "how, in what way", "part_of_speech": "adverb"}]	\N
如今	rú jīn	như kim	jyu4 gam1	[{"meaning": "nowadays", "part_of_speech": "time"}]	\N
软件	ruǎn jiàn	nhuyễn viên	jyun4 gin6	[{"meaning": "software", "part_of_speech": "noun"}]	\N
弱	ruò	nhược	joek6	[{"meaning": "weak", "part_of_speech": "adjective"}]	\N
洒	sǎ	sá	saa3	[{"meaning": "to sprinkle, to spray", "part_of_speech": "verb"}]	\N
嗓子	sǎng zi	sang tử	song2 zi2	[{"meaning": "throat, voice", "part_of_speech": "noun"}]	\N
傻	shǎ	sảo	saa1	[{"meaning": "foolish", "part_of_speech": "adjective"}]	\N
杀	shā	sát	saat3	[{"meaning": "to kill", "part_of_speech": "verb"}]	\N
沙漠	shā mò	sà mạc	saa1 mok6	[{"meaning": "desert", "part_of_speech": "noun"}]	\N
沙滩	shā tān	san đất	saa1 taan1	[{"meaning": "beach", "part_of_speech": "noun"}]	\N
晒	shài	tái	saai3	[{"meaning": "to share files, to dry in the sun, to sunbathe", "part_of_speech": "verb"}]	\N
删除	shān chú	xóa bỏ	ceot1 syu2	[{"meaning": "to delete", "part_of_speech": "verb"}]	\N
闪电	shǎn diàn	xuyên điện	sim2 din6	[{"meaning": "lightning", "part_of_speech": "noun"}]	\N
善良	shàn liáng	thiện lương	sin6 loeng4	[{"meaning": "kindhearted, good, honest", "part_of_speech": "adjective"}]	\N
善于	shàn yú	thiện ư	sin6 jyu1	[{"meaning": "to be good at", "part_of_speech": "verb"}]	\N
扇子	shàn zi	phiến tử	sin3 zi2	[{"meaning": "fan", "part_of_speech": "noun"}]	\N
上当	shàng dàng	thượng đang	soeng6 dong2	[{"meaning": "to be fooled", "part_of_speech": "verb"}]	\N
商品	shāng pǐn	thương phẩm	soeng6 baak6	[{"meaning": "good, commodity", "part_of_speech": "noun"}]	\N
商业	shāng yè	thương nghiệp	soeng1 jip6	[{"meaning": "business, commerce, trade", "part_of_speech": "noun"}]	\N
勺子	sháo zi	thước tử	sok3 zi2	[{"meaning": "spoon", "part_of_speech": "noun"}]	\N
蛇	shé	sa	se4	[{"meaning": "snake", "part_of_speech": "noun"}]	\N
设备	shè bèi	thiết bị	cit3 bai6	[{"meaning": "equipment, facilities", "part_of_speech": "noun"}]	\N
舍不得	shě bu de	xa bất đắc	se3 bat1 dak1	[{"meaning": "reluctant to give up or let go", "part_of_speech": "verb"}]	\N
设计	shè jì	thiết kế	cit3 gai3	[{"meaning": "design, plan", "part_of_speech": "noun"}, {"meaning": "to design, to plan", "part_of_speech": "verb"}]	\N
射击	shè jī	xạ trịch	se6 zik1	[{"meaning": "to shoot, to fire (a gun)", "part_of_speech": "verb"}]	\N
设施	shè shī	thiết sứ	cit3 si5	[{"meaning": "facility, installation", "part_of_speech": "noun"}]	\N
舌头	shé tou	thiết đầu	cit3 tau4	[{"meaning": "tongue", "part_of_speech": "noun"}]	\N
摄影	shè yǐng	thiết ảnh	sip3 jing2	[{"meaning": "to take a photo, to shoot a movie", "part_of_speech": "verb"}]	\N
伸	shēn	thân	san1	[{"meaning": "to stretch, to extend", "part_of_speech": "verb"}]	\N
身材	shēn cái	thân thể	san1 coi4	[{"meaning": "figure, stature", "part_of_speech": "noun"}]	\N
身份	shēn fèn	thân phận	san1 fan6	[{"meaning": "identity, status", "part_of_speech": "noun"}]	\N
神话	shén huà	thần thoại	san4 waa6	[{"meaning": "fairy tale, myth", "part_of_speech": "noun"}]	\N
神经	shén jīng	thần kinh	san4 ging1	[{"meaning": "nerve", "part_of_speech": "noun"}]	\N
深刻	shēn kè	thâm khắc	sam1 hak1	[{"meaning": "profound, deep", "part_of_speech": "adjective"}]	\N
神秘	shén mì	thần bí	san4 bei6	[{"meaning": "mystery", "part_of_speech": "noun"}, {"meaning": "mysterious", "part_of_speech": "adjective"}]	\N
升	shēng	thăng	sing1	[{"meaning": "to promote, to raise", "part_of_speech": "verb"}, {"meaning": "1 liter", "part_of_speech": "measure word"}]	\N
椅子	yǐ zi	ỷ tử	ji5 zi2	[{"meaning": "chair", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%a4%85%e5%ad%90-yi-zi-translation-pronunciation-and-example-sentences/
生产	shēng chǎn	sinh sản	sang1 caan2	[{"meaning": "production", "part_of_speech": "noun"}, {"meaning": "to produce, to manufacture", "part_of_speech": "verb"}]	\N
声调	shēng diào	thanh điệu	seng1 diu6	[{"meaning": "tone, note", "part_of_speech": "noun"}]	\N
生动	shēng dòng	sinh động	sang1 dung6	[{"meaning": "vivid, lively", "part_of_speech": "adjective"}]	\N
胜利	shèng lì	thắng lợi	sing3 loi6	[{"meaning": "victory, triumph", "part_of_speech": "noun"}]	\N
省略	shěng lüè	tiết lược	saang2 luk6	[{"meaning": "to leave out, to omit", "part_of_speech": "verb"}]	\N
绳子	shéng zi	thằng tử	sing4 zi2	[{"meaning": "string, rope, cord", "part_of_speech": "noun"}]	\N
士兵	shì bīng	sỹ binh	si6 bing1	[{"meaning": "soldier", "part_of_speech": "noun"}]	\N
时代	shí dài	thời đại	si4 doi6	[{"meaning": "time, era, epoch", "part_of_speech": "time"}]	\N
似的	shì de	thị đích	ci5 dik1	[{"meaning": "(seems) as if", "part_of_speech": "conjunction"}]	\N
是否	shì fǒu	thị phải	ci4 fai3	[{"meaning": "whether (or not)", "part_of_speech": "conjunction"}]	\N
实话	shí huà	thực thoại	sat6 waa6	[{"meaning": "truth", "part_of_speech": "noun"}]	\N
实践	shí jiàn	thực tiễn	sat6 gin6	[{"meaning": "to practice, to carry out", "part_of_speech": "verb"}]	\N
使劲儿	shǐ jìn r	sỹ cấp nhi	si2 geng6 ji6	[{"meaning": "to exert all one’s strength", "part_of_speech": "verb"}]	\N
试卷	shì juàn	thí nghiệm	si3 gin2	[{"meaning": "examination paper", "part_of_speech": "noun"}]	\N
时刻	shí kè	thời khắc	si4 hak1	[{"meaning": "moment", "part_of_speech": "time"}]	\N
时髦	shí máo	thời mốt	si4 maau6	[{"meaning": "fashionable", "part_of_speech": "adjective"}]	\N
失眠	shī mián	thất miên	sat1 min5	[{"meaning": "insomnia", "part_of_speech": "noun"}, {"meaning": "be unable to sleep", "part_of_speech": "verb"}]	\N
时期	shí qī	thời kỳ	si4 kei4	[{"meaning": "period, phase", "part_of_speech": "noun"}]	\N
失去	shī qù	thất khứ	sat1 heoi2	[{"meaning": "to lose (sth.)", "part_of_speech": "verb"}]	\N
有	yǒu	hữu	jau5	[{"meaning": "to have, to exist, to be", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%9c%89-you-translation-pronunciation-and-example-sentences/
月	yuè	nguyệt	jyut6	[{"meaning": "month, moon", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%9c%88-yue-translation-pronunciation-and-example-sentences/
在	zài	tại	zoi6	[{"meaning": "at, on, in", "part_of_speech": "relative clause"}, {"meaning": "for action in progress", "part_of_speech": "particle"}]	https://wohok.com/dict/%e5%9c%a8-zai-translation-pronunciation-and-example-sentences/
再见	zài jiàn	tái kiến	zoi3 gin3	[{"meaning": "goodbye, see you", "part_of_speech": "expression"}]	https://wohok.com/dict/%e5%86%8d%e8%a7%81-zai-jian-translation-pronunciation-and-example-sentences/
怎么	zěn me	chẩm ma	zeon3 mo1	[{"meaning": "how", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e6%80%8e%e4%b9%88-zen-me-translation-pronunciation-and-example-sentences/
怎么样	zěn me yàng	chẩm ma dạng	zeon3 mo1 joeng6	[{"meaning": "how is/are", "part_of_speech": "adverb"}, {"meaning": "how about that?", "part_of_speech": "expression"}]	https://wohok.com/dict/%e6%80%8e%e4%b9%88%e6%a0%b7-zen-me-yang-translation-pronunciation-and-example-sentences/
这	zhè	giá	ze2	[{"meaning": "this", "part_of_speech": "pronoun"}]	https://wohok.com/dict/%e8%bf%99-zhe-translation-pronunciation-and-example-sentences/
中国	Zhōng guó	Trung Quốc	zung1 gwok3	[{"meaning": "China", "part_of_speech": "noun"}]	https://wohok.com/dict/%e4%b8%ad%e5%9b%bd-zhong-guo-translation-pronunciation-and-example-sentences/
中午	zhōng wǔ	trung ngọ	zung1 ng5	[{"meaning": "noon, midday", "part_of_speech": "noun"}]	https://wohok.com/dict/%e4%b8%ad%e5%8d%88-zhong-wu-translation-pronunciation-and-example-sentences/
住	zhù	trú	zyu6	[{"meaning": "to live, to stay, to reside", "part_of_speech": "verb"}]	https://wohok.com/dict/%e4%bd%8f-zhu-translation-pronunciation-and-example-sentences/
桌子	zhuō zi	trác tử	coek3 zi2	[{"meaning": "table", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%a1%8c%e5%ad%90-zhuo-zi-translation-pronunciation-and-example-sentences/
字	zì	tự	zi6	[{"meaning": "word, character", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%ad%97-zi-translation-pronunciation-and-example-sentences/
做	zuò	tố	zou6	[{"meaning": "to do, to make", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%81%9a-zuo-translation-pronunciation-and-example-sentences/
坐	zuò	tọa	co5	[{"meaning": "to sit, to take (bus, train, etc.)", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%9d%90-zuo-translation-pronunciation-and-example-sentences/
昨天	zuó tiān	tạc thiên	zok3 jin1	[{"meaning": "yesterday", "part_of_speech": "time"}]	https://wohok.com/dict/%e6%98%a8%e5%a4%a9-zuo-tian-translation-pronunciation-and-example-sentences/
时尚	shí shàng	thời thượng	si4 soeng6	[{"meaning": "fashion", "part_of_speech": "noun"}]	\N
事实	shì shí	sự thật	si6 sat6	[{"meaning": "fact", "part_of_speech": "noun"}]	\N
石头	shí tou	thạch đầu	sek6 tau4	[{"meaning": "stone", "part_of_speech": "noun"}]	\N
食物	shí wù	thực vật	sik6 mat6	[{"meaning": "food", "part_of_speech": "noun"}]	\N
事物	shì wù	sự vật	si6 mat6	[{"meaning": "thing, object", "part_of_speech": "noun"}]	\N
实习	shí xí	thực tập	sat6 zaap6	[{"meaning": "practice, internship", "part_of_speech": "noun"}, {"meaning": "to practice", "part_of_speech": "verb"}]	\N
实现	shí xiàn	thực hiện	sat6 jin4	[{"meaning": "to realize, to achieve, to bring about", "part_of_speech": "verb"}]	\N
事先	shì xiān	sự tiên	si6 sin1	[{"meaning": "in advance, beforehand", "part_of_speech": "adverb"}]	\N
抽烟	chōu yān	trừ yên	cau1 jim1	[{"meaning": "to smoke (a cigarette, etc.)", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%8a%bd%e7%83%9f-chou-yan-translation-pronunciation-and-example-sentences/
出差	chū chāi	xuất sảy	ceot1 caai1	[{"meaning": "to go on a business trip", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%87%ba%e5%b7%ae-chu-chai-translation-pronunciation-and-example-sentences/
实行	shí xíng	thực hành	sat6 haang4	[{"meaning": "to put into practice, to carry out", "part_of_speech": "verb"}]	\N
实验	shí yàn	thực nghiệm	sat6 jim6	[{"meaning": "experiment", "part_of_speech": "noun"}, {"meaning": "to experiment", "part_of_speech": "verb"}]	\N
失业	shī yè	thất nghiệp	sat1 jip6	[{"meaning": "unemployment", "part_of_speech": "noun"}, {"meaning": "to lose one’s job", "part_of_speech": "verb"}, {"meaning": "unemployed", "part_of_speech": "adjective"}]	\N
实用	shí yòng	thực dụng	sat6 jung6	[{"meaning": "practical, pragmatisch, applied", "part_of_speech": "adjective"}]	\N
始终	shǐ zhōng	thủy chung	ci2 zung1	[{"meaning": "from beginning to end", "part_of_speech": "adverb"}]	\N
吧	ba	ba	baa1	[{"meaning": "indicating suggestion", "part_of_speech": "particle"}]	https://wohok.com/dict/%e5%90%a7-ba-translation-pronunciation-and-example-sentences/
白	bái	bạch	baak6	[{"meaning": "white, blank", "part_of_speech": "adjective"}, {"meaning": "free of charge, for nothing", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e7%99%bd-bai-translation-pronunciation-and-example-sentences/
百	bǎi	bách	baak3	[{"meaning": "100", "part_of_speech": "number"}]	https://wohok.com/dict/%e7%99%be-bai-translation-pronunciation-and-example-sentences/
帮助	bāng zhù	bảng trợ	bong1 zyu6	[{"meaning": "assistance, help", "part_of_speech": "noun"}, {"meaning": "to help, to assist", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%b8%ae%e5%8a%a9-bang-zhu-translation-pronunciation-and-example-sentences/
报纸	bào zhǐ	báo chí	bou3 zi2	[{"meaning": "newspaper", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%8a%a5%e7%ba%b8-bao-zhi-translation-pronunciation-and-example-sentences/
比	bǐ	bỉ	bei2	[{"meaning": "than, used for comparison", "part_of_speech": "relative clause"}]	https://wohok.com/dict/%e6%af%94-bi-translation-pronunciation-and-example-sentences/
别	bié	biệt	bit6	[{"meaning": "to leave, to distinguish", "part_of_speech": "verb"}, {"meaning": "other, another", "part_of_speech": "adjective"}, {"meaning": "don’t", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e5%88%ab-bie-translation-pronunciation-and-example-sentences/
长	cháng	 trường	 zoeng4	[{"meaning": "length", "part_of_speech": "noun"}, {"meaning": "long", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e9%95%bf-chang-zhang-translation-pronunciation-and-example-sentences/
唱歌	chàng gē	xướng ca	coeng3 go1	[{"meaning": "to sing", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%94%b1%e6%ad%8c-chang-ge-translation-pronunciation-and-example-sentences/
出	chū	xuất	ceot1	[{"meaning": "to go out, to exceed, to happen", "part_of_speech": "verb"}, {"meaning": "for dramas, plays, operas", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e5%87%ba-chu-translation-pronunciation-and-example-sentences/
船	chuán	thuyền	syun4	[{"meaning": "boat, ship", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%88%b9-chuan-translation-pronunciation-and-example-sentences/
穿	chuān	xuyên	cyun1	[{"meaning": "to wear", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%a9%bf-chuan-translation-pronunciation-and-example-sentences/
次	cì	thứ	ci3	[{"meaning": "order, sequence", "part_of_speech": "noun"}, {"meaning": "“time(s)”", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e6%ac%a1-ci-translation-pronunciation-and-example-sentences/
从	cóng	tòng	cung4	[{"meaning": "from", "part_of_speech": "relative clause"}]	https://wohok.com/dict/%e4%bb%8e-cong-translation-pronunciation-and-example-sentences/
错	cuò	sai	co3	[{"meaning": "mistake, error", "part_of_speech": "noun"}, {"meaning": "wrong", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e9%94%99-cuo-translation-pronunciation-and-example-sentences/
大家	dà jiā	đại gia	daai6 gaa1	[{"meaning": "everybody, all", "part_of_speech": "pronoun"}]	https://wohok.com/dict/%e5%a4%a7%e5%ae%b6-da-jia-translation-pronunciation-and-example-sentences/
打篮球	dǎ lán qiú	đả lạn cầu	daa2 laam4 kau4	[{"meaning": "play basketball", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%89%93%e7%af%ae%e7%90%83-da-lan-qiu-translation-pronunciation-and-example-sentences/
但是	dàn shì	đản thị	daan6 si6	[{"meaning": "but, however", "part_of_speech": "conjunction"}]	https://wohok.com/dict/%e4%bd%86%e6%98%af-dan-shi-translation-pronunciation-and-example-sentences/
到	dào	đáo	dou3	[{"meaning": "to arrive, to reach", "part_of_speech": "verb"}, {"meaning": "to, until, up to", "part_of_speech": "relative clause"}]	https://wohok.com/dict/%e5%88%b0-dao-translation-pronunciation-and-example-sentences/
弟弟	dì di	đệ đệ	dai6 dai6	[{"meaning": "younger brother", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%bc%9f%e5%bc%9f-di-di-translation-pronunciation-and-example-sentences/
第一	dì yī	đệ nhất	dai6 jat1	[{"meaning": "first, number one", "part_of_speech": "number"}]	https://wohok.com/dict/%e7%ac%ac%e4%b8%80-di-yi-translation-pronunciation-and-example-sentences/
懂	dǒng	đổng	dung2	[{"meaning": "to understand, to know", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%87%82-dong-translation-pronunciation-and-example-sentences/
手工	shǒu gōng	thủ công	sau2 gung1	[{"meaning": "hondwork", "part_of_speech": "noun"}, {"meaning": "manual", "part_of_speech": "adjective"}]	\N
房间	fáng jiān	phòng gian	fong2 gaan1	[{"meaning": "room", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%88%bf%e9%97%b4-fang-jian-translation-pronunciation-and-example-sentences/
非常	fēi cháng	phi thường	fei1 soeng4	[{"meaning": "very", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e9%9d%9e%e5%b8%b8-fei-chang-translation-pronunciation-and-example-sentences/
服务员	fú wù yuán	phục vụ viên	fuk6 wu6 jyun4	[{"meaning": "waiter, service personnel", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%9c%8d%e5%8a%a1%e5%91%98-fu-wu-yuan-translation-pronunciation-and-example-sentences/
高	gāo	cao	gou1	[{"meaning": "high, tall", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e9%ab%98-gao-translation-pronunciation-and-example-sentences/
告诉	gào su	cảo tục	gou3 sou3	[{"meaning": "to tell", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%91%8a%e8%af%89-gao-su-translation-pronunciation-and-example-sentences/
哥哥	gē ge	ca ca	go1 go1	[{"meaning": "older brother", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%93%a5%e5%93%a5-ge-ge-translation-pronunciation-and-example-sentences/
给	gěi	cấp	kap1	[{"meaning": "to give", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%bb%99-gei-translation-pronunciation-and-example-sentences/
公共汽车	gōng gòng qì chē	công cộng khí xa	gung1 gung6 hei3 ce1	[{"meaning": "bus", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%85%ac%e5%85%b1%e6%b1%bd%e8%bd%a6-gong-gong-qi-che-translation-pronunciation-and-example-sentences/
公斤	gōng jīn	công cân	gung1 gan1	[{"meaning": "kilogram", "part_of_speech": "noun"}, {"meaning": "kg", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e5%85%ac%e6%96%a4-gong-jin-translation-pronunciation-and-example-sentences/
公司	gōng sī	công ty	gung1 si1	[{"meaning": "company", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%85%ac%e5%8f%b8-gong-si-translation-pronunciation-and-example-sentences/
贵	guì	quý	gwai3	[{"meaning": "expensive", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e8%b4%b5-gui-translation-pronunciation-and-example-sentences/
收获	shōu huò	thu hoạch	sau1 wo4	[{"meaning": "result, gain, harvest", "part_of_speech": "noun"}, {"meaning": "to harvest", "part_of_speech": "verb"}]	\N
还	hái	hoàn	waan4	[{"meaning": "still", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e8%bf%98-hai-huan-translation-pronunciation-and-example-sentences/
孩子	hái zi	hài tử	haai4 zi2	[{"meaning": "child", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%ad%a9%e5%ad%90-hai-zi-translation-pronunciation-and-example-sentences/
号	hào	hào	hou6	[{"meaning": "number, day of month", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%8f%b7-hao-translation-pronunciation-and-example-sentences/
好吃	hǎo chī	hảo xúc	hou2 hek3	[{"meaning": "tasty, delicious", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%a5%bd%e5%90%83-hao-chi-translation-pronunciation-and-example-sentences/
黑	hēi	hắc	hak1	[{"meaning": "black, dark", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e9%bb%91-hei-translation-pronunciation-and-example-sentences/
红	hóng	hồng	hung4	[{"meaning": "dividend", "part_of_speech": "noun"}, {"meaning": "red, popular, revlutionary", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e7%ba%a2-hong-translation-pronunciation-and-example-sentences/
欢迎	huān yíng	hoan nghênh	fun1 jing4	[{"meaning": "welcome!", "part_of_speech": "expression"}]	https://wohok.com/dict/%e6%ac%a2%e8%bf%8e-huan-ying-translation-pronunciation-and-example-sentences/
回答	huí dá	hồi đáp	wui4 daap3	[{"meaning": "answer", "part_of_speech": "noun"}, {"meaning": "to answer, to reply", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%9b%9e%e7%ad%94-hui-da-translation-pronunciation-and-example-sentences/
机场	jī chǎng	cơ trường	gei1 coeng4	[{"meaning": "airport", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%9c%ba%e5%9c%ba-ji-chang-translation-pronunciation-and-example-sentences/
鸡蛋	jī dàn	kê đản	gai1 daan6	[{"meaning": "(chicken) egg", "part_of_speech": "noun"}]	https://wohok.com/dict/%e9%b8%a1%e8%9b%8b-ji-dan-translation-pronunciation-and-example-sentences/
件	jiàn	kiện	gin6	[{"meaning": "for events, things, clothes, etc.", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e4%bb%b6-jian-translation-pronunciation-and-example-sentences/
教室	jiào shì	giáo thất	gaau3 sat1	[{"meaning": "classroom", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%95%99%e5%ae%a4-jiao-shi-translation-pronunciation-and-example-sentences/
姐姐	jiě jie	tỷ tỷ	ze2 ze2	[{"meaning": "older sister", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%a7%90%e5%a7%90-jie-jie-translation-pronunciation-and-example-sentences/
介绍	jiè shào	giới thiệu	gaai3 siu6	[{"meaning": "introduction", "part_of_speech": "noun"}, {"meaning": "to introduce, to recommend", "part_of_speech": "verb"}]	https://wohok.com/dict/%e4%bb%8b%e7%bb%8d-jie-shao-translation-pronunciation-and-example-sentences/
进	jìn	tiến	zeon3	[{"meaning": "to advance, to enter", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%bf%9b-jin-translation-pronunciation-and-example-sentences/
近	jìn	cận	gan6	[{"meaning": "near, close", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e8%bf%91-jin-translation-pronunciation-and-example-sentences/
就	jiù	tựu	zau6	[{"meaning": "only, already", "part_of_speech": "adverb"}, {"meaning": "with regard to", "part_of_speech": "relative clause"}, {"meaning": "as soon as, right away, even if", "part_of_speech": "conjunction"}]	https://wohok.com/dict/%e5%b0%b1-jiu-translation-pronunciation-and-example-sentences/
觉得	jué de	giác đắc	gok3 dak1	[{"meaning": "to think, to feel", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%a7%89%e5%be%97-jue-de-translation-pronunciation-and-example-sentences/
咖啡	kā fēi	ca phê	gaa1 fe1	[{"meaning": "coffee", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%92%96%e5%95%a1-ka-fei-translation-pronunciation-and-example-sentences/
打扮	dǎ ban	đả bàn	daa2 baan6	[{"meaning": "to decorate, to dress up", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%89%93%e6%89%ae-da-ban-translation-pronunciation-and-example-sentences/
开始	kāi shǐ	khởi sự	hoi1 ci2	[{"meaning": "beginning", "part_of_speech": "noun"}, {"meaning": "to begin", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%bc%80%e5%a7%8b-kai-shi-translation-pronunciation-and-example-sentences/
考试	kǎo shì	khảo sát	haau2 si6	[{"meaning": "exam", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%80%83%e8%af%95-kao-shi-translation-pronunciation-and-example-sentences/
课	kè	khóa	haak3	[{"meaning": "class, lesson, course", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%af%be-ke-translation-pronunciation-and-example-sentences/
可能	kě néng	khả năng	ho2 nang4	[{"meaning": "might, maybe", "part_of_speech": "adverb"}, {"meaning": "can", "part_of_speech": "auxiliary verb"}]	https://wohok.com/dict/%e5%8f%af%e8%83%bd-ke-neng-translation-pronunciation-and-example-sentences/
可以	kě yǐ	khả dĩ	ho2 ji5	[{"meaning": "can, may, able to", "part_of_speech": "auxiliary verb"}]	https://wohok.com/dict/%e5%8f%af%e4%bb%a5-ke-yi-translation-pronunciation-and-example-sentences/
快	kuài	khoái	faai3	[{"meaning": "quick, rapid", "part_of_speech": "adjective"}, {"meaning": "soon, almost", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e5%bf%ab-kuai-translation-pronunciation-and-example-sentences/
快乐	kuài lè	khoái lạc	faai3 lok6	[{"meaning": "happy", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%bf%ab%e4%b9%90-kuai-le-translation-pronunciation-and-example-sentences/
累	lèi	lệ	leoi6	[{"meaning": "tired", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e7%b4%af-lei-translation-pronunciation-and-example-sentences/
离	lí	ly	lei4	[{"meaning": "to leave, to be away from", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%a6%bb-li-translation-pronunciation-and-example-sentences/
两	liǎng	lưỡng	loeng5	[{"meaning": "two, some", "part_of_speech": "number"}, {"meaning": "50 gram", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e4%b8%a4-liang-translation-pronunciation-and-example-sentences/
路	lù	lộ	lou6	[{"meaning": "road, path", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%b7%af-lu-translation-pronunciation-and-example-sentences/
旅游	lǚ yóu	lữ du	leoi5 jau4	[{"meaning": "trip, journey", "part_of_speech": "noun"}, {"meaning": "to travel", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%97%85%e6%b8%b8-lu-you-translation-pronunciation-and-example-sentences/
卖	mài	mãi	maai6	[{"meaning": "to sell", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%8d%96-mai-translation-pronunciation-and-example-sentences/
慢	màn	mạn	maan6	[{"meaning": "slow", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e6%85%a2-man-translation-pronunciation-and-example-sentences/
忙	máng	mang	maang4	[{"meaning": "busy", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%bf%99-mang-translation-pronunciation-and-example-sentences/
每	měi	mỗi	mui5	[{"meaning": "each, per", "part_of_speech": "adverb"}, {"meaning": "all, each, every", "part_of_speech": "pronoun"}]	https://wohok.com/dict/%e6%af%8f-mei-translation-pronunciation-and-example-sentences/
妹妹	mèi mei	muội muội	mui4 mui4	[{"meaning": "younger sister", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%a6%b9%e5%a6%b9-mei-mei-translation-pronunciation-and-example-sentences/
门	mén	môn	mun4	[{"meaning": "door", "part_of_speech": "noun"}, {"meaning": "for lessons", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e9%97%a8-men-translation-pronunciation-and-example-sentences/
男人	nán rén	nam nhân	naam4 jan4	[{"meaning": "man, men", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%94%b7%e4%ba%ba-nan-ren-translation-pronunciation-and-example-sentences/
您	nín	nhân	nei5	[{"meaning": "you (singular, polite)", "part_of_speech": "pronoun"}]	https://wohok.com/dict/%e6%82%a8-nin-translation-pronunciation-and-example-sentences/
牛奶	niú nǎi	ngưu nãi	ngau4 naai5	[{"meaning": "cow milk", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%89%9b%e5%a5%b6-niu-nai-translation-pronunciation-and-example-sentences/
女人	nǚ rén	nữ nhân	neoi5 jan4	[{"meaning": "woman, women", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%a5%b3%e4%ba%ba-nu-ren-translation-pronunciation-and-example-sentences/
旁边	páng biān	bàng biên	pong4 bin1	[{"meaning": "beside, aside", "part_of_speech": "location"}]	https://wohok.com/dict/%e6%97%81%e8%be%b9-pang-bian-translation-pronunciation-and-example-sentences/
跑步	pǎo bù	bào bộ	paau2 bou6	[{"meaning": "to run", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%b7%91%e6%ad%a5-pao-bu-translation-pronunciation-and-example-sentences/
便宜	pián yi	tiện nghi	bin6 ji6	[{"meaning": "cheap, inexpensive", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e4%be%bf%e5%ae%9c-pian-yi-translation-pronunciation-and-example-sentences/
票	piào	phiếu	piu3	[{"meaning": "ticket", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%a5%a8-piao-translation-pronunciation-and-example-sentences/
起床	qǐ chuáng	khởi sàng	hei2 coeng4	[{"meaning": "to get up (from bed)", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%b5%b7%e5%ba%8a-qi-chuang-translation-pronunciation-and-example-sentences/
妻子	qī zi	thê tử	cai1 zi2	[{"meaning": "wife", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%a6%bb%e5%ad%90-qi-zi-translation-pronunciation-and-example-sentences/
千	qiān	thiên	cin1	[{"meaning": "1000", "part_of_speech": "number"}]	https://wohok.com/dict/%e5%8d%83-qian-translation-pronunciation-and-example-sentences/
晴	qíng	tinh	cing4	[{"meaning": "clear, sunny", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e6%99%b4-qing-translation-pronunciation-and-example-sentences/
去年	qù nián	khứ niên	heoi3 nin4	[{"meaning": "last year", "part_of_speech": "time"}]	https://wohok.com/dict/%e5%8e%bb%e5%b9%b4-qu-nian-translation-pronunciation-and-example-sentences/
让	ràng	nhưỡng	joeng6	[{"meaning": "to permit, to let sb. do sth.", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%ae%a9-rang-translation-pronunciation-and-example-sentences/
上班	shàng bān	thượng ban	soeng6 baan1	[{"meaning": "to go to work, to start work", "part_of_speech": "verb"}]	https://wohok.com/dict/%e4%b8%8a%e7%8f%ad-shang-ban-translation-pronunciation-and-example-sentences/
身体	shēn tǐ	thân thể	san1 tai2	[{"meaning": "body, health", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%ba%ab%e4%bd%93-shen-ti-translation-pronunciation-and-example-sentences/
生病	shēng bìng	sinh bệnh	sang1 beng6	[{"meaning": "to get sick", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%94%9f%e7%97%85-sheng-bing-translation-pronunciation-and-example-sentences/
生日	shēng rì	sinh nhật	sang1 jat6	[{"meaning": "birthday", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%94%9f%e6%97%a5-sheng-ri-translation-pronunciation-and-example-sentences/
时间	shí jiān	thời gian	si4 gaan3	[{"meaning": "time, period", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%97%b6%e9%97%b4-shi-jian-translation-pronunciation-and-example-sentences/
事情	shì qing	sự tình	si6 cing4	[{"meaning": "thing, affair, matter", "part_of_speech": "noun"}]	https://wohok.com/dict/%e4%ba%8b%e6%83%85-shi-qing-translation-pronunciation-and-example-sentences/
手表	shǒu biǎo	thủ biểu	sau2 biu2	[{"meaning": "wrist watch", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%89%8b%e8%a1%a8-shou-biao-translation-pronunciation-and-example-sentences/
手机	shǒu jī	thủ khố	so2 ho2	[{"meaning": "mobile phone", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%89%8b%e6%9c%ba-shou-ji-translation-pronunciation-and-example-sentences/
送	sòng	tống	sung3	[{"meaning": "to deliver, to escort, to give, to send", "part_of_speech": "verb"}]	https://wohok.com/dict/%e9%80%81-song-translation-pronunciation-and-example-sentences/
所以	suǒ yǐ	sở dĩ	so2 ji5	[{"meaning": "therefore, as a result, so", "part_of_speech": "conjunction"}]	https://wohok.com/dict/%e6%89%80%e4%bb%a5-suo-yi-translation-pronunciation-and-example-sentences/
它	tā	tha	taa1	[{"meaning": "it", "part_of_speech": "pronoun"}]	https://wohok.com/dict/%e5%ae%83-ta-translation-pronunciation-and-example-sentences/
题	tí	đề	tai4	[{"meaning": "question (of a test)", "part_of_speech": "noun"}, {"meaning": "to inscribe, to mention", "part_of_speech": "verb"}]	https://wohok.com/dict/%e9%a2%98-ti-translation-pronunciation-and-example-sentences/
踢足球	tī zú qiú	thích túc cầu	tek3 zuk1 kau4	[{"meaning": "to play football", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%b8%a2%e8%b6%b3%e7%90%83-ti-zu-qiu-translation-pronunciation-and-example-sentences/
跳舞	tiào wǔ	khiêu vũ	tiu3 mou5	[{"meaning": "to dance", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%b7%b3%e8%88%9e-tiao-wu-translation-pronunciation-and-example-sentences/
外	wài	ngoại	ngoi6	[{"meaning": "foreign, external", "part_of_speech": "adjective"}, {"meaning": "outside", "part_of_speech": "location"}]	https://wohok.com/dict/%e5%a4%96-wai-translation-pronunciation-and-example-sentences/
完	wán	hoàn	jyun4	[{"meaning": "to finish", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%ae%8c-wan-translation-pronunciation-and-example-sentences/
玩	wán	hoàn	wun6	[{"meaning": "to play, to have fun", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%8e%a9-wan-translation-pronunciation-and-example-sentences/
晚上	wǎn shang	vãn thượng	maan5 soeng6	[{"meaning": "evening", "part_of_speech": "time"}]	https://wohok.com/dict/%e6%99%9a%e4%b8%8a-wan-shang-translation-pronunciation-and-example-sentences/
为什么	wèi shén me	vi thậm ma	wai4 sam6 mo1	[{"meaning": "why", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e4%b8%ba%e4%bb%80%e4%b9%88-wei-shen-me-translation-pronunciation-and-example-sentences/
问	wèn	vấn	man6	[{"meaning": "to ask", "part_of_speech": "verb"}]	https://wohok.com/dict/%e9%97%ae-wen-translation-pronunciation-and-example-sentences/
问题	wèn tí	vấn đề	man6 tai4	[{"meaning": "problem, question", "part_of_speech": "noun"}]	https://wohok.com/dict/%e9%97%ae%e9%a2%98-wen-ti-translation-pronunciation-and-example-sentences/
洗	xǐ	tẩy	sai2	[{"meaning": "to wash", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%b4%97-xi-translation-pronunciation-and-example-sentences/
西瓜	xī guā	tây qua	sai1 gwa1	[{"meaning": "watermelon", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%a5%bf%e7%93%9c-xi-gua-translation-pronunciation-and-example-sentences/
希望	xī wàng	hy vọng	hei1 mong6	[{"meaning": "hope", "part_of_speech": "noun"}, {"meaning": "to hope, to wish", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%b8%8c%e6%9c%9b-xi-wang-translation-pronunciation-and-example-sentences/
向	xiàng	hướng	hoeng3	[{"meaning": "direction", "part_of_speech": "noun"}, {"meaning": "to face, to turn towards", "part_of_speech": "verb"}, {"meaning": "formerly, all along", "part_of_speech": "adverb"}, {"meaning": "towards", "part_of_speech": "relative clause"}]	https://wohok.com/dict/%e5%90%91-xiang-translation-pronunciation-and-example-sentences/
笑	xiào	tiếu	siu3	[{"meaning": "to smile, to laugh", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%ac%91-xiao-translation-pronunciation-and-example-sentences/
小时	xiǎo shí	tiểu thì	siu2 si4	[{"meaning": "hour", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%b0%8f%e6%97%b6-xiao-shi-translation-pronunciation-and-example-sentences/
新	xīn	tân	san1	[{"meaning": "new", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e6%96%b0-xin-translation-pronunciation-and-example-sentences/
姓	xìng	tính	sing3	[{"meaning": "surname", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%a7%93-xing-translation-pronunciation-and-example-sentences/
休息	xiū xi	hưu tích	jau1 sik1	[{"meaning": "rest", "part_of_speech": "noun"}, {"meaning": "to rest", "part_of_speech": "verb"}]	https://wohok.com/dict/%e4%bc%91%e6%81%af-xiu-xi-translation-pronunciation-and-example-sentences/
雪	xuě	tuyết	syut3	[{"meaning": "snow", "part_of_speech": "noun"}]	https://wohok.com/dict/%e9%9b%aa-xue-translation-pronunciation-and-example-sentences/
眼睛	yǎn jing	nhãn tình	ngaan5 zing1	[{"meaning": "eye", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%9c%bc%e7%9d%9b-yan-jing-translation-pronunciation-and-example-sentences/
颜色	yán sè	nhan sắc	ngaan4 sik1	[{"meaning": "colour", "part_of_speech": "noun"}]	https://wohok.com/dict/%e9%a2%9c%e8%89%b2-yan-se-translation-pronunciation-and-example-sentences/
羊肉	yáng ròu	dương nhục	joeng4 juk6	[{"meaning": "mutton", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%be%8a%e8%82%89-yang-rou-translation-pronunciation-and-example-sentences/
药	yào	dược	joek6	[{"meaning": "medicine, drug", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%8d%af-yao-translation-pronunciation-and-example-sentences/
要	yào	yếu	jiu3	[{"meaning": "to want to, going to", "part_of_speech": "auxiliary verb"}]	https://wohok.com/dict/%e8%a6%81-yao-translation-pronunciation-and-example-sentences/
也	yě	dã	jaa5	[{"meaning": "also", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e4%b9%9f-ye-translation-pronunciation-and-example-sentences/
已经	yǐ jīng	dĩ kinh	ji5 ging1	[{"meaning": "already", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e5%b7%b2%e7%bb%8f-yi-jing-translation-pronunciation-and-example-sentences/
一起	yì qǐ	nhất khởi	jat1 hei2	[{"meaning": "together", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e4%b8%80%e8%b5%b7-yi-qi-translation-pronunciation-and-example-sentences/
意思	yì si	ý tứ	ji3 si1	[{"meaning": "meaning, opinion, idea", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%84%8f%e6%80%9d-yi-si-translation-pronunciation-and-example-sentences/
阴	yīn	âm	jam1	[{"meaning": "cloudy, overcast", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e9%98%b4-yin-translation-pronunciation-and-example-sentences/
因为	yīn wèi	nhân vị	jan1 wai6	[{"meaning": "because", "part_of_speech": "conjunction"}]	https://wohok.com/dict/%e5%9b%a0%e4%b8%ba-yin-wei-translation-pronunciation-and-example-sentences/
右边	yòu bian	hữu biên	jau5 bin1	[{"meaning": "right, right side", "part_of_speech": "location"}]	https://wohok.com/dict/%e5%8f%b3%e8%be%b9-you-bian-translation-pronunciation-and-example-sentences/
游泳	yóu yǒng	du vịnh	jau4 wing6	[{"meaning": "swimming", "part_of_speech": "noun"}, {"meaning": "to swim", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%b8%b8%e6%b3%b3-you-yong-translation-pronunciation-and-example-sentences/
鱼	yú	ngư	jyu4	[{"meaning": "fish", "part_of_speech": "noun"}]	https://wohok.com/dict/%e9%b1%bc-yu-translation-pronunciation-and-example-sentences/
元	yuán	nguyên	jyun4	[{"meaning": "for money (Yuan, RMB)", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e5%85%83-yuan-translation-pronunciation-and-example-sentences/
远	yuǎn	viễn	jyun5	[{"meaning": "far, distant", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e8%bf%9c-yuan-translation-pronunciation-and-example-sentences/
运动	yùn dòng	vận động	wan6 dung6	[{"meaning": "movement, sports", "part_of_speech": "noun"}, {"meaning": "to move about", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%bf%90%e5%8a%a8-yun-dong-translation-pronunciation-and-example-sentences/
再	zài	tái	zoi3	[{"meaning": "again, once more", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e5%86%8d-zai-translation-pronunciation-and-example-sentences/
早上	zǎo shang	tảo thượng	zou2 soeng6	[{"meaning": "early morning", "part_of_speech": "time"}]	https://wohok.com/dict/%e6%97%a9%e4%b8%8a-zao-shang-translation-pronunciation-and-example-sentences/
张	zhāng	trương	zoeng1	[{"meaning": "to open up, to spread", "part_of_speech": "verb"}, {"meaning": "for pieces, flat objects", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e5%bc%a0-zhang-translation-pronunciation-and-example-sentences/
丈夫	zhàng fu	trượng phu	zoeng6 fu6	[{"meaning": "husband", "part_of_speech": "noun"}]	https://wohok.com/dict/%e4%b8%88%e5%a4%ab-zhang-fu-translation-pronunciation-and-example-sentences/
找	zhǎo	tìm	zaau2	[{"meaning": "to look for, to seek", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%89%be-zhao-translation-pronunciation-and-example-sentences/
着	zhe	trước	zoek6	[{"meaning": "indicating action in progress", "part_of_speech": "particle"}]	https://wohok.com/dict/%e7%9d%80-zhe-zhao-translation-pronunciation-and-example-sentences/
真	zhēn	chân	zan1	[{"meaning": "real, true, genuine", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e7%9c%9f-zhen-translation-pronunciation-and-example-sentences/
正在	zhèng zài	chính tại	zing6 zoi6	[{"meaning": "in the process of, in course of", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e6%ad%a3%e5%9c%a8-zheng-zai-translation-pronunciation-and-example-sentences/
知道	zhī dào	tri đạo	zi1 dou6	[{"meaning": "to know, to be aware of", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%9f%a5%e9%81%93-zhi-dao-translation-pronunciation-and-example-sentences/
准备	zhǔn bèi	chuẩn bị	zeon2 bei6	[{"meaning": "to prepare", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%87%86%e5%a4%87-zhun-bei-translation-pronunciation-and-example-sentences/
自行车	zì xíng chē	tự hành xa	zi6 hang4 ce1	[{"meaning": "bicycle, bike", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%87%aa%e8%a1%8c%e8%bd%a6-zi-xing-che-translation-pronunciation-and-example-sentences/
走	zǒu	tẩu	zau2	[{"meaning": "to walk", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%b5%b0-zou-translation-pronunciation-and-example-sentences/
最	zuì	tối	zeoi3	[{"meaning": "most", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e6%9c%80-zui-translation-pronunciation-and-example-sentences/
左边	zuǒ bian	tả biên	zo2 bin1	[{"meaning": "left, left side", "part_of_speech": "location"}]	https://wohok.com/dict/%e5%b7%a6%e8%be%b9-zuo-bian-translation-pronunciation-and-example-sentences/
收据	shōu jù	thu thụ	sau1 geoi3	[{"meaning": "receipt", "part_of_speech": "noun"}]	\N
寿命	shòu mìng	thọ mệnh	sau6 meng6	[{"meaning": "life span, life expectancy", "part_of_speech": "noun"}]	\N
受伤	shòu shāng	thụ thương	sau6 soeng1	[{"meaning": "to get injured", "part_of_speech": "verb"}]	\N
手术	shǒu shù	thủ thuật	sau2 syut6	[{"meaning": "operation, surgery", "part_of_speech": "noun"}]	\N
手套	shǒu tào	thủ đào	sau2 tou3	[{"meaning": "gloves", "part_of_speech": "noun"}]	\N
手续	shǒu xù	thủ tục	sau2 seoi6	[{"meaning": "procedure, formality", "part_of_speech": "noun"}]	\N
手指	shǒu zhǐ	thủ chỉ	sau2 zi2	[{"meaning": "finger", "part_of_speech": "noun"}]	\N
鼠标	shǔ biāo	chu biểu	syu2 biu1	[{"meaning": "mouse (IT)", "part_of_speech": "noun"}]	\N
蔬菜	shū cài	thực phẩm	so1 coi3	[{"meaning": "vegetables", "part_of_speech": "noun"}]	\N
书架	shū jià	thư giá	syu1 gaai2	[{"meaning": "bookshelf", "part_of_speech": "noun"}]	\N
数据	shù jù	số liệu	so3 dai6	[{"meaning": "data", "part_of_speech": "noun"}]	\N
熟练	shú liàn	thục luyện	suk6 lim6	[{"meaning": "skilled, practiced, proficient", "part_of_speech": "adjective"}]	\N
数码	shù mǎ	số mạch	sou3 ma5	[{"meaning": "number, figure", "part_of_speech": "noun"}, {"meaning": "digital", "part_of_speech": "adjective"}]	\N
输入	shū rù	nhập khẩu	sap6 jap6	[{"meaning": "to import, to input", "part_of_speech": "verb"}]	\N
爱	ài	ái	oi3	[{"meaning": "to love", "part_of_speech": "verb"}]	https://wohok.com/dict/爱-ai-translation-pronunciation-and-example-sentences/
八	bā	bát	baat3	[{"meaning": "8", "part_of_speech": "number"}]	https://wohok.com/dict/%E5%85%AB-ba-translation-pronunciation-and-example-sentences/
爸爸	bà ba	ba ba	baa4 baa1	[{"meaning": "dad", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%88%b8%e7%88%b8-ba-ba-translation-pronunciation-and-example-sentences/
北京	Běi jīng	Bắc Kinh	bak1 geng1	[{"meaning": "Beijing", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%8c%97%e4%ba%ac-bei-jing-translation-pronunciation-and-example-sentences/
杯子	bēi zi	bôi tử	bui1 zi2	[{"meaning": "cup, glass", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%9d%af%e5%ad%90-bei-zi-translation-pronunciation-and-example-sentences/
本	běn	bản	bun2	[{"meaning": "root, basis, foundation, origin, capital", "part_of_speech": "noun"}, {"meaning": "for books, files, etc.", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e6%9c%ac-ben-translation-pronunciation-and-example-sentences/
不	bù	bất	bat1	[{"meaning": "no, not", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e4%b8%8d-bu-translation-pronunciation-and-example-sentences/
不客气	bú kè qi	bất khách khí	bat1 haak3 hei3	[{"meaning": "you are welcome", "part_of_speech": "expression"}]	https://wohok.com/dict/%e4%b8%8d%e5%ae%a2%e6%b0%94-bu-ke-qi-translation-pronunciation-and-example-sentences/
菜	cài	thái	coi3	[{"meaning": "dish, vegetable", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%8f%9c-cai-translation-pronunciation-and-example-sentences/
茶	chá	trà	caa4	[{"meaning": "tea", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%8c%b6-cha-translation-pronunciation-and-example-sentences/
吃	chī	xích	hek3	[{"meaning": "to eat", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%90%83-chi-translation-pronunciation-and-example-sentences/
出租车	chū zū chē	xuất tô xa	ceot1 zou2 ce1	[{"meaning": "taxi", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%87%ba%e7%a7%9f%e8%bd%a6-chu-zu-che-translation-pronunciation-and-example-sentences/
大	dà	đại	daai6	[{"meaning": "big, great", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%a4%a7-da-translation-pronunciation-and-example-sentences/
打电话	dǎ diàn huà	đả điện thoại	daa2 waa6	[{"meaning": "to make a phone call", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%89%93%e7%94%b5%e8%af%9d-da-dian-hua-translation-pronunciation-and-example-sentences/
的	de	đích	dik1	[{"meaning": "to form an attribute", "part_of_speech": "particle"}]	https://wohok.com/dict/%e7%9a%84-de-translation-pronunciation-and-example-sentences/
点	diǎn	điểm	dim2	[{"meaning": "point, dot", "part_of_speech": "noun"}, {"meaning": "to nod, to click", "part_of_speech": "verb"}, {"meaning": "a little, a bit", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e7%82%b9-dian-translation-pronunciation-and-example-sentences/
电脑	diàn nǎo	điện não	din6 nou5	[{"meaning": "computer", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%94%b5%e8%84%91-dian-nao-translation-pronunciation-and-example-sentences/
电视	diàn shì	điện thị	din6 si6	[{"meaning": "TV(-set)", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%94%b5%e8%a7%86-dian-shi-translation-pronunciation-and-example-sentences/
电影	diàn yǐng	điện ảnh	din6 jing2	[{"meaning": "movie, film", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%94%b5%e5%bd%b1-dian-ying-translation-pronunciation-and-example-sentences/
东西	dōng xi	đông tây	dung1 sai1	[{"meaning": "thing", "part_of_speech": "noun"}]	https://wohok.com/dict/%e4%b8%9c%e8%a5%bf-dong-xi-translation-pronunciation-and-example-sentences/
都	dōu	đô	dou1	[{"meaning": "all, both", "part_of_speech": "adverb"}, {"meaning": "all, both", "part_of_speech": "pronoun"}]	https://wohok.com/dict/%e9%83%bd-dou-translation-pronunciation-and-example-sentences/
读	dú	độc	duk6	[{"meaning": "to read aloud", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%af%bb-du-translation-pronunciation-and-example-sentences/
对不起	duì bu qǐ	đối bất khởi	deoi3 bat1 hei2	[{"meaning": "sorry, I’m sorry", "part_of_speech": "expression"}]	https://wohok.com/dict/%e5%af%b9%e4%b8%8d%e8%b5%b7-dui-bu-qi-translation-pronunciation-and-example-sentences/
多	duō	đa	do1	[{"meaning": "much, many", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%a4%9a-duo-translation-pronunciation-and-example-sentences/
多少	duō shao	đa thiểu	do1 siu3	[{"meaning": "how many, how much", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e5%a4%9a%e5%b0%91-duo-shao-translation-pronunciation-and-example-sentences/
二	èr	nhị	ji6	[{"meaning": "2", "part_of_speech": "number"}]	https://wohok.com/dict/%e4%ba%8c-er-translation-pronunciation-and-example-sentences/
儿子	ér zi	nhi tử	ji4 zi6	[{"meaning": "son", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%84%bf%e5%ad%90-er-zi-translation-pronunciation-and-example-sentences/
饭馆	fàn guǎn	phạn quán	faan6 gun2	[{"meaning": "restaurant", "part_of_speech": "noun"}]	https://wohok.com/dict/%e9%a5%ad%e9%a6%86-fan-guan-translation-pronunciation-and-example-sentences/
飞机	fēi jī	phi cơ	fei1 gei1	[{"meaning": "airplane", "part_of_speech": "noun"}]	https://wohok.com/dict/%e9%a3%9e%e6%9c%ba-fei-ji-translation-pronunciation-and-example-sentences/
分钟	fēn zhōng	phân chung	fan1 zyun1	[{"meaning": "minute", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%88%86%e9%92%9f-fen-zhong-translation-pronunciation-and-example-sentences/
高兴	gāo xìng	cao hứng	gou1 hing3	[{"meaning": "happy, glad, cheerful", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e9%ab%98%e5%85%b4-gao-xing-translation-pronunciation-and-example-sentences/
个	gè	cá	go3	[{"meaning": "for almost everything", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e4%b8%aa-ge-translation-pronunciation-and-example-sentences/
工作	gōng zuò	công tác	gung1 zok3	[{"meaning": "job", "part_of_speech": "noun"}, {"meaning": "to work", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%b7%a5%e4%bd%9c-gong-zuo-translation-pronunciation-and-example-sentences/
狗	gǒu	cẩu	gau2	[{"meaning": "dog", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%8b%97-gou-translation-pronunciation-and-example-sentences/
汉语	hàn yǔ	Hán ngữ	hon3 jyu5	[{"meaning": "Chinese language", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%b1%89%e8%af%ad-han-yu-translation-pronunciation-and-example-sentences/
好	hǎo	hảo	hou2	[{"meaning": "good, nice", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%a5%bd-hao-hao-translation-pronunciation-and-example-sentences/
和	hé	hòa	wo4	[{"meaning": "with", "part_of_speech": "relative clause"}, {"meaning": "and", "part_of_speech": "conjunction"}]	https://wohok.com/dict/%e5%92%8c-he-translation-pronunciation-and-example-sentences/
喝	hē	hát	hot3	[{"meaning": "to drink", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%96%9d-he-translation-pronunciation-and-example-sentences/
很	hěn	hẫn	han2	[{"meaning": "very, quite", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e5%be%88-hen-translation-pronunciation-and-example-sentences/
后面	hòu miàn	hậu diện	hau6 min6	[{"meaning": "rear, back, behind", "part_of_speech": "location"}]	https://wohok.com/dict/%e5%90%8e%e9%9d%a2-hou-mian-translation-pronunciation-and-example-sentences/
回	huí	hồi	wui4	[{"meaning": "to return, to answer, to reply", "part_of_speech": "verb"}, {"meaning": "for events of action", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e5%9b%9e-hui-translation-pronunciation-and-example-sentences/
会	huì	hội	wui5	[{"meaning": "meeting, conference", "part_of_speech": "noun"}, {"meaning": "can, to be able to", "part_of_speech": "auxiliary verb"}]	https://wohok.com/dict/%e4%bc%9a-hui-translation-pronunciation-and-example-sentences/
火车站	huǒ chē zhàn	hỏa xa trạm	fo2 ce1 zaam6	[{"meaning": "train station", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%81%ab%e8%bd%a6%e7%ab%99-huo-che-zhan-translation-pronunciation-and-example-sentences/
几	jǐ	kỷ	gei2	[{"meaning": "how many", "part_of_speech": "adverb"}, {"meaning": "several", "part_of_speech": "pronoun"}]	https://wohok.com/dict/%e5%87%a0-ji-translation-pronunciation-and-example-sentences/
家	jiā	gia	gaa1	[{"meaning": "family, home, houshold", "part_of_speech": "noun"}, {"meaning": "for businesses, families", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e5%ae%b6-jia-translation-pronunciation-and-example-sentences/
叫	jiào	khiếu	giu3	[{"meaning": "to be called, to call, to shout", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%8f%ab-jiao-translation-pronunciation-and-example-sentences/
今天	jīn tiān	kim thiên	gam1 tin1	[{"meaning": "today", "part_of_speech": "time"}]	https://wohok.com/dict/%e4%bb%8a%e5%a4%a9-jin-tian-translation-pronunciation-and-example-sentences/
九	jiǔ	cửu	gau2	[{"meaning": "9", "part_of_speech": "number"}]	https://wohok.com/dict/%e4%b9%9d-jiu-translation-pronunciation-and-example-sentences/
开	kāi	khai	hoi1	[{"meaning": "to open, to start, to drive (car, etc.)", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%bc%80-kai-translation-pronunciation-and-example-sentences/
看	kàn	khán	hon3	[{"meaning": "to see, to watch, to look at", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%9c%8b-kan-kan-translation-pronunciation-and-example-sentences/
看见	kàn jiàn	khán kiến	hon3 gin3	[{"meaning": "to see, to catch sight of", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%9c%8b%e8%a7%81-kan-jian-translation-pronunciation-and-example-sentences/
块	kuài	khối	faai3	[{"meaning": "for a piece", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e5%9d%97-kuai-translation-pronunciation-and-example-sentences/
来	lái	lai	loi4	[{"meaning": "to come, to arrive", "part_of_speech": "verb"}, {"meaning": "ever since", "part_of_speech": "particle"}]	https://wohok.com/dict/%e6%9d%a5-lai-translation-pronunciation-and-example-sentences/
老师	lǎo shī	lão sư	lou5 si1	[{"meaning": "teacher", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%80%81%e5%b8%88-lao-shi-translation-pronunciation-and-example-sentences/
了	le	liễu	liu5	[{"meaning": "indicating past or change", "part_of_speech": "particle"}]	https://wohok.com/dict/%e4%ba%86-le-liao-translation-pronunciation-and-example-sentences/
冷	lěng	lãnh	laang5	[{"meaning": "cold", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%86%b7-leng-translation-pronunciation-and-example-sentences/
里	lǐ	lí	lei5	[{"meaning": "in, inside", "part_of_speech": "location"}, {"meaning": "for 0.5 km", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e9%87%8c-li-translation-pronunciation-and-example-sentences/
零	líng	linh	ling4	[{"meaning": "0", "part_of_speech": "number"}]	https://wohok.com/dict/%e9%9b%b6-ling-translation-pronunciation-and-example-sentences/
六	liù	lục	luk6	[{"meaning": "6", "part_of_speech": "number"}]	https://wohok.com/dict/%e5%85%ad-liu-translation-pronunciation-and-example-sentences/
吗	ma	ma	maa1	[{"meaning": "to form a question", "part_of_speech": "particle"}]	https://wohok.com/dict/%e5%90%97-ma-translation-pronunciation-and-example-sentences/
妈妈	mā ma	mẫu mẫu	maa1 maa1	[{"meaning": "mother", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%a6%88%e5%a6%88-ma-ma-translation-pronunciation-and-example-sentences/
买	mǎi	mãi	maai5	[{"meaning": "to buy", "part_of_speech": "verb"}]	https://wohok.com/dict/%e4%b9%b0-mai-translation-pronunciation-and-example-sentences/
猫	māo	miêu	maau1	[{"meaning": "cat", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%8c%ab-mao-translation-pronunciation-and-example-sentences/
没	méi	một	mut6	[{"meaning": "not", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e6%b2%a1-mei-translation-pronunciation-and-example-sentences/
没关系	méi guān xi	một quan hệ	mut6 gwaan1 hai6	[{"meaning": "it doesn’t matter", "part_of_speech": "expression"}]	https://wohok.com/dict/%e6%b2%a1%e5%85%b3%e7%b3%bb-mei-guan-xi-translation-pronunciation-and-example-sentences/
米饭	mǐ fàn	mễ phạn	mai5 faan6	[{"meaning": "(cooked) rice", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%b1%b3%e9%a5%ad-mi-fan-translation-pronunciation-and-example-sentences/
明天	míng tiān	minh thiên	ming4 tin1	[{"meaning": "tomorrow", "part_of_speech": "time"}]	https://wohok.com/dict/%e6%98%8e%e5%a4%a9-ming-tian-translation-pronunciation-and-example-sentences/
名字	míng zi	danh tự	ming4 zi6	[{"meaning": "name", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%90%8d%e5%ad%97-ming-zi-translation-pronunciation-and-example-sentences/
那	nà	na	naa5	[{"meaning": "that", "part_of_speech": "pronoun"}]	https://wohok.com/dict/%e9%82%a3-na-translation-pronunciation-and-example-sentences/
哪	nǎ	nả	naa5	[{"meaning": "which", "part_of_speech": "pronoun"}]	https://wohok.com/dict/%e5%93%aa-na-na-translation-pronunciation-and-example-sentences/
呢	ne	ni	ne1	[{"meaning": "to build a question based on already mentioned subjects", "part_of_speech": "particle"}]	https://wohok.com/dict/%e5%91%a2-ne-translation-pronunciation-and-example-sentences/
能	néng	năng	nang4	[{"meaning": "to be able to", "part_of_speech": "auxiliary verb"}]	https://wohok.com/dict/%e8%83%bd-neng-translation-pronunciation-and-example-sentences/
你	nǐ	nễ	nei5	[{"meaning": "you (singular)", "part_of_speech": "pronoun"}]	https://wohok.com/dict/%e4%bd%a0-ni-translation-pronunciation-and-example-sentences/
年	nián	niên	nin4	[{"meaning": "year", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%b9%b4-nian-translation-pronunciation-and-example-sentences/
女儿	nǚ ér	nữ nhi	neoi5 ji4	[{"meaning": "daughter", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%a5%b3%e5%84%bf-nu-er-translation-pronunciation-and-example-sentences/
朋友	péng you	bằng hữu	pang4 jau5	[{"meaning": "friend", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%9c%8b%e5%8f%8b-peng-you-translation-pronunciation-and-example-sentences/
漂亮	piào liang	phiêu lượng	piu1 loeng4	[{"meaning": "pretty, beautiful", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e6%bc%82%e4%ba%ae-piao-liang-translation-pronunciation-and-example-sentences/
苹果	píng guǒ	bình quả	ping4 gwo2	[{"meaning": "apple", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%8b%b9%e6%9e%9c-ping-guo-translation-pronunciation-and-example-sentences/
七	qī	thất	cat1	[{"meaning": "7", "part_of_speech": "number"}]	https://wohok.com/dict/%e4%b8%83-qi-translation-pronunciation-and-example-sentences/
钱	qián	tiền	cin2	[{"meaning": "money", "part_of_speech": "noun"}]	https://wohok.com/dict/%e9%92%b1-qian-translation-pronunciation-and-example-sentences/
前面	qián miàn	tiền diện	cin4 min6	[{"meaning": "ahead, in front", "part_of_speech": "location"}]	https://wohok.com/dict/%e5%89%8d%e9%9d%a2-qian-mian-translation-pronunciation-and-example-sentences/
请	qǐng	thỉnh	ceng2	[{"meaning": "to ask, to invite", "part_of_speech": "verb"}, {"meaning": "please", "part_of_speech": "expression"}]	https://wohok.com/dict/%e8%af%b7-qing-translation-pronunciation-and-example-sentences/
去	qù	khứ	heoi3	[{"meaning": "to go", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%8e%bb-qu-translation-pronunciation-and-example-sentences/
热	rè	nhiệt	jit6	[{"meaning": "hot, warm", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e7%83%ad-re-translation-pronunciation-and-example-sentences/
人	rén	nhân	jan4	[{"meaning": "person, people", "part_of_speech": "noun"}]	https://wohok.com/dict/%e4%ba%ba-ren-translation-pronunciation-and-example-sentences/
认识	rèn shi	nhận thức	jing6 sik1	[{"meaning": "understanding, knowledge, awareness", "part_of_speech": "noun"}, {"meaning": "to know, to recognize, to understand, to be familiar with", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%ae%a4%e8%af%86-ren-shi-translation-pronunciation-and-example-sentences/
日	rì	nhật	jat6	[{"meaning": "day, sun", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%97%a5-ri-translation-pronunciation-and-example-sentences/
三	sān	tam	saam1	[{"meaning": "3", "part_of_speech": "number"}]	https://wohok.com/dict/%e4%b8%89-san-translation-pronunciation-and-example-sentences/
上	shàng	thượng	soeng6	[{"meaning": "to go up, to attend, to climb", "part_of_speech": "verb"}, {"meaning": "on, upon, previous, upper", "part_of_speech": "location"}]	https://wohok.com/dict/%e4%b8%8a-shang-translation-pronunciation-and-example-sentences/
商店	shāng diàn	thương điếm	soeng1 dim3	[{"meaning": "shop, store", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%95%86%e5%ba%97-shang-dian-translation-pronunciation-and-example-sentences/
上午	shàng wǔ	thượng ngọ	soeng6 ng5	[{"meaning": "morning", "part_of_speech": "noun"}]	https://wohok.com/dict/%e4%b8%8a%e5%8d%88-shang-wu-translation-pronunciation-and-example-sentences/
少	shǎo	thiểu	siu2	[{"meaning": "few, little", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%b0%91-shao-translation-pronunciation-and-example-sentences/
谁	shéi	thùy	seoi4	[{"meaning": "who", "part_of_speech": "pronoun"}]	https://wohok.com/dict/%e8%b0%81-shei-translation-pronunciation-and-example-sentences/
什么	shén me	thậm ma	sam6 mo1	[{"meaning": "what", "part_of_speech": "pronoun"}]	https://wohok.com/dict/%e4%bb%80%e4%b9%88-shen-me-translation-pronunciation-and-example-sentences/
十	shí	thập	sap6	[{"meaning": "10", "part_of_speech": "number"}]	https://wohok.com/dict/%e5%8d%81-shi-translation-pronunciation-and-example-sentences/
是	shì	thị	si6	[{"meaning": "is, to be", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%98%af-shi-translation-pronunciation-and-example-sentences/
时候	shí hou	thì hậu	si4 hau6	[{"meaning": "time, moment, period", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%97%b6%e5%80%99-shi-hou-translation-pronunciation-and-example-sentences/
书	shū	thư	syu1	[{"meaning": "book", "part_of_speech": "noun"}]	https://wohok.com/dict/%e4%b9%a6-shu-translation-pronunciation-and-example-sentences/
水	shuǐ	thủy	seoi2	[{"meaning": "Water", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%b0%b4-shui-translation-pronunciation-and-example-sentences/
水果	shuǐ guǒ	thủy quả	seoi2 gwo2	[{"meaning": "fruit", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%b0%b4%e6%9e%9c-shui-guo-translation-pronunciation-and-example-sentences/
睡觉	shuì jiào	thụy giác	seoi6 gaau3	[{"meaning": "to sleep, to go to bed", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%9d%a1%e8%a7%89-shui-jiao-translation-pronunciation-and-example-sentences/
说话	shuō huà	thuyết thoại	syut3 waa6	[{"meaning": "to speak, to talk, to gossip", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%af%b4%e8%af%9d-shuo-hua-translation-pronunciation-and-example-sentences/
四	sì	tứ	sei3	[{"meaning": "4", "part_of_speech": "number"}]	https://wohok.com/dict/%e5%9b%9b-si-translation-pronunciation-and-example-sentences/
岁	suì	tuế	seoi3	[{"meaning": "“years old”", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e5%b2%81-sui-translation-pronunciation-and-example-sentences/
他	tā	tha	taa1	[{"meaning": "he", "part_of_speech": "pronoun"}]	https://wohok.com/dict/%e4%bb%96-ta-translation-pronunciation-and-example-sentences/
她	tā	tha	taa1	[{"meaning": "she", "part_of_speech": "pronoun"}]	https://wohok.com/dict/%e5%a5%b9-ta-translation-pronunciation-and-example-sentences/
太	tài	thái	taai3	[{"meaning": "too, extremely", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e5%a4%aa-tai-translation-pronunciation-and-example-sentences/
天气	tiān qì	thiên khí	tin1 hei3	[{"meaning": "weather", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%a4%a9%e6%b0%94-tian-qi-translation-pronunciation-and-example-sentences/
听	tīng	thính	teng1	[{"meaning": "to listen, to hear, to obey", "part_of_speech": "verb"}, {"meaning": "for canned beverages", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e5%90%ac-ting-translation-pronunciation-and-example-sentences/
同学	tóng xué	đồng học	tung4 hok6	[{"meaning": "classmate", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%90%8c%e5%ad%a6-tong-xue-translation-pronunciation-and-example-sentences/
喂	wèi	duy	wai3	[{"meaning": "to feed, to breed", "part_of_speech": "verb"}, {"meaning": "hello", "part_of_speech": "expression"}]	https://wohok.com/dict/%e5%96%82-wei-translation-pronunciation-and-example-sentences/
我	wǒ	ngã	ngo5	[{"meaning": "I", "part_of_speech": "pronoun"}]	https://wohok.com/dict/%e6%88%91-wo-translation-pronunciation-and-example-sentences/
我们	wǒ men	ngã môn	ngo5 mun4	[{"meaning": "we", "part_of_speech": "pronoun"}]	https://wohok.com/dict/%e6%88%91%e4%bb%ac-wo-men-translation-pronunciation-and-example-sentences/
五	wǔ	ngũ	ng5	[{"meaning": "5", "part_of_speech": "number"}]	https://wohok.com/dict/%e4%ba%94-wu-translation-pronunciation-and-example-sentences/
喜欢	xǐ huan	hỉ hoan	hei2 fun1	[{"meaning": "to like", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%96%9c%e6%ac%a2-xi-huan-translation-pronunciation-and-example-sentences/
下	xià	hạ	haa6	[{"meaning": "descend, fall", "part_of_speech": "verb"}, {"meaning": "for times of action", "part_of_speech": "measure word"}, {"meaning": "below, down, under", "part_of_speech": "location"}]	https://wohok.com/dict/%e4%b8%8b-xia-translation-pronunciation-and-example-sentences/
下午	xià wǔ	hạ ngọ	haa6 ng5	[{"meaning": "afternoon", "part_of_speech": "noun"}]	https://wohok.com/dict/%e4%b8%8b%e5%8d%88-xia-wu-translation-pronunciation-and-example-sentences/
下雨	xià yǔ	hạ vũ	haa6 jyu5	[{"meaning": "to rain", "part_of_speech": "verb"}]	https://wohok.com/dict/%e4%b8%8b%e9%9b%a8-xia-yu-translation-pronunciation-and-example-sentences/
先生	xiān sheng	tiên sinh	sin1 sang1	[{"meaning": "Mister (Mr.), teacher", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%85%88%e7%94%9f-xian-sheng-translation-pronunciation-and-example-sentences/
现在	xiàn zài	hiện tại	jin6 zoi6	[{"meaning": "now", "part_of_speech": "time"}]	https://wohok.com/dict/%e7%8e%b0%e5%9c%a8-xian-zai-translation-pronunciation-and-example-sentences/
想	xiǎng	tưởng	soeng2	[{"meaning": "to think, to miss", "part_of_speech": "verb"}, {"meaning": "to want", "part_of_speech": "auxiliary verb"}]	https://wohok.com/dict/%e6%83%b3-xiang-translation-pronunciation-and-example-sentences/
小	xiǎo	tiểu	siu2	[{"meaning": "small", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%b0%8f-xiao-translation-pronunciation-and-example-sentences/
小姐	xiǎo jiě	tiểu thư	siu2 ze2	[{"meaning": "Miss, young lady", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%b0%8f%e5%a7%90-xiao-jie-translation-pronunciation-and-example-sentences/
写	xiě	tả	se2	[{"meaning": "to write", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%86%99-xie-translation-pronunciation-and-example-sentences/
些	xiē	ta	se1	[{"meaning": "some, few, several", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e4%ba%9b-xie-translation-pronunciation-and-example-sentences/
谢谢	xiè xie	tạ tạ	je5 je5	[{"meaning": "thanks!", "part_of_speech": "expression"}]	https://wohok.com/dict/%e8%b0%a2%e8%b0%a2-xie-xie-translation-pronunciation-and-example-sentences/
星期	xīng qī	tinh kỳ	sing1 kei4	[{"meaning": "week", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%98%9f%e6%9c%9f-xing-qi-translation-pronunciation-and-example-sentences/
学生	xué sheng	học sinh	hok6 sang1	[{"meaning": "student, pupil", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%ad%a6%e7%94%9f-xue-sheng-translation-pronunciation-and-example-sentences/
学习	xué xí	học tập	hok6 jik6	[{"meaning": "to study, to learn", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%ad%a6%e4%b9%a0-xue-xi-translation-pronunciation-and-example-sentences/
学校	xué xiào	học hiệu	hok6 haau6	[{"meaning": "school", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%ad%a6%e6%a0%a1-xue-xiao-translation-pronunciation-and-example-sentences/
一	yī	nhất	jat1	[{"meaning": "1", "part_of_speech": "number"}]	https://wohok.com/dict/%e4%b8%80-yi-translation-pronunciation-and-example-sentences/
衣服	yī fu	y phục	ji1 fuk6	[{"meaning": "clothes", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%a1%a3%e6%9c%8d-yi-fu-translation-pronunciation-and-example-sentences/
医生	yī shēng	y sinh	ji1 sang1	[{"meaning": "doctor", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%8c%bb%e7%94%9f-yi-sheng-translation-pronunciation-and-example-sentences/
医院	yī yuàn	y viện	ji1 jyun2	[{"meaning": "hospital", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%8c%bb%e9%99%a2-yi-yuan-translation-pronunciation-and-example-sentences/
舒适	shū shì	thư thích	syu1 sik1	[{"meaning": "comfortable, cozy", "part_of_speech": "adjective"}]	\N
属于	shǔ yú	thuộc về	suk6 jyu1	[{"meaning": "to belong to, to be part of", "part_of_speech": "verb"}]	\N
梳子	shū zi	thô tử	so1 zi2	[{"meaning": "comb", "part_of_speech": "noun"}]	\N
甩	shuǎi	thoải	lat1	[{"meaning": "to throw, to swing, to move back and forth", "part_of_speech": "verb"}]	\N
啊	a	a1	a	[{"meaning": "showing approval", "part_of_speech": "particle"}]	https://wohok.com/dict/%e5%95%8a-a-a-translation-pronunciation-and-example-sentences/
阿姨	ā yí	a1 yi2	a1 ji2	[{"meaning": "aunt", "part_of_speech": "noun"}]	https://wohok.com/dict/%e9%98%bf%e5%a7%a8-a-yi-translation-pronunciation-and-example-sentences/
矮	ǎi	ai1	ngaai2	[{"meaning": "low, short", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e7%9f%ae-ai-translation-pronunciation-and-example-sentences/
摔	shuāi	suýt	soi3	[{"meaning": "to fall, to throw down", "part_of_speech": "verb"}]	\N
双方	shuāng fāng	song phương	soeng1 fong1	[{"meaning": "both sides", "part_of_speech": "noun"}, {"meaning": "bilateral", "part_of_speech": "adjective"}]	\N
爱好	ài hào	ái hào	oi3 hou2	[{"meaning": "hobby, interest", "part_of_speech": "noun"}, {"meaning": "to like", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%88%b1%e5%a5%bd-ai-hao-translation-pronunciation-and-example-sentences/
安静	ān jìng	an ninh	on1 zing6	[{"meaning": "quiet, peaceful", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%ae%89%e9%9d%99-an-jing-translation-pronunciation-and-example-sentences/
把	bǎ	bả	baa2	[{"meaning": "handle", "part_of_speech": "noun"}, {"meaning": "to grasp, to hold", "part_of_speech": "verb"}, {"meaning": "for ba-sentences", "part_of_speech": "particle"}, {"meaning": "for a bunch or objects with handle", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e6%8a%8a-ba-translation-pronunciation-and-example-sentences/
半	bàn	bán	boon3	[{"meaning": "half", "part_of_speech": "number"}]	https://wohok.com/dict/%e5%8d%8a-ban-translation-pronunciation-and-example-sentences/
搬	bān	bàn	baan1	[{"meaning": "to move, to shift", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%90%ac-ban-translation-pronunciation-and-example-sentences/
班	bān	ban	baan1	[{"meaning": "class, team, squad", "part_of_speech": "noun"}, {"meaning": "for groups, rankings, etc.", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e7%8f%ad-ban-translation-pronunciation-and-example-sentences/
办法	bàn fǎ	bạn pháp	baan6 faat3	[{"meaning": "method, way, means", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%8a%9e%e6%b3%95-ban-fa-translation-pronunciation-and-example-sentences/
办公室	bàn gōng shì	bạn cơng thất	baan6 gung1 sat1	[{"meaning": "office, bureau", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%8a%9e%e5%85%ac%e5%ae%a4-ban-gong-shi-translation-pronunciation-and-example-sentences/
帮忙	bāng máng	bằng mạnh	baang1 mong4	[{"meaning": "to help, to do a favour", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%b8%ae%e5%bf%99-bang-mang-translation-pronunciation-and-example-sentences/
饱	bǎo	bão	bou2	[{"meaning": "full (from eating)", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e9%a5%b1-bao-translation-pronunciation-and-example-sentences/
包	bāo	bao	bāau1	[{"meaning": "bag, package", "part_of_speech": "noun"}, {"meaning": "to cover, to wrap, to hold, to include", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%8c%85-bao-translation-pronunciation-and-example-sentences/
被	bèi	bị	bei6	[{"meaning": "by (for passive sentence)", "part_of_speech": "relative clause"}]	https://wohok.com/dict/%e8%a2%ab-bei-translation-pronunciation-and-example-sentences/
北方	běi fāng	bắc phương	bak1 fong1	[{"meaning": "north, northern part of a country", "part_of_speech": "location"}]	https://wohok.com/dict/%e5%8c%97%e6%96%b9-bei-fang-translation-pronunciation-and-example-sentences/
比较	bǐ jiào	bỉ giới	bei2 gaau2	[{"meaning": "quite, rather, fairly, comparatively", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e6%af%94%e8%be%83-bi-jiao-translation-pronunciation-and-example-sentences/
比赛	bǐ sài	bỉ tại	bei2 coi3	[{"meaning": "competition, match", "part_of_speech": "noun"}, {"meaning": "to compete", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%af%94%e8%b5%9b-bi-sai-translation-pronunciation-and-example-sentences/
必须	bì xū	tất hủ	bit1 heoi1	[{"meaning": "to have to, to must", "part_of_speech": "auxiliary verb"}]	https://wohok.com/dict/%e5%bf%85%e9%a1%bb-bi-xu-translation-pronunciation-and-example-sentences/
鼻子	bí zi	mũi bí	bei6 zi2	[{"meaning": "nose", "part_of_speech": "noun"}]	https://wohok.com/dict/%e9%bc%bb%e5%ad%90-bi-zi-translation-pronunciation-and-example-sentences/
变化	biàn huà	biến hoá	bin3 faa3	[{"meaning": "change, variation", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%8f%98%e5%8c%96-bian-hua-translation-pronunciation-and-example-sentences/
表示	biǎo shì	biểu thị	biu2 tai2	[{"meaning": "to express, to show, to indicate", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%a1%a8%e7%a4%ba-biao-shi-translation-pronunciation-and-example-sentences/
表演	biǎo yǎn	biểu diễn	biu2 jin6	[{"meaning": "performance, show", "part_of_speech": "noun"}, {"meaning": "to perform, to act", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%a1%a8%e6%bc%94-biao-yan-translation-pronunciation-and-example-sentences/
别人	bié ren	biệt nhân	bit6 jan4	[{"meaning": "others, other people", "part_of_speech": "pronoun"}]	https://wohok.com/dict/%e5%88%ab%e4%ba%ba-bie-ren-translation-pronunciation-and-example-sentences/
宾馆	bīn guǎn	tân quán	ban1 gun2	[{"meaning": "hotel", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%ae%be%e9%a6%86-bin-guan-translation-pronunciation-and-example-sentences/
冰箱	bīng xiāng	băng tường	bing1 seong1	[{"meaning": "fridge, icebox", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%86%b0%e7%ae%b1-bing-xiang-translation-pronunciation-and-example-sentences/
才	cái	tài	coi4	[{"meaning": "ability, talent", "part_of_speech": "noun"}, {"meaning": "just, only if", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e6%89%8d-cai-translation-pronunciation-and-example-sentences/
菜单	cài dān	thực đơn	coi3 daan6	[{"meaning": "menu", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%8f%9c%e5%8d%95-cai-dan-translation-pronunciation-and-example-sentences/
参加	cān jiā	tam gia	chaam1 gaa1	[{"meaning": "to attend, to take part, to join", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%8f%82%e5%8a%a0-can-jia-translation-pronunciation-and-example-sentences/
草	cǎo	thảo	cou2	[{"meaning": "grass, straw", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%8d%89-cao-translation-pronunciation-and-example-sentences/
层	céng	tằng	cang4	[{"meaning": "layer, floor", "part_of_speech": "noun"}, {"meaning": "for layer, story, floor", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e5%b1%82-ceng-translation-pronunciation-and-example-sentences/
差	chà	sai	chaai1	[{"meaning": "to lack, short of", "part_of_speech": "verb"}, {"meaning": "poor", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%b7%ae-cha-translation-pronunciation-and-example-sentences/
超市	chāo shì	siêu thị	ciu1 si5	[{"meaning": "supermarket", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%b6%85%e5%b8%82-chao-shi-translation-pronunciation-and-example-sentences/
衬衫	chèn shān	soàm sơ	can3 saam1	[{"meaning": "shirt, blouse", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%a1%ac%e8%a1%ab-chen-shan-translation-pronunciation-and-example-sentences/
税	shuì	thuế	seoi3	[{"meaning": "tax, duty", "part_of_speech": "noun"}]	\N
成绩	chéng jì	thành tích	cing4 zik1	[{"meaning": "score, achievement, grades", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%88%90%e7%bb%a9-cheng-ji-translation-pronunciation-and-example-sentences/
城市	chéng shì	thành phố	sing4 si5	[{"meaning": "city, town", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%9f%8e%e5%b8%82-cheng-shi-translation-pronunciation-and-example-sentences/
迟到	chí dào	trì đáo	ci4 dou3	[{"meaning": "to be late", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%bf%9f%e5%88%b0-chi-dao-translation-pronunciation-and-example-sentences/
厨房	chú fáng	trù phòng	ceoi4 fong2	[{"meaning": "kitchen", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%8e%a8%e6%88%bf-chu-fang-translation-pronunciation-and-example-sentences/
除了	chú le	trừ liễu	ceoi4 liu5	[{"meaning": "except for, apart from, besides", "part_of_speech": "conjunction"}]	https://wohok.com/dict/%e9%99%a4%e4%ba%86-chu-le-translation-pronunciation-and-example-sentences/
出现	chū xiàn	xuất hiện	ceot1 hin6	[{"meaning": "to appear, to arise", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%87%ba%e7%8e%b0-chu-xian-translation-pronunciation-and-example-sentences/
春	chūn	xuân	ceon1	[{"meaning": "spring", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%98%a5-chun-translation-pronunciation-and-example-sentences/
词语	cí yǔ	từ ngữ	ci4 jyu5	[{"meaning": "word, expression", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%af%8d%e8%af%ad-ci-yu-translation-pronunciation-and-example-sentences/
聪明	cōng ming	thông minh	cong1 ming4	[{"meaning": "clever, intelligent, smart", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e8%81%aa%e6%98%8e-cong-ming-translation-pronunciation-and-example-sentences/
打扫	dǎ sǎo	đả tảo	daa2 sou3	[{"meaning": "to clean", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%89%93%e6%89%ab-da-sao-translation-pronunciation-and-example-sentences/
打算	dǎ suàn	đả toán	daa2 syun3	[{"meaning": "plan, intention", "part_of_speech": "noun"}, {"meaning": "to plan, to think of, to calculate", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%89%93%e7%ae%97-da-suan-translation-pronunciation-and-example-sentences/
带	dài	đái	daai3	[{"meaning": "band, belt, area, region", "part_of_speech": "noun"}, {"meaning": "to wear, to carry, to bring, to lead", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%b8%a6-dai-translation-pronunciation-and-example-sentences/
蛋糕	dàn gāo	đánh khao	daan6 gou1	[{"meaning": "cake", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%9b%8b%e7%b3%95-dan-gao-translation-pronunciation-and-example-sentences/
担心	dān xīn	đảm tâm	daam6 sam1	[{"meaning": "to worry", "part_of_speech": "verb"}, {"meaning": "worried, anxious", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e6%8b%85%e5%bf%83-dan-xin-translation-pronunciation-and-example-sentences/
当然	dāng rán	đương nhiên	doong6 jin4	[{"meaning": "certainly, of course", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e5%bd%93%e7%84%b6-dang-ran-translation-pronunciation-and-example-sentences/
地	de	địa	dei6	[{"meaning": "used before a verb", "part_of_speech": "particle"}]	https://wohok.com/dict/%e5%9c%b0-de-di-translation-pronunciation-and-example-sentences/
灯	dēng	đèn	dang1	[{"meaning": "lamp, light", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%81%af-deng-translation-pronunciation-and-example-sentences/
低	dī	dĩ	dai1	[{"meaning": "low", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e4%bd%8e-di-translation-pronunciation-and-example-sentences/
地方	dì fang	địa phương	dei6 fong1	[{"meaning": "region, place, location", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%9c%b0%e6%96%b9-di-fang-translation-pronunciation-and-example-sentences/
地铁	dì tiě	địa thiết	dei6 tit3	[{"meaning": "subway", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%9c%b0%e9%93%81-di-tie-translation-pronunciation-and-example-sentences/
地图	dì tú	địa đồ	dei6 tou4	[{"meaning": "map", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%9c%b0%e5%9b%be-di-tu-translation-pronunciation-and-example-sentences/
电梯	diàn tī	điện thang	 din6 tai1	[{"meaning": "elevator", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%94%b5%e6%a2%af-dian-ti-translation-pronunciation-and-example-sentences/
电子邮件	diàn zǐ yóu jiàn	điện tử duyệt viên	din6 zi2 jau4 min6	[{"meaning": "email", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%94%b5%e5%ad%90%e9%82%ae%e4%bb%b6-dian-zi-you-jian-translation-pronunciation-and-example-sentences/
东	dōng	đông	dung1	[{"meaning": "east", "part_of_speech": "location"}]	https://wohok.com/dict/%e4%b8%9c-dong-translation-pronunciation-and-example-sentences/
冬	dōng	đông	dung1	[{"meaning": "winter", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%86%ac-dong-translation-pronunciation-and-example-sentences/
动物	dòng wù	động vật	dung6 mat6	[{"meaning": "animal", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%8a%a8%e7%89%a9-dong-wu-translation-pronunciation-and-example-sentences/
段	duàn	đoạn	dyun6	[{"meaning": "for paragraphs, segments, periods, stories", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e6%ae%b5-duan-translation-pronunciation-and-example-sentences/
短	duǎn	đoản	dyun2	[{"meaning": "short, brief", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e7%9f%ad-duan-translation-pronunciation-and-example-sentences/
锻炼	duàn liàn	đoàn liễn	dyun3 lin6	[{"meaning": "to exercise, to engage in physical exercise", "part_of_speech": "verb"}]	https://wohok.com/dict/%e9%94%bb%e7%82%bc-duan-lian-translation-pronunciation-and-example-sentences/
多么	duō me	đa mạc	do1 maa5	[{"meaning": "how, what", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e5%a4%9a%e4%b9%88-duo-me-translation-pronunciation-and-example-sentences/
饿	è	ngạc	aak6	[{"meaning": "hungry", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e9%a5%bf-e-translation-pronunciation-and-example-sentences/
耳朵	ěr duo	nhi đảo	ji5 dou2	[{"meaning": "ear", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%80%b3%e6%9c%b5-er-duo-translation-pronunciation-and-example-sentences/
而且	ér qiě	như thích	ji4 ci3	[{"meaning": "moreover, in addition, furthermore", "part_of_speech": "conjunction"}]	https://wohok.com/dict/%e8%80%8c%e4%b8%94-er-qie-translation-pronunciation-and-example-sentences/
发烧	fā shāo	phát triều	faat3 siu1	[{"meaning": "to have fever", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%8f%91%e7%83%a7-fa-shao-translation-pronunciation-and-example-sentences/
发现	fā xiàn	phát hiện	faat3 jin6	[{"meaning": "to discover, to find", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%8f%91%e7%8e%b0-fa-xian-translation-pronunciation-and-example-sentences/
放	fàng	phóng	fong3	[{"meaning": "to let go, to put, have a vacation", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%94%be-fang-translation-pronunciation-and-example-sentences/
方便	fāng biàn	phương tiện	fong1 bin6	[{"meaning": "convenient", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e6%96%b9%e4%be%bf-fang-bian-translation-pronunciation-and-example-sentences/
放心	fàng xīn	phóng tâm	fong3 sam1	[{"meaning": "to rest, to be at ease", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%94%be%e5%bf%83-fang-xin-translation-pronunciation-and-example-sentences/
分	fēn	phân	fan1	[{"meaning": "minute, point, 0.01 Yuan", "part_of_speech": "noun"}, {"meaning": "to divide, to distinguish", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%88%86-fen-translation-pronunciation-and-example-sentences/
附近	fù jìn	phụ cận	fu6 gan6	[{"meaning": "vicinity", "part_of_speech": "noun"}, {"meaning": "nearby", "part_of_speech": "adverb"}, {"meaning": "next to", "part_of_speech": "relative clause"}]	https://wohok.com/dict/%e9%99%84%e8%bf%91-fu-jin-translation-pronunciation-and-example-sentences/
复习	fù xí	phục tập	fu6 zaap6	[{"meaning": "revision", "part_of_speech": "noun"}, {"meaning": "to revise", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%a4%8d%e4%b9%a0-fu-xi-translation-pronunciation-and-example-sentences/
敢	gǎn	cảm	kam2	[{"meaning": "to dare", "part_of_speech": "auxiliary verb"}]	https://wohok.com/dict/%e6%95%a2-gan-translation-pronunciation-and-example-sentences/
干净	gān jìng	càn kính	gon1 jing1	[{"meaning": "clean, tidy", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%b9%b2%e5%87%80-gan-jing-translation-pronunciation-and-example-sentences/
感冒	gǎn mào	cảm mạo	kam2 mou6	[{"meaning": "common cold", "part_of_speech": "noun"}, {"meaning": "to catch a cold", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%84%9f%e5%86%92-gan-mao-translation-pronunciation-and-example-sentences/
刚才	gāng cái	cang tài	gong1 coi4	[{"meaning": "just a moment ago", "part_of_speech": "time"}]	https://wohok.com/dict/%e5%88%9a%e6%89%8d-gang-cai-translation-pronunciation-and-example-sentences/
跟	gēn	cân	kun1	[{"meaning": "to follow", "part_of_speech": "verb"}, {"meaning": "with", "part_of_speech": "relative clause"}, {"meaning": "and", "part_of_speech": "conjunction"}]	https://wohok.com/dict/%e8%b7%9f-gen-translation-pronunciation-and-example-sentences/
根据	gēn jù	căn cứ	gan1 geoi2	[{"meaning": "basis, foundation", "part_of_speech": "noun"}, {"meaning": "to base on", "part_of_speech": "verb"}, {"meaning": "according to, based on", "part_of_speech": "relative clause"}]	https://wohok.com/dict/%e6%a0%b9%e6%8d%ae-gen-ju-translation-pronunciation-and-example-sentences/
更	gèng	canh	gaang1	[{"meaning": "even more", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e6%9b%b4-geng-translation-pronunciation-and-example-sentences/
公园	gōng yuán	công viên	gung1 jyun2	[{"meaning": "park", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%85%ac%e5%9b%ad-gong-yuan-translation-pronunciation-and-example-sentences/
故事	gù shi	cố sự	gu3 si6	[{"meaning": "story, tale", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%95%85%e4%ba%8b-gu-shi-translation-pronunciation-and-example-sentences/
刮风	guā fēng	quát phong	gwaa3 fung1	[{"meaning": "to be windy", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%88%ae%e9%a3%8e-gua-feng-translation-pronunciation-and-example-sentences/
关	guān	gwan	guan1	[{"meaning": "mountain pass, barrier", "part_of_speech": "noun"}, {"meaning": "to close, to shut, to turn off", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%85%b3-guan-translation-pronunciation-and-example-sentences/
关系	guān xì	quan hệ	guan1 hai6	[{"meaning": "relationship, relation", "part_of_speech": "noun"}, {"meaning": "to affect, to have to do with", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%85%b3%e7%b3%bb-guan-xi-translation-pronunciation-and-example-sentences/
关心	guān xīn	quan tâm	guan1 sam1	[{"meaning": "concern", "part_of_speech": "noun"}, {"meaning": "to care for", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%85%b3%e5%bf%83-guan-xin-translation-pronunciation-and-example-sentences/
关于	guān yú	quan vụ	guan1 jyu1	[{"meaning": "concerning, with regards to, about", "part_of_speech": "relative clause"}]	https://wohok.com/dict/%e5%85%b3%e4%ba%8e-guan-yu-translation-pronunciation-and-example-sentences/
国家	guó jiā	quốc gia	guok3 gaai1	[{"meaning": "country, state, nation", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%9b%bd%e5%ae%b6-guo-jia-translation-pronunciation-and-example-sentences/
过去	guò qù	quá khứ	gwo3 heoi3	[{"meaning": "to go over, to pass by", "part_of_speech": "verb"}, {"meaning": "past, former", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e8%bf%87%e5%8e%bb-guo-qu-translation-pronunciation-and-example-sentences/
果汁	guǒ zhī	quả trí	gwo2 zat1	[{"meaning": "fruit juice", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%9e%9c%e6%b1%81-guo-zhi-translation-pronunciation-and-example-sentences/
害怕	hài pà	hại phạ	hoi6 paa3	[{"meaning": "to be afraid, to fear", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%ae%b3%e6%80%95-hai-pa-translation-pronunciation-and-example-sentences/
还是	hái shì	hòa thị	waan4 si6	[{"meaning": "still, nevertheless", "part_of_speech": "adverb"}, {"meaning": "or", "part_of_speech": "conjunction"}]	https://wohok.com/dict/%e8%bf%98%e6%98%af-hai-shi-translation-pronunciation-and-example-sentences/
河	hé	hà	sai1	[{"meaning": "river", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%b2%b3-he-translation-pronunciation-and-example-sentences/
黑板	hēi bǎn	hắc bảng	hak1 bong2	[{"meaning": "blackboard", "part_of_speech": "noun"}]	https://wohok.com/dict/%e9%bb%91%e6%9d%bf-hei-ban-translation-pronunciation-and-example-sentences/
护照	hù zhào	hộ chiếu	ho6 ciu3	[{"meaning": "passport", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%8a%a4%e7%85%a7-hu-zhao-translation-pronunciation-and-example-sentences/
画	huà	hoa	waak6	[{"meaning": "picture, painting", "part_of_speech": "noun"}, {"meaning": "to draw, to paint", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%94%bb-hua-translation-pronunciation-and-example-sentences/
花	huā	hoa	faa1	[{"meaning": "flower", "part_of_speech": "noun"}, {"meaning": "to spend", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%8a%b1-hua-translation-pronunciation-and-example-sentences/
花园	huā yuán	hoa viên	faa1 jyun4	[{"meaning": "garden", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%8a%b1%e5%9b%ad-hua-yuan-translation-pronunciation-and-example-sentences/
坏	huài	hoại	waai6	[{"meaning": "bad, broken, spoiled", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%9d%8f-huai-translation-pronunciation-and-example-sentences/
说不定	shuō bu dìng	thuật thất định	syut6 bat1 ding6	[{"meaning": "maybe, cannot say for sure", "part_of_speech": "adverb"}]	\N
换	huàn	hoán	woon6	[{"meaning": "to change, to exchange", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%8d%a2-huan-translation-pronunciation-and-example-sentences/
环境	huán jìng	hoàn cảnh	waan4 ging2	[{"meaning": "environment, surroundings", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%8e%af%e5%a2%83-huan-jing-translation-pronunciation-and-example-sentences/
黄	huáng	hoàng	wong4	[{"meaning": "to fall through", "part_of_speech": "verb"}, {"meaning": "yellow, pornographic", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e9%bb%84-huang-translation-pronunciation-and-example-sentences/
会议	huì yì	hoạt nghị	wo6 jui6	[{"meaning": "meeting, conference", "part_of_speech": "noun"}]	https://wohok.com/dict/%e4%bc%9a%e8%ae%ae-hui-yi-translation-pronunciation-and-example-sentences/
或者	huò zhě	hoặc giả	waak6 gaa2	[{"meaning": "or, possibly", "part_of_speech": "conjunction"}]	https://wohok.com/dict/%e6%88%96%e8%80%85-huo-zhe-translation-pronunciation-and-example-sentences/
极	jí	cực	cuk1	[{"meaning": "pole", "part_of_speech": "noun"}, {"meaning": "extremely, highly", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e6%9e%81-ji-translation-pronunciation-and-example-sentences/
记得	jì de	ký đảo	gei3 dou3	[{"meaning": "to remember", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%ae%b0%e5%be%97-ji-de-translation-pronunciation-and-example-sentences/
几乎	jī hū	kỳ hồ	gei2 fu1	[{"meaning": "almost, nearly", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e5%87%a0%e4%b9%8e-ji-hu-translation-pronunciation-and-example-sentences/
机会	jī huì	cơ hội	gei1 wui6	[{"meaning": "opportunity, chance", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%9c%ba%e4%bc%9a-ji-hui-translation-pronunciation-and-example-sentences/
季节	jì jié	kỳ tiết	gei3 jit3	[{"meaning": "season, period", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%ad%a3%e8%8a%82-ji-jie-translation-pronunciation-and-example-sentences/
检查	jiǎn chá	kiểm tra	gim2 chaak1	[{"meaning": "inspection", "part_of_speech": "noun"}, {"meaning": "to check, to inspect, to examine", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%a3%80%e6%9f%a5-jian-cha-translation-pronunciation-and-example-sentences/
简单	jiǎn dān	giản đơn	gaan2 daan1	[{"meaning": "simple, uncomplicated", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e7%ae%80%e5%8d%95-jian-dan-translation-pronunciation-and-example-sentences/
健康	jiàn kāng	cường tráng	gin6 hong1	[{"meaning": "health", "part_of_speech": "noun"}, {"meaning": "healthy", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%81%a5%e5%ba%b7-jian-kang-translation-pronunciation-and-example-sentences/
见面	jiàn miàn	kiến diện	gin3 min6	[{"meaning": "to meet, to see sb.", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%a7%81%e9%9d%a2-jian-mian-translation-pronunciation-and-example-sentences/
讲	jiǎng	giang	gong2	[{"meaning": "speech, lecture", "part_of_speech": "noun"}, {"meaning": "to speak, to explain, to negotiate", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%ae%b2-jiang-translation-pronunciation-and-example-sentences/
脚	jiǎo	chiếu	gok3	[{"meaning": "foot", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%84%9a-jiao-translation-pronunciation-and-example-sentences/
角	jiǎo	cước	gok3	[{"meaning": "angle, corner, horn", "part_of_speech": "noun"}, {"meaning": "for 0.1 yuan", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e8%a7%92-jiao-translation-pronunciation-and-example-sentences/
教	jiāo	giao	gaau3	[{"meaning": "to teach, to instruct", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%95%99-jiao-translation-pronunciation-and-example-sentences/
借	jiè	tá	ze3	[{"meaning": "to lend, to borrow, to make use of (an opportunity)", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%80%9f-jie-translation-pronunciation-and-example-sentences/
接	jiē	tập	zip3	[{"meaning": "to receive, to meet, to connect, to catch", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%8e%a5-jie-translation-pronunciation-and-example-sentences/
街道	jiē dào	gia đạo	gai1 dou6	[{"meaning": "street", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%a1%97%e9%81%93-jie-dao-translation-pronunciation-and-example-sentences/
结婚	jié hūn	kết hôn	git3 fan1	[{"meaning": "marriage, wedding", "part_of_speech": "noun"}, {"meaning": "to marry", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%bb%93%e5%a9%9a-jie-hun-translation-pronunciation-and-example-sentences/
解决	jiě jué	giải quyết	gai2 kyut3	[{"meaning": "to settle (dispute), to resolve, to solve", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%a7%a3%e5%86%b3-jie-jue-translation-pronunciation-and-example-sentences/
节目	jié mù	tiết mục	zit3 muk6	[{"meaning": "program, item", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%8a%82%e7%9b%ae-jie-mu-translation-pronunciation-and-example-sentences/
节日	jié rì	tiết ngày	zit3 jat6	[{"meaning": "holiday, festival", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%8a%82%e6%97%a5-jie-ri-translation-pronunciation-and-example-sentences/
结束	jié shù	kết thúc	jit3 suk6	[{"meaning": "termination, end", "part_of_speech": "noun"}, {"meaning": "to finish, to end, to conclude", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%bb%93%e6%9d%9f-jie-shu-translation-pronunciation-and-example-sentences/
经常	jīng cháng	kinh thường	ging1 soeng4	[{"meaning": "often, frequently", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e7%bb%8f%e5%b8%b8-jing-chang-translation-pronunciation-and-example-sentences/
经过	jīng guò	kinh qua	ging1 gwo3	[{"meaning": "to pass, to go through", "part_of_speech": "verb"}, {"meaning": "after, as a result of", "part_of_speech": "relative clause"}]	https://wohok.com/dict/%e7%bb%8f%e8%bf%87-jing-guo-translation-pronunciation-and-example-sentences/
经理	jīng lǐ	kinh lý	ging1 lei5	[{"meaning": "manager, director", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%bb%8f%e7%90%86-jing-li-translation-pronunciation-and-example-sentences/
旧	jiù	cựu	gau6	[{"meaning": "old, used, worn", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e6%97%a7-jiu-translation-pronunciation-and-example-sentences/
久	jiǔ	cửu	gau2	[{"meaning": "long (time)", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e4%b9%85-jiu-translation-pronunciation-and-example-sentences/
举行	jǔ xíng	lễ hành	geoi2 hang4	[{"meaning": "to hold (meeting, etc.)", "part_of_speech": "verb"}]	https://wohok.com/dict/%e4%b8%be%e8%a1%8c-ju-xing-translation-pronunciation-and-example-sentences/
句子	jù zi	câu tử	guk1 zi2	[{"meaning": "sentence", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%8f%a5%e5%ad%90-ju-zi-translation-pronunciation-and-example-sentences/
决定	jué dìng	quyết định	kyut3 ding6	[{"meaning": "decision", "part_of_speech": "noun"}, {"meaning": "to decide", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%86%b3%e5%ae%9a-jue-ding-translation-pronunciation-and-example-sentences/
刻	kè	khắc	hak1	[{"meaning": "to cut, to carve", "part_of_speech": "verb"}, {"meaning": "for quarter of an hour", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e5%88%bb-ke-translation-pronunciation-and-example-sentences/
渴	kě	khát	hot3	[{"meaning": "thirsty", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e6%b8%b4-ke-translation-pronunciation-and-example-sentences/
可爱	kě ài	khả ái	ho2 oi3	[{"meaning": "cute, lovely", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%8f%af%e7%88%b1-ke-ai-translation-pronunciation-and-example-sentences/
客人	kè rén	khách nhân	haak6 jan4	[{"meaning": "guest, customer, visitor", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%ae%a2%e4%ba%ba-ke-ren-translation-pronunciation-and-example-sentences/
空调	kōng tiáo	không điều	hung1 tiu4	[{"meaning": "air conditioning", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%a9%ba%e8%b0%83-kong-tiao-translation-pronunciation-and-example-sentences/
口	kǒu	 khẩu	hau2	[{"meaning": "mouth", "part_of_speech": "noun"}, {"meaning": "for things with mouths or a mouth full of", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e5%8f%a3-kou-translation-pronunciation-and-example-sentences/
哭	kū	khốc	huk1	[{"meaning": "to cry, to weep", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%93%ad-ku-translation-pronunciation-and-example-sentences/
裤子	kù zi	quần	bou3 zi2	[{"meaning": "trousers", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%a3%a4%e5%ad%90-ku-zi-translation-pronunciation-and-example-sentences/
筷子	kuài zi	quải tử	kwaai2 zi2	[{"meaning": "chopsticks", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%ad%b7%e5%ad%90-kuai-zi-translation-pronunciation-and-example-sentences/
蓝	lán	lam4	laam4	[{"meaning": "blue", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e8%93%9d-lan-translation-pronunciation-and-example-sentences/
老	lǎo	lão	lou5	[{"meaning": "old", "part_of_speech": "adjective"}, {"meaning": "always", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e8%80%81-lao-translation-pronunciation-and-example-sentences/
离开	lí kāi	ly khai	lai4 hoi1	[{"meaning": "to depart, to leave", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%a6%bb%e5%bc%80-li-kai-translation-pronunciation-and-example-sentences/
历史	lì shǐ	lịch sử	lik6 si6	[{"meaning": "history", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%8e%86%e5%8f%b2-li-shi-translation-pronunciation-and-example-sentences/
礼物	lǐ wù	lễ vật	lei5 mat6	[{"meaning": "gift, present", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%a4%bc%e7%89%a9-li-wu-translation-pronunciation-and-example-sentences/
脸	liǎn	liễn	lim5	[{"meaning": "face", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%84%b8-lian-translation-pronunciation-and-example-sentences/
练习	liàn xí	liễn tập	lin6 zaap6	[{"meaning": "exercise, practice", "part_of_speech": "noun"}, {"meaning": "to practice", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%bb%83%e4%b9%a0-lian-xi-translation-pronunciation-and-example-sentences/
辆	liàng	lượng	loeng6	[{"meaning": "for vehicles", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e8%be%86-liang-translation-pronunciation-and-example-sentences/
了解	liǎo jiě	liễu giải	liu5 gaai2	[{"meaning": "to understand", "part_of_speech": "verb"}]	https://wohok.com/dict/%e4%ba%86%e8%a7%a3-liao-jie-translation-pronunciation-and-example-sentences/
邻居	lín jū	lân cư	lun4 keoi1	[{"meaning": "neighbour", "part_of_speech": "noun"}]	https://wohok.com/dict/%e9%82%bb%e5%b1%85-lin-ju-translation-pronunciation-and-example-sentences/
楼	lóu	lâu	lau4	[{"meaning": "storied building", "part_of_speech": "noun"}, {"meaning": "for floor", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e6%a5%bc-lou-translation-pronunciation-and-example-sentences/
绿	lǜ	lục	luk6	[{"meaning": "green", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e7%bb%bf-lu-translation-pronunciation-and-example-sentences/
马	mǎ	mã	maa5	[{"meaning": "horse", "part_of_speech": "noun"}]	https://wohok.com/dict/%e9%a9%ac-ma-translation-pronunciation-and-example-sentences/
马上	mǎ shàng	mã thượng	maa5 soeng6	[{"meaning": "immediately, at once", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e9%a9%ac%e4%b8%8a-ma-shang-translation-pronunciation-and-example-sentences/
满意	mǎn yì	mãn ý	mun5 ji3	[{"meaning": "to satisfy", "part_of_speech": "verb"}, {"meaning": "satisfied", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e6%bb%a1%e6%84%8f-man-yi-translation-pronunciation-and-example-sentences/
帽子	mào zi	mạo tử	maau6 zi2	[{"meaning": "hat, cap", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%b8%bd%e5%ad%90-mao-zi-translation-pronunciation-and-example-sentences/
米	mǐ	mễ	mai5	[{"meaning": "rice", "part_of_speech": "noun"}, {"meaning": "for meter", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e7%b1%b3-mi-translation-pronunciation-and-example-sentences/
面包	miàn bāo	diện bao	 min6 baau1	[{"meaning": "bread", "part_of_speech": "noun"}]	https://wohok.com/dict/%e9%9d%a2%e5%8c%85-mian-bao-translation-pronunciation-and-example-sentences/
面条	miàn tiáo	diện điếu	min6 tiu4	[{"meaning": "noodles", "part_of_speech": "noun"}]	https://wohok.com/dict/%e9%9d%a2%e6%9d%a1-mian-tiao-translation-pronunciation-and-example-sentences/
明白	míng bai	minh bạch	meng4 baak6	[{"meaning": "to understand", "part_of_speech": "verb"}, {"meaning": "clear, obvious", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e6%98%8e%e7%99%bd-ming-bai-translation-pronunciation-and-example-sentences/
拿	ná	nhã	náah4	[{"meaning": "to hold, to seize", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%8b%bf-na-translation-pronunciation-and-example-sentences/
奶奶	nǎi nai	nại nại	nai5 nai5	[{"meaning": "grandmother (father’s mother)", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%a5%b6%e5%a5%b6-nai-nai-translation-pronunciation-and-example-sentences/
南	nán	nam	nam4	[{"meaning": "south", "part_of_speech": "location"}]	https://wohok.com/dict/%e5%8d%97-nan-translation-pronunciation-and-example-sentences/
难	nán	nan	nan4	[{"meaning": "difficult", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e9%9a%be-nan-translation-pronunciation-and-example-sentences/
难过	nán guò	nan khốc	nan4 huk1	[{"meaning": "to feel sorry, sad", "part_of_speech": "verb"}]	https://wohok.com/dict/%e9%9a%be%e8%bf%87-nan-guo-translation-pronunciation-and-example-sentences/
年级	nián jí	niên cấp	nin4 gap1	[{"meaning": "grade, year", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%b9%b4%e7%ba%a7-nian-ji-translation-pronunciation-and-example-sentences/
年轻	nián qīng	niên kinh	nin4 hing1	[{"meaning": "young", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%b9%b4%e8%bd%bb-nian-qing-translation-pronunciation-and-example-sentences/
鸟	niǎo	diểu	niu5	[{"meaning": "bird", "part_of_speech": "noun"}]	https://wohok.com/dict/%e9%b8%9f-niao-translation-pronunciation-and-example-sentences/
努力	nǔ lì	nỗ lực	no6 lik6	[{"meaning": "great effort", "part_of_speech": "noun"}, {"meaning": "to strive, to work/study hard", "part_of_speech": "verb"}, {"meaning": "hard, hardworking", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%8a%aa%e5%8a%9b-nu-li-translation-pronunciation-and-example-sentences/
爬山	pá shān	bà sơn	paa4 saan1	[{"meaning": "hiking", "part_of_speech": "noun"}, {"meaning": "to climb a mountain", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%88%ac%e5%b1%b1-pa-shan-translation-pronunciation-and-example-sentences/
盘子	pán zi	phiến tử	paan4 zi2	[{"meaning": "tray, plate, dish", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%9b%98%e5%ad%90-pan-zi-translation-pronunciation-and-example-sentences/
胖	pàng	bạnh	paang5	[{"meaning": "fat, plump", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e8%83%96-pang-translation-pronunciation-and-example-sentences/
啤酒	pí jiǔ	bia	pei1 zau2	[{"meaning": "beer", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%95%a4%e9%85%92-pi-jiu-translation-pronunciation-and-example-sentences/
葡萄	pú tao	phong thảo	pou4 tou4	[{"meaning": "grape", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%91%a1%e8%90%84-pu-tao-translation-pronunciation-and-example-sentences/
普通话	pǔ tōng huà	bình thường thoại	pou2 tung1 waa6	[{"meaning": "Mandarin", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%99%ae%e9%80%9a%e8%af%9d-pu-tong-hua-translation-pronunciation-and-example-sentences/
骑	qí	khí	kei4	[{"meaning": "to ride (animal or bike)", "part_of_speech": "verb"}]	https://wohok.com/dict/%e9%aa%91-qi-translation-pronunciation-and-example-sentences/
奇怪	qí guài	kỳ quái	kei4 gwaai3	[{"meaning": "strange, weird", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%a5%87%e6%80%aa-qi-guai-translation-pronunciation-and-example-sentences/
其实	qí shí	kỳ thự	kèi4 sat6	[{"meaning": "actually, in fact", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e5%85%b6%e5%ae%9e-qi-shi-translation-pronunciation-and-example-sentences/
其他	qí tā	khác thứ	kei4 ta1	[{"meaning": "other, others", "part_of_speech": "pronoun"}]	https://wohok.com/dict/%e5%85%b6%e4%bb%96-qi-ta-translation-pronunciation-and-example-sentences/
铅笔	qiān bǐ	thiêm bút	jin1 bat1	[{"meaning": "pencil", "part_of_speech": "noun"}]	https://wohok.com/dict/%e9%93%85%e7%ac%94-qian-bi-translation-pronunciation-and-example-sentences/
清楚	qīng chu	thanh rõ	cing1 co2	[{"meaning": "clear, distinct", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e6%b8%85%e6%a5%9a-qing-chu-translation-pronunciation-and-example-sentences/
秋	qiū	thu	cau1	[{"meaning": "autumn, fall", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%a7%8b-qiu-translation-pronunciation-and-example-sentences/
裙子	qún zi	côn tử	kwan4 zi2	[{"meaning": "skirt", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%a3%99%e5%ad%90-qun-zi-translation-pronunciation-and-example-sentences/
然后	rán hòu	nhãn hạ	jin4 hau6	[{"meaning": "then, afterwards", "part_of_speech": "conjunction"}]	https://wohok.com/dict/%e7%84%b6%e5%90%8e-ran-hou-translation-pronunciation-and-example-sentences/
热情	rè qíng	nhiệt tình	jit6 tinh4	[{"meaning": "enthusiasm, passion", "part_of_speech": "noun"}, {"meaning": "enthusiastic, passionate, cordial", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e7%83%ad%e6%83%85-re-qing-translation-pronunciation-and-example-sentences/
认为	rèn wéi	nhận vi	 jin6 wai4	[{"meaning": "to think, to believe, to consider", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%ae%a4%e4%b8%ba-ren-wei-translation-pronunciation-and-example-sentences/
认真	rèn zhēn	nhận chân	 jin6 jan1	[{"meaning": "conscientious, earnest, serious", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e8%ae%a4%e7%9c%9f-ren-zhen-translation-pronunciation-and-example-sentences/
容易	róng yì	dung dị	 jung4 ji6	[{"meaning": "easy", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%ae%b9%e6%98%93-rong-yi-translation-pronunciation-and-example-sentences/
如果	rú guǒ	nhược khảo	 jyu4 gwo2	[{"meaning": "if", "part_of_speech": "conjunction"}]	https://wohok.com/dict/%e5%a6%82%e6%9e%9c-ru-guo-translation-pronunciation-and-example-sentences/
伞	sǎn	tán	san3	[{"meaning": "umbrella", "part_of_speech": "noun"}]	https://wohok.com/dict/%e4%bc%9e-san-translation-pronunciation-and-example-sentences/
上网	shàng wǎng	thượng mạng	soeng6 mong5	[{"meaning": "to be on the internet", "part_of_speech": "verb"}]	https://wohok.com/dict/%e4%b8%8a%e7%bd%91-shang-wang-translation-pronunciation-and-example-sentences/
生气	shēng qì	 sinh khí	 sang1 hei3	[{"meaning": "to be/get angry", "part_of_speech": "verb"}, {"meaning": "angry, mad", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e7%94%9f%e6%b0%94-sheng-qi-translation-pronunciation-and-example-sentences/
声音	shēng yīn	 thanh âm	 sing1 jam1	[{"meaning": "voice, sound", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%a3%b0%e9%9f%b3-sheng-yin-translation-pronunciation-and-example-sentences/
使	shǐ	 sứ	 si2	[{"meaning": "envoy, messenger", "part_of_speech": "noun"}, {"meaning": "to make, to cause, to use, to employ", "part_of_speech": "verb"}]	https://wohok.com/dict/%e4%bd%bf-shi-translation-pronunciation-and-example-sentences/
世界	shì jiè	 thế giới	 sai3 gaai3	[{"meaning": "world", "part_of_speech": "noun"}]	https://wohok.com/dict/%e4%b8%96%e7%95%8c-shi-jie-translation-pronunciation-and-example-sentences/
瘦	shòu	 sấu	 sau3	[{"meaning": "thin, slim", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e7%98%a6-shou-translation-pronunciation-and-example-sentences/
树	shù	 thụ	 syu6	[{"meaning": "tree", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%a0%91-shu-translation-pronunciation-and-example-sentences/
舒服	shū fu	 thư phục	 syu1 fuk6	[{"meaning": "comfortable", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e8%88%92%e6%9c%8d-shu-fu-translation-pronunciation-and-example-sentences/
叔叔	shū shu	 thúc thúc	 suk1 suk1	[{"meaning": "uncle", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%8f%94%e5%8f%94-shu-shu-translation-pronunciation-and-example-sentences/
数学	shù xué	 sổ học	 sou3 hok6	[{"meaning": "mathematics", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%95%b0%e5%ad%a6-shu-xue-translation-pronunciation-and-example-sentences/
刷牙	shuā yá	 soát nha	 saat3 ngaa4	[{"meaning": "to brush teeth", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%88%b7%e7%89%99-shua-ya-translation-pronunciation-and-example-sentences/
双	shuāng	 song	 soeng1	[{"meaning": "two, pair, both", "part_of_speech": "adjective"}, {"meaning": "for a pair (of shoes, etc.)", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e5%8f%8c-shuang-translation-pronunciation-and-example-sentences/
水平	shuǐ píng	 thuỷ bình	 seoi2 ping4	[{"meaning": "level, standard", "part_of_speech": "noun"}, {"meaning": "horizontal", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e6%b0%b4%e5%b9%b3-shui-ping-translation-pronunciation-and-example-sentences/
司机	sī jī	 tức cơ	 si1 gei1	[{"meaning": "driver", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%8f%b8%e6%9c%ba-si-ji-translation-pronunciation-and-example-sentences/
虽然	suī rán	 tuy nhiên	 seoi1 jin4	[{"meaning": "although", "part_of_speech": "conjunction"}]	https://wohok.com/dict/%e8%99%bd%e7%84%b6-sui-ran-translation-pronunciation-and-example-sentences/
太阳	tài yáng	 thái dương	 taai3 joeng4	[{"meaning": "sun", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%a4%aa%e9%98%b3-tai-yang-translation-pronunciation-and-example-sentences/
糖	táng	 đường	 tong4	[{"meaning": "sugar, sweets, candy", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%b3%96-tang-translation-pronunciation-and-example-sentences/
特别	tè bié	 đặc biệt	 dak6 bit6	[{"meaning": "special, particular", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e7%89%b9%e5%88%ab-te-bie-translation-pronunciation-and-example-sentences/
疼	téng	 đau	 tang4	[{"meaning": "pain", "part_of_speech": "noun"}, {"meaning": "to ache, to hurt", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%96%bc-teng-translation-pronunciation-and-example-sentences/
提高	tí gāo	 đề cao	 tai4 gou1	[{"meaning": "to raise, to increase", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%8f%90%e9%ab%98-ti-gao-translation-pronunciation-and-example-sentences/
体育	tǐ yù	 thể dục	 tai2 juk6	[{"meaning": "sports", "part_of_speech": "noun"}]	https://wohok.com/dict/%e4%bd%93%e8%82%b2-ti-yu-translation-pronunciation-and-example-sentences/
甜	tián	 ngọt	 tim4	[{"meaning": "sweet", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e7%94%9c-tian-translation-pronunciation-and-example-sentences/
条	tiáo	 điều	 tiu4	[{"meaning": "strip, clause", "part_of_speech": "noun"}, {"meaning": "for long thin things", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e6%9d%a1-tiao-translation-pronunciation-and-example-sentences/
同事	tóng shì	 đồng sự	 tung4 si6	[{"meaning": "colleague", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%90%8c%e4%ba%8b-tong-shi-translation-pronunciation-and-example-sentences/
同意	tóng yì	 đồng ý	 tung4 ji3	[{"meaning": "to agree, to consent, to approve", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%90%8c%e6%84%8f-tong-yi-translation-pronunciation-and-example-sentences/
头发	tóu fa	 đầu phát	 tau4 faat3	[{"meaning": "hair (on the head)", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%a4%b4%e5%8f%91-tou-fa-translation-pronunciation-and-example-sentences/
突然	tū rán	 đột nhiên	 dat6 nam4	[{"meaning": "sudden, abrupt", "part_of_speech": "adjective"}, {"meaning": "suddenly, unexpectedly", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e7%aa%81%e7%84%b6-tu-ran-translation-pronunciation-and-example-sentences/
图书馆	tú shū guǎn	 đồ thư quán	 tou4 syu1 gun2	[{"meaning": "library", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%9b%be%e4%b9%a6%e9%a6%86-tu-shu-guan-translation-pronunciation-and-example-sentences/
腿	tuǐ	 thối	 tui2	[{"meaning": "leg", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%85%bf-tui-translation-pronunciation-and-example-sentences/
万	wàn	 vạn	 maan6	[{"meaning": "10000", "part_of_speech": "number"}]	https://wohok.com/dict/%e4%b8%87-wan-translation-pronunciation-and-example-sentences/
碗	wǎn	 hoàn	 wan2	[{"meaning": "bowl", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%a2%97-wan-translation-pronunciation-and-example-sentences/
完成	wán chéng	 hoàn thành	 wan4 cin4	[{"meaning": "to complete, to accomplish", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%ae%8c%e6%88%90-wan-cheng-translation-pronunciation-and-example-sentences/
忘记	wàng jì	 vong kí	 mong6 gei3	[{"meaning": "to forget", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%bf%98%e8%ae%b0-wang-ji-translation-pronunciation-and-example-sentences/
为	wèi	 vi	 wai4	[{"meaning": "to do, to act, to be, to become", "part_of_speech": "verb"}, {"meaning": "for (sb.)", "part_of_speech": "relative clause"}]	https://wohok.com/dict/%e4%b8%ba-wei-wei-translation-pronunciation-and-example-sentences/
一共	yí gòng	 nhất cùng	 jat1 gung6	[{"meaning": "althogether", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e4%b8%80%e5%85%b1-yi-gong-translation-pronunciation-and-example-sentences/
位	wèi	 vị	 wai6	[{"meaning": "position, place, seat", "part_of_speech": "noun"}, {"meaning": "for people", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e4%bd%8d-wei-translation-pronunciation-and-example-sentences/
为了	wèi le	 vì ly	 wai4 liu5	[{"meaning": "for, in order to", "part_of_speech": "relative clause"}]	https://wohok.com/dict/%e4%b8%ba%e4%ba%86-wei-le-translation-pronunciation-and-example-sentences/
文化	wén huà	 văn hóa	 man4 faa3	[{"meaning": "culture", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%96%87%e5%8c%96-wen-hua-translation-pronunciation-and-example-sentences/
西	xī	 tây	 sai1	[{"meaning": "west", "part_of_speech": "location"}]	https://wohok.com/dict/%e8%a5%bf-xi-translation-pronunciation-and-example-sentences/
习惯	xí guàn	 tập quán	 jap6 gun2	[{"meaning": "habit, usual practice, custom", "part_of_speech": "noun"}, {"meaning": "to be/get used to", "part_of_speech": "verb"}]	https://wohok.com/dict/%e4%b9%a0%e6%83%af-xi-guan-translation-pronunciation-and-example-sentences/
洗手间	xǐ shǒu jiān	 tẩy thủ gian	 sai2 sau2 gaan1	[{"meaning": "toilet, bathroom", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%b4%97%e6%89%8b%e9%97%b4-xi-shou-jian-translation-pronunciation-and-example-sentences/
洗澡	xǐ zǎo	 tẩy tạo	 sai2 zou6	[{"meaning": "to take a shower, to have a bath", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%b4%97%e6%be%a1-xi-zao-translation-pronunciation-and-example-sentences/
夏	xià	 hạ	 haa6	[{"meaning": "summer", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%a4%8f-xia-translation-pronunciation-and-example-sentences/
先	xiān	 tiên	 sin1	[{"meaning": "early, former, first, before", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e5%85%88-xian-translation-pronunciation-and-example-sentences/
像	xiàng	 tượng	 zoeng6	[{"meaning": "be/look like, to appear, to seem", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%83%8f-xiang-translation-pronunciation-and-example-sentences/
香蕉	xiāng jiāo	 hương điều	 hoeng1 diu6	[{"meaning": "banana", "part_of_speech": "noun"}]	https://wohok.com/dict/%e9%a6%99%e8%95%89-xiang-jiao-translation-pronunciation-and-example-sentences/
相同	xiāng tóng	 tương đồng	 soeng1 tung4	[{"meaning": "identical, same", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e7%9b%b8%e5%90%8c-xiang-tong-translation-pronunciation-and-example-sentences/
相信	xiāng xìn	 tương tín	 soeng1 seon3	[{"meaning": "to believe in, have faith in", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%9b%b8%e4%bf%a1-xiang-xin-translation-pronunciation-and-example-sentences/
小心	xiǎo xīn	 tiểu tâm	 siu2 sam1	[{"meaning": "to be careful", "part_of_speech": "verb"}, {"meaning": "careful", "part_of_speech": "adjective"}, {"meaning": "Take care!", "part_of_speech": "expression"}]	https://wohok.com/dict/%e5%b0%8f%e5%bf%83-xiao-xin-translation-pronunciation-and-example-sentences/
校长	xiào zhǎng	 hiệu trưởng	 haau6 zoeng2	[{"meaning": "headmaster, president (university)", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%a0%a1%e9%95%bf-xiao-zhang-translation-pronunciation-and-example-sentences/
鞋	xié	 giày	 haai4	[{"meaning": "shoe", "part_of_speech": "noun"}]	https://wohok.com/dict/%e9%9e%8b-xie-translation-pronunciation-and-example-sentences/
信	xìn	 tín	 seon3	[{"meaning": "letter, trust", "part_of_speech": "noun"}, {"meaning": "to believe, to trust", "part_of_speech": "verb"}]	https://wohok.com/dict/%e4%bf%a1-xin-translation-pronunciation-and-example-sentences/
新闻	xīn wén	 tin vấn	 san1 man4	[{"meaning": "news", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%96%b0%e9%97%bb-xin-wen-translation-pronunciation-and-example-sentences/
新鲜	xīn xiān	 tân tiên	 san1 sin1	[{"meaning": "fresh (food, experience, etc.)", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e6%96%b0%e9%b2%9c-xin-xian-translation-pronunciation-and-example-sentences/
行李箱	xíng li xiāng	 hành ly hư	 haang4 lei5 soeng1	[{"meaning": "suitcase", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%a1%8c%e6%9d%8e%e7%ae%b1-xing-li-xiang-translation-pronunciation-and-example-sentences/
兴趣	xìng qù	 hưng thú	 hing1 ceoi3	[{"meaning": "interest", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%85%b4%e8%b6%a3-xing-qu-translation-pronunciation-and-example-sentences/
熊猫	xióng māo	 hùng mao	 hung4 maau1	[{"meaning": "panda", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%86%8a%e7%8c%ab-xiong-mao-translation-pronunciation-and-example-sentences/
需要	xū yào	 nhu cầu	 seoi1 jiu3	[{"meaning": "needs", "part_of_speech": "noun"}, {"meaning": "to need, to want", "part_of_speech": "verb"}]	https://wohok.com/dict/%e9%9c%80%e8%a6%81-xu-yao-translation-pronunciation-and-example-sentences/
选择	xuǎn zé	 tuyển trọng	 zeon2 zoek3	[{"meaning": "choice, option", "part_of_speech": "noun"}, {"meaning": "to choose, to select", "part_of_speech": "verb"}]	https://wohok.com/dict/%e9%80%89%e6%8b%a9-xuan-ze-translation-pronunciation-and-example-sentences/
眼镜	yǎn jìng	 nhãn kính	 ngaan5 geng1	[{"meaning": "eyeglasses", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%9c%bc%e9%95%9c-yan-jing-translation-pronunciation-and-example-sentences/
要求	yāo qiú	 yêu cầu	 ji4 kau4	[{"meaning": "demand, requirement", "part_of_speech": "noun"}, {"meaning": "to require, to demand", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%a6%81%e6%b1%82-yao-qiu-translation-pronunciation-and-example-sentences/
爷爷	yé ye	 ông nội	 je4 je4	[{"meaning": "grandfather (father’s father)", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%88%b7%e7%88%b7-ye-ye-translation-pronunciation-and-example-sentences/
一般	yì bān	 nhất ban	 jat1 baan1	[{"meaning": "ordinary, general, common", "part_of_speech": "adjective"}, {"meaning": "in general, generally", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e4%b8%80%e8%88%ac-yi-ban-translation-pronunciation-and-example-sentences/
一边	yì biān	 nhất biên	 jat1 bin1	[{"meaning": "one side", "part_of_speech": "location"}, {"meaning": "on the one hand", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e4%b8%80%e8%be%b9-yi-bian-translation-pronunciation-and-example-sentences/
一定	yí dìng	 nhất định	 jat1 ding6	[{"meaning": "definite, fixed, given", "part_of_speech": "adjective"}, {"meaning": "surely, certainly", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e4%b8%80%e5%ae%9a-yi-ding-translation-pronunciation-and-example-sentences/
以后	yǐ hòu	 dĩ hậu	 ji5 hau6	[{"meaning": "after, afterwards", "part_of_speech": "time"}]	https://wohok.com/dict/%e4%bb%a5%e5%90%8e-yi-hou-translation-pronunciation-and-example-sentences/
一会儿	yí huì r	 nhất hội nhĩ	 jat1 wui6 ji5	[{"meaning": "a while", "part_of_speech": "time"}, {"meaning": "in a moment, a little while", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e4%b8%80%e4%bc%9a%e5%84%bf-yi-hui-er-translation-pronunciation-and-example-sentences/
以前	yǐ qián	 dĩ tiền	 ji5 cin4	[{"meaning": "before", "part_of_speech": "time"}, {"meaning": "previous, formerly", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e4%bb%a5%e5%89%8d-yi-qian-translation-pronunciation-and-example-sentences/
以为	yǐ wéi	 dĩ vị	 ji5 wai4	[{"meaning": "to think (wrongly), to be under the (wrong) impression", "part_of_speech": "verb"}]	https://wohok.com/dict/%e4%bb%a5%e4%b8%ba-yi-wei-translation-pronunciation-and-example-sentences/
一样	yí yàng	 nhất dạng	 jat1 joeng6	[{"meaning": "alike, equal to", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e4%b8%80%e6%a0%b7-yi-yang-translation-pronunciation-and-example-sentences/
一直	yī zhí	 nhất trực	 jat1 zik6	[{"meaning": "always, continuously, straight", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e4%b8%80%e7%9b%b4-yi-zhi-translation-pronunciation-and-example-sentences/
银行	yín háng	 ngân hàng	 ngan4 hong4	[{"meaning": "bank (for money)", "part_of_speech": "noun"}]	https://wohok.com/dict/%e9%93%b6%e8%a1%8c-yin-hang-translation-pronunciation-and-example-sentences/
音乐	yīn yuè	 âm nhạc	 jam1 ngok6	[{"meaning": "music", "part_of_speech": "noun"}]	https://wohok.com/dict/%e9%9f%b3%e4%b9%90-yin-yue-translation-pronunciation-and-example-sentences/
应该	yīng gāi	 ứng cận	 jing1 hoi6	[{"meaning": "should, ought to", "part_of_speech": "auxiliary verb"}]	https://wohok.com/dict/%e5%ba%94%e8%af%a5-ying-gai-translation-pronunciation-and-example-sentences/
影响	yǐng xiǎng	 ảnh hưởng	 jing2 hyung2	[{"meaning": "influence, effect", "part_of_speech": "noun"}, {"meaning": "to influence, to affect", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%bd%b1%e5%93%8d-ying-xiang-translation-pronunciation-and-example-sentences/
用	yòng	 dụng	 jung6	[{"meaning": "to use, to employ, to apply", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%94%a8-yong-translation-pronunciation-and-example-sentences/
又	yòu	 hữu	 jau6	[{"meaning": "again", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e5%8f%88-you-translation-pronunciation-and-example-sentences/
有名	yǒu míng	 hữu danh	 jau5 ming4	[{"meaning": "famous, well known", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e6%9c%89%e5%90%8d-you-ming-translation-pronunciation-and-example-sentences/
游戏	yóu xì	 du hí	 jau4 jik6	[{"meaning": "game, play", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%b8%b8%e6%88%8f-you-xi-translation-pronunciation-and-example-sentences/
遇到	yù dào	 ngộ đáo	 jyu6 dou3	[{"meaning": "to meet, to run into", "part_of_speech": "verb"}]	https://wohok.com/dict/%e9%81%87%e5%88%b0-yu-dao-translation-pronunciation-and-example-sentences/
愿意	yuàn yì	 nguyện ý	 jyun6 ji3	[{"meaning": "to be willing, be ready, to wish, to want", "part_of_speech": "auxiliary verb"}]	https://wohok.com/dict/%e6%84%bf%e6%84%8f-yuan-yi-translation-pronunciation-and-example-sentences/
越	yuè	 dưới	 jyut6	[{"meaning": "to exceed, to climb over, to surpass", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%b6%8a-yue-translation-pronunciation-and-example-sentences/
月亮	yuè liang	 nguyệt lượng	 jyut6 loeng6	[{"meaning": "moon", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%9c%88%e4%ba%ae-yue-liang-translation-pronunciation-and-example-sentences/
云	yún	 vân	 wan4	[{"meaning": "cloud", "part_of_speech": "noun"}]	https://wohok.com/dict/%e4%ba%91-yun-translation-pronunciation-and-example-sentences/
站	zhàn	 trạm	 zaam6	[{"meaning": "station, stop", "part_of_speech": "noun"}, {"meaning": "to stand, to stop, to halt", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%ab%99-zhan-translation-pronunciation-and-example-sentences/
说服	shuō fú	thuyết phục	syut6 fuk6	[{"meaning": "to persuade, to convince", "part_of_speech": "verb"}]	\N
照顾	zhào gù	 chiếu cố	 ziu3 gu3	[{"meaning": "to take care of, to look after", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%85%a7%e9%a1%be-zhao-gu-translation-pronunciation-and-example-sentences/
着急	zháo jí	 trước cấp	 zoek3 gap1	[{"meaning": "to worry, to be nervous", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%9d%80%e6%80%a5-zhao-ji-translation-pronunciation-and-example-sentences/
照片	zhào piàn	 chiếu bản	 ziu3 pin3	[{"meaning": "photo, picture", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%85%a7%e7%89%87-zhao-pian-translation-pronunciation-and-example-sentences/
照相机	zhào xiàng jī	 chiếu tượng cơ	 ziu3 zoeng6 gei1	[{"meaning": "camera", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%85%a7%e7%9b%b8%e6%9c%ba-zhao-xiang-ji-translation-pronunciation-and-example-sentences/
撕	sī	xé	ci1	[{"meaning": "to tear up", "part_of_speech": "verb"}]	\N
种	zhǒng	 chủng	 zung2	[{"meaning": "species, race, breed", "part_of_speech": "noun"}, {"meaning": "type, kind, sort or for languages", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e7%a7%8d-zhong-zhong-translation-pronunciation-and-example-sentences/
中间	zhōng jiān	 trung gian	 zung1 gaan1	[{"meaning": "between, in the middle, mid", "part_of_speech": "location"}]	https://wohok.com/dict/%e4%b8%ad%e9%97%b4-zhong-jian-translation-pronunciation-and-example-sentences/
重要	zhòng yào	 trọng yếu	 zung6 jiu6	[{"meaning": "important", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e9%87%8d%e8%a6%81-zhong-yao-translation-pronunciation-and-example-sentences/
终于	zhōng yú	 chung ư	 zung1 jyu4	[{"meaning": "at last, finally, eventually", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e7%bb%88%e4%ba%8e-zhong-yu-translation-pronunciation-and-example-sentences/
周末	zhōu mò	 chuỗi mạt	 zau1 mut6	[{"meaning": "weekend", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%91%a8%e6%9c%ab-zhou-mo-translation-pronunciation-and-example-sentences/
丝绸	sī chóu	tơ tằm	si1 cuk1	[{"meaning": "silk, silk cloth", "part_of_speech": "noun"}]	\N
丝毫	sī háo	tơ hào	si1 hou4	[{"meaning": "the slightes amount or degree, very little", "part_of_speech": "adjective"}]	\N
祝	zhù	 chúc	 zuk1	[{"meaning": "to wish, to express good wishes", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%a5%9d-zhu-translation-pronunciation-and-example-sentences/
主要	zhǔ yào	 chủ yếu	 zyu2 jiu6	[{"meaning": "main, principal, major", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e4%b8%bb%e8%a6%81-zhu-yao-translation-pronunciation-and-example-sentences/
注意	zhù yì	 chú ý	 zyu3 zi6	[{"meaning": "to pay attention to", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%b3%a8%e6%84%8f-zhu-yi-translation-pronunciation-and-example-sentences/
字典	zì diǎn	 tự điển	 zi6 din2	[{"meaning": "dictionary, character book", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%ad%97%e5%85%b8-zi-dian-translation-pronunciation-and-example-sentences/
自己	zì jǐ	 tự kỷ	 zi6 gei2	[{"meaning": "oneself, self", "part_of_speech": "pronoun"}]	https://wohok.com/dict/%e8%87%aa%e5%b7%b1-zi-ji-translation-pronunciation-and-example-sentences/
总是	zǒng shì	 tông thị	 zung2 si6	[{"meaning": "always", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e6%80%bb%e6%98%af-zong-shi-translation-pronunciation-and-example-sentences/
最近	zuì jìn	 tối cận	 zeoi3 gan6	[{"meaning": "recently, lately, soon", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e6%9c%80%e8%bf%91-zui-jin-translation-pronunciation-and-example-sentences/
作业	zuò yè	 tác nghiệp	 zok3 jip6	[{"meaning": "homework, task, work", "part_of_speech": "noun"}]	https://wohok.com/dict/%e4%bd%9c%e4%b8%9a-zuo-ye-translation-pronunciation-and-example-sentences/
作用	zuò yòng	 tác dụng	 zok3 jung6	[{"meaning": "action, function, impact, effect", "part_of_speech": "noun"}, {"meaning": "to affect", "part_of_speech": "verb"}]	https://wohok.com/dict/%e4%bd%9c%e7%94%a8-zuo-yong-translation-pronunciation-and-example-sentences/
似乎	sì hū	thị hồ	ci5 fu1	[{"meaning": "apparently, it seems as if, seemingly", "part_of_speech": "adverb"}]	\N
思考	sī kǎo	tư tưởng	si1 haau2	[{"meaning": "to ponder over, to think over, to reflect upon", "part_of_speech": "verb"}]	\N
寺庙	sì miào	tự miếu	zi6 miu6	[{"meaning": "temple, monastery", "part_of_speech": "noun"}]	\N
私人	sī rén	tư nhân	si1 jan4	[{"meaning": "private (person)", "part_of_speech": "noun"}, {"meaning": "private", "part_of_speech": "adjective"}]	\N
思想	sī xiǎng	tư tưởng	si1 soeng2	[{"meaning": "idea, thought, thinking", "part_of_speech": "noun"}]	\N
宿舍	sù shè	túc xá	suk1 se2	[{"meaning": "dormitory", "part_of_speech": "noun"}]	\N
碎	suì	toái	seoi3	[{"meaning": "to break into pieces", "part_of_speech": "verb"}, {"meaning": "broken (into pieces)", "part_of_speech": "adjective"}]	\N
随时	suí shí	tuỳ thời	ceoi4 si4	[{"meaning": "at all time, at any time", "part_of_speech": "adverb"}]	\N
损失	sǔn shī	tổn thất	syun2 sat1	[{"meaning": "loss, damage", "part_of_speech": "noun"}, {"meaning": "to lose, to damage", "part_of_speech": "verb"}]	\N
所	suǒ	sở	so2	[{"meaning": "actually", "part_of_speech": "adverb"}, {"meaning": "for houses, buildings, institutions", "part_of_speech": "measure word"}]	\N
锁	suǒ	tục	so2	[{"meaning": "lock", "part_of_speech": "noun"}, {"meaning": "to lock up", "part_of_speech": "verb"}]	\N
缩短	suō duǎn	súc đoản	suk1 dyun2	[{"meaning": "to curtail, to cut down", "part_of_speech": "verb"}]	\N
所谓	suǒ wèi	sở vị	so2 wai6	[{"meaning": "so-called", "part_of_speech": "adverb"}]	\N
缩小	suō xiǎo	súc tiểu	suk1 siu2	[{"meaning": "to reduce, to shrink, to lessen", "part_of_speech": "verb"}]	\N
塔	tǎ	tháp	taap3	[{"meaning": "tower", "part_of_speech": "noun"}]	\N
太极拳	tài jí quán	thái cực quyền	taai3 gik6 kyun4	[{"meaning": "shadowboxing, Taiji", "part_of_speech": "noun"}]	\N
台阶	tái jiē	đài cấp	toi4 gaai2	[{"meaning": "stairs, step", "part_of_speech": "noun"}]	\N
太太	tài tai	thái thê	taai3 taai2	[{"meaning": "wife, Madame, Mrs.", "part_of_speech": "noun"}]	\N
谈判	tán pàn	đàm phán	taam4 pun3	[{"meaning": "negotiation, talks", "part_of_speech": "noun"}, {"meaning": "to negotiate", "part_of_speech": "verb"}]	\N
坦率	tǎn shuài	thản suất	taan2 syut6	[{"meaning": "frank, open, candid", "part_of_speech": "adjective"}]	\N
烫	tàng	thang	tong1	[{"meaning": "to burn, to iron", "part_of_speech": "verb"}, {"meaning": "hot (food, etc.)", "part_of_speech": "adjective"}]	\N
桃	táo	đào	tou4	[{"meaning": "peach", "part_of_speech": "noun"}]	\N
逃	táo	trảo	tou4	[{"meaning": "to escape, to run away, to flee", "part_of_speech": "verb"}]	\N
套	tào	đạo	tou3	[{"meaning": "cover", "part_of_speech": "noun"}, {"meaning": "to cover with", "part_of_speech": "verb"}, {"meaning": "for sets of things", "part_of_speech": "measure word"}]	\N
逃避	táo bì	trảo tì	tou4 bei6	[{"meaning": "to escape, to avoid, to shirk", "part_of_speech": "verb"}]	\N
特殊	tè shū	đặc thù	dak6 syu4	[{"meaning": "special, unusual", "part_of_speech": "adjective"}]	\N
特意	tè yì	đặc ý	dak6 ji3	[{"meaning": "specially, expressly", "part_of_speech": "adverb"}]	\N
特征	tè zhēng	đặc trưng	dak6 zing1	[{"meaning": "distinctive feature, characteristic", "part_of_speech": "noun"}]	\N
疼爱	téng ài	đằng ái	tang4 oi3	[{"meaning": "to love dearly", "part_of_speech": "verb"}]	\N
提	tí	đề	tai4	[{"meaning": "to carry, to raise", "part_of_speech": "verb"}]	\N
提倡	tí chàng	đề xương	tai4 coeng3	[{"meaning": "to promote, to advocate", "part_of_speech": "verb"}]	\N
提纲	tí gāng	đề cương	tai4 gong1	[{"meaning": "key points, outline", "part_of_speech": "noun"}]	\N
体会	tǐ huì	thể hội	tai2 wui6	[{"meaning": "to know (through experience), to experience", "part_of_speech": "verb"}]	\N
体积	tǐ jī	thể tích	tai2 zik1	[{"meaning": "volume", "part_of_speech": "noun"}]	\N
题目	tí mù	đề mục	tai4 muk6	[{"meaning": "topic, title", "part_of_speech": "noun"}]	\N
体贴	tǐ tiē	thể thiết	tai2 tip3	[{"meaning": "considerate", "part_of_speech": "adjective"}]	\N
提问	tí wèn	đề vấn	tai4 man6	[{"meaning": "to raise a question", "part_of_speech": "verb"}]	\N
体现	tǐ xiàn	thể hiện	tai2 yin6	[{"meaning": "to embody, to incarnate", "part_of_speech": "verb"}]	\N
体验	tǐ yàn	thể nghiệm	tai2 jim6	[{"meaning": "to experience (for oneself)", "part_of_speech": "verb"}]	\N
天空	tiān kōng	thiên không	tin1 hung1	[{"meaning": "sky", "part_of_speech": "noun"}]	\N
田野	tián yě	điền dã	tin4 je5	[{"meaning": "field, open land", "part_of_speech": "noun"}]	\N
天真	tiān zhēn	thiên chân	tin1 zan1	[{"meaning": "naive, innocent", "part_of_speech": "adjective"}]	\N
调皮	tiáo pí	điều bí	tiu4 pei4	[{"meaning": "naughty, tricky", "part_of_speech": "adjective"}]	\N
挑战	tiǎo zhàn	điều tranh	tiu1 zin3	[{"meaning": "challange", "part_of_speech": "noun"}]	\N
调整	tiáo zhěng	điều chỉnh	tiu4 zing2	[{"meaning": "adjustment", "part_of_speech": "noun"}, {"meaning": "to adjust, to revise", "part_of_speech": "verb"}]	\N
铜	tóng	đồng	tung4	[{"meaning": "copper", "part_of_speech": "noun"}]	\N
通常	tōng cháng	thông thường	tung1 soeng4	[{"meaning": "regular, usually, normally", "part_of_speech": "adverb"}]	\N
痛苦	tòng kǔ	đau khổ	tung3 fu2	[{"meaning": "pain, suffering", "part_of_speech": "noun"}, {"meaning": "painful", "part_of_speech": "adjective"}]	\N
痛快	tòng kuài	thông khoái	tung3 faai3	[{"meaning": "delighted, very happy", "part_of_speech": "adjective"}]	\N
同时	tóng shí	thồng thời	tung4 si4	[{"meaning": "at the same time, simultaneously", "part_of_speech": "time"}]	\N
通讯	tōng xùn	thông tín	tung1 seon3	[{"meaning": "communication, news report", "part_of_speech": "noun"}]	\N
统一	tǒng yī	đồng nhất	tung2 jat1	[{"meaning": "to unify, to unite, to integrate", "part_of_speech": "verb"}]	\N
统治	tǒng zhì	thống trị	tung2 zi6	[{"meaning": "regime, government", "part_of_speech": "noun"}, {"meaning": "to rule, to govern", "part_of_speech": "verb"}]	\N
透明	tòu míng	thấu minh	tau3 ming4	[{"meaning": "transparent", "part_of_speech": "adjective"}]	\N
投资	tóu zī	đầu tư	tau4 zi1	[{"meaning": "investment", "part_of_speech": "noun"}, {"meaning": "to invest", "part_of_speech": "verb"}]	\N
吐	tù	thổ	tou3	[{"meaning": "to vomit", "part_of_speech": "verb"}]	\N
突出	tū chū	đột xuất	dat6 ceot1	[{"meaning": "outstanding", "part_of_speech": "adjective"}]	\N
土地	tǔ dì	thổ địa	tou2 dei6	[{"meaning": "land, soil, territory", "part_of_speech": "noun"}]	\N
土豆	tǔ dòu	thổ đậu	tou2 dau6	[{"meaning": "potato", "part_of_speech": "noun"}]	\N
兔子	tù zi	thố tử	tou3 zi2	[{"meaning": "rabbit", "part_of_speech": "noun"}]	\N
团	tuán	đoàn	tyun4	[{"meaning": "group, regiment", "part_of_speech": "noun"}, {"meaning": "for ball-like things", "part_of_speech": "measure word"}]	\N
退	tuì	thoái	teoi3	[{"meaning": "to return, to decline, to withdraw", "part_of_speech": "verb"}]	\N
退步	tuì bù	thoái bộ	teoi3 bou6	[{"meaning": "regression", "part_of_speech": "noun"}, {"meaning": "to regress, to fall behind, to go backward", "part_of_speech": "verb"}]	\N
推辞	tuī cí	thôi từ	teoi1 ci4	[{"meaning": "to decline, to turn down", "part_of_speech": "verb"}]	\N
推广	tuī guǎng	thôi quảng	teoi1 gwong2	[{"meaning": "to spread, to popularize", "part_of_speech": "verb"}]	\N
推荐	tuī jiàn	thôi tiến	teoi1 tin2	[{"meaning": "recommendation", "part_of_speech": "noun"}, {"meaning": "to recommend", "part_of_speech": "verb"}]	\N
退休	tuì xiū	thôi hưu	teoi3 jau1	[{"meaning": "retirement", "part_of_speech": "noun"}, {"meaning": "to retire", "part_of_speech": "verb"}]	\N
歪	wāi	ngoẽo	waai1	[{"meaning": "crooked, devious", "part_of_speech": "adjective"}]	\N
外交	wài jiāo	ngoại giao	ngoi6 gaau1	[{"meaning": "diplomacy, foreign affairs", "part_of_speech": "noun"}]	\N
弯	wān	oản	waan1	[{"meaning": "a curve", "part_of_speech": "noun"}, {"meaning": "to bend, to curve", "part_of_speech": "verb"}, {"meaning": "bent, curved", "part_of_speech": "adjective"}]	\N
公交车	gōng jiāo chē	công giao xa	gung1 gaau1 ce1	[{"meaning": "bus", "part_of_speech": "noun"}]	\N
危害	wēi hài	nguy hại	wai4 hoi6	[{"meaning": "endangerment", "part_of_speech": "noun"}, {"meaning": "to endanger, to harm", "part_of_speech": "verb"}]	\N
围巾	wéi jīn	vi cân	wai4 gan1	[{"meaning": "scarf", "part_of_speech": "noun"}]	\N
未来	wèi lái	vị lai	mei6 lai4	[{"meaning": "future", "part_of_speech": "noun"}]	\N
委屈	wěi qu	ủy khúc	wai2 wat1	[{"meaning": "to feel wronged", "part_of_speech": "verb"}]	\N
围绕	wéi rào	vị nhiên	wai4 yiu5	[{"meaning": "to revolve around, to surround", "part_of_speech": "verb"}]	\N
卫生间	wèi shēng jiān	vệ sinh gian	wai6 sang1 gaan1	[{"meaning": "bathroom, WC", "part_of_speech": "noun"}]	\N
委托	wěi tuō	ủy trọng	wai2 tok3	[{"meaning": "to entrust, to commission, to consign", "part_of_speech": "verb"}]	\N
微笑	wēi xiào	vi tiếu	mei4 siu6	[{"meaning": "smile", "part_of_speech": "noun"}, {"meaning": "to smile", "part_of_speech": "verb"}]	\N
威胁	wēi xié	uy hiếp	wai1 hip3	[{"meaning": "threat, menace", "part_of_speech": "noun"}, {"meaning": "to threaten, to menace", "part_of_speech": "verb"}]	\N
唯一	wéi yī	duy nhất	wai4 jat1	[{"meaning": "only, sole", "part_of_speech": "adverb"}]	\N
位置	wèi zhì	vị trí	wai6 zi6	[{"meaning": "position, place", "part_of_speech": "noun"}]	\N
闻	wén	văn	man4	[{"meaning": "to hear, to smell", "part_of_speech": "verb"}]	\N
吻	wěn	vấn	man5	[{"meaning": "kiss", "part_of_speech": "noun"}, {"meaning": "to kiss", "part_of_speech": "verb"}]	\N
稳定	wěn dìng	ốn định	wan2 ding6	[{"meaning": "stability", "part_of_speech": "noun"}, {"meaning": "to stabalize", "part_of_speech": "verb"}, {"meaning": "steady, stable", "part_of_speech": "adjective"}]	\N
问候	wèn hòu	vấn hỏi	man6 hou6	[{"meaning": "to send a greeting", "part_of_speech": "verb"}]	\N
文件	wén jiàn	văn phẩm	man4 fan3	[{"meaning": "document, file", "part_of_speech": "noun"}]	\N
文具	wén jù	văn cụ	man4 geoi6	[{"meaning": "stationery, writing materials", "part_of_speech": "noun"}]	\N
文明	wén míng	văn minh	man4 ming4	[{"meaning": "civilization, culture", "part_of_speech": "noun"}, {"meaning": "civilized", "part_of_speech": "adjective"}]	\N
温暖	wēn nuǎn	ôn noãn	wan1 lyun5	[{"meaning": "warm", "part_of_speech": "adjective"}]	\N
温柔	wēn róu	ôn nhẹn	wan1 jau4	[{"meaning": "gentle, soft, tender", "part_of_speech": "adjective"}]	\N
文学	wén xué	văn học	man4 hok6	[{"meaning": "literature", "part_of_speech": "noun"}]	\N
卧室	wò shì	ốt thất	ngoh6 sat1	[{"meaning": "bedroom", "part_of_speech": "noun"}]	\N
雾	wù	ngạc	mou6	[{"meaning": "fog", "part_of_speech": "noun"}]	\N
物理	wù lǐ	vật lý	mat6 lei4	[{"meaning": "physics", "part_of_speech": "noun"}]	\N
无奈	wú nài	vô nại	mou4 noi6	[{"meaning": "to have no choice", "part_of_speech": "verb"}]	\N
武器	wǔ qì	vũ khí	mou5 hei3	[{"meaning": "weapon, arms", "part_of_speech": "noun"}]	\N
无数	wú shù	vô số	mou4 sou3	[{"meaning": "countless, innumerable", "part_of_speech": "adjective"}]	\N
武术	wǔ shù	vũ thuật	mou5 seot6	[{"meaning": "martial arts", "part_of_speech": "noun"}]	\N
物质	wù zhì	vật chất	mat6 zat1	[{"meaning": "matter, substance, material", "part_of_speech": "noun"}]	\N
屋子	wū zi	ốc tử	uk1 zi2	[{"meaning": "room, house", "part_of_speech": "noun"}]	\N
系	xì	hệ	hai6	[{"meaning": "system, department", "part_of_speech": "noun"}]	\N
细节	xì jié	tế tiết	sai3 zit3	[{"meaning": "detail, particulars", "part_of_speech": "noun"}]	\N
戏剧	xì jù	hí kịch	hei3 guk6	[{"meaning": "drama, play, theater", "part_of_speech": "noun"}]	\N
吸收	xī shōu	hấp thụ	kap1 sau1	[{"meaning": "to absorb, to soak up, to assimilate", "part_of_speech": "verb"}]	\N
系统	xì tǒng	hệ thống	hai6 tung4	[{"meaning": "system", "part_of_speech": "noun"}]	\N
反而	fǎn ér	phản nhi	faan2 ji4	[{"meaning": "instead, on the contrary", "part_of_speech": "adverb"}]	\N
反复	fǎn fù	phản phó	faan2 fu6	[{"meaning": "repeatedly", "part_of_speech": "adverb"}]	\N
繁荣	fán róng	phồn nhãn	faan4 wing4	[{"meaning": "flourishing, prosperous, booming", "part_of_speech": "adjective"}]	\N
凡是	fán shì	phàm thị	faan4 si6	[{"meaning": "every, any, all", "part_of_speech": "adverb"}]	\N
反应	fǎn yìng	phản ứng	faan2 jing3	[{"meaning": "reaction, response", "part_of_speech": "noun"}, {"meaning": "to react, to respond", "part_of_speech": "verb"}]	\N
反正	fǎn zhèng	phản chính	faan2 zing3	[{"meaning": "anyway, whatever happens", "part_of_speech": "adverb"}]	\N
方	fāng	phương	fong1	[{"meaning": "square, direction, side", "part_of_speech": "noun"}, {"meaning": "for square things", "part_of_speech": "measure word"}]	\N
妨碍	fáng ài	phương ai	fong1 ngai6	[{"meaning": "to hinder, to obstruct", "part_of_speech": "verb"}]	\N
方案	fāng àn	phương án	fong1 on3	[{"meaning": "plan, program, scheme", "part_of_speech": "noun"}]	\N
房东	fáng dōng	phòng đông	fong4 dung1	[{"meaning": "landlord", "part_of_speech": "noun"}]	\N
仿佛	fǎng fú	phảng phật	fong2 fat6	[{"meaning": "to seem as if", "part_of_speech": "adverb"}]	\N
方式	fāng shì	phương thức	fong1 sik1	[{"meaning": "way, pattern, manner", "part_of_speech": "noun"}]	\N
放松	fàng sōng	phóng song	fong3 sung1	[{"meaning": "to relax, to loosen", "part_of_speech": "verb"}]	\N
肺	fèi	phế	fai3	[{"meaning": "lung", "part_of_speech": "noun"}]	\N
非	fēi	phi	fei1	[{"meaning": "wrong, mistaken", "part_of_speech": "adjective"}, {"meaning": "not, non-, un-", "part_of_speech": "adverb"}]	\N
废话	fèi huà	phế thoại	fai3 waa6	[{"meaning": "nonsense, useless statement", "part_of_speech": "expression"}]	\N
费用	fèi yong	phí dụng	fai3 jung6	[{"meaning": "expenses, cost", "part_of_speech": "noun"}]	\N
肥皂	féi zào	phì tảo	fei4 zou6	[{"meaning": "soap", "part_of_speech": "noun"}]	\N
吓	xià	giả	haa3	[{"meaning": "to frighten, to scare", "part_of_speech": "verb"}]	\N
瞎	xiā	hạ	hat6	[{"meaning": "blind", "part_of_speech": "adjective"}, {"meaning": "groundlessly, foolishly, aimlessly", "part_of_speech": "adverb"}]	\N
下载	xià zài	tải hạ	haai6 zai3	[{"meaning": "to download", "part_of_speech": "verb"}]	\N
县	xiàn	huyện	yun6	[{"meaning": "county", "part_of_speech": "noun"}]	\N
显得	xiǎn de	hiển đắc	hin2 dak1	[{"meaning": "to seem, to look, to appear", "part_of_speech": "verb"}]	\N
现金	xiàn jīn	hiện kim	yin6 gam1	[{"meaning": "cash", "part_of_speech": "noun"}]	\N
显然	xiǎn rán	hiển nhiên	hin2 jin4	[{"meaning": "clear, evident", "part_of_speech": "adjective"}]	\N
现实	xiàn shí	hiện thực	yin6 sat6	[{"meaning": "reality, actuality", "part_of_speech": "noun"}, {"meaning": "real, actual", "part_of_speech": "adjective"}]	\N
显示	xiǎn shì	hiển thị	yin6 si6	[{"meaning": "Display", "part_of_speech": "noun"}, {"meaning": "to show, to display, to demonstrate", "part_of_speech": "verb"}]	\N
现象	xiàn xiàng	hiện tượng	yin6 seung6	[{"meaning": "appearance, phenomenon", "part_of_speech": "noun"}]	\N
鲜艳	xiān yàn	tân nham	sin1 jin6	[{"meaning": "bright-coloured, colourful", "part_of_speech": "adjective"}]	\N
项	xiàng	hạng	hong6	[{"meaning": "neck, point, item", "part_of_speech": "noun"}, {"meaning": "for tasks, events, etc.", "part_of_speech": "measure word"}]	\N
相处	xiāng chǔ	tương xứng	song1 coeng2	[{"meaning": "to get along with each other", "part_of_speech": "verb"}]	\N
相当	xiāng dāng	tương đương	song1 dong1	[{"meaning": "be quivalent to", "part_of_speech": "verb"}, {"meaning": "apropriate", "part_of_speech": "adjective"}, {"meaning": "quite, rather, fairly", "part_of_speech": "adverb"}]	\N
相对	xiāng duì	tương đối	song1 deoi3	[{"meaning": "to face each other", "part_of_speech": "verb"}, {"meaning": "relatively, comperatively", "part_of_speech": "adverb"}]	\N
相关	xiāng guān	tương quan	song1 goi1	[{"meaning": "correlation, dependence", "part_of_speech": "noun"}, {"meaning": "to be interrelated", "part_of_speech": "verb"}]	\N
项链	xiàng liàn	hạng liên	hong6 lin4	[{"meaning": "necklace", "part_of_speech": "noun"}]	\N
项目	xiàng mù	hạng mục	hong6 mak6	[{"meaning": "item, project, sports event", "part_of_speech": "noun"}]	\N
想念	xiǎng niàn	tưởng niệm	song2 nim6	[{"meaning": "to miss, to remember with longing", "part_of_speech": "verb"}]	\N
橡皮	xiàng pí	sương bì	zoeng6 pei4	[{"meaning": "rubber, eraser", "part_of_speech": "noun"}]	\N
象棋	xiàng qí	tượng kỳ	zoeng6 kei4	[{"meaning": "Chinese chess", "part_of_speech": "noun"}]	\N
根本	gēn běn	căn bản	gan1 bun2	[{"meaning": "foundation, root", "part_of_speech": "noun"}, {"meaning": "fundamental, simply, basic", "part_of_speech": "adjective"}]	\N
更加	gèng jiā	cánh gia	gang3 gaa1	[{"meaning": "more, even more", "part_of_speech": "adverb"}]	\N
公布	gōng bù	công bố	gung1 bou3	[{"meaning": "to announce, to make public", "part_of_speech": "verb"}]	\N
工厂	gōng chǎng	công xưởng	gung1 coeng4	[{"meaning": "factory", "part_of_speech": "noun"}]	\N
工程师	gōng chéng shī	công trình sư	gung1 cing4 si1	[{"meaning": "engineer", "part_of_speech": "noun"}]	\N
功夫	gōng fu	công phu	gung1 fu1	[{"meaning": "time, skill, labor, workmanship, kung fu", "part_of_speech": "noun"}]	\N
公开	gōng kāi	công khai	gung1 hoi1	[{"meaning": "to publish, to make public", "part_of_speech": "verb"}, {"meaning": "public", "part_of_speech": "adjective"}]	\N
功能	gōng néng	công năng	gung1 nang4	[{"meaning": "function, feature", "part_of_speech": "noun"}]	\N
公平	gōng píng	công bằng	gung1 ping4	[{"meaning": "fair, impartial", "part_of_speech": "adjective"}]	\N
工人	gōng rén	công nhân	gung1 jan4	[{"meaning": "worker", "part_of_speech": "noun"}]	\N
贡献	gòng xiàn	cống hiến	gung6 hin3	[{"meaning": "contribution", "part_of_speech": "noun"}, {"meaning": "to contribute, to dedicate", "part_of_speech": "verb"}]	\N
工业	gōng yè	công nghiệp	gung1 jip6	[{"meaning": "industry", "part_of_speech": "noun"}]	\N
公寓	gōng yù	công ốc	gung1 juk6	[{"meaning": "block of flats", "part_of_speech": "noun"}]	\N
公元	gōng yuán	công nguyên	gung1 jyun4	[{"meaning": "Christian era", "part_of_speech": "noun"}]	\N
公主	gōng zhǔ	công chúa	gung1 zyu2	[{"meaning": "princess", "part_of_speech": "noun"}]	\N
构成	gòu chéng	cấu thành	kau3 sing4	[{"meaning": "to compose, to constitute, to configure (IT)", "part_of_speech": "verb"}]	\N
沟通	gōu tōng	câu thông	gau1 tung1	[{"meaning": "to communicate", "part_of_speech": "verb"}]	\N
古代	gǔ dài	cổ đại	goo2 doi6	[{"meaning": "ancient times", "part_of_speech": "time"}]	\N
古典	gǔ diǎn	cổ điển	goo2 din6	[{"meaning": "classical", "part_of_speech": "adjective"}]	\N
固定	gù dìng	cố định	gu3 ding6	[{"meaning": "to fasten, to fix", "part_of_speech": "verb"}, {"meaning": "fixed, set, regular", "part_of_speech": "adjective"}]	\N
姑姑	gū gu	cô	cou1 gu1	[{"meaning": "aunt (paternal)", "part_of_speech": "noun"}]	\N
古老	gǔ lǎo	cổ lão	goo2 lou5	[{"meaning": "ancient, age-old", "part_of_speech": "adjective"}]	\N
姑娘	gū niang	cô gái	gu1 noeng4	[{"meaning": "girl, young woman, daughter", "part_of_speech": "noun"}]	\N
股票	gǔ piào	cổ phiếu	gu2 piu3	[{"meaning": "share, stock", "part_of_speech": "noun"}]	\N
固体	gù tǐ	cố thể	gu3 tai2	[{"meaning": "solid (body)", "part_of_speech": "noun"}]	\N
骨头	gǔ tou	cốt đầu	guk1 tau4	[{"meaning": "bone, strong character", "part_of_speech": "noun"}]	\N
鼓舞	gǔ wǔ	cổ vũ	gu2 mou5	[{"meaning": "encouragement", "part_of_speech": "noun"}, {"meaning": "to inspire, to animate", "part_of_speech": "verb"}]	\N
享受	xiǎng shòu	hưởng thụ	hoeng2 sau6	[{"meaning": "enjoyment, pleasure", "part_of_speech": "noun"}, {"meaning": "to enjoy", "part_of_speech": "verb"}]	\N
相似	xiāng sì	tương tự	song1 ci5	[{"meaning": "to resemble, to be similar to", "part_of_speech": "verb"}]	\N
想象	xiǎng xiàng	tưởng tượng	song2 zoeng6	[{"meaning": "imagination", "part_of_speech": "noun"}, {"meaning": "to imagine, to visualize", "part_of_speech": "verb"}]	\N
象征	xiàng zhēng	tượng chứng	zoeng6 zing1	[{"meaning": "symbol", "part_of_speech": "noun"}, {"meaning": "to symbolize, to stand for", "part_of_speech": "verb"}]	\N
小吃	xiǎo chī	tiểu xích	síu2 sik6	[{"meaning": "snack, refreshments", "part_of_speech": "noun"}]	\N
消费	xiāo fèi	tiêu phí	siu1 fai3	[{"meaning": "consumption", "part_of_speech": "noun"}, {"meaning": "to consume", "part_of_speech": "verb"}]	\N
消化	xiāo huà	tiêu hóa	siu1 faa3	[{"meaning": "digestion", "part_of_speech": "noun"}, {"meaning": "to digest", "part_of_speech": "verb"}]	\N
小伙子	xiǎo huǒ zi	tiểu huynh tử	síu2 wui2 zi2	[{"meaning": "young fellow", "part_of_speech": "noun"}]	\N
效率	xiào lǜ	hiệu lực	haau6 lik6	[{"meaning": "efficiency", "part_of_speech": "noun"}]	\N
小麦	xiǎo mài	tiểu mạch	síu2 mak6	[{"meaning": "wheat", "part_of_speech": "noun"}]	\N
消灭	xiāo miè	tiêu diệt	siu1 mit6	[{"meaning": "annihilation", "part_of_speech": "noun"}, {"meaning": "to eliminate, to perish", "part_of_speech": "verb"}]	\N
小气	xiǎo qi	tiểu khí	síu2 hei3	[{"meaning": "stingy, petty, miserly", "part_of_speech": "adjective"}]	\N
消失	xiāo shī	tiêu thất	siu1 sat1	[{"meaning": "to disappear, to fade away", "part_of_speech": "verb"}]	\N
销售	xiāo shòu	tiêu sản	siu1 sau2	[{"meaning": "sales", "part_of_speech": "noun"}, {"meaning": "to sell", "part_of_speech": "verb"}]	\N
孝顺	xiào shun	hiếu thuận	haau6 seon6	[{"meaning": "to be obedient to one’s parents", "part_of_speech": "verb"}]	\N
小偷	xiǎo tōu	tiểu đạo	síu2 tau1	[{"meaning": "thief", "part_of_speech": "noun"}]	\N
斜	xié	tà	ce1	[{"meaning": "inclined, slanting, oblique", "part_of_speech": "adjective"}]	\N
歇	xiē	hiệt	hiet3	[{"meaning": "to rest", "part_of_speech": "verb"}]	\N
协调	xié tiáo	hiệp điều	hip3 tiu4	[{"meaning": "to coordinate, to harmonize", "part_of_speech": "verb"}]	\N
信封	xìn fēng	tín phong	seon3 fung1	[{"meaning": "envelope", "part_of_speech": "noun"}]	\N
信号	xìn hào	tín hiệu	seon3 hou6	[{"meaning": "signal", "part_of_speech": "noun"}]	\N
心理	xīn lǐ	tâm lí	sam1 lei5	[{"meaning": "psychology, mentality", "part_of_speech": "noun"}, {"meaning": "psychological, menatl", "part_of_speech": "adjective"}]	\N
欣赏	xīn shǎng	tân thưởng	yan1 soeng6	[{"meaning": "to enjoy, to appreciate", "part_of_speech": "verb"}]	\N
信息	xìn xī	tín hiệu	seon3 si6	[{"meaning": "information, news", "part_of_speech": "noun"}]	\N
心脏	xīn zàng	tâm trạng	sam1 zong6	[{"meaning": "heart", "part_of_speech": "noun"}]	\N
形成	xíng chéng	hình thành	ying4 sing4	[{"meaning": "to form, to take shape", "part_of_speech": "verb"}]	\N
行动	xíng dòng	hành động	hang4 dung6	[{"meaning": "action, operation", "part_of_speech": "noun"}, {"meaning": "to move, to act", "part_of_speech": "verb"}]	\N
幸亏	xìng kuī	hạnh khuy	haang6 fui1	[{"meaning": "furtunately, luckily", "part_of_speech": "adverb"}]	\N
行人	xíng rén	hành nhân	hang4 jan4	[{"meaning": "pedestrian", "part_of_speech": "noun"}]	\N
形容	xíng róng	hình dung	ying4 jung4	[{"meaning": "description", "part_of_speech": "noun"}, {"meaning": "to describe", "part_of_speech": "verb"}]	\N
形势	xíng shì	hình thế	ying4 si6	[{"meaning": "situation, circumstances, terrain", "part_of_speech": "noun"}]	\N
形式	xíng shì	hình thức	ying4 sik1	[{"meaning": "form, shape", "part_of_speech": "noun"}]	\N
行为	xíng wéi	hành vi	hang4 wai4	[{"meaning": "action, conduct, behaviour, activity", "part_of_speech": "noun"}]	\N
形象	xíng xiàng	hình ảnh	ying4 zoeng6	[{"meaning": "image, appearance, figure", "part_of_speech": "noun"}]	\N
幸运	xìng yùn	hạnh phúc	haang6 wan6	[{"meaning": "luck, fortune", "part_of_speech": "noun"}, {"meaning": "lucky, fortunate", "part_of_speech": "adjective"}]	\N
性质	xìng zhì	tính chất	sing3 cat1	[{"meaning": "nature, character", "part_of_speech": "noun"}]	\N
形状	xíng zhuàng	hình dạng	ying4 jong6	[{"meaning": "form, shape", "part_of_speech": "noun"}]	\N
胸	xiōng	hồng	hung1	[{"meaning": "chest", "part_of_speech": "noun"}]	\N
兄弟	xiōng dì	huynh đệ	hung1 dai6	[{"meaning": "brothers", "part_of_speech": "noun"}]	\N
雄伟	xióng wěi	hùng vĩ	hung4 wai5	[{"meaning": "grand, magnificent", "part_of_speech": "adjective"}]	\N
修改	xiū gǎi	sửa chữa	sau1 sai2	[{"meaning": "modification", "part_of_speech": "noun"}, {"meaning": "to modify, to amend, to revise", "part_of_speech": "verb"}]	\N
休闲	xiū xián	huỳnh nhàn	heoi1 haan4	[{"meaning": "leisure", "part_of_speech": "noun"}]	\N
叙述	xù shù	tử thước	zeoi6 seot6	[{"meaning": "narration", "part_of_speech": "noun"}, {"meaning": "to tell, to relate", "part_of_speech": "verb"}]	\N
虚心	xū xīn	hư tâm	heoi1 sam1	[{"meaning": "modest", "part_of_speech": "adjective"}]	\N
宣布	xuān bù	tuyên bố	syun1 bou6	[{"meaning": "to declare, to announce", "part_of_speech": "verb"}]	\N
宣传	xuān chuán	tuyên truyền	syun1 cyun4	[{"meaning": "propaganda", "part_of_speech": "noun"}, {"meaning": "to propagte, to disseminate", "part_of_speech": "verb"}]	\N
选举	xuǎn jǔ	tuyển cử	syun2 zeoi2	[{"meaning": "election", "part_of_speech": "noun"}, {"meaning": "to elect", "part_of_speech": "verb"}]	\N
学期	xué qī	học kỳ	hok6 kei4	[{"meaning": "term, semester", "part_of_speech": "noun"}]	\N
学术	xué shù	học thuật	hok6 seot6	[{"meaning": "learning, science", "part_of_speech": "noun"}]	\N
学问	xué wen	học vấn	hok6 man6	[{"meaning": "knowledge", "part_of_speech": "noun"}]	\N
训练	xùn liàn	huấn luyện	zeon6 lyun6	[{"meaning": "training", "part_of_speech": "noun"}, {"meaning": "to train, to drill", "part_of_speech": "verb"}]	\N
迅速	xùn sù	tốc độ	seon3 cok3	[{"meaning": "rapid, speedy, quick", "part_of_speech": "adjective"}]	\N
询问	xún wèn	tần vấn	seon2 man6	[{"meaning": "to inquire", "part_of_speech": "verb"}]	\N
寻找	xún zhǎo	tần tảo	seon2 zaau2	[{"meaning": "to seek, to look for", "part_of_speech": "verb"}]	\N
延长	yán cháng	diên trường	jin4 coeng4	[{"meaning": "to prolong, to extend", "part_of_speech": "verb"}]	\N
宴会	yàn huì	yến hội	jin3 wui2	[{"meaning": "banquet, feast", "part_of_speech": "noun"}]	\N
严肃	yán sù	nghiêm túc	jim4 suk1	[{"meaning": "solemn, serious", "part_of_speech": "adjective"}]	\N
痒	yǎng	dương	jeung5	[{"meaning": "to itch, to tickle", "part_of_speech": "verb"}]	\N
样式	yàng shì	dạng	jeung6 sik1	[{"meaning": "type, style, pattern", "part_of_speech": "noun"}]	\N
阳台	yáng tái	dương đài	joeng4 toi4	[{"meaning": "balcony", "part_of_speech": "noun"}]	\N
摇	yáo	dạo	jiu1	[{"meaning": "to shake, to sway", "part_of_speech": "verb"}]	\N
腰	yāo	dây yếm	jiu1	[{"meaning": "waist, lower back", "part_of_speech": "noun"}]	\N
要不	yào bù	nhất bất	jiu3 bat1	[{"meaning": "otherwise", "part_of_speech": "conjunction"}]	\N
要是	yào shi	nhất thị	jiu3 si6	[{"meaning": "if, in case", "part_of_speech": "conjunction"}]	\N
夜	yè	dạ	je6	[{"meaning": "night", "part_of_speech": "noun"}]	\N
液体	yè tǐ	dịch thể	jik6 tai2	[{"meaning": "liquid", "part_of_speech": "noun"}]	\N
业务	yè wù	nghiệp vụ	jip6 mou6	[{"meaning": "business, professional work", "part_of_speech": "noun"}]	\N
业余	yè yú	nghiệp dư	jip6 jyu4	[{"meaning": "spare time", "part_of_speech": "noun"}, {"meaning": "amateur", "part_of_speech": "adjective"}]	\N
乙	yǐ	dịch	jat1	[{"meaning": "second(ly)", "part_of_speech": "number"}]	\N
一辈子	yí bèi zi	nhất bối tử	jat1 bui6 zi2	[{"meaning": "a lifetime", "part_of_speech": "noun"}]	\N
一旦	yí dàn	nhất đán	jat1 daan6	[{"meaning": "in one day", "part_of_speech": "time"}, {"meaning": "in case, if, once", "part_of_speech": "conjunction"}]	\N
移动	yí dòng	di động	ji4 dung6	[{"meaning": "movement", "part_of_speech": "noun"}, {"meaning": "to move, to shift", "part_of_speech": "verb"}, {"meaning": "mobile, portable", "part_of_speech": "adjective"}]	\N
遗憾	yí hàn	di hối	ji4 hon6	[{"meaning": "to regret", "part_of_speech": "verb"}, {"meaning": "regrettable", "part_of_speech": "adjective"}]	\N
以及	yǐ jí	dĩ cập	ji5 kap6	[{"meaning": "as well as", "part_of_speech": "conjunction"}]	\N
以来	yǐ lái	dĩ lai	ji5 loi4	[{"meaning": "since", "part_of_speech": "adverb"}]	\N
一路平安	yí lù píng ān	nhất lộ bình an	jat1 lou6 ping4 on1	[{"meaning": "have a save trip!", "part_of_speech": "expression"}]	\N
议论	yì lùn	nghị luận	ji5 leon6	[{"meaning": "discussion", "part_of_speech": "noun"}, {"meaning": "to discuss, to comment on", "part_of_speech": "verb"}]	\N
移民	yí mín	di dân	ji4 man4	[{"meaning": "immigrant", "part_of_speech": "noun"}, {"meaning": "to immigrate, to migrate", "part_of_speech": "verb"}]	\N
依然	yī rán	nhĩ nhiên	ji1 jin4	[{"meaning": "still, as before", "part_of_speech": "adverb"}]	\N
意外	yì wài	dĩ ngoại	ji3 ngoi6	[{"meaning": "accident", "part_of_speech": "noun"}, {"meaning": "unexpected, accidental", "part_of_speech": "adjective"}]	\N
疑问	yí wèn	nghi vấn	ji4 man6	[{"meaning": "question, doubt", "part_of_speech": "noun"}]	\N
义务	yì wù	nghĩa vụ	ji6 mou6	[{"meaning": "duty, obligation", "part_of_speech": "noun"}, {"meaning": "voluntary", "part_of_speech": "adjective"}]	\N
意义	yì yì	dĩ nghĩa	ji3 ji6	[{"meaning": "meaning, sense, significance", "part_of_speech": "noun"}]	\N
一致	yí zhì	nhất trí	jat1 zi3	[{"meaning": "agreement", "part_of_speech": "noun"}, {"meaning": "identical, unanimous (views, etc.)", "part_of_speech": "adjective"}]	\N
银	yín	ngân	ngan4	[{"meaning": "silver", "part_of_speech": "noun"}, {"meaning": "silver (colour)", "part_of_speech": "adjective"}]	\N
因而	yīn ér	nhân nhi	wan4 ji4	[{"meaning": "thus, as a result", "part_of_speech": "conjunction"}]	\N
因素	yīn sù	nhân tố	wan4 sou3	[{"meaning": "element, factor", "part_of_speech": "noun"}]	\N
硬币	yìng bì	ngạnh bỉ	ngaang6 bai6	[{"meaning": "coin", "part_of_speech": "noun"}]	\N
应付	yìng fu	ứng phó	jing1 fu6	[{"meaning": "to deal with, to cope with", "part_of_speech": "verb"}]	\N
硬件	yìng jiàn	ngạnh kiện	ngaang6 gin6	[{"meaning": "hardware", "part_of_speech": "noun"}]	\N
迎接	yíng jiē	nhân tiếp	ying4 zip3	[{"meaning": "to greet, to welcome, to meet", "part_of_speech": "verb"}]	\N
英俊	yīng jùn	anh tuấn	ying1 zeon3	[{"meaning": "handsome and smart", "part_of_speech": "adjective"}]	\N
应聘	yìng pìn	ứng tuyển	jing1 pin3	[{"meaning": "to apply for a job", "part_of_speech": "verb"}]	\N
英雄	yīng xióng	anh hùng	ying1 hung4	[{"meaning": "hero", "part_of_speech": "noun"}]	\N
营养	yíng yǎng	dinh dưỡng	jing4 joeng4	[{"meaning": "nutrition, nourishment", "part_of_speech": "noun"}]	\N
营业	yíng yè	dinh dịch	jing4 jip6	[{"meaning": "to do business, to trade", "part_of_speech": "verb"}]	\N
应用	yìng yòng	ứng dụng	jing1 jung6	[{"meaning": "application", "part_of_speech": "noun"}, {"meaning": "to apply, to use", "part_of_speech": "verb"}]	\N
影子	yǐng zi	ánh chiếu	jing2 zi2	[{"meaning": "shadow", "part_of_speech": "noun"}]	\N
拥抱	yōng bào	dung báo	jung5 pou5	[{"meaning": "to embrace, to hug", "part_of_speech": "verb"}]	\N
拥挤	yōng jǐ	dung tế	jung5 zai1	[{"meaning": "to squeeze, to press", "part_of_speech": "verb"}, {"meaning": "crowded", "part_of_speech": "adjective"}]	\N
勇气	yǒng qì	dũng khí	jung5 hei3	[{"meaning": "courage", "part_of_speech": "noun"}]	\N
用途	yòng tú	dụng đồng	jung6 tou4	[{"meaning": "application, use, purpos", "part_of_speech": "noun"}]	\N
幼儿园	yòu ér yuán	nhi đồng viên	jau6 ji4 jyun2	[{"meaning": "kintergarten, nursery school", "part_of_speech": "noun"}]	\N
优惠	yōu huì	ưu đãi	jau1 fai3	[{"meaning": "preferential, favourable", "part_of_speech": "adjective"}]	\N
邮局	yóu jú	bưu điện	jau4 guk6	[{"meaning": "post office", "part_of_speech": "noun"}]	\N
游览	yóu lǎn	du lãm	jau4 lyun6	[{"meaning": "to visit, to go sightseeing", "part_of_speech": "verb"}]	\N
有利	yǒu lì	hữu lợi	jau5 lei6	[{"meaning": "advantageous, beneficial", "part_of_speech": "adjective"}]	\N
优美	yōu měi	ưu mỹ	jau1 mei5	[{"meaning": "fine, graceful", "part_of_speech": "adjective"}]	\N
优势	yōu shì	ưu thế	jau1 sai3	[{"meaning": "superiority, dominance, advantage", "part_of_speech": "noun"}]	\N
犹豫	yóu yù	do dự	jau4 jyu6	[{"meaning": "to hesitate", "part_of_speech": "verb"}]	\N
油炸	yóu zhá	dầu chiên	jau4 zaa3	[{"meaning": "to deep fry", "part_of_speech": "verb"}]	\N
预报	yù bào	dự báo	jyu6 bou3	[{"meaning": "forecast", "part_of_speech": "noun"}]	\N
预订	yù dìng	dự định	jyu6 ding6	[{"meaning": "booking", "part_of_speech": "noun"}, {"meaning": "to book, to subscribe for", "part_of_speech": "verb"}]	\N
预防	yù fáng	dự phòng	jyu6 fong4	[{"meaning": "prevention, prophylaxis", "part_of_speech": "noun"}, {"meaning": "to prevent", "part_of_speech": "verb"}]	\N
娱乐	yú lè	vui chơi	jyu4 lok6	[{"meaning": "amusement, entertainment", "part_of_speech": "noun"}, {"meaning": "to amuse, to entertain", "part_of_speech": "verb"}]	\N
玉米	yù mǐ	nhục mễ	juk6 mai5	[{"meaning": "corn, maize", "part_of_speech": "noun"}]	\N
与其	yǔ qí	dữ kỳ	jo1 kei4	[{"meaning": "rather than", "part_of_speech": "conjunction"}]	\N
语气	yǔ qì	ngữ khí	jyu5 hei3	[{"meaning": "tone, manner of speaking", "part_of_speech": "noun"}]	\N
宇宙	yǔ zhòu	vũ trụ	jyu5 zau6	[{"meaning": "universe, cosmos", "part_of_speech": "noun"}]	\N
元旦	Yuán dàn	nguyên đán	jyun4 daan3	[{"meaning": "New Year’s Day", "part_of_speech": "noun"}]	\N
缘故	yuán gù	duyên cớ	jyun4 gu3	[{"meaning": "reason, cause", "part_of_speech": "noun"}]	\N
原料	yuán liào	nguyên liệu	jyun4 liu6	[{"meaning": "raw material", "part_of_speech": "noun"}]	\N
愿望	yuàn wàng	nguyện vọng	jyun3 mong6	[{"meaning": "desire, wish", "part_of_speech": "noun"}]	\N
原则	yuán zé	nguyên tắc	jyun4 jak3	[{"meaning": "principle", "part_of_speech": "noun"}]	\N
晕	yūn	ưn	wan2	[{"meaning": "to pass out, to faint", "part_of_speech": "verb"}, {"meaning": "dizzy, faint, confused", "part_of_speech": "adjective"}]	\N
运气	yùn qi	vận khí	wan6 hei3	[{"meaning": "luck, fate", "part_of_speech": "noun"}]	\N
运输	yùn shū	vận chuyển	wan6 syun6	[{"meaning": "transport", "part_of_speech": "noun"}, {"meaning": "to transport", "part_of_speech": "verb"}]	\N
运用	yùn yòng	vận dụng	wan6 jung6	[{"meaning": "to use, to utilize", "part_of_speech": "verb"}]	\N
灾害	zāi hài	tai hoại	zoi1 hoi6	[{"meaning": "calamity, disaster", "part_of_speech": "noun"}]	\N
再三	zài sān	tái tam	zoi3 saam1	[{"meaning": "again and again", "part_of_speech": "adverb"}]	\N
赞成	zàn chéng	tán thành	zaan3 sing4	[{"meaning": "to approve of, to agree with", "part_of_speech": "verb"}]	\N
赞美	zàn měi	tán mỹ	zaan3 mei5	[{"meaning": "applause, praise", "part_of_speech": "noun"}, {"meaning": "to praise, to admire", "part_of_speech": "verb"}]	\N
造成	zào chéng	tạo thành	zoeng6 sing4	[{"meaning": "to bring about, to create, to cause", "part_of_speech": "verb"}]	\N
糟糕	zāo gāo	táo cáo	zo1 gou1	[{"meaning": "terrible, bad", "part_of_speech": "adjective"}]	\N
则	zé	tắc	zaak6	[{"meaning": "norm, standard", "part_of_speech": "noun"}, {"meaning": "to follow (rule, etc.)", "part_of_speech": "verb"}, {"meaning": "then", "part_of_speech": "conjunction"}, {"meaning": "for written items", "part_of_speech": "measure word"}]	\N
责备	zé bèi	trách bị	zaak3 bui3	[{"meaning": "to blame, to criticize", "part_of_speech": "verb"}]	\N
摘	zhāi	tróc	zaak6	[{"meaning": "to pick, to pluck, to take off (glasses, etc.)", "part_of_speech": "verb"}]	\N
展开	zhǎn kāi	triển khai	zin2 hoi1	[{"meaning": "to unfold, to carry out, to spread out", "part_of_speech": "verb"}]	\N
展览	zhǎn lǎn	triển lãm	zin2 laam4	[{"meaning": "exhibition", "part_of_speech": "noun"}, {"meaning": "to exhibit", "part_of_speech": "verb"}]	\N
粘贴	zhān tiē	niêm thiệt	nim4 tip3	[{"meaning": "to stick, to affix, to paste", "part_of_speech": "verb"}]	\N
占线	zhàn xiàn	chinh tiến	zaam1 sin3	[{"meaning": "busy (phone)", "part_of_speech": "adjective"}]	\N
战争	zhàn zhēng	chiến tranh	zin3 zung1	[{"meaning": "war", "part_of_speech": "noun"}]	\N
涨	zhǎng	tăng	zeng3	[{"meaning": "to rise, to go up", "part_of_speech": "verb"}]	\N
账户	zhàng hù	trương hộ	zoeng3 wu6	[{"meaning": "bank account", "part_of_speech": "noun"}]	\N
掌握	zhǎng wò	trưởng nguyệt	zoeng2 ngo6	[{"meaning": "to grasp, to master, to control", "part_of_speech": "verb"}]	\N
照常	zhào cháng	chiếu thường	ziu3 soeng4	[{"meaning": "as usual", "part_of_speech": "adverb"}]	\N
具备	jù bèi	cụ bổ	geoi6 be6	[{"meaning": "to possess, to have", "part_of_speech": "verb"}]	\N
巨大	jù dà	cự đại	geoi6 daai6	[{"meaning": "huge enormous", "part_of_speech": "adjective"}]	\N
聚会	jù huì	chụ hội	zyu3 wui6	[{"meaning": "party, gathering", "part_of_speech": "noun"}, {"meaning": "to party, to get together", "part_of_speech": "verb"}]	\N
招待	zhāo dài	chiêu đãi	zou1 doi6	[{"meaning": "reception", "part_of_speech": "noun"}, {"meaning": "to entertain (guests), to serve, to receive", "part_of_speech": "verb"}]	\N
召开	zhào kāi	chiêu khai	ziu6 hoi1	[{"meaning": "to convene, to convoke, to call together", "part_of_speech": "verb"}]	\N
着凉	zháo liáng	chiều lạnh	zoek6 loeng4	[{"meaning": "to catch a cold", "part_of_speech": "verb"}]	\N
哲学	zhé xué	triết học	zyut3 hok6	[{"meaning": "philosophy", "part_of_speech": "noun"}]	\N
阵	zhèn	chuỗi	zyun6	[{"meaning": "disposition of troops", "part_of_speech": "noun"}, {"meaning": "for short periods or events", "part_of_speech": "conjunction"}]	\N
振动	zhèn dòng	chấn động	zan3 dung6	[{"meaning": "vibration", "part_of_speech": "noun"}, {"meaning": "to vibrate", "part_of_speech": "verb"}]	\N
诊断	zhěn duàn	triển đoạn	zan3 dyun6	[{"meaning": "diagnosis", "part_of_speech": "noun"}, {"meaning": "to diagnose", "part_of_speech": "verb"}]	\N
针对	zhēn duì	châm đối	zam1 deoi3	[{"meaning": "to be aimed at, to be directed against", "part_of_speech": "verb"}]	\N
真理	zhēn lǐ	chân lí	zan1 lei5	[{"meaning": "truth", "part_of_speech": "noun"}]	\N
真实	zhēn shí	chân thực	zan1 sat6	[{"meaning": "real, true", "part_of_speech": "adjective"}]	\N
枕头	zhěn tou	chẩm đầu	zam2 tau4	[{"meaning": "pillow", "part_of_speech": "noun"}]	\N
珍惜	zhēn xī	trân trọng	zan1 sik1	[{"meaning": "to value, to cherish", "part_of_speech": "verb"}]	\N
正	zhèng	chính	zing3	[{"meaning": "upright, honest", "part_of_speech": "adjective"}, {"meaning": "just, upright", "part_of_speech": "adverb"}]	\N
整体	zhěng tǐ	chính thể	jing2 tai2	[{"meaning": "whole entity", "part_of_speech": "noun"}]	\N
政治	zhèng zhì	chính trị	jing3 zi6	[{"meaning": "politics", "part_of_speech": "noun"}]	\N
直	zhí	trực	zeoi6	[{"meaning": "to straighten", "part_of_speech": "verb"}, {"meaning": "straight, direct", "part_of_speech": "adjective"}]	\N
支	zhī	chi	zi1	[{"meaning": "branch, division", "part_of_speech": "noun"}, {"meaning": "to support", "part_of_speech": "verb"}, {"meaning": "for stick-like objects", "part_of_speech": "measure word"}]	\N
指导	zhǐ dǎo	chỉ đạo	zi2 dou6	[{"meaning": "guidance", "part_of_speech": "noun"}, {"meaning": "to guide, to direct", "part_of_speech": "verb"}]	\N
制定	zhì dìng	chế định	zai3 ding6	[{"meaning": "to formulate, to work out, to draw up", "part_of_speech": "verb"}]	\N
制度	zhì dù	chế độ	zai3 dou6	[{"meaning": "system", "part_of_speech": "noun"}]	\N
智慧	zhì huì	trí huệ	zi3 wai6	[{"meaning": "wisdom, intelligence, knowledge", "part_of_speech": "noun"}]	\N
指挥	zhǐ huī	chỉ huy	zi2 wui4	[{"meaning": "conductor", "part_of_speech": "noun"}, {"meaning": "to conduct, to command, to direct", "part_of_speech": "verb"}]	\N
至今	zhì jīn	chí cận	zi3 gam1	[{"meaning": "until now, until today", "part_of_speech": "time"}]	\N
治疗	zhì liáo	trị liệu	zi6 liu4	[{"meaning": "medical treatment", "part_of_speech": "noun"}, {"meaning": "to treat, to cure", "part_of_speech": "verb"}]	\N
支票	zhī piào	chi phiếu	zi1 piu3	[{"meaning": "check (bank)", "part_of_speech": "noun"}]	\N
执行	zhí xíng	thực hiện	zik1 hang4	[{"meaning": "to carry out, to execute", "part_of_speech": "verb"}]	\N
秩序	zhì xù	trật tự	zik6 zeoi6	[{"meaning": "order, orderly state", "part_of_speech": "noun"}]	\N
至于	zhì yú	chí vu	zi3 jyu1	[{"meaning": "to go so far as to, with regard to", "part_of_speech": "conjunction"}]	\N
志愿者	zhì yuàn zhě	chí viên giả	zi3 jyun6 ze2	[{"meaning": "volunteer", "part_of_speech": "noun"}]	\N
执照	zhí zhào	chức chiếu	zat1 ziu3	[{"meaning": "license", "part_of_speech": "noun"}]	\N
制作	zhì zuò	chế tác	zai3 zok3	[{"meaning": "to make, to manufacture, to produce", "part_of_speech": "verb"}]	\N
重	zhòng	trọng	zung6	[{"meaning": "heavy, serious", "part_of_speech": "adjective"}, {"meaning": "heavily", "part_of_speech": "adverb"}]	\N
钟	zhōng	chung	zung1	[{"meaning": "clock, bell", "part_of_speech": "noun"}, {"meaning": "o’clock", "part_of_speech": "measure word"}]	\N
中介	zhōng jiè	trung gian	zung1 gaai3	[{"meaning": "agency, agent", "part_of_speech": "noun"}]	\N
重量	zhòng liàng	trọng lượng	zung6 loeng6	[{"meaning": "weight", "part_of_speech": "noun"}]	\N
中心	zhōng xīn	trung tâm	zung1 sam1	[{"meaning": "center", "part_of_speech": "noun"}]	\N
中旬	zhōng xún	trung tuần	zung1 seon4	[{"meaning": "middle third of a month", "part_of_speech": "time"}]	\N
周到	zhōu dao	châu đáo	zau1 dou3	[{"meaning": "thoughtful, considerate", "part_of_speech": "adjective"}]	\N
煮	zhǔ	trữ	zyu2	[{"meaning": "to cook, to boil", "part_of_speech": "verb"}]	\N
逐步	zhú bù	trục bộ	zuk6 bou6	[{"meaning": "step by step", "part_of_speech": "adverb"}]	\N
注册	zhù cè	chứng nhận	zu2 ceoi3	[{"meaning": "to register", "part_of_speech": "verb"}]	\N
主持	zhǔ chí	chủ trì	zyu2 ci4	[{"meaning": "to direct, to manage, to preside over", "part_of_speech": "verb"}]	\N
祝福	zhù fú	chúc phúc	zuk1 fuk1	[{"meaning": "to bless, to wish well", "part_of_speech": "verb"}]	\N
嘱咐	zhǔ fù	trục phụ	zuk1 fu6	[{"meaning": "to exhort, to enjoin, to tell", "part_of_speech": "verb"}]	\N
主观	zhǔ guān	chủ quan	zyu2 gun1	[{"meaning": "subjectiv", "part_of_speech": "adjective"}]	\N
主人	zhǔ rén	chủ nhân	zyu2 jan4	[{"meaning": "host, master", "part_of_speech": "noun"}]	\N
主席	zhǔ xí	chủ tịch	zyu2 zik6	[{"meaning": "chairman", "part_of_speech": "noun"}]	\N
主张	zhǔ zhāng	chủ trương	zyu2 zoeng1	[{"meaning": "viewpoint, stand", "part_of_speech": "noun"}, {"meaning": "to advocate, to stand for", "part_of_speech": "verb"}]	\N
竹子	zhú zi	tre	zyu1 zi2	[{"meaning": "bamboo", "part_of_speech": "noun"}]	\N
抓紧	zhuā jǐn	trói chặt	zuaa1 gan2	[{"meaning": "to grasp firmly, to pay special attention to, to seize", "part_of_speech": "verb"}]	\N
转变	zhuǎn biàn	chuyển biến	zyun2 bin3	[{"meaning": "change", "part_of_speech": "noun"}, {"meaning": "to change, to transform", "part_of_speech": "verb"}]	\N
转告	zhuǎn gào	chuyển cáo	zyun2 gou3	[{"meaning": "to pass on (a message, etc.), to transmit", "part_of_speech": "verb"}]	\N
专家	zhuān jiā	chuyên gia	zyun1 gaa1	[{"meaning": "expert, specialist", "part_of_speech": "noun"}]	\N
专心	zhuān xīn	chuyên tâm	zyun1 sam1	[{"meaning": "concentration", "part_of_speech": "noun"}, {"meaning": "to concentrate", "part_of_speech": "verb"}, {"meaning": "concentrated, attentive", "part_of_speech": "adjective"}]	\N
装	zhuāng	trang	zong1	[{"meaning": "dress, clothing, costume", "part_of_speech": "noun"}, {"meaning": "to pretend, to install, to fix, to load, to pack", "part_of_speech": "verb"}]	\N
状况	zhuàng kuàng	trạng thái	zong6 fong2	[{"meaning": "condition, state, situation", "part_of_speech": "noun"}]	\N
装饰	zhuāng shì	trang trí	zong1 sik1	[{"meaning": "decoration", "part_of_speech": "noun"}, {"meaning": "to decorate", "part_of_speech": "verb"}]	\N
状态	zhuàng tài	trạng thái	zong6 tai2	[{"meaning": "state, condition", "part_of_speech": "noun"}]	\N
追求	zhuī qiú	truy cầu	zeoi1 kau4	[{"meaning": "to pursue, to seek after", "part_of_speech": "verb"}]	\N
紫	zǐ	tử	tzi2	[{"meaning": "purple", "part_of_speech": "adjective"}]	\N
自从	zì cóng	tự từ	zzi6 cung4	[{"meaning": "ever since", "part_of_speech": "adverb"}, {"meaning": "since", "part_of_speech": "relative clause"}]	\N
自动	zì dòng	tự động	zi6 dung6	[{"meaning": "automatic", "part_of_speech": "adjective"}]	\N
资格	zī gé	tư cách	zi1 gok3	[{"meaning": "qualifications", "part_of_speech": "noun"}]	\N
自豪	zì háo	tự hào	zi6 hou4	[{"meaning": "proud", "part_of_speech": "adjective"}]	\N
资金	zī jīn	tài chính	zi1 gam1	[{"meaning": "funds, capital", "part_of_speech": "noun"}]	\N
自觉	zì jué	tự giác	zi6 gok3	[{"meaning": "aware, conscious, on one’s own initiative", "part_of_speech": "adjective"}]	\N
资料	zī liào	tư liệu	zi1 liu6	[{"meaning": "material, data, resources, profile (IT)", "part_of_speech": "noun"}]	\N
字幕	zì mù	tự mục	zi6 muk6	[{"meaning": "caption, subtitle", "part_of_speech": "noun"}]	\N
姿势	zī shì	tư thế	zi1 si6	[{"meaning": "gesture, posture, pose", "part_of_speech": "noun"}]	\N
自私	zì sī	tự tư	zi6 si1	[{"meaning": "selfish", "part_of_speech": "adjective"}]	\N
自信	zì xìn	tự tin	zi6 seon3	[{"meaning": "(self-)confidence", "part_of_speech": "noun"}, {"meaning": "(self-)confident", "part_of_speech": "adjective"}]	\N
咨询	zī xún	tư vấn	zi1 seon4	[{"meaning": "consultation", "part_of_speech": "noun"}, {"meaning": "to consult, to seek advice", "part_of_speech": "verb"}]	\N
自由	zì yóu	tự do	zi6 jau4	[{"meaning": "freedom, liberty", "part_of_speech": "noun"}, {"meaning": "free", "part_of_speech": "adjective"}]	\N
自愿	zì yuàn	tự nguyện	zi6 jyun6	[{"meaning": "voluntary", "part_of_speech": "adjective"}]	\N
资源	zī yuán	tài nguyên	zi1 jyuan4	[{"meaning": "resources", "part_of_speech": "noun"}]	\N
总裁	zǒng cái	tổng tài	zung2 coi4	[{"meaning": "general director", "part_of_speech": "noun"}]	\N
总共	zǒng gòng	tổng cộng	zung2 gung6	[{"meaning": "altogether, in total", "part_of_speech": "adverb"}]	\N
综合	zōng hé	tổng hợp	zung2 hap6	[{"meaning": "Synthese", "part_of_speech": "noun"}, {"meaning": "to integrate, to sum up", "part_of_speech": "verb"}, {"meaning": "synthesized, integrated", "part_of_speech": "adjective"}]	\N
宗教	zōng jiào	tông giáo	zung1 gaau3	[{"meaning": "religion", "part_of_speech": "noun"}]	\N
总理	zǒng lǐ	tổng lý	zung2 lei5	[{"meaning": "premier, prime minister", "part_of_speech": "noun"}]	\N
总算	zǒng suàn	tổng toán	zung2 syun3	[{"meaning": "finally, in the end, at long last", "part_of_speech": "adverb"}]	\N
总统	zǒng tǒng	tổng thống	zung2 tung2	[{"meaning": "president (of a country)", "part_of_speech": "noun"}]	\N
总之	zǒng zhī	tổng chi	zung2 zi1	[{"meaning": "in short, in a word", "part_of_speech": "conjunction"}]	\N
祖国	zǔ guó	tổ quốc	zou2 gwok3	[{"meaning": "fatherland, homeland", "part_of_speech": "noun"}]	\N
组合	zǔ hé	tổ hợp	zyu2 hap6	[{"meaning": "association, combination", "part_of_speech": "noun"}, {"meaning": "to make up, to compose, to constitute", "part_of_speech": "verb"}]	\N
祖先	zǔ xiān	tổ tiên	zou2 sin1	[{"meaning": "ancestor", "part_of_speech": "noun"}]	\N
阻止	zǔ zhǐ	trở ngăn	zo2 zi2	[{"meaning": "to prevent, to stop", "part_of_speech": "verb"}]	\N
醉	zuì	túy	zeoi3	[{"meaning": "intoxicated, drunk", "part_of_speech": "adjective"}]	\N
最初	zuì chū	tối sơ	zeoi3 co1	[{"meaning": "first, initial", "part_of_speech": "time"}]	\N
罪犯	zuì fàn	tội phạm	zui6 faan6	[{"meaning": "criminal", "part_of_speech": "noun"}]	\N
尊敬	zūn jìng	tôn kính	zyun1 ging3	[{"meaning": "respect, esteem", "part_of_speech": "noun"}, {"meaning": "to respect, to revere", "part_of_speech": "verb"}]	\N
遵守	zūn shǒu	tôn thờ	zyun1 sau6	[{"meaning": "to abide by, to comply with", "part_of_speech": "verb"}]	\N
作品	zuò pǐn	tác phẩm	zok3 ban2	[{"meaning": "works (literature, art)", "part_of_speech": "noun"}]	\N
作为	zuò wéi	tác vụ	zok3 wai4	[{"meaning": "conduct, ac", "part_of_speech": "noun"}, {"meaning": "to accomplish, to act as, to take for", "part_of_speech": "verb"}, {"meaning": "as", "part_of_speech": "conjunction"}]	\N
作文	zuò wén	tác văn	zok3 man4	[{"meaning": "composition", "part_of_speech": "noun"}, {"meaning": "to write an essay", "part_of_speech": "verb"}]	\N
早	zǎo	tảo	zou2	[{"meaning": "early", "part_of_speech": "adjective"}]	\N
权利	quán lì	quyền lợi	kyun4 lei6	[{"meaning": "right, privilege", "part_of_speech": "noun"}]	\N
权力	quán lì	quyền lực	kyun4 lik6	[{"meaning": "power, authority", "part_of_speech": "noun"}]	\N
悠久	yōu jiǔ	u cửu	jau4 gau6	[{"meaning": "long, longstanding", "part_of_speech": "adjective"}]	\N
房子	fáng zi	phòng tử	fong4 zi2	[{"meaning": "house, building", "part_of_speech": "noun"}]	\N
诗	shī	thơ	si1	[{"meaning": "poem", "part_of_speech": "noun"}]	\N
玩具	wán jù	hoạch cụ	waan4 geoi6	[{"meaning": "toy", "part_of_speech": "noun"}]	\N
完美	wán měi	hoàn mỹ	yuen4 mei5	[{"meaning": "perfect", "part_of_speech": "adjective"}]	\N
完善	wán shàn	hoàn thiện	yuen4 sin6	[{"meaning": "to improve, to make perfect", "part_of_speech": "verb"}, {"meaning": "perfect", "part_of_speech": "adjective"}]	\N
万一	wàn yī	vạn nhất	maan6 jat1	[{"meaning": "contingency", "part_of_speech": "noun"}, {"meaning": "in case", "part_of_speech": "conjunction"}]	\N
完整	wán zhěng	hoàn chính	yuen4 zing2	[{"meaning": "complete, intact", "part_of_speech": "adjective"}]	\N
往返	wǎng fǎn	vãng phản	wong5 faan1	[{"meaning": "back and forth, to and from", "part_of_speech": "adverb"}]	\N
王子	wáng zǐ	vương tử	wong4 zi2	[{"meaning": "prince", "part_of_speech": "noun"}]	\N
胃	wèi	vị	wai6	[{"meaning": "stomach", "part_of_speech": "noun"}]	\N
尾巴	wěi ba	vĩ ba	mei5 baa1	[{"meaning": "tail", "part_of_speech": "noun"}]	\N
未必	wèi bì	vị tất	mei6 bat1	[{"meaning": "not necessarily", "part_of_speech": "adverb"}]	\N
伟大	wěi dà	vi đại	wai5 daai6	[{"meaning": "great, mighty", "part_of_speech": "adjective"}]	\N
违反	wéi fǎn	vi phản	wai4 faan2	[{"meaning": "to violate (law)", "part_of_speech": "verb"}]	\N
维护	wéi hù	duy hỗ	wai4 wu6	[{"meaning": "to defend, to safeguard, to maintain", "part_of_speech": "verb"}]	\N
爱情	ài qíng	ái tình	oi3 cing4	[{"meaning": "love", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%88%b1%e6%83%85-ai-qing-translation-pronunciation-and-example-sentences/
暗	àn	ám	am3	[{"meaning": "dark", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e6%9a%97-an-translation-pronunciation-and-example-sentences/
安排	ān pái	an phối	on1 paai4	[{"meaning": "plan", "part_of_speech": "noun"}, {"meaning": "to plan, to arrange", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%ae%89%e6%8e%92-an-pai-translation-pronunciation-and-example-sentences/
安全	ān quán	an toàn	on1 cyun4	[{"meaning": "safety", "part_of_speech": "noun"}, {"meaning": "safe, secure", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%ae%89%e5%85%a8-an-quan-translation-pronunciation-and-example-sentences/
按时	àn shí	án thời	on3 si4	[{"meaning": "on time, on schedule", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e6%8c%89%e6%97%b6-an-shi-translation-pronunciation-and-example-sentences/
按照	àn zhào	án chiếu	on3 ziu3	[{"meaning": "according to", "part_of_speech": "relative clause"}]	https://wohok.com/dict/%e6%8c%89%e7%85%a7-an-zhao-translation-pronunciation-and-example-sentences/
抱	bào	bảo	pou5	[{"meaning": "to hug, to embrace, to hold", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%8a%b1-bao-translation-pronunciation-and-example-sentences/
报道	bào dào	báo cáo	bou3 dou6	[{"meaning": "report", "part_of_speech": "noun"}, {"meaning": "to report", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%8a%a5%e9%81%93-bao-dao-translation-pronunciation-and-example-sentences/
保护	bǎo hù	bảo hộ	bou2 wu6	[{"meaning": "protection", "part_of_speech": "noun"}, {"meaning": "to protect, to safeguard", "part_of_speech": "verb"}]	https://wohok.com/dict/%e4%bf%9d%e6%8a%a4-bao-hu-translation-pronunciation-and-example-sentences/
包括	bāo kuò	bao quát	baau1 gwaak3	[{"meaning": "to include, to consist of", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%8c%85%e6%8b%ac-bao-kuo-translation-pronunciation-and-example-sentences/
报名	bào míng	báo danh	bou3 ming4	[{"meaning": "to sign up, to register", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%8a%a5%e5%90%8d-bao-ming-translation-pronunciation-and-example-sentences/
抱歉	bào qiàn	báo tiếc	pou5 cin2	[{"meaning": "sorry! my apologies!", "part_of_speech": "expression"}]	https://wohok.com/dict/%e6%8a%b1%e6%ad%89-bao-qian-translation-pronunciation-and-example-sentences/
保证	bǎo zhèng	bảo đảm	bou2 zing3	[{"meaning": "guarantee", "part_of_speech": "noun"}, {"meaning": "to guarantee, to ensure, to assure", "part_of_speech": "verb"}]	https://wohok.com/dict/%e4%bf%9d%e8%af%81-bao-zheng-translation-pronunciation-and-example-sentences/
倍	bèi	bội	bui3	[{"meaning": "for times, -fold", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e5%80%8d-bei-translation-pronunciation-and-example-sentences/
笨	bèn	bần	ban6	[{"meaning": "stupid, foolish", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e7%ac%a8-ben-translation-pronunciation-and-example-sentences/
本来	běn lái	bản lai	bun2 loi4	[{"meaning": "original", "part_of_speech": "adjective"}, {"meaning": "originally, at first", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e6%9c%ac%e6%9d%a5-ben-lai-translation-pronunciation-and-example-sentences/
笔记本	bǐ jì běn	bút ký bản	bat1 gei3 bun2	[{"meaning": "notebook", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%ac%94%e8%ae%b0%e6%9c%ac-bi-ji-ben-translation-pronunciation-and-example-sentences/
毕业	bì yè	tốt nghiệp	bat1 jip6	[{"meaning": "to graduate, to finish school", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%af%95%e4%b8%9a-bi-ye-translation-pronunciation-and-example-sentences/
遍	biàn	biến	pin3	[{"meaning": "all over", "part_of_speech": "adverb"}, {"meaning": "for a time", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e9%81%8d-bian-translation-pronunciation-and-example-sentences/
表达	biǎo dá	biểu đạt	biu2 daat3	[{"meaning": "to express, to convey", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%a1%a8%e8%be%be-biao-da-translation-pronunciation-and-example-sentences/
表格	biǎo gé	biểu cách	biu2 gaak3	[{"meaning": "form, table", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%a1%a8%e6%a0%bc-biao-ge-translation-pronunciation-and-example-sentences/
表扬	biǎo yáng	biểu dương	biu2 joeng4	[{"meaning": "to praise, to commend", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%a1%a8%e6%89%ac-biao-yang-translation-pronunciation-and-example-sentences/
标准	biāo zhǔn	tiêu chuẩn	biu1 zeon2	[{"meaning": "standard, norm", "part_of_speech": "noun"}, {"meaning": "standard", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e6%a0%87%e5%87%86-biao-zhun-translation-pronunciation-and-example-sentences/
饼干	bǐng gān	bánh gato	beng2 gon1	[{"meaning": "buscuit, cookie", "part_of_speech": "noun"}]	https://wohok.com/dict/%e9%a5%bc%e5%b9%b2-bing-gan-translation-pronunciation-and-example-sentences/
并且	bìng qiě	tánh quả	bing6 ce2	[{"meaning": "and, besides, moreover", "part_of_speech": "conjunction"}]	https://wohok.com/dict/%e5%b9%b6%e4%b8%94-bing-qie-translation-pronunciation-and-example-sentences/
博士	bó shì	bác sĩ	bok3 si6	[{"meaning": "doctor, Ph.D.", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%8d%9a%e5%a3%ab-bo-shi-translation-pronunciation-and-example-sentences/
不但	bú dàn	bất đắc	bat1 daan6	[{"meaning": "not only", "part_of_speech": "conjunction"}]	https://wohok.com/dict/%e4%b8%8d%e4%bd%86-bu-dan-translation-pronunciation-and-example-sentences/
不得不	bù dé bù	bất đắc bất	bat1 dak1 bat1	[{"meaning": "to have to, cannot but", "part_of_speech": "auxiliary verb"}]	https://wohok.com/dict/%e4%b8%8d%e5%be%97%e4%b8%8d-bu-de-bu-translation-pronunciation-and-example-sentences/
部分	bù fen	bộ phần	bou6 fan6	[{"meaning": "part, section", "part_of_speech": "noun"}]	https://wohok.com/dict/%e9%83%a8%e5%88%86-bu-fen-translation-pronunciation-and-example-sentences/
不管	bù guǎn	bất quản	bat1 gun2	[{"meaning": "regardless of, no matter what/how", "part_of_speech": "conjunction"}]	https://wohok.com/dict/%e4%b8%8d%e7%ae%a1-bu-guan-translation-pronunciation-and-example-sentences/
不过	bú guò	bất quá	bat1 gwo3	[{"meaning": "only, just, no more than", "part_of_speech": "adverb"}, {"meaning": "but, however", "part_of_speech": "conjunction"}]	https://wohok.com/dict/%e4%b8%8d%e8%bf%87-bu-guo-translation-pronunciation-and-example-sentences/
不仅	bù jǐn	bất cấn	bat1 gan2	[{"meaning": "not only, not just", "part_of_speech": "conjunction"}]	https://wohok.com/dict/%e4%b8%8d%e4%bb%85-bu-jin-translation-pronunciation-and-example-sentences/
擦	cā	sát	caat3	[{"meaning": "to wipe, to rub, to erase", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%93%a6-ca-translation-pronunciation-and-example-sentences/
猜	cāi	thôi	caai1	[{"meaning": "to guess", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%8c%9c-cai-translation-pronunciation-and-example-sentences/
材料	cái liào	tài liệu	coi4 liu6	[{"meaning": "material, data, stuff", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%9d%90%e6%96%99-cai-liao-translation-pronunciation-and-example-sentences/
参观	cān guān	tham quan	caam1 gun1	[{"meaning": "to visit, to look around", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%8f%82%e8%a7%82-can-guan-translation-pronunciation-and-example-sentences/
差不多	chà bu duō	sát bất đa	caa1 bat1 do1	[{"meaning": "almost, more or less", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%b7%ae%e4%b8%8d%e5%a4%9a-cha-bu-duo-translation-pronunciation-and-example-sentences/
尝	cháng	thưởng	coeng4	[{"meaning": "to taste", "part_of_speech": "verb"}, {"meaning": "once", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e5%b0%9d-chang-translation-pronunciation-and-example-sentences/
场	chǎng	trường	coeng4	[{"meaning": "field, place", "part_of_speech": "noun"}, {"meaning": "for events, happenings, etc.", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e5%9c%ba-chang-translation-pronunciation-and-example-sentences/
长城	Cháng chéng	trường thành	coeng4 sing4	[{"meaning": "the Great Wall", "part_of_speech": "noun"}]	https://wohok.com/dict/%e9%95%bf%e5%9f%8e-chang-cheng-translation-pronunciation-and-example-sentences/
长江	Cháng jiāng	trường giang	coeng4 gong1	[{"meaning": "Yangtze river", "part_of_speech": "noun"}]	https://wohok.com/dict/%e9%95%bf%e6%b1%9f-chang-jiang-translation-pronunciation-and-example-sentences/
吵	chǎo	xao	caau2	[{"meaning": "to quarrel", "part_of_speech": "verb"}, {"meaning": "noisy", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%90%b5-chao-translation-pronunciation-and-example-sentences/
超过	chāo guò	siêu quá	ciu1 gwo3	[{"meaning": "to surpass, to exceed", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%b6%85%e8%bf%87-chao-guo-translation-pronunciation-and-example-sentences/
成功	chéng gōng	thành công	sing4 gung1	[{"meaning": "success", "part_of_speech": "noun"}, {"meaning": "to succeed", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%88%90%e5%8a%9f-cheng-gong-translation-pronunciation-and-example-sentences/
诚实	chéng shí	thành thật	sing4 sat6	[{"meaning": "honest, truthful", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e8%af%9a%e5%ae%9e-cheng-shi-translation-pronunciation-and-example-sentences/
成熟	chéng shú	thành thục	sing4 suk6	[{"meaning": "mature", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e6%88%90%e7%86%9f-cheng-shu-translation-pronunciation-and-example-sentences/
成为	chéng wéi	thành vi	sing4 wai4	[{"meaning": "to become, to turn into", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%88%90%e4%b8%ba-cheng-wei-translation-pronunciation-and-example-sentences/
乘坐	chéng zuò	thừa tọa	sing4 co5	[{"meaning": "to ride (in a vehicle)", "part_of_speech": "verb"}]	https://wohok.com/dict/%e4%b9%98%e5%9d%90-cheng-zuo-translation-pronunciation-and-example-sentences/
吃惊	chī jīng	xích kinh	hek3 ging1	[{"meaning": "to be startled, to be shocked, to be amazed", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%90%83%e6%83%8a-chi-jing-translation-pronunciation-and-example-sentences/
重新	chóng xīn	tái tự	cung4 seng1	[{"meaning": "again", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e9%87%8d%e6%96%b0-chong-xin-translation-pronunciation-and-example-sentences/
出发	chū fā	xuất phát	ceot1 faat3	[{"meaning": "to leave, to set out", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%87%ba%e5%8f%91-chu-fa-translation-pronunciation-and-example-sentences/
出生	chū shēng	xuất sanh	ceot1 sang1	[{"meaning": "to be born", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%87%ba%e7%94%9f-chu-sheng-translation-pronunciation-and-example-sentences/
传真	chuán zhēn	truyền chân	cyun4 zan1	[{"meaning": "fax", "part_of_speech": "noun"}]	https://wohok.com/dict/%e4%bc%a0%e7%9c%9f-chuan-zhen-translation-pronunciation-and-example-sentences/
窗户	chuāng hu	song hồ	coeng1 wu6	[{"meaning": "window", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%aa%97%e6%88%b7-chuang-hu-translation-pronunciation-and-example-sentences/
词典	cí diǎn	từ điển	ci4 dim3	[{"meaning": "dictionary", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%af%8d%e5%85%b8-ci-dian-translation-pronunciation-and-example-sentences/
从来	cóng lái	tòng lai	cung4 loi4	[{"meaning": "always, ever since, at all times", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e4%bb%8e%e6%9d%a5-cong-lai-translation-pronunciation-and-example-sentences/
粗心	cū xīn	thô tâm	co1 sam1	[{"meaning": "careless, thoughtless", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e7%b2%97%e5%bf%83-cu-xin-translation-pronunciation-and-example-sentences/
答案	dá àn	đáp án	daap3 ngon6	[{"meaning": "answer, solution", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%ad%94%e6%a1%88-da-an-translation-pronunciation-and-example-sentences/
大概	dà gài	đại khái	daai6 koi3	[{"meaning": "probably, roughly", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e5%a4%a7%e6%a6%82-da-gai-translation-pronunciation-and-example-sentences/
打扰	dǎ rǎo	đả nhiễu	daa2 jiu6	[{"meaning": "to disturb", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%89%93%e6%89%b0-da-rao-translation-pronunciation-and-example-sentences/
大使馆	dà shǐ guǎn	đại sứ quán	daai6 si2 gun2	[{"meaning": "embassy", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%a4%a7%e4%bd%bf%e9%a6%86-da-shi-guan-translation-pronunciation-and-example-sentences/
打印	dǎ yìn	đả ấn	daa2 jan2	[{"meaning": "to print, to seal, to stamp", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%89%93%e5%8d%b0-da-yin-translation-pronunciation-and-example-sentences/
大约	dà yuē	đại ước	daai6 joek3	[{"meaning": "approximately", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e5%a4%a7%e7%ba%a6-da-yue-translation-pronunciation-and-example-sentences/
打折	dǎ zhé	đả trả	daa2 zit3	[{"meaning": "to give discount", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%89%93%e6%8a%98-da-zhe-translation-pronunciation-and-example-sentences/
打针	dǎ zhēn	đả châm	daa2 zam1	[{"meaning": "to inject", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%89%93%e9%92%88-da-zhen-translation-pronunciation-and-example-sentences/
戴	dài	đái	daai3	[{"meaning": "to put on, to wear, to respect, to support", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%88%b4-dai-translation-pronunciation-and-example-sentences/
代表	dài biǎo	đại biểu	doi6 biu2	[{"meaning": "representative", "part_of_speech": "noun"}, {"meaning": "to represent", "part_of_speech": "verb"}]	https://wohok.com/dict/%e4%bb%a3%e8%a1%a8-dai-biao-translation-pronunciation-and-example-sentences/
大夫	dài fu	đại phu	daai6 fu1	[{"meaning": "doctor", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%a4%a7%e5%a4%ab-dai-fu-translation-pronunciation-and-example-sentences/
代替	dài tì	đại thế	doi6 thai3	[{"meaning": "replacement", "part_of_speech": "noun"}, {"meaning": "to replace, to substitute", "part_of_speech": "verb"}, {"meaning": "instead of", "part_of_speech": "relative clause"}]	https://wohok.com/dict/%e4%bb%a3%e6%9b%bf-dai-ti-translation-pronunciation-and-example-sentences/
当	dāng	đương	dong1	[{"meaning": "to act as, to administer", "part_of_speech": "verb"}, {"meaning": "should, ought", "part_of_speech": "auxiliary verb"}, {"meaning": "equal", "part_of_speech": "adjective"}, {"meaning": "when, during", "part_of_speech": "conjunction"}]	https://wohok.com/dict/%e5%bd%93-dang-dang-translation-pronunciation-and-example-sentences/
当地	dāng dì	đương địa	dong1 dei6	[{"meaning": "locality", "part_of_speech": "noun"}, {"meaning": "local", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%bd%93%e5%9c%b0-dang-di-translation-pronunciation-and-example-sentences/
当时	dāng shí	đương thời	dong1 si4	[{"meaning": "at that time, then", "part_of_speech": "time"}]	https://wohok.com/dict/%e5%bd%93%e6%97%b6-dang-shi-translation-pronunciation-and-example-sentences/
刀	dāo	đao	dou1	[{"meaning": "knife", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%88%80-dao-translation-pronunciation-and-example-sentences/
到处	dào chù	đáo xứ	dou3 cyu3	[{"meaning": "everywhere, at all places", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e5%88%b0%e5%a4%84-dao-chu-translation-pronunciation-and-example-sentences/
到底	dào dǐ	đáo để	dou3 dai2	[{"meaning": "finally, in the end", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e5%88%b0%e5%ba%95-dao-di-translation-pronunciation-and-example-sentences/
道歉	dào qiàn	đạo khiển	dou6 hip3	[{"meaning": "to apologize", "part_of_speech": "verb"}]	https://wohok.com/dict/%e9%81%93%e6%ad%89-dao-qian-translation-pronunciation-and-example-sentences/
导游	dǎo yóu	đảo du	dou6 jau4	[{"meaning": "tour guide", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%af%bc%e6%b8%b8-dao-you-translation-pronunciation-and-example-sentences/
得意	dé yì	đắc ý	dak1 ji3	[{"meaning": "pleased with oneself", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%be%97%e6%84%8f-de-yi-translation-pronunciation-and-example-sentences/
得	děi	đắc	dak1	[{"meaning": "to have to", "part_of_speech": "auxiliary verb"}]	https://wohok.com/dict/%e5%be%97-de-de-dei-translation-pronunciation-and-example-sentences/
等	děng	đẳng	dang2	[{"meaning": "etc., and so on", "part_of_speech": "particle"}]	https://wohok.com/dict/%e7%ad%89-deng-translation-pronunciation-and-example-sentences/
底	dǐ	đi	dai2	[{"meaning": "background, end, bottom, base", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%ba%95-di-translation-pronunciation-and-example-sentences/
地球	dì qiú	địa cầu	dei6 kau4	[{"meaning": "earth (planet)", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%9c%b0%e7%90%83-di-qiu-translation-pronunciation-and-example-sentences/
地址	dì zhǐ	địa chỉ	dei6 ci3	[{"meaning": "address", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%9c%b0%e5%9d%80-di-zhi-translation-pronunciation-and-example-sentences/
掉	diào	điệu	diu6	[{"meaning": "to fall, to drop, to lose, to turn", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%8e%89-diao-translation-pronunciation-and-example-sentences/
调查	diào chá	điều tra	diu6 caa4	[{"meaning": "investigation, survey", "part_of_speech": "noun"}, {"meaning": "to investigate, to survey", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%b0%83%e6%9f%a5-diao-cha-translation-pronunciation-and-example-sentences/
丢	diū	đi	diu1	[{"meaning": "to lose, to throw", "part_of_speech": "verb"}]	https://wohok.com/dict/%e4%b8%a2-diu-translation-pronunciation-and-example-sentences/
动作	dòng zuò	động tác	dung6 co3	[{"meaning": "movement", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%8a%a8%e4%bd%9c-dong-zuo-translation-pronunciation-and-example-sentences/
堵车	dǔ chē	đỗ xá	dou6 ce1	[{"meaning": "traffic jam", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%a0%b5%e8%bd%a6-du-che-translation-pronunciation-and-example-sentences/
肚子	dù zi	đỗ tử	tou5 zi2	[{"meaning": "belly, abdomen", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%82%9a%e5%ad%90-du-zi-translation-pronunciation-and-example-sentences/
断	duàn	đoán	dyun6	[{"meaning": "to cut off, to break, to judge, to decide", "part_of_speech": "verb"}, {"meaning": "absolutely, definitely", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e6%96%ad-duan-translation-pronunciation-and-example-sentences/
对	duì	đối	deoi3	[{"meaning": "for, to, towards", "part_of_speech": "relative clause"}]	https://wohok.com/dict/%e5%af%b9-dui-translation-pronunciation-and-example-sentences/
对话	duì huà	đối thoại	deoi3 wa6	[{"meaning": "dialog", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%af%b9%e8%af%9d-dui-hua-translation-pronunciation-and-example-sentences/
对面	duì miàn	đối diện	deoi3 min6	[{"meaning": "opposite", "part_of_speech": "location"}]	https://wohok.com/dict/%e5%af%b9%e9%9d%a2-dui-mian-translation-pronunciation-and-example-sentences/
顿	dùn	độn	deon6	[{"meaning": "pause", "part_of_speech": "noun"}, {"meaning": "to stop, to pause, to arrange", "part_of_speech": "verb"}, {"meaning": "for meals, beatings, etc.", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e9%a1%bf-dun-translation-pronunciation-and-example-sentences/
朵	duǒ	đóa	do2	[{"meaning": "for flowers, clouds, etc.", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e6%9c%b5-duo-translation-pronunciation-and-example-sentences/
而	ér	nhi	ji4	[{"meaning": "and, but, yet", "part_of_speech": "conjunction"}]	https://wohok.com/dict/%e8%80%8c-er-translation-pronunciation-and-example-sentences/
儿童	ér tóng	nhị đồng	ji4 tung4	[{"meaning": "child", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%84%bf%e7%ab%a5-er-tong-translation-pronunciation-and-example-sentences/
发	fā	phát	faat3	[{"meaning": "to send out, to issue, to develop", "part_of_speech": "verb"}, {"meaning": "for gunshots", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e5%8f%91-fa-translation-pronunciation-and-example-sentences/
法律	fǎ lǜ	pháp luật	faat3 leot6	[{"meaning": "law", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%b3%95%e5%be%8b-fa-lu-translation-pronunciation-and-example-sentences/
发生	fā shēng	phát sinh	faat3 sang1	[{"meaning": "to happen, to occur, to take place", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%8f%91%e7%94%9f-fa-sheng-translation-pronunciation-and-example-sentences/
发展	fā zhǎn	phát triển	faat3 zin2	[{"meaning": "development, growth", "part_of_speech": "noun"}, {"meaning": "to develop, to grow", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%8f%91%e5%b1%95-fa-zhan-translation-pronunciation-and-example-sentences/
反对	fǎn duì	phản đối	faan2 deoi6	[{"meaning": "to fight against, to oppose", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%8f%8d%e5%af%b9-fan-dui-translation-pronunciation-and-example-sentences/
烦恼	fán nǎo	phiền nao	faan4 nou5	[{"meaning": "worries", "part_of_speech": "noun"}, {"meaning": "worried, troubled", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e7%83%a6%e6%81%bc-fan-nao-translation-pronunciation-and-example-sentences/
范围	fàn wéi	phạm vi	faam4 wai4	[{"meaning": "scope limit, range", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%8c%83%e5%9b%b4-fan-wei-translation-pronunciation-and-example-sentences/
翻译	fān yì	phiên dịch	faan1 jik6	[{"meaning": "translation, translator", "part_of_speech": "noun"}, {"meaning": "to translate", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%bf%bb%e8%af%91-fan-yi-translation-pronunciation-and-example-sentences/
反映	fǎn yìng	phản ứng	faan2 jing2	[{"meaning": "reflection", "part_of_speech": "noun"}, {"meaning": "to reflect, to mirror", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%8f%8d%e6%98%a0-fan-ying-translation-pronunciation-and-example-sentences/
方法	fāng fǎ	phương pháp	faat3 jik6	[{"meaning": "method, way", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%96%b9%e6%b3%95-fang-fa-translation-pronunciation-and-example-sentences/
方面	fāng miàn	phương diện	fong1 min6	[{"meaning": "aspect, respect", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%96%b9%e9%9d%a2-fang-mian-translation-pronunciation-and-example-sentences/
放弃	fàng qì	phóng tế	fong3 bei6	[{"meaning": "to give up", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%94%be%e5%bc%83-fang-qi-translation-pronunciation-and-example-sentences/
放暑假	fàng shǔ jià	phóng thử giá	fong3 syu2 gaa3	[{"meaning": "to take summer vacation", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%94%be%e6%9a%91%e5%81%87-fang-shu-jia-translation-pronunciation-and-example-sentences/
访问	fǎng wèn	phỏng vấn	fong2 man6	[{"meaning": "visit", "part_of_speech": "noun"}, {"meaning": "to visit, to interview", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%ae%bf%e9%97%ae-fang-wen-translation-pronunciation-and-example-sentences/
方向	fāng xiàng	phương hướng	fong1 hoeng3	[{"meaning": "direction, orientation", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%96%b9%e5%90%91-fang-xiang-translation-pronunciation-and-example-sentences/
份	fèn	phần	fan6	[{"meaning": "part, share, portion, copy", "part_of_speech": "noun"}, {"meaning": "for newspaper, papers, reports, contracts", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e4%bb%bd-fen-translation-pronunciation-and-example-sentences/
分之	fēn zhī	phần chi	fan1 zi1	[{"meaning": "used for fractions and percentages", "part_of_speech": "expression"}]	https://wohok.com/dict/%e5%88%86%e4%b9%8b-fen-zhi-translation-pronunciation-and-example-sentences/
丰富	fēng fù	phong phú	fung1 fu3	[{"meaning": "rich, plentiful", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e4%b8%b0%e5%af%8c-feng-fu-translation-pronunciation-and-example-sentences/
风景	fēng jǐng	phong cảnh	fung1 ging2	[{"meaning": "scenery, landscape", "part_of_speech": "noun"}]	https://wohok.com/dict/%e9%a3%8e%e6%99%af-feng-jing-translation-pronunciation-and-example-sentences/
否则	fǒu zé	phủ tứ	fai6 zi6	[{"meaning": "otherwise", "part_of_speech": "conjunction"}]	https://wohok.com/dict/%e5%90%a6%e5%88%99-fou-ze-translation-pronunciation-and-example-sentences/
富	fù	phú	fu3	[{"meaning": "rich", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%af%8c-fu-translation-pronunciation-and-example-sentences/
符合	fú hé	phù hợp	fu4 hap6	[{"meaning": "to accord with, to conform to", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%ac%a6%e5%90%88-fu-he-translation-pronunciation-and-example-sentences/
父亲	fù qīn	phụ thân	fu6 can1	[{"meaning": "father", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%88%b6%e4%ba%b2-fu-qin-translation-pronunciation-and-example-sentences/
复印	fù yìn	phục ấn	fuk6 jan2	[{"meaning": "to (photo)copy", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%a4%8d%e5%8d%b0-fu-yin-translation-pronunciation-and-example-sentences/
复杂	fù zá	phức tạp	fuk6 zaap6	[{"meaning": "complicated, complex", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%a4%8d%e6%9d%82-fu-za-translation-pronunciation-and-example-sentences/
负责	fù zé	phụ trách	fu6 zaak6	[{"meaning": "to be responsible for", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%b4%9f%e8%b4%a3-fu-ze-translation-pronunciation-and-example-sentences/
改变	gǎi biàn	cải biến	goi2 bin3	[{"meaning": "to change", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%94%b9%e5%8f%98-gai-bian-translation-pronunciation-and-example-sentences/
干	gàn	khô	gon1	[{"meaning": "to do, to work", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%b9%b2-gan-gan-translation-pronunciation-and-example-sentences/
干杯	gān bēi	khô bôi	gon1 bui1	[{"meaning": "Cheers!", "part_of_speech": "expression"}]	https://wohok.com/dict/%e5%b9%b2%e6%9d%af-gan-bei-translation-pronunciation-and-example-sentences/
感动	gǎn dòng	cảm động	gam2 dung6	[{"meaning": "to move sb., to be moved", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%84%9f%e5%8a%a8-gan-dong-translation-pronunciation-and-example-sentences/
感觉	gǎn jué	cảm giác	gam2 gok3	[{"meaning": "feeling, sense", "part_of_speech": "noun"}, {"meaning": "to feel", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%84%9f%e8%a7%89-gan-jue-translation-pronunciation-and-example-sentences/
感情	gǎn qíng	cảm tình	gam2 cing4	[{"meaning": "emotion, feeling", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%84%9f%e6%83%85-gan-qing-translation-pronunciation-and-example-sentences/
感谢	gǎn xiè	cảm tạ	gam2 hat6	[{"meaning": "gratitude", "part_of_speech": "noun"}, {"meaning": "to thank, to be grateful", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%84%9f%e8%b0%a2-gan-xie-translation-pronunciation-and-example-sentences/
干燥	gān zào	khô táo	gon1 zou2	[{"meaning": "dry", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%b9%b2%e7%87%a5-gan-zao-translation-pronunciation-and-example-sentences/
刚刚	gāng gāng	cương cương	gong1 gong1	[{"meaning": "just now, a moment ago", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e5%88%9a%e5%88%9a-gang-gang-translation-pronunciation-and-example-sentences/
高级	gāo jí	cao cấp	gou1 zaap6	[{"meaning": "high level, high grade, advanced", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e9%ab%98%e7%ba%a7-gao-ji-translation-pronunciation-and-example-sentences/
各	gè	các	gok3	[{"meaning": "each, every", "part_of_speech": "pronoun"}]	https://wohok.com/dict/%e5%90%84-ge-translation-pronunciation-and-example-sentences/
个子	gè zi	cá tí	go3 zi2	[{"meaning": "height, stature", "part_of_speech": "noun"}]	https://wohok.com/dict/%e4%b8%aa%e5%ad%90-ge-zi-translation-pronunciation-and-example-sentences/
工具	gōng jù	công cụ	gung1 zeoi6	[{"meaning": "tool, utensil", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%b7%a5%e5%85%b7-gong-ju-translation-pronunciation-and-example-sentences/
公里	gōng lǐ	công lý	gung1 lei5	[{"meaning": "kilometer", "part_of_speech": "noun"}, {"meaning": "for km", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e5%85%ac%e9%87%8c-gong-li-translation-pronunciation-and-example-sentences/
共同	gòng tóng	cộng đồng	gung6 tung4	[{"meaning": "common, joint, together", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%85%b1%e5%90%8c-gong-tong-translation-pronunciation-and-example-sentences/
工资	gōng zī	công tử	gung1 zai1	[{"meaning": "salary, wages", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%b7%a5%e8%b5%84-gong-zi-translation-pronunciation-and-example-sentences/
够	gòu	cúc	gau3	[{"meaning": "to reach, to be enough", "part_of_speech": "verb"}, {"meaning": "be enough", "part_of_speech": "adjective"}, {"meaning": "enough", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e5%a4%9f-gou-translation-pronunciation-and-example-sentences/
购物	gòu wù	cấu vật	kau3 mat6	[{"meaning": "to go shopping", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%b4%ad%e7%89%a9-gou-wu-translation-pronunciation-and-example-sentences/
孤单	gū dān	cô đơn	gu1 dan1	[{"meaning": "lone, lonely", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%ad%a4%e5%8d%95-gu-dan-translation-pronunciation-and-example-sentences/
估计	gū jì	cơ kế	gu2 gai3	[{"meaning": "to estimate", "part_of_speech": "verb"}]	https://wohok.com/dict/%e4%bc%b0%e8%ae%a1-gu-ji-translation-pronunciation-and-example-sentences/
顾客	gù kè	cố khách	gu3 haak6	[{"meaning": "client, customer", "part_of_speech": "noun"}]	https://wohok.com/dict/%e9%a1%be%e5%ae%a2-gu-ke-translation-pronunciation-and-example-sentences/
鼓励	gǔ lì	cỗ lực	gu2 lai6	[{"meaning": "to encourage, to urge", "part_of_speech": "verb"}]	https://wohok.com/dict/%e9%bc%93%e5%8a%b1-gu-li-translation-pronunciation-and-example-sentences/
故意	gù yì	cố ý	gu3 ji3	[{"meaning": "on purpose, deliberately", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e6%95%85%e6%84%8f-gu-yi-translation-pronunciation-and-example-sentences/
鼓掌	gǔ zhǎng	cỗ chưởng	gu2 zoeng6	[{"meaning": "to applaud", "part_of_speech": "verb"}]	https://wohok.com/dict/%e9%bc%93%e6%8e%8c-gu-zhang-translation-pronunciation-and-example-sentences/
挂	guà	quải	gwaa3	[{"meaning": "to hang (up)", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%8c%82-gua-translation-pronunciation-and-example-sentences/
关键	guān jiàn	quan điểm	gwaan1 gin3	[{"meaning": "key, crucial point", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%85%b3%e9%94%ae-guan-jian-translation-pronunciation-and-example-sentences/
管理	guǎn lǐ	quản lý	gun2 lei5	[{"meaning": "management", "part_of_speech": "noun"}, {"meaning": "to manage", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%ae%a1%e7%90%86-guan-li-translation-pronunciation-and-example-sentences/
观众	guān zhòng	quan chứng	gun1 zung2	[{"meaning": "audience, spectators", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%a7%82%e4%bc%97-guan-zhong-translation-pronunciation-and-example-sentences/
逛	guàng	quanh	gwong2	[{"meaning": "to stroll", "part_of_speech": "verb"}]	https://wohok.com/dict/%e9%80%9b-guang-translation-pronunciation-and-example-sentences/
光	guāng	quang	gwong1	[{"meaning": "light, ray", "part_of_speech": "noun"}, {"meaning": "naked", "part_of_speech": "adjective"}, {"meaning": "only, merely", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e5%85%89-guang-translation-pronunciation-and-example-sentences/
广播	guǎng bō	quảng báo	gwong2 bo3	[{"meaning": "broadcasting", "part_of_speech": "noun"}, {"meaning": "to broadcast", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%b9%bf%e6%92%ad-guang-bo-translation-pronunciation-and-example-sentences/
广告	guǎng gào	quảng cáo	gwong2 gou3	[{"meaning": "advertisement", "part_of_speech": "noun"}, {"meaning": "to advertise", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%b9%bf%e5%91%8a-guang-gao-translation-pronunciation-and-example-sentences/
规定	guī dìng	quy định	kwai1 ding6	[{"meaning": "regulations, provision", "part_of_speech": "noun"}, {"meaning": "to fix, to stipulate", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%a7%84%e5%ae%9a-gui-ding-translation-pronunciation-and-example-sentences/
过	guò	quá	gwo3	[{"meaning": "to pass, to cross, to spend time", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%bf%87-guo-translation-pronunciation-and-example-sentences/
过程	guò chéng	quá trình	gwo3 cing4	[{"meaning": "process, course", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%bf%87%e7%a8%8b-guo-cheng-translation-pronunciation-and-example-sentences/
国际	guó jì	quốc tế	gwok3 zik6	[{"meaning": "international", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%9b%bd%e9%99%85-guo-ji-translation-pronunciation-and-example-sentences/
果然	guǒ rán	quả nhiên	gwo2 jin4	[{"meaning": "as expected", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e6%9e%9c%e7%84%b6-guo-ran-translation-pronunciation-and-example-sentences/
害羞	hài xiū	hại hiu	hoi6 sau1	[{"meaning": "shy", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%ae%b3%e7%be%9e-hai-xiu-translation-pronunciation-and-example-sentences/
海洋	hǎi yáng	hải dương	hoi2 joeng4	[{"meaning": "ocean", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%b5%b7%e6%b4%8b-hai-yang-translation-pronunciation-and-example-sentences/
汗	hàn	hàn	hon6	[{"meaning": "sweat", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%b1%97-han-translation-pronunciation-and-example-sentences/
寒假	hán jià	hàn giáp	hon4 gaa3	[{"meaning": "winter vacation", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%af%92%e5%81%87-han-jia-translation-pronunciation-and-example-sentences/
航班	háng bān	hàng phản	hong4 faan6	[{"meaning": "scheduled flight, flight number", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%88%aa%e7%8f%ad-hang-ban-translation-pronunciation-and-example-sentences/
好处	hǎo chu	hảo hữu	hou2 syu6	[{"meaning": "benefit, advantage", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%a5%bd%e5%a4%84-hao-chu-translation-pronunciation-and-example-sentences/
号码	hào mǎ	hiệu mạc	hou6 maa5	[{"meaning": "number", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%8f%b7%e7%a0%81-hao-ma-translation-pronunciation-and-example-sentences/
好像	hǎo xiàng	hảo hống	hou2 hoeng6	[{"meaning": "to seem, to be like, look like", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%a5%bd%e5%83%8f-hao-xiang-translation-pronunciation-and-example-sentences/
合格	hé gé	hợp khí	hap6 gwai3	[{"meaning": "qualified", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%90%88%e6%a0%bc-he-ge-translation-pronunciation-and-example-sentences/
合适	hé shì	hợp thích	hap6 sik1	[{"meaning": "suitable, appropriate", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%90%88%e9%80%82-he-shi-translation-pronunciation-and-example-sentences/
盒子	hé zi	hệ tử	hap6 zi2	[{"meaning": "box, case", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%9b%92%e5%ad%90-he-zi-translation-pronunciation-and-example-sentences/
厚	hòu	hậu	hau5	[{"meaning": "thick, deep", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%8e%9a-hou-translation-pronunciation-and-example-sentences/
后悔	hòu huǐ	hậu hối	hau6 fui3	[{"meaning": "to regret, to repent", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%90%8e%e6%82%94-hou-hui-translation-pronunciation-and-example-sentences/
后来	hòu lái	hậu lai	hau6 lai4	[{"meaning": "afterwards, later", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e5%90%8e%e6%9d%a5-hou-lai-translation-pronunciation-and-example-sentences/
猴子	hóu zi	hầu tử	hau4 zi2	[{"meaning": "monkey", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%8c%b4%e5%ad%90-hou-zi-translation-pronunciation-and-example-sentences/
忽然	hū rán	hốt nhiên	fat1 nin4	[{"meaning": "suddenly", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e5%bf%bd%e7%84%b6-hu-ran-translation-pronunciation-and-example-sentences/
护士	hù shi	hộ y tá	wu6 si6	[{"meaning": "nurse", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%8a%a4%e5%a3%ab-hu-shi-translation-pronunciation-and-example-sentences/
互相	hù xiāng	hỗ tương	wu4 soeng1	[{"meaning": "each other", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e4%ba%92%e7%9b%b8-hu-xiang-translation-pronunciation-and-example-sentences/
怀疑	huái yí	hoài nghi	waai4 ji4	[{"meaning": "doubt, suspicion", "part_of_speech": "noun"}, {"meaning": "to doubt, to suspect", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%80%80%e7%96%91-huai-yi-translation-pronunciation-and-example-sentences/
回忆	huí yì	hồi ức	wui4 wik6	[{"meaning": "recollection", "part_of_speech": "noun"}, {"meaning": "to recall, to recollect", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%9b%9e%e5%bf%86-hui-yi-translation-pronunciation-and-example-sentences/
火	huǒ	hỏa	fo2	[{"meaning": "fire", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%81%ab-huo-translation-pronunciation-and-example-sentences/
获得	huò dé	hoạt đắc	wut6 dak1	[{"meaning": "to obtain, to acquire", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%8e%b7%e5%be%97-huo-de-translation-pronunciation-and-example-sentences/
活动	huó dòng	hoạt động	wut6 dung6	[{"meaning": "activity", "part_of_speech": "noun"}, {"meaning": "to move about", "part_of_speech": "verb"}, {"meaning": "active", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e6%b4%bb%e5%8a%a8-huo-dong-translation-pronunciation-and-example-sentences/
活泼	huó pō	hoạt phách	wut6 pok3	[{"meaning": "lively, vivid", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e6%b4%bb%e6%b3%bc-huo-po-translation-pronunciation-and-example-sentences/
寄	jì	ký	gei3	[{"meaning": "to send, to mail", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%af%84-ji-translation-pronunciation-and-example-sentences/
基础	jī chǔ	cơ sở	gei1 co3	[{"meaning": "base, foundation, basis", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%9f%ba%e7%a1%80-ji-chu-translation-pronunciation-and-example-sentences/
激动	jī dòng	kích động	gik1 dung6	[{"meaning": "to excite", "part_of_speech": "verb"}, {"meaning": "exciting", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e6%bf%80%e5%8a%a8-ji-dong-translation-pronunciation-and-example-sentences/
集合	jí hé	tập hợp	zaap6 hap6	[{"meaning": "congregation", "part_of_speech": "noun"}, {"meaning": "to gather, to assemble", "part_of_speech": "verb"}]	https://wohok.com/dict/%e9%9b%86%e5%90%88-ji-he-translation-pronunciation-and-example-sentences/
计划	jì huà	kế hoạch	gai3 waak6	[{"meaning": "plan, project, program", "part_of_speech": "noun"}, {"meaning": "to plan", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%ae%a1%e5%88%92-ji-hua-translation-pronunciation-and-example-sentences/
积极	jī jí	tích cực	zik1 gik6	[{"meaning": "positive, active", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e7%a7%af%e6%9e%81-ji-ji-translation-pronunciation-and-example-sentences/
积累	jī lěi	tích luỹ	zik1 lui5	[{"meaning": "accumulation", "part_of_speech": "noun"}, {"meaning": "to accumulate", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%a7%af%e7%b4%af-ji-lei-translation-pronunciation-and-example-sentences/
极其	jí qí	cực kỳ	gik6 kei4	[{"meaning": "extremely", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e6%9e%81%e5%85%b6-ji-qi-translation-pronunciation-and-example-sentences/
既然	jì rán	kỳ nhiên	gei3 jin4	[{"meaning": "this being the case", "part_of_speech": "conjunction"}]	https://wohok.com/dict/%e6%97%a2%e7%84%b6-ji-ran-translation-pronunciation-and-example-sentences/
及时	jí shí	cập thời	kap6 si4	[{"meaning": "in time", "part_of_speech": "adjective"}, {"meaning": "without delay", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e5%8f%8a%e6%97%b6-ji-shi-translation-pronunciation-and-example-sentences/
即使	jí shǐ	tức thì	zik1 si2	[{"meaning": "even if, even thoug", "part_of_speech": "conjunction"}]	https://wohok.com/dict/%e5%8d%b3%e4%bd%bf-ji-shi-translation-pronunciation-and-example-sentences/
技术	jì shù	kỹ thuật	gei6 seot6	[{"meaning": "technology, skill, technique", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%8a%80%e6%9c%af-ji-shu-translation-pronunciation-and-example-sentences/
继续	jì xù	kế tục	gai3 zuk6	[{"meaning": "continuation", "part_of_speech": "noun"}, {"meaning": "to continue, to go on", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%bb%a7%e7%bb%ad-ji-xu-translation-pronunciation-and-example-sentences/
记者	jì zhě	ký giả	gei3 ze2	[{"meaning": "reporter, journalist", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%ae%b0%e8%80%85-ji-zhe-translation-pronunciation-and-example-sentences/
假	jiǎ	giả	gaa3	[{"meaning": "fake, false", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%81%87-jia-translation-pronunciation-and-example-sentences/
加班	jiā bān	gia phán	gaa1 baan1	[{"meaning": "to work overtime", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%8a%a0%e7%8f%ad-jia-ban-translation-pronunciation-and-example-sentences/
价格	jià gé	giá cả	gaa3 gei2	[{"meaning": "price", "part_of_speech": "noun"}]	https://wohok.com/dict/%e4%bb%b7%e6%a0%bc-jia-ge-translation-pronunciation-and-example-sentences/
家具	jiā jù	gia cụ	gaa1 geoi1	[{"meaning": "furniture", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%ae%b6%e5%85%b7-jia-ju-translation-pronunciation-and-example-sentences/
加油站	jiā yóu zhàn	gia dầu trạm	gaa1 jau4 zaam6	[{"meaning": "gas station", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%8a%a0%e6%b2%b9%e7%ab%99-jia-you-zhan-translation-pronunciation-and-example-sentences/
坚持	jiān chí	kiên trì	gin1 ci6	[{"meaning": "to stick to, to persist in, to insist on", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%9d%9a%e6%8c%81-jian-chi-translation-pronunciation-and-example-sentences/
减肥	jiǎn féi	giảm phì	gaam2 fei4	[{"meaning": "to lose weight", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%87%8f%e8%82%a5-jian-fei-translation-pronunciation-and-example-sentences/
减少	jiǎn shǎo	giảm thiểu	gaam2 siu2	[{"meaning": "to reduce, to decrease", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%87%8f%e5%b0%91-jian-shao-translation-pronunciation-and-example-sentences/
降低	jiàng dī	giảm đệ	gong2 dai1	[{"meaning": "to reduce, to lower", "part_of_speech": "verb"}]	https://wohok.com/dict/%e9%99%8d%e4%bd%8e-jiang-di-translation-pronunciation-and-example-sentences/
奖金	jiǎng jīn	giải kim	zoeng2 gam1	[{"meaning": "premium, award money, bonus", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%a5%96%e9%87%91-jiang-jin-translation-pronunciation-and-example-sentences/
将来	jiāng lái	tương lai	zoeng1 loi4	[{"meaning": "future", "part_of_speech": "noun"}, {"meaning": "in the future", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e5%b0%86%e6%9d%a5-jiang-lai-translation-pronunciation-and-example-sentences/
交	jiāo	giao	gaau1	[{"meaning": "to hand over, to intersect, to associate with", "part_of_speech": "verb"}]	https://wohok.com/dict/%e4%ba%a4-jiao-translation-pronunciation-and-example-sentences/
骄傲	jiāo ào	kiêu ngạo	giu1 ngou6	[{"meaning": "to be proud of sth.", "part_of_speech": "verb"}, {"meaning": "arrogant, conceited", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e9%aa%84%e5%82%b2-jiao-ao-translation-pronunciation-and-example-sentences/
交流	jiāo liú	giao lưu	gaau1 lau4	[{"meaning": "communication, exchange", "part_of_speech": "noun"}, {"meaning": "to exchange, to communicate", "part_of_speech": "verb"}]	https://wohok.com/dict/%e4%ba%a4%e6%b5%81-jiao-liu-translation-pronunciation-and-example-sentences/
教授	jiào shòu	giáo sư	gaau3 syu1	[{"meaning": "professor", "part_of_speech": "noun"}, {"meaning": "to instruct, to lecture on", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%95%99%e6%8e%88-jiao-shou-translation-pronunciation-and-example-sentences/
交通	jiāo tōng	giao thông	gaau1 tung1	[{"meaning": "traffic", "part_of_speech": "noun"}]	https://wohok.com/dict/%e4%ba%a4%e9%80%9a-jiao-tong-translation-pronunciation-and-example-sentences/
教育	jiào yù	giáo dục	gaau3 duk6	[{"meaning": "educatione", "part_of_speech": "noun"}, {"meaning": "to teach", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%95%99%e8%82%b2-jiao-yu-translation-pronunciation-and-example-sentences/
饺子	jiǎo zi	giá đản	gaau2 zi2	[{"meaning": "dumpling", "part_of_speech": "noun"}]	https://wohok.com/dict/%e9%a5%ba%e5%ad%90-jiao-zi-translation-pronunciation-and-example-sentences/
结果	jié guǒ	kết quả	gai3 zyut3	[{"meaning": "result, outcome", "part_of_speech": "noun"}, {"meaning": "finally, at last", "part_of_speech": "conjunction"}]	https://wohok.com/dict/%e7%bb%93%e6%9e%9c-jie-guo-translation-pronunciation-and-example-sentences/
解释	jiě shì	giải thích	gaai2 sik1	[{"meaning": "explanation", "part_of_speech": "noun"}, {"meaning": "to explain", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%a7%a3%e9%87%8a-jie-shi-translation-pronunciation-and-example-sentences/
接受	jiē shòu	tiếp thụ	zip3 saup6	[{"meaning": "to accept, to receive", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%8e%a5%e5%8f%97-jie-shou-translation-pronunciation-and-example-sentences/
节约	jié yuē	tiết ước	zit3 jok3	[{"meaning": "to economize, to conserve", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%8a%82%e7%ba%a6-jie-yue-translation-pronunciation-and-example-sentences/
尽管	jǐn guǎn	tận quan	zeon6 gun2	[{"meaning": "unhesitatingly", "part_of_speech": "adverb"}, {"meaning": "in spite of, although, despite", "part_of_speech": "conjunction"}]	https://wohok.com/dict/%e5%b0%bd%e7%ae%a1-jin-guan-translation-pronunciation-and-example-sentences/
进行	jìn xíng	tiến hành	zing3 hang4	[{"meaning": "to be in progress, be underway", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%bf%9b%e8%a1%8c-jin-xing-translation-pronunciation-and-example-sentences/
紧张	jǐn zhāng	cấn trạng	gan2 zoeng1	[{"meaning": "nervous, tense, in short supply", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e7%b4%a7%e5%bc%a0-jin-zhang-translation-pronunciation-and-example-sentences/
禁止	jìn zhǐ	cấm chỉ	gam3 zi6	[{"meaning": "to prohibit, to forbid, to ban", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%a6%81%e6%ad%a2-jin-zhi-translation-pronunciation-and-example-sentences/
精彩	jīng cǎi	tinh xúy	zing1 coi2	[{"meaning": "brilliant, excellent, splendid", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e7%b2%be%e5%bd%a9-jing-cai-translation-pronunciation-and-example-sentences/
警察	jǐng chá	cảnh sát	ging2 caat3	[{"meaning": "police", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%ad%a6%e5%af%9f-jing-cha-translation-pronunciation-and-example-sentences/
经济	jīng jì	kinh tế	ging1 gei3	[{"meaning": "economy", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%bb%8f%e6%b5%8e-jing-ji-translation-pronunciation-and-example-sentences/
京剧	jīng jù	kinh kịch	ging1 kek6	[{"meaning": "Beijing Opera", "part_of_speech": "noun"}]	https://wohok.com/dict/%e4%ba%ac%e5%89%a7-jing-ju-translation-pronunciation-and-example-sentences/
经历	jīng lì	kinh lịch	ging1 lik6	[{"meaning": "experience", "part_of_speech": "noun"}, {"meaning": "to experience", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%bb%8f%e5%8e%86-jing-li-translation-pronunciation-and-example-sentences/
竟然	jìng rán	kinh nhiên	ging2 jin4	[{"meaning": "unexpectedly", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e7%ab%9f%e7%84%b6-jing-ran-translation-pronunciation-and-example-sentences/
精神	jīng shén	tinh thần	zing1 san4	[{"meaning": "spirit, mind", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%b2%be%e7%a5%9e-jing-shen-translation-pronunciation-and-example-sentences/
经验	jīng yàn	kinh nghiệm	ging1 jim6	[{"meaning": "experience", "part_of_speech": "noun"}, {"meaning": "to experience", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%bb%8f%e9%aa%8c-jing-yan-translation-pronunciation-and-example-sentences/
竞争	jìng zhēng	cạnh tranh	ging1 zang1	[{"meaning": "competition", "part_of_speech": "noun"}, {"meaning": "to compete", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%ab%9e%e4%ba%89-jing-zheng-translation-pronunciation-and-example-sentences/
镜子	jìng zi	kinh tử	geng3 zi2	[{"meaning": "mirror", "part_of_speech": "noun"}]	https://wohok.com/dict/%e9%95%9c%e5%ad%90-jing-zi-translation-pronunciation-and-example-sentences/
究竟	jiū jìng	cứu kỳ	gau2 ging2	[{"meaning": "after all, actually", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e7%a9%b6%e7%ab%9f-jiu-jing-translation-pronunciation-and-example-sentences/
举办	jǔ bàn	cử ban	geoi2 baan6	[{"meaning": "to hold, to conduct", "part_of_speech": "verb"}]	https://wohok.com/dict/%e4%b8%be%e5%8a%9e-ju-ban-translation-pronunciation-and-example-sentences/
拒绝	jù jué	từ túy	keoi5 zeoi6	[{"meaning": "to refuse, to decline", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%8b%92%e7%bb%9d-ju-jue-translation-pronunciation-and-example-sentences/
距离	jù lí	cự li	keoi4 lei5	[{"meaning": "distance", "part_of_speech": "noun"}, {"meaning": "to be apart from", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%b7%9d%e7%a6%bb-ju-li-translation-pronunciation-and-example-sentences/
开玩笑	kāi wán xiào	khai vui tiếu	hoi1 wun6 gaa3	[{"meaning": "to play a joke, to make fun of", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%bc%80%e7%8e%a9%e7%ac%91-kai-wan-xiao-translation-pronunciation-and-example-sentences/
看法	kàn fǎ	khán pháp	hon3 faat3	[{"meaning": "view, opinion", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%9c%8b%e6%b3%95-kan-fa-translation-pronunciation-and-example-sentences/
考虑	kǎo lǜ	khảo lượng	haau2 leot6	[{"meaning": "consideration", "part_of_speech": "noun"}, {"meaning": "to think over, to consider", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%80%83%e8%99%91-kao-lu-translation-pronunciation-and-example-sentences/
棵	kē	cơ	fo1	[{"meaning": "for trees, plants, etc.", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e6%a3%b5-ke-translation-pronunciation-and-example-sentences/
可怜	kě lián	khả liên	ho2 lin4	[{"meaning": "pitiful, poor, pathetic", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%8f%af%e6%80%9c-ke-lian-translation-pronunciation-and-example-sentences/
可是	kě shì	khả thị	ho2 si6	[{"meaning": "but", "part_of_speech": "conjunction"}]	https://wohok.com/dict/%e5%8f%af%e6%98%af-ke-shi-translation-pronunciation-and-example-sentences/
咳嗽	ké sou	khái tấu	hai3 so2	[{"meaning": "cough", "part_of_speech": "noun"}, {"meaning": "to cough", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%92%b3%e5%97%bd-ke-sou-translation-pronunciation-and-example-sentences/
可惜	kě xī	khả tiếc	ho2 sik1	[{"meaning": "it is a pity, what a pity", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%8f%af%e6%83%9c-ke-xi-translation-pronunciation-and-example-sentences/
科学	kē xué	kỹ học	fo1 hok6	[{"meaning": "science", "part_of_speech": "noun"}, {"meaning": "scientific", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e7%a7%91%e5%ad%a6-ke-xue-translation-pronunciation-and-example-sentences/
肯定	kěn dìng	khẳng định	hang2 ding6	[{"meaning": "to affirm, to confirm", "part_of_speech": "verb"}, {"meaning": "certain, definite", "part_of_speech": "adjective"}, {"meaning": "certainly, definitely", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e8%82%af%e5%ae%9a-ken-ding-translation-pronunciation-and-example-sentences/
恐怕	kǒng pà	khủng phạm	hung2 fat3	[{"meaning": "I’m afraid that", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e6%81%90%e6%80%95-kong-pa-translation-pronunciation-and-example-sentences/
空气	kōng qì	không khí	hung1 hei3	[{"meaning": "air, atmosphere", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%a9%ba%e6%b0%94-kong-qi-translation-pronunciation-and-example-sentences/
苦	kǔ	khổ	fu2	[{"meaning": "bitter, miserable", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e8%8b%a6-ku-translation-pronunciation-and-example-sentences/
宽	kuān	khoan	fun1	[{"meaning": "wide, broad", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%ae%bd-kuan-translation-pronunciation-and-example-sentences/
困	kùn	khốn	kwan3	[{"meaning": "sleepy, tired", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%9b%b0-kun-translation-pronunciation-and-example-sentences/
困难	kùn nan	khốn nan	kwan3 naan4	[{"meaning": "difficulty, problem", "part_of_speech": "noun"}, {"meaning": "difficult", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%9b%b0%e9%9a%be-kun-nan-translation-pronunciation-and-example-sentences/
扩大	kuò dà	khuếch đại	kong3 daai6	[{"meaning": "to expand, to enlarge", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%89%a9%e5%a4%a7-kuo-da-translation-pronunciation-and-example-sentences/
辣	là	lạt	laat6	[{"meaning": "spicy", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e8%be%a3-la-translation-pronunciation-and-example-sentences/
拉	lā	lạc	laai1	[{"meaning": "to pull", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%8b%89-la-translation-pronunciation-and-example-sentences/
垃圾桶	lā jī tǒng	lạp ti tồng	laap6 sap3 tung1	[{"meaning": "rubbish bin", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%9e%83%e5%9c%be%e6%a1%b6-la-ji-tong-translation-pronunciation-and-example-sentences/
来不及	lái bu jí	lai bất cập	loi4 bat1 gap1	[{"meaning": "there’s not enough time", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%9d%a5%e4%b8%8d%e5%8f%8a-lai-bu-ji-translation-pronunciation-and-example-sentences/
来得及	lái de jí	lai đắc cập	loi4 dak1 gap1	[{"meaning": "there is still time to do sth.", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%9d%a5%e5%be%97%e5%8f%8a-lai-de-ji-translation-pronunciation-and-example-sentences/
懒	lǎn	lãn	laan5	[{"meaning": "lazy", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e6%87%92-lan-translation-pronunciation-and-example-sentences/
浪费	làng fèi	lãn phí	long6 fai3	[{"meaning": "to waste", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%b5%aa%e8%b4%b9-lang-fei-translation-pronunciation-and-example-sentences/
浪漫	làng màn	lãn mạn	long6 maan6	[{"meaning": "romantic", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e6%b5%aa%e6%bc%ab-lang-man-translation-pronunciation-and-example-sentences/
老虎	lǎo hǔ	lão hổ	lou5 fu2	[{"meaning": "tiger", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%80%81%e8%99%8e-lao-hu-translation-pronunciation-and-example-sentences/
冷静	lěng jìng	lãnh tĩnh	laang5 zing6	[{"meaning": "calm, cool-headed, quite", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%86%b7%e9%9d%99-leng-jing-translation-pronunciation-and-example-sentences/
理发	lǐ fà	lý phát	lei5 faat3	[{"meaning": "to have a haircut", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%90%86%e5%8f%91-li-fa-translation-pronunciation-and-example-sentences/
厉害	lì hai	lợi hại	lai6 hoi6	[{"meaning": "awesome, terrible, strict, severe, difficult to deal with", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%8e%89%e5%ae%b3-li-hai-translation-pronunciation-and-example-sentences/
理解	lǐ jiě	lý giải	lei5 gaai2	[{"meaning": "comprehension, understanding", "part_of_speech": "noun"}, {"meaning": "to comprehend, to understand", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%90%86%e8%a7%a3-li-jie-translation-pronunciation-and-example-sentences/
礼貌	lǐ mào	lễ mạo	lai5 mou6	[{"meaning": "politeness, courtesy", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%a4%bc%e8%b2%8c-li-mao-translation-pronunciation-and-example-sentences/
力气	lì qi	lực khí	lik6 hei3	[{"meaning": "strength", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%8a%9b%e6%b0%94-li-qi-translation-pronunciation-and-example-sentences/
例如	lì rú	lựa lự	lai4 lai6	[{"meaning": "for example", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e4%be%8b%e5%a6%82-li-ru-translation-pronunciation-and-example-sentences/
理想	lǐ xiǎng	lý tưởng	lei5 soeng2	[{"meaning": "ideal, dream", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%90%86%e6%83%b3-li-xiang-translation-pronunciation-and-example-sentences/
俩	liǎ	lưỡng	loeng5	[{"meaning": "two (people)", "part_of_speech": "number"}]	https://wohok.com/dict/%e4%bf%a9-lia-translation-pronunciation-and-example-sentences/
连	lián	liên	lin4	[{"meaning": "to link, to join, to connect", "part_of_speech": "verb"}, {"meaning": "even", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e8%bf%9e-lian-translation-pronunciation-and-example-sentences/
联系	lián xì	liên hệ	lin4 hai6	[{"meaning": "contact, connection", "part_of_speech": "noun"}, {"meaning": "to contact", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%81%94%e7%b3%bb-lian-xi-translation-pronunciation-and-example-sentences/
亮	liàng	lương	loeng6	[{"meaning": "to shine, to show, to reveal", "part_of_speech": "verb"}, {"meaning": "bright, clear, shiny", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e4%ba%ae-liang-translation-pronunciation-and-example-sentences/
凉快	liáng kuai	lương khoái	loeng4 faai3	[{"meaning": "pleasantly cool", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%87%89%e5%bf%ab-liang-kuai-translation-pronunciation-and-example-sentences/
聊天	liáo tiān	liêu thiên	liu4 tin1	[{"meaning": "to chat", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%81%8a%e5%a4%a9-liao-tian-translation-pronunciation-and-example-sentences/
另外	lìng wài	lẽ thải	ling6 ngoi6	[{"meaning": "in addition, morover, furthermore", "part_of_speech": "conjunction"}]	https://wohok.com/dict/%e5%8f%a6%e5%a4%96-ling-wai-translation-pronunciation-and-example-sentences/
留	liú	lưu	lau4	[{"meaning": "to keep, to remain, to stay, to leave (a message, etc.)", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%95%99-liu-translation-pronunciation-and-example-sentences/
流泪	liú lèi	lưu lệ	lau4 lip6	[{"meaning": "to shed tears", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%b5%81%e6%b3%aa-liu-lei-translation-pronunciation-and-example-sentences/
流利	liú lì	lưu lợi	lau4 lei6	[{"meaning": "fluent", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e6%b5%81%e5%88%a9-liu-li-translation-pronunciation-and-example-sentences/
流行	liú xíng	lưu hành	lau4 hang4	[{"meaning": "to spread", "part_of_speech": "verb"}, {"meaning": "popular, fashionable", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e6%b5%81%e8%a1%8c-liu-xing-translation-pronunciation-and-example-sentences/
留学	liú xué	lưu học	lau4 hok6	[{"meaning": "to study abroad", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%95%99%e5%ad%a6-liu-xue-translation-pronunciation-and-example-sentences/
律师	lǜ shī	luật sư	leot6 si1	[{"meaning": "lawyer", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%be%8b%e5%b8%88-lu-shi-translation-pronunciation-and-example-sentences/
乱	luàn	loạn	lyun6	[{"meaning": "disorder", "part_of_speech": "noun"}, {"meaning": "to cause disorder", "part_of_speech": "verb"}, {"meaning": "in a mess, confused", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e4%b9%b1-luan-translation-pronunciation-and-example-sentences/
麻烦	má fan	ma phiền	maa4 faan4	[{"meaning": "to trouble sb.", "part_of_speech": "verb"}, {"meaning": "troublesome", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e9%ba%bb%e7%83%a6-ma-fan-translation-pronunciation-and-example-sentences/
马虎	mǎ hu	mã hỗ	maa5 fu2	[{"meaning": "careless, negligent, casual", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e9%a9%ac%e8%99%8e-ma-hu-translation-pronunciation-and-example-sentences/
满	mǎn	mãn	mun5	[{"meaning": "to fill, to satisfy", "part_of_speech": "verb"}, {"meaning": "full, satisfied", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e6%bb%a1-man-translation-pronunciation-and-example-sentences/
毛巾	máo jīn	mao giấn	mou4 gan1	[{"meaning": "towel", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%af%9b%e5%b7%be-mao-jin-translation-pronunciation-and-example-sentences/
美丽	měi lì	mỹ lệ	mei5 lai6	[{"meaning": "beautiful", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e7%be%8e%e4%b8%bd-mei-li-translation-pronunciation-and-example-sentences/
梦	mèng	mộng	mung6	[{"meaning": "dream", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%a2%a6-meng-translation-pronunciation-and-example-sentences/
密码	mì mǎ	mật mã	mi5 ma5	[{"meaning": "password", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%af%86%e7%a0%81-mi-ma-translation-pronunciation-and-example-sentences/
免费	miǎn fèi	miễn phí	min5 fai3	[{"meaning": "free (of charge)", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%85%8d%e8%b4%b9-mian-fei-translation-pronunciation-and-example-sentences/
民族	mín zú	dân tộc	man4 zuk6	[{"meaning": "nationality, ethnic group", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%b0%91%e6%97%8f-min-zu-translation-pronunciation-and-example-sentences/
目的	mù dì	mục đích	muk6 dik1	[{"meaning": "purpose, aim", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%9b%ae%e7%9a%84-mu-di-translation-pronunciation-and-example-sentences/
母亲	mǔ qīn	mẫu thân	mou5 can1	[{"meaning": "mother", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%af%8d%e4%ba%b2-mu-qin-translation-pronunciation-and-example-sentences/
耐心	nài xīn	nại tâm	noi6 sam1	[{"meaning": "patience", "part_of_speech": "noun"}, {"meaning": "patient", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e8%80%90%e5%bf%83-nai-xin-translation-pronunciation-and-example-sentences/
难道	nán dào	nan đáo	naan4 dou6	[{"meaning": "don’t tell me …, is it possible that …", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e9%9a%be%e9%81%93-nan-dao-translation-pronunciation-and-example-sentences/
难受	nán shòu	nan thử	naan4 sau6	[{"meaning": "to be difficult to bear", "part_of_speech": "verb"}]	https://wohok.com/dict/%e9%9a%be%e5%8f%97-nan-shou-translation-pronunciation-and-example-sentences/
内	nèi	nội	noi6	[{"meaning": "inside, inner", "part_of_speech": "location"}]	https://wohok.com/dict/%e5%86%85-nei-translation-pronunciation-and-example-sentences/
内容	nèi róng	nội dung	noi6 jung4	[{"meaning": "content, substance", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%86%85%e5%ae%b9-nei-rong-translation-pronunciation-and-example-sentences/
能力	néng lì	năng lực	nang4 lik6	[{"meaning": "ability, capability", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%83%bd%e5%8a%9b-neng-li-translation-pronunciation-and-example-sentences/
年龄	nián líng	niên linh	nin4 ling4	[{"meaning": "age (of a person)", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%b9%b4%e9%be%84-nian-ling-translation-pronunciation-and-example-sentences/
弄	nòng	lãng	nung6	[{"meaning": "to do, to make", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%bc%84-nong-translation-pronunciation-and-example-sentences/
农村	nóng cūn	nông thôn	nung4 cyun1	[{"meaning": "village, rural area", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%86%9c%e6%9d%91-nong-cun-translation-pronunciation-and-example-sentences/
暖和	nuǎn huo	noãn hòa	nyun5 wo1	[{"meaning": "warm", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e6%9a%96%e5%92%8c-nuan-huo-translation-pronunciation-and-example-sentences/
偶尔	ǒu ěr	ẩu nhiên	ngau6 ji5	[{"meaning": "occasionally", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e5%81%b6%e5%b0%94-ou-er-translation-pronunciation-and-example-sentences/
排列	pái liè	bài lễ	paai4 loi5	[{"meaning": "arrangement, permutation", "part_of_speech": "noun"}, {"meaning": "to arrange, to put in order", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%8e%92%e5%88%97-pai-lie-translation-pronunciation-and-example-sentences/
判断	pàn duàn	phán đoán	pun4 din6	[{"meaning": "decision, judgement", "part_of_speech": "noun"}, {"meaning": "to decide, to judge", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%88%a4%e6%96%ad-pan-duan-translation-pronunciation-and-example-sentences/
陪	péi	bảy	pui4	[{"meaning": "to accompany", "part_of_speech": "verb"}]	https://wohok.com/dict/%e9%99%aa-pei-translation-pronunciation-and-example-sentences/
皮肤	pí fū	bì phủ	pei4 fu1	[{"meaning": "skin", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%9a%ae%e8%82%a4-pi-fu-translation-pronunciation-and-example-sentences/
批评	pī píng	phê bình	pai1 ping4	[{"meaning": "criticism", "part_of_speech": "noun"}, {"meaning": "to criticize", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%89%b9%e8%af%84-pi-ping-translation-pronunciation-and-example-sentences/
脾气	pí qi	phế khí	pei4 hei3	[{"meaning": "temperament, temper", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%84%be%e6%b0%94-pi-qi-translation-pronunciation-and-example-sentences/
骗	piàn	phiễn	pin3	[{"meaning": "to cheat, to swindle", "part_of_speech": "verb"}]	https://wohok.com/dict/%e9%aa%97-pian-translation-pronunciation-and-example-sentences/
篇	piān	bản	pin1	[{"meaning": "for chapters, articles, etc.", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e7%af%87-pian-translation-pronunciation-and-example-sentences/
乒乓球	pīng pāng qiú	bình bàn cầu	ping1 pong4 kau4	[{"meaning": "table tennis", "part_of_speech": "noun"}]	https://wohok.com/dict/%e4%b9%92%e4%b9%93%e7%90%83-ping-pang-qiu-translation-pronunciation-and-example-sentences/
平时	píng shí	bình thời	ping4 si4	[{"meaning": "in peacetime", "part_of_speech": "noun"}, {"meaning": "normally", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e5%b9%b3%e6%97%b6-ping-shi-translation-pronunciation-and-example-sentences/
瓶子	píng zi	bình tử	ping4 zi2	[{"meaning": "bottle", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%93%b6%e5%ad%90-ping-zi-translation-pronunciation-and-example-sentences/
破	pò	phá	po3	[{"meaning": "to break, to destroy", "part_of_speech": "verb"}, {"meaning": "broken, damaged", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e7%a0%b4-po-translation-pronunciation-and-example-sentences/
普遍	pǔ biàn	phổ biến	pou2 pin3	[{"meaning": "universal, general", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e6%99%ae%e9%81%8d-pu-bian-translation-pronunciation-and-example-sentences/
其次	qí cì	kỳ thứ	kei4 chi6	[{"meaning": "next, secondary", "part_of_speech": "adverb"}, {"meaning": "secondly", "part_of_speech": "conjunction"}]	https://wohok.com/dict/%e5%85%b6%e6%ac%a1-qi-ci-translation-pronunciation-and-example-sentences/
起飞	qǐ fēi	khởi phôi	hei2 fei1	[{"meaning": "to take off", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%b5%b7%e9%a3%9e-qi-fei-translation-pronunciation-and-example-sentences/
气候	qì hòu	khí hậu	hei3 hau6	[{"meaning": "climate, atmosphere", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%b0%94%e5%80%99-qi-hou-translation-pronunciation-and-example-sentences/
起来	qǐ lái	khởi lai	hei2 loi4	[{"meaning": "to stand up, to get up", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%b5%b7%e6%9d%a5-qi-lai-translation-pronunciation-and-example-sentences/
其中	qí zhōng	kỳ đóng	kei4 jung1	[{"meaning": "among, in", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e5%85%b6%e4%b8%ad-qi-zhong-translation-pronunciation-and-example-sentences/
千万	qiān wàn	thiên vạn	cin1 maan6	[{"meaning": "10 million", "part_of_speech": "number"}, {"meaning": "countless, many", "part_of_speech": "adjective"}, {"meaning": "must, be sure to", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e5%8d%83%e4%b8%87-qian-wan-translation-pronunciation-and-example-sentences/
签证	qiān zhèng	thiên chứng	cin1 zing3	[{"meaning": "visa", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%ad%be%e8%af%81-qian-zheng-translation-pronunciation-and-example-sentences/
墙	qiáng	tường	coeng4	[{"meaning": "wall", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%a2%99-qiang-translation-pronunciation-and-example-sentences/
桥	qiáo	kiều	kiu4	[{"meaning": "bridge", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%a1%a5-qiao-translation-pronunciation-and-example-sentences/
敲	qiāo	khẩu	haau1	[{"meaning": "to knock", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%95%b2-qiao-translation-pronunciation-and-example-sentences/
巧克力	qiǎo kè lì	khéo khắc lợi	haau2 hak1 lik6	[{"meaning": "chocolate", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%b7%a7%e5%85%8b%e5%8a%9b-qiao-ke-li-translation-pronunciation-and-example-sentences/
亲戚	qīn qi	thân thích	can1 cai4	[{"meaning": "relatives", "part_of_speech": "noun"}]	https://wohok.com/dict/%e4%ba%b2%e6%88%9a-qin-qi-translation-pronunciation-and-example-sentences/
轻	qīng	khinh	hing1	[{"meaning": "light, small in number, unimportant", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e8%bd%bb-qing-translation-pronunciation-and-example-sentences/
请假	qǐng jià	thỉnh giả	ceng2 gaa3	[{"meaning": "to ask for leave", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%af%b7%e5%81%87-qing-jia-translation-pronunciation-and-example-sentences/
请客	qǐng kè	thỉnh khách	ceng2 haak3	[{"meaning": "to invite sb. for dinner", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%af%b7%e5%ae%a2-qing-ke-translation-pronunciation-and-example-sentences/
情况	qíng kuàng	tình huống	cing4 fong3	[{"meaning": "circumstance, situation", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%83%85%e5%86%b5-qing-kuang-translation-pronunciation-and-example-sentences/
轻松	qīng sōng	khinh tống	hing1 sung1	[{"meaning": "relaxed, easy", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e8%bd%bb%e6%9d%be-qing-song-translation-pronunciation-and-example-sentences/
穷	qióng	cùng	kung4	[{"meaning": "poor", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e7%a9%b7-qiong-translation-pronunciation-and-example-sentences/
取	qǔ	thủ	ceoi2	[{"meaning": "to take, to get", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%8f%96-qu-translation-pronunciation-and-example-sentences/
区别	qū bié	khu biệt	keoi1 bi6	[{"meaning": "difference", "part_of_speech": "noun"}, {"meaning": "to distinguish", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%8c%ba%e5%88%ab-qu-bie-translation-pronunciation-and-example-sentences/
全部	quán bù	toàn bộ	cyun4 but3	[{"meaning": "whole, entire, complete", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%85%a8%e9%83%a8-quan-bu-translation-pronunciation-and-example-sentences/
却	què	khước	keoi3	[{"meaning": "but, yet", "part_of_speech": "conjunction"}]	https://wohok.com/dict/%e5%8d%b4-que-translation-pronunciation-and-example-sentences/
缺点	quē diǎn	khuyết điểm	kuet3 dim2	[{"meaning": "weakness, shortcoming", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%bc%ba%e7%82%b9-que-dian-translation-pronunciation-and-example-sentences/
缺少	quē shǎo	khuyết thiếu	kuet3 siu2	[{"meaning": "lack, shortage", "part_of_speech": "noun"}, {"meaning": "to lack, to be short of", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%bc%ba%e5%b0%91-que-shao-translation-pronunciation-and-example-sentences/
确实	què shí	xác thực	kok3 sat6	[{"meaning": "indeed, really", "part_of_speech": "adjective"}, {"meaning": "for sure, indeed", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e7%a1%ae%e5%ae%9e-que-shi-translation-pronunciation-and-example-sentences/
群	qún	quần	kwan4	[{"meaning": "for group, crowd, etc.", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e7%be%a4-qun-translation-pronunciation-and-example-sentences/
然而	rán ér	nhiên hoá	jin4 jaa4	[{"meaning": "however, but", "part_of_speech": "conjunction"}]	https://wohok.com/dict/%e7%84%b6%e8%80%8c-ran-er-translation-pronunciation-and-example-sentences/
热闹	rè nao	nhiệt náo	jit6 naau6	[{"meaning": "lively, busy", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e7%83%ad%e9%97%b9-re-nao-translation-pronunciation-and-example-sentences/
任何	rèn hé	nhậm hà	jam6 ho4	[{"meaning": "any, whichever, whatever", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e4%bb%bb%e4%bd%95-ren-he-translation-pronunciation-and-example-sentences/
人民币	rén mín bì	nhân dân tệ	jan4 man4 bai6	[{"meaning": "RMB, Chinese Yuan", "part_of_speech": "noun"}]	https://wohok.com/dict/%e4%ba%ba%e6%b0%91%e5%b8%81-ren-min-bi-translation-pronunciation-and-example-sentences/
任务	rèn wu	nhận vụ	jam6 man6	[{"meaning": "mission, task", "part_of_speech": "noun"}]	https://wohok.com/dict/%e4%bb%bb%e5%8a%a1-ren-wu-translation-pronunciation-and-example-sentences/
扔	rēng	nhẫn	jing1	[{"meaning": "to throw (away)", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%89%94-reng-translation-pronunciation-and-example-sentences/
仍然	réng rán	nhẫn nhiên	jing4 jin4	[{"meaning": "still, yet", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e4%bb%8d%e7%84%b6-reng-ran-translation-pronunciation-and-example-sentences/
日记	rì jì	nhật ký	jat6 gei2	[{"meaning": "diary", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%97%a5%e8%ae%b0-ri-ji-translation-pronunciation-and-example-sentences/
入口	rù kǒu	nhập khẩu	jap6 hau2	[{"meaning": "entrance", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%85%a5%e5%8f%a3-ru-kou-translation-pronunciation-and-example-sentences/
软	ruǎn	nhoẹn	jyun5	[{"meaning": "soft", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e8%bd%af-ruan-translation-pronunciation-and-example-sentences/
散步	sàn bù	tán bộ	saan3 bou6	[{"meaning": "to take/to go for a walk", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%95%a3%e6%ad%a5-san-bu-translation-pronunciation-and-example-sentences/
森林	sēn lín	sâm lâm	sam1 lam4	[{"meaning": "forest", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%a3%ae%e6%9e%97-sen-lin-translation-pronunciation-and-example-sentences/
沙发	shā fā	sa phà	saa1 faa3	[{"meaning": "sofa", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%b2%99%e5%8f%91-sha-fa-translation-pronunciation-and-example-sentences/
商量	shāng liang	thương lượng	soeng1 loeng6	[{"meaning": "to consult, to discuss", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%95%86%e9%87%8f-shang-liang-translation-pronunciation-and-example-sentences/
伤心	shāng xīn	thương tâm	soeng1 sam1	[{"meaning": "sad, grievous, brokenhearted", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e4%bc%a4%e5%bf%83-shang-xin-translation-pronunciation-and-example-sentences/
稍微	shāo wēi	sơ ngoại	siu1 wai4	[{"meaning": "a little bit", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e7%a8%8d%e5%be%ae-shao-wei-translation-pronunciation-and-example-sentences/
社会	shè huì	xã hội	se5 wui2	[{"meaning": "society", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%a4%be%e4%bc%9a-she-hui-translation-pronunciation-and-example-sentences/
深	shēn	thâm	sam1	[{"meaning": "deep, dark (color, etc.)", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e6%b7%b1-shen-translation-pronunciation-and-example-sentences/
申请	shēn qǐng	thân tính	san1 cing2	[{"meaning": "application", "part_of_speech": "noun"}, {"meaning": "to apply for", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%94%b3%e8%af%b7-shen-qing-translation-pronunciation-and-example-sentences/
甚至	shèn zhì	thậm chỉ	sam6 zi3	[{"meaning": "even", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e7%94%9a%e8%87%b3-shen-zhi-translation-pronunciation-and-example-sentences/
剩	shèng	thặng	sing6	[{"meaning": "to remain", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%89%a9-sheng-translation-pronunciation-and-example-sentences/
省	shěng	tỉnh	saang2	[{"meaning": "province", "part_of_speech": "noun"}, {"meaning": "to save, to omit", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%9c%81-sheng-translation-pronunciation-and-example-sentences/
生活	shēng huó	sinh hoạt	saang1 wut6	[{"meaning": "life", "part_of_speech": "noun"}, {"meaning": "to live", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%94%9f%e6%b4%bb-sheng-huo-translation-pronunciation-and-example-sentences/
生命	shēng mìng	sinh mạng	saang1 meng6	[{"meaning": "life", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%94%9f%e5%91%bd-sheng-ming-translation-pronunciation-and-example-sentences/
试	shì	thí	si3	[{"meaning": "experiment, examination, test", "part_of_speech": "noun"}, {"meaning": "to test, to attempt", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%af%95-shi-translation-pronunciation-and-example-sentences/
失败	shī bài	thất bại	sit6 bai6	[{"meaning": "defeat, failure", "part_of_speech": "noun"}, {"meaning": "to lose, to be defeated", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%a4%b1%e8%b4%a5-shi-bai-translation-pronunciation-and-example-sentences/
市场	shì chǎng	thị trường	si5 coeng4	[{"meaning": "market", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%b8%82%e5%9c%ba-shi-chang-translation-pronunciation-and-example-sentences/
十分	shí fēn	thập phần	sap6 fan1	[{"meaning": "very, completely, fully, utterly, absolutely", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e5%8d%81%e5%88%86-shi-fen-translation-pronunciation-and-example-sentences/
师傅	shī fu	sư phụ	si1 fu6	[{"meaning": "master, teacher, used to respectfully address older men", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%b8%88%e5%82%85-shi-fu-translation-pronunciation-and-example-sentences/
适合	shì hé	thí hợp	sik1 hap6	[{"meaning": "to fit, to suit", "part_of_speech": "verb"}]	https://wohok.com/dict/%e9%80%82%e5%90%88-shi-he-translation-pronunciation-and-example-sentences/
实际	shí jì	thực tế	sat6 jik6	[{"meaning": "reality, practice", "part_of_speech": "noun"}, {"meaning": "realistic, practical", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%ae%9e%e9%99%85-shi-ji-translation-pronunciation-and-example-sentences/
世纪	shì jì	thế kỷ	sai3 gei2	[{"meaning": "century", "part_of_speech": "noun"}]	https://wohok.com/dict/%e4%b8%96%e7%ba%aa-shi-ji-translation-pronunciation-and-example-sentences/
食品	shí pǐn	thực phẩm	sik6 ban2	[{"meaning": "food", "part_of_speech": "noun"}]	https://wohok.com/dict/%e9%a3%9f%e5%93%81-shi-pin-translation-pronunciation-and-example-sentences/
湿润	shī rùn	thấp nhuận	sap1 wan6	[{"meaning": "moist, humid", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e6%b9%bf%e6%b6%a6-shi-run-translation-pronunciation-and-example-sentences/
失望	shī wàng	thất vọng	sat1 mong6	[{"meaning": "disappointment", "part_of_speech": "noun"}, {"meaning": "to lose hope", "part_of_speech": "verb"}, {"meaning": "disappointed", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%a4%b1%e6%9c%9b-shi-wang-translation-pronunciation-and-example-sentences/
适应	shì yìng	thí ứng	sik1 jing4	[{"meaning": "to fit, to suit, to adabt", "part_of_speech": "verb"}]	https://wohok.com/dict/%e9%80%82%e5%ba%94-shi-ying-translation-pronunciation-and-example-sentences/
使用	shǐ yòng	sử dụng	sai6 zung6	[{"meaning": "to use", "part_of_speech": "verb"}]	https://wohok.com/dict/%e4%bd%bf%e7%94%a8-shi-yong-translation-pronunciation-and-example-sentences/
实在	shí zài	thực tại	sat6 zoi6	[{"meaning": "real, true", "part_of_speech": "adjective"}, {"meaning": "really, in fact", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e5%ae%9e%e5%9c%a8-shi-zai-translation-pronunciation-and-example-sentences/
狮子	shī zi	sư tử	si1 zi2	[{"meaning": "lion", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%8b%ae%e5%ad%90-shi-zi-translation-pronunciation-and-example-sentences/
收	shōu	thu	sau1	[{"meaning": "to accept, to receive", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%94%b6-shou-translation-pronunciation-and-example-sentences/
受不了	shòu bù liǎo	thụ bất liễu	sau6 bat1 liu5	[{"meaning": "unbearable", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%8f%97%e4%b8%8d%e4%ba%86-shou-bu-liao-translation-pronunciation-and-example-sentences/
受到	shòu dào	thụ đáo	sau6 dou3	[{"meaning": "to receive, to suffer", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%8f%97%e5%88%b0-shou-dao-translation-pronunciation-and-example-sentences/
首都	shǒu dū	thủ đô	sau2 dou1	[{"meaning": "capital city", "part_of_speech": "noun"}]	https://wohok.com/dict/%e9%a6%96%e9%83%bd-shou-du-translation-pronunciation-and-example-sentences/
售货员	shòu huò yuán	thụ hàng viên	sau6 fo3 jyun4	[{"meaning": "salesperson", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%94%ae%e8%b4%a7%e5%91%98-shou-huo-yuan-translation-pronunciation-and-example-sentences/
收入	shōu rù	thu nhập	sau1 jap6	[{"meaning": "income, revenue", "part_of_speech": "noun"}, {"meaning": "to take in", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%94%b6%e5%85%a5-shou-ru-translation-pronunciation-and-example-sentences/
收拾	shōu shi	thu thập	sau1 si2	[{"meaning": "to put in order, to tidy up, to punish", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%94%b6%e6%8b%be-shou-shi-translation-pronunciation-and-example-sentences/
首先	shǒu xiān	thủ tiên	sau2 sin1	[{"meaning": "first of all", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e9%a6%96%e5%85%88-shou-xian-translation-pronunciation-and-example-sentences/
输	shū	thua	syu1	[{"meaning": "to transport, to lose, to be beaten", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%be%93-shu-translation-pronunciation-and-example-sentences/
数量	shù liàng	số lượng	so3 leung5	[{"meaning": "amount, quantity", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%95%b0%e9%87%8f-shu-liang-translation-pronunciation-and-example-sentences/
熟悉	shú xī	thục túc	suk6 sik1	[{"meaning": "to be familiar with", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%86%9f%e6%82%89-shu-xi-translation-pronunciation-and-example-sentences/
数字	shù zì	số tử	sou3 zi2	[{"meaning": "figure, number", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%95%b0%e5%ad%97-shu-zi-translation-pronunciation-and-example-sentences/
帅	shuài	sóc	seoi3	[{"meaning": "handsome, smart (for men)", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%b8%85-shuai-translation-pronunciation-and-example-sentences/
顺便	shùn biàn	thuận tiện	seon6 bin6	[{"meaning": "on the way, in passing by", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e9%a1%ba%e4%be%bf-shun-bian-translation-pronunciation-and-example-sentences/
顺利	shùn lì	thuận lợi	seon6 lei6	[{"meaning": "smoothly", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e9%a1%ba%e5%88%a9-shun-li-translation-pronunciation-and-example-sentences/
顺序	shùn xù	thuận tự	seon6 zeoi6	[{"meaning": "sequence, order", "part_of_speech": "noun"}]	https://wohok.com/dict/%e9%a1%ba%e5%ba%8f-shun-xu-translation-pronunciation-and-example-sentences/
说明	shuō míng	thuyết minh	soeng1 ming4	[{"meaning": "explanation, illustration", "part_of_speech": "noun"}, {"meaning": "to explain, to illustrate", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%af%b4%e6%98%8e-shuo-ming-translation-pronunciation-and-example-sentences/
硕士	shuò shì	thạc sĩ	seok3 si6	[{"meaning": "master’s degree", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%a1%95%e5%a3%ab-shuo-shi-translation-pronunciation-and-example-sentences/
死	sǐ	tử	sei2	[{"meaning": "death", "part_of_speech": "noun"}, {"meaning": "to die", "part_of_speech": "verb"}, {"meaning": "dead", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e6%ad%bb-si-translation-pronunciation-and-example-sentences/
速度	sù dù	tốc độ	cuk1 dou6	[{"meaning": "speed", "part_of_speech": "noun"}]	https://wohok.com/dict/%e9%80%9f%e5%ba%a6-su-du-translation-pronunciation-and-example-sentences/
塑料袋	sù liào dài	tố lệ đái	sou3 laat6 doi6	[{"meaning": "plastic bag", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%a1%91%e6%96%99%e8%a2%8b-su-liao-dai-translation-pronunciation-and-example-sentences/
算	suàn	toán	syun3	[{"meaning": "to calculate", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%ae%97-suan-translation-pronunciation-and-example-sentences/
酸	suān	chua	syun1	[{"meaning": "sour", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e9%85%b8-suan-translation-pronunciation-and-example-sentences/
随便	suí biàn	tuỳ biến	ceoi4 bin1	[{"meaning": "random", "part_of_speech": "adjective"}, {"meaning": "as one wishes", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e9%9a%8f%e4%be%bf-sui-bian-translation-pronunciation-and-example-sentences/
随着	suí zhe	tuỳ trước	ceoi4 zoek3	[{"meaning": "along with, in the wake of", "part_of_speech": "relative clause"}]	https://wohok.com/dict/%e9%9a%8f%e7%9d%80-sui-zhe-translation-pronunciation-and-example-sentences/
孙子	sūn zi	tôn tử	syun1 zi2	[{"meaning": "grandson", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%ad%99%e5%ad%90-sun-zi-translation-pronunciation-and-example-sentences/
所有	suǒ yǒu	tất cả	so2 jau5	[{"meaning": "to possess, to own", "part_of_speech": "verb"}, {"meaning": "all", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e6%89%80%e6%9c%89-suo-you-translation-pronunciation-and-example-sentences/
台	tái	đài	toi4	[{"meaning": "desk, platform", "part_of_speech": "noun"}, {"meaning": "for vehicles, machinese, etc.", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e5%8f%b0-tai-translation-pronunciation-and-example-sentences/
抬	tái	thải	toi4	[{"meaning": "to lift up, to raise, to carry", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%8a%ac-tai-translation-pronunciation-and-example-sentences/
态度	tài du	thái độ	taai3 dou6	[{"meaning": "manner, attitude", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%80%81%e5%ba%a6-tai-du-translation-pronunciation-and-example-sentences/
谈	tán	tham	taam4	[{"meaning": "to talk", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%b0%88-tan-translation-pronunciation-and-example-sentences/
弹钢琴	tán gāng qín	đàn cầm kim	daan6 gong1 kam4	[{"meaning": "to play the piano", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%bc%b9%e9%92%a2%e7%90%b4-tan-gang-qin-translation-pronunciation-and-example-sentences/
趟	tàng	đường	tong3	[{"meaning": "for number of trips or runs made", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e8%b6%9f-tang-translation-pronunciation-and-example-sentences/
躺	tǎng	tháng	tong2	[{"meaning": "to lie (down), to recline", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%ba%ba-tang-translation-pronunciation-and-example-sentences/
汤	tāng	thang	tong1	[{"meaning": "soup", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%b1%a4-tang-translation-pronunciation-and-example-sentences/
讨论	tǎo lùn	thảo luận	tou2 leon4	[{"meaning": "discussion", "part_of_speech": "noun"}, {"meaning": "to discuss", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%ae%a8%e8%ae%ba-tao-lun-translation-pronunciation-and-example-sentences/
讨厌	tǎo yàn	thảo yểm	tou2 jim3	[{"meaning": "to hate", "part_of_speech": "verb"}, {"meaning": "disgusting, nasty", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e8%ae%a8%e5%8e%8c-tao-yan-translation-pronunciation-and-example-sentences/
特点	tè diǎn	đặc điểm	dak6 dim2	[{"meaning": "characteristic feature", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%89%b9%e7%82%b9-te-dian-translation-pronunciation-and-example-sentences/
提供	tí gōng	đề cấp	tai4 gung1	[{"meaning": "to offer, to supply, to provide", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%8f%90%e4%be%9b-ti-gong-translation-pronunciation-and-example-sentences/
提前	tí qián	đề tiền	tai4 cin4	[{"meaning": "to bring forward", "part_of_speech": "verb"}, {"meaning": "early", "part_of_speech": "adjective"}, {"meaning": "beforehand", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e6%8f%90%e5%89%8d-ti-qian-translation-pronunciation-and-example-sentences/
提醒	tí xǐng	đề hỉnh	tai4 hieng3	[{"meaning": "to remind, to call attention to", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%8f%90%e9%86%92-ti-xing-translation-pronunciation-and-example-sentences/
填空	tián kòng	điền không	tim4 hong1	[{"meaning": "to fill in (questionnaire, etc.)", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%a1%ab%e7%a9%ba-tian-kong-translation-pronunciation-and-example-sentences/
条件	tiáo jiàn	điều kiện	tim4 cin4	[{"meaning": "condition, circumstances", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%9d%a1%e4%bb%b6-tiao-jian-translation-pronunciation-and-example-sentences/
挺	tǐng	đỡ	ting2	[{"meaning": "to stick out, to stand straight", "part_of_speech": "verb"}, {"meaning": "quite, very, rather", "part_of_speech": "adverb"}, {"meaning": "for machine guns", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e6%8c%ba-ting-translation-pronunciation-and-example-sentences/
停止	tíng zhǐ	đình chỉ	ting4 zi2	[{"meaning": "to stop, to halt", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%81%9c%e6%ad%a2-ting-zhi-translation-pronunciation-and-example-sentences/
通过	tōng guò	thông qua	tung4 gwai3	[{"meaning": "to pass through, to get through", "part_of_speech": "verb"}, {"meaning": "via, by", "part_of_speech": "relative clause"}]	https://wohok.com/dict/%e9%80%9a%e8%bf%87-tong-guo-translation-pronunciation-and-example-sentences/
同情	tóng qíng	đồng tình	tung4 cing4	[{"meaning": "sympathy, compassion", "part_of_speech": "noun"}, {"meaning": "to sympathize", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%90%8c%e6%83%85-tong-qing-translation-pronunciation-and-example-sentences/
通知	tōng zhī	thông tri	tung1 zi3	[{"meaning": "notice", "part_of_speech": "noun"}, {"meaning": "to notify, to inform", "part_of_speech": "verb"}]	https://wohok.com/dict/%e9%80%9a%e7%9f%a5-tong-zhi-translation-pronunciation-and-example-sentences/
推	tuī	thôi	teoi1	[{"meaning": "to push", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%8e%a8-tui-translation-pronunciation-and-example-sentences/
推迟	tuī chí	thôi trì	teoi1 ci4	[{"meaning": "to postpone, to defer", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%8e%a8%e8%bf%9f-tui-chi-translation-pronunciation-and-example-sentences/
脱	tuō	thoát	tyut3	[{"meaning": "to take off, to shed", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%84%b1-tuo-translation-pronunciation-and-example-sentences/
袜子	wà zi	vật tử	maak6 zi2	[{"meaning": "socks, stockings", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%a2%9c%e5%ad%90-wa-zi-translation-pronunciation-and-example-sentences/
完全	wán quán	hoàn toàn	jyun4 cyun4	[{"meaning": "complete, whole, entire", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%ae%8c%e5%85%a8-wan-quan-translation-pronunciation-and-example-sentences/
往	wǎng	vãng	wong5	[{"meaning": "to go", "part_of_speech": "verb"}, {"meaning": "towards, to", "part_of_speech": "relative clause"}]	https://wohok.com/dict/%e5%be%80-wang-translation-pronunciation-and-example-sentences/
网球	wǎng qiú	võng kiều	mong5 kau4	[{"meaning": "tennis", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%bd%91%e7%90%83-wang-qiu-translation-pronunciation-and-example-sentences/
往往	wǎng wǎng	vãng vãng	wong5 wong5	[{"meaning": "often", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e5%be%80%e5%be%80-wang-wang-translation-pronunciation-and-example-sentences/
网站	wǎng zhàn	võng tầm	mong5 zaam6	[{"meaning": "website", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%bd%91%e7%ab%99-wang-zhan-translation-pronunciation-and-example-sentences/
味道	wèi dào	vị đạo	mei6 dou6	[{"meaning": "taste, flavour", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%91%b3%e9%81%93-wei-dao-translation-pronunciation-and-example-sentences/
危险	wēi xiǎn	nguy hiểm	ngai4 him2	[{"meaning": "danger", "part_of_speech": "noun"}, {"meaning": "dangerous", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%8d%b1%e9%99%a9-wei-xian-translation-pronunciation-and-example-sentences/
温度	wēn dù	ôn độ	wan1 dou6	[{"meaning": "temperature", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%b8%a9%e5%ba%a6-wen-du-translation-pronunciation-and-example-sentences/
文章	wén zhāng	văn chương	man4 zung1	[{"meaning": "article, essay", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%96%87%e7%ab%a0-wen-zhang-translation-pronunciation-and-example-sentences/
握手	wò shǒu	ác thủ	ak1 sau2	[{"meaning": "to shake hands", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%8f%a1%e6%89%8b-wo-shou-translation-pronunciation-and-example-sentences/
无	wú	vô	mou4	[{"meaning": "not", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e6%97%a0-wu-translation-pronunciation-and-example-sentences/
误会	wù huì	ngộ hội	ng6 wui2	[{"meaning": "misunderstanding", "part_of_speech": "noun"}, {"meaning": "to misunderstand", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%af%af%e4%bc%9a-wu-hui-translation-pronunciation-and-example-sentences/
无聊	wú liáo	vô liêu	mou4 liu4	[{"meaning": "boring, bored", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e6%97%a0%e8%81%8a-wu-liao-translation-pronunciation-and-example-sentences/
无论	wú lùn	vô luận	mou4 leon6	[{"meaning": "no matter how/what", "part_of_speech": "conjunction"}]	https://wohok.com/dict/%e6%97%a0%e8%ae%ba-wu-lun-translation-pronunciation-and-example-sentences/
污染	wū rǎn	ô nhiễm	wu1 jim6	[{"meaning": "pollution, contamination", "part_of_speech": "noun"}, {"meaning": "to pollute, to contaminate", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%b1%a1%e6%9f%93-wu-ran-translation-pronunciation-and-example-sentences/
西红柿	xī hóng shì	tây hồng sỉ	sai1 hung4 ci2	[{"meaning": "tomato", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%a5%bf%e7%ba%a2%e6%9f%bf-xi-hong-shi-translation-pronunciation-and-example-sentences/
洗衣机	xǐ yī jī	tẩy dị cơ	sai2 ji4 gei1	[{"meaning": "washing machine", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%b4%97%e8%a1%a3%e6%9c%ba-xi-yi-ji-translation-pronunciation-and-example-sentences/
吸引	xī yǐn	hấp dẫn	kap1 jan5	[{"meaning": "to attract (interest, customers, etc.)", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%90%b8%e5%bc%95-xi-yin-translation-pronunciation-and-example-sentences/
咸	xián	hàm	haam4	[{"meaning": "salty", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%92%b8-xian-translation-pronunciation-and-example-sentences/
现代	xiàn dài	hiện đại	jin6 doi6	[{"meaning": "modern times, the contemporary age", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%8e%b0%e4%bb%a3-xian-dai-translation-pronunciation-and-example-sentences/
羡慕	xiàn mù	tiện mộ	sin3 mou6	[{"meaning": "to envy, to admire", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%be%a1%e6%85%95-xian-mu-translation-pronunciation-and-example-sentences/
限制	xiàn zhì	hạn chế	haan6 zai6	[{"meaning": "restriction, limit", "part_of_speech": "noun"}, {"meaning": "to restrict, to limit", "part_of_speech": "verb"}]	https://wohok.com/dict/%e9%99%90%e5%88%b6-xian-zhi-translation-pronunciation-and-example-sentences/
响	xiǎng	hiệu	hoeng2	[{"meaning": "sound, noise", "part_of_speech": "noun"}, {"meaning": "to make a sound", "part_of_speech": "verb"}, {"meaning": "loud, noisy", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%93%8d-xiang-translation-pronunciation-and-example-sentences/
香	xiāng	hương	hoeng1	[{"meaning": "fragrang", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e9%a6%99-xiang-translation-pronunciation-and-example-sentences/
相反	xiāng fǎn	tương phản	soeng1 faan2	[{"meaning": "opposite, contrary", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e7%9b%b8%e5%8f%8d-xiang-fan-translation-pronunciation-and-example-sentences/
详细	xiáng xì	tỉnh tỉnh	coeng4 sai3	[{"meaning": "detailed", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e8%af%a6%e7%bb%86-xiang-xi-translation-pronunciation-and-example-sentences/
效果	xiào guǒ	hiệu quả	haau6 gwo2	[{"meaning": "effect, result", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%95%88%e6%9e%9c-xiao-guo-translation-pronunciation-and-example-sentences/
笑话	xiào hua	tiếu họa	siu3 faa3	[{"meaning": "joke", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%ac%91%e8%af%9d-xiao-hua-translation-pronunciation-and-example-sentences/
小说	xiǎo shuō	tiểu thuyết	siu2 seot6	[{"meaning": "novel, fiction", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%b0%8f%e8%af%b4-xiao-shuo-translation-pronunciation-and-example-sentences/
消息	xiāo xi	tiêu hiệu	siu1 si6	[{"meaning": "news, information", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%b6%88%e6%81%af-xiao-xi-translation-pronunciation-and-example-sentences/
辛苦	xīn kǔ	tân khổ	san1 fu2	[{"meaning": "hard, toilsome", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e8%be%9b%e8%8b%a6-xin-ku-translation-pronunciation-and-example-sentences/
心情	xīn qíng	tâm tình	sam1 cing4	[{"meaning": "mood, state of mind", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%bf%83%e6%83%85-xin-qing-translation-pronunciation-and-example-sentences/
信任	xìn rèn	tín nhiệm	seon3 jam6	[{"meaning": "trust", "part_of_speech": "noun"}, {"meaning": "to trust", "part_of_speech": "verb"}]	https://wohok.com/dict/%e4%bf%a1%e4%bb%bb-xin-ren-translation-pronunciation-and-example-sentences/
信心	xìn xīn	tín tâm	seon3 sam1	[{"meaning": "confidence, faith", "part_of_speech": "noun"}]	https://wohok.com/dict/%e4%bf%a1%e5%bf%83-xin-xin-translation-pronunciation-and-example-sentences/
信用卡	xìn yòng kǎ	tín dụng tha	seon3 jung6 kaat1	[{"meaning": "credit card", "part_of_speech": "noun"}]	https://wohok.com/dict/%e4%bf%a1%e7%94%a8%e5%8d%a1-xin-yong-ka-translation-pronunciation-and-example-sentences/
行	xíng	hành	hang4	[{"meaning": "to walk, to go", "part_of_speech": "verb"}, {"meaning": "capable, competent", "part_of_speech": "adjective"}, {"meaning": "OK", "part_of_speech": "expression"}]	https://wohok.com/dict/%e8%a1%8c-xing-hang-translation-pronunciation-and-example-sentences/
醒	xǐng	tỉnh	sing2	[{"meaning": "to wake up", "part_of_speech": "verb"}]	https://wohok.com/dict/%e9%86%92-xing-translation-pronunciation-and-example-sentences/
性别	xìng bié	tính biệt	sing3 bit6	[{"meaning": "gender, sex", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%80%a7%e5%88%ab-xing-bie-translation-pronunciation-and-example-sentences/
兴奋	xīng fèn	hứng phấn	hing1 fan6	[{"meaning": "excitement", "part_of_speech": "noun"}, {"meaning": "excited", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%85%b4%e5%a5%8b-xing-fen-translation-pronunciation-and-example-sentences/
幸福	xìng fú	hạnh phúc	hang6 fuk1	[{"meaning": "happiness", "part_of_speech": "noun"}, {"meaning": "happy", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%b9%b8%e7%a6%8f-xing-fu-translation-pronunciation-and-example-sentences/
性格	xìng gé	tính cách	sing3 gaak3	[{"meaning": "nature, temperament, character", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%80%a7%e6%a0%bc-xing-ge-translation-pronunciation-and-example-sentences/
修	xiū	tu	sau1	[{"meaning": "to repair", "part_of_speech": "verb"}]	https://wohok.com/dict/%e4%bf%ae-xiu-translation-pronunciation-and-example-sentences/
许多	xǔ duō	hứa đoàn	heoi2 do1	[{"meaning": "many, a lot of", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e8%ae%b8%e5%a4%9a-xu-duo-translation-pronunciation-and-example-sentences/
血	xuè	huyết	hyut3	[{"meaning": "blood", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%a1%80-xue-translation-pronunciation-and-example-sentences/
呀	ya	ơ	aa1	[{"meaning": "expressing surprise or doubt", "part_of_speech": "particle"}]	https://wohok.com/dict/%e5%91%80-ya-translation-pronunciation-and-example-sentences/
牙膏	yá gāo	nha cạo	ngaa4 gou1	[{"meaning": "toothpaste", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%89%99%e8%86%8f-ya-gao-translation-pronunciation-and-example-sentences/
压力	yā lì	áp lực	ap3 lik6	[{"meaning": "pressure", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%8e%8b%e5%8a%9b-ya-li-translation-pronunciation-and-example-sentences/
亚洲	Yà zhōu	á châu	aa3 zau1	[{"meaning": "Asia", "part_of_speech": "noun"}]	https://wohok.com/dict/%e4%ba%9a%e6%b4%b2-ya-zhou-translation-pronunciation-and-example-sentences/
盐	yán	diêm	jim4	[{"meaning": "salt", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%9b%90-yan-translation-pronunciation-and-example-sentences/
演出	yǎn chū	diễn xuất	jin2 ceot1	[{"meaning": "performance, show", "part_of_speech": "noun"}, {"meaning": "to perform, to put on a show", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%bc%94%e5%87%ba-yan-chu-translation-pronunciation-and-example-sentences/
严格	yán gé	nghiêm cấp	jim4 gaak3	[{"meaning": "strict, rigorous", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e4%b8%a5%e6%a0%bc-yan-ge-translation-pronunciation-and-example-sentences/
研究生	yán jiū shēng	nghiên cứu sinh	jin4 gau3 saang1	[{"meaning": "graduate, postgraduate or research student", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%a0%94%e7%a9%b6%e7%94%9f-yan-jiu-sheng-translation-pronunciation-and-example-sentences/
演员	yǎn yuán	diễn viên	jin2 jyun4	[{"meaning": "performer, actor", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%bc%94%e5%91%98-yan-yuan-translation-pronunciation-and-example-sentences/
严重	yán zhòng	nghiêm trọng	jim4 zung6	[{"meaning": "grave, serious, critical", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e4%b8%a5%e9%87%8d-yan-zhong-translation-pronunciation-and-example-sentences/
养成	yǎng chéng	dưỡng thành	joeng5 sing4	[{"meaning": "to cultivate, to form, to acquire", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%85%bb%e6%88%90-yang-cheng-translation-pronunciation-and-example-sentences/
阳光	yáng guāng	dương quang	joeng4 gwong1	[{"meaning": "sunshine", "part_of_speech": "noun"}]	https://wohok.com/dict/%e9%98%b3%e5%85%89-yang-guang-translation-pronunciation-and-example-sentences/
样子	yàng zi	dạng tử	joeng2 zi2	[{"meaning": "appearance, manner", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%a0%b7%e5%ad%90-yang-zi-translation-pronunciation-and-example-sentences/
邀请	yāo qǐng	yêu kêu	jiu1 cing2	[{"meaning": "invitation", "part_of_speech": "noun"}, {"meaning": "to invite", "part_of_speech": "verb"}]	https://wohok.com/dict/%e9%82%80%e8%af%b7-yao-qing-translation-pronunciation-and-example-sentences/
钥匙	yào shi	yếu khóa	joek3 si4	[{"meaning": "key", "part_of_speech": "noun"}]	https://wohok.com/dict/%e9%92%a5%e5%8c%99-yao-shi-translation-pronunciation-and-example-sentences/
页	yè	duyệt	jip6	[{"meaning": "page, leaf", "part_of_speech": "noun"}, {"meaning": "for a page", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e9%a1%b5-ye-translation-pronunciation-and-example-sentences/
也许	yě xǔ	dã hứa	jaa5 hyut3	[{"meaning": "perhaps, maybe", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e4%b9%9f%e8%ae%b8-ye-xu-translation-pronunciation-and-example-sentences/
叶子	yè zi	diệp tử	jip6 zi2	[{"meaning": "leaf", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%8f%b6%e5%ad%90-ye-zi-translation-pronunciation-and-example-sentences/
亿	yì	ức	jik1	[{"meaning": "100 million", "part_of_speech": "number"}]	https://wohok.com/dict/%e4%ba%bf-yi-translation-pronunciation-and-example-sentences/
以	yǐ	dĩ	ji5	[{"meaning": "because of, so as to, in order to", "part_of_speech": "relative clause"}]	https://wohok.com/dict/%e4%bb%a5-yi-translation-pronunciation-and-example-sentences/
意见	yì jiàn	ý kiến	ji3 gin3	[{"meaning": "opinion, view, objection", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%84%8f%e8%a7%81-yi-jian-translation-pronunciation-and-example-sentences/
一切	yí qiè	nhất thiết	jat1 ceot3	[{"meaning": "all, everything", "part_of_speech": "pronoun"}]	https://wohok.com/dict/%e4%b8%80%e5%88%87-yi-qie-translation-pronunciation-and-example-sentences/
艺术	yì shù	nghệ thuật	ngai6 seot6	[{"meaning": "art", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%89%ba%e6%9c%af-yi-shu-translation-pronunciation-and-example-sentences/
因此	yīn cǐ	nhân thử	jan1 ci2	[{"meaning": "thus, consequently", "part_of_speech": "conjunction"}]	https://wohok.com/dict/%e5%9b%a0%e6%ad%a4-yin-ci-translation-pronunciation-and-example-sentences/
饮料	yǐn liào	ẩm dụ	jam2 liu6	[{"meaning": "drink, beverage", "part_of_speech": "noun"}]	https://wohok.com/dict/%e9%a5%ae%e6%96%99-yin-liao-translation-pronunciation-and-example-sentences/
引起	yǐn qǐ	dẫn khởi	jan5 hei2	[{"meaning": "to give rise to, to lead to", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%bc%95%e8%b5%b7-yin-qi-translation-pronunciation-and-example-sentences/
印象	yìn xiàng	ấn tượng	jan3 zoeng6	[{"meaning": "impression", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%8d%b0%e8%b1%a1-yin-xiang-translation-pronunciation-and-example-sentences/
赢	yíng	thắng	jing4	[{"meaning": "to win, to beat", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%b5%a2-ying-translation-pronunciation-and-example-sentences/
硬	yìng	ngạnh	ngaang6	[{"meaning": "hard, stiff, firm", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e7%a1%ac-ying-translation-pronunciation-and-example-sentences/
勇敢	yǒng gǎn	dũng cảm	jung5 ngaan2	[{"meaning": "brave, courageous", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%8b%87%e6%95%a2-yong-gan-translation-pronunciation-and-example-sentences/
永远	yǒng yuǎn	vĩnh viễn	wing5 jyun5	[{"meaning": "forever, ever", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e6%b0%b8%e8%bf%9c-yong-yuan-translation-pronunciation-and-example-sentences/
由	yóu	do	jau4	[{"meaning": "due to, because of, by, from", "part_of_speech": "relative clause"}]	https://wohok.com/dict/%e7%94%b1-you-translation-pronunciation-and-example-sentences/
优点	yōu diǎn	ưu điểm	jau1 dim2	[{"meaning": "merit, advantage, strong point", "part_of_speech": "noun"}]	https://wohok.com/dict/%e4%bc%98%e7%82%b9-you-dian-translation-pronunciation-and-example-sentences/
友好	yǒu hǎo	hữu hảo	jau5 hou2	[{"meaning": "friendly", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%8f%8b%e5%a5%bd-you-hao-translation-pronunciation-and-example-sentences/
幽默	yōu mò	du mộc	jau1 muk6	[{"meaning": "humor", "part_of_speech": "noun"}, {"meaning": "humorous", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%b9%bd%e9%bb%98-you-mo-translation-pronunciation-and-example-sentences/
尤其	yóu qí	do kỳ	jau4 kei4	[{"meaning": "especially, particularly", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e5%b0%a4%e5%85%b6-you-qi-translation-pronunciation-and-example-sentences/
有趣	yǒu qù	hữu thú	jau5 ceot1	[{"meaning": "interesting", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e6%9c%89%e8%b6%a3-you-qu-translation-pronunciation-and-example-sentences/
优秀	yōu xiù	ưu tú	jau1 sau3	[{"meaning": "outstanding, excellent", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e4%bc%98%e7%a7%80-you-xiu-translation-pronunciation-and-example-sentences/
友谊	yǒu yì	hữu nghị	jau5 ji4	[{"meaning": "friendship", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%8f%8b%e8%b0%8a-you-yi-translation-pronunciation-and-example-sentences/
由于	yóu yú	do dư	jau4 jyu1	[{"meaning": "due to, because of", "part_of_speech": "relative clause"}]	https://wohok.com/dict/%e7%94%b1%e4%ba%8e-you-yu-translation-pronunciation-and-example-sentences/
与	yǔ	dữ	jyu5	[{"meaning": "and, with", "part_of_speech": "conjunction"}]	https://wohok.com/dict/%e4%b8%8e-yu-translation-pronunciation-and-example-sentences/
语法	yǔ fǎ	ngữ pháp	jyu5 faat3	[{"meaning": "grammar", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%af%ad%e6%b3%95-yu-fa-translation-pronunciation-and-example-sentences/
愉快	yú kuài	duy khoái	jyu4 faai3	[{"meaning": "happy, cheerful", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e6%84%89%e5%bf%ab-yu-kuai-translation-pronunciation-and-example-sentences/
羽毛球	yǔ máo qiú	vũ mao cầu	jyu4 mou4 kau4	[{"meaning": "badminton", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%be%bd%e6%af%9b%e7%90%83-yu-mao-qiu-translation-pronunciation-and-example-sentences/
于是	yú shì	vúy thị	jyu1 si6	[{"meaning": "as a result, consequently", "part_of_speech": "conjunction"}]	https://wohok.com/dict/%e4%ba%8e%e6%98%af-yu-shi-translation-pronunciation-and-example-sentences/
预习	yù xí	dự học	jyu6 seoi6	[{"meaning": "to prepare for (a lesson)", "part_of_speech": "verb"}]	https://wohok.com/dict/%e9%a2%84%e4%b9%a0-yu-xi-translation-pronunciation-and-example-sentences/
语言	yǔ yán	ngữ ngôn	jyu5 jin4	[{"meaning": "language", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%af%ad%e8%a8%80-yu-yan-translation-pronunciation-and-example-sentences/
圆	yuán	viên	jyun4	[{"meaning": "circle", "part_of_speech": "noun"}, {"meaning": "circular, round", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%9c%86-yuan-translation-pronunciation-and-example-sentences/
原来	yuán lái	nguyên lai	jyun4 loi4	[{"meaning": "former, original", "part_of_speech": "adjective"}, {"meaning": "as it turns out", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e5%8e%9f%e6%9d%a5-yuan-lai-translation-pronunciation-and-example-sentences/
原谅	yuán liàng	nguyên lượng	jyun4 loeng6	[{"meaning": "to excuse, to forgive", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%8e%9f%e8%b0%85-yuan-liang-translation-pronunciation-and-example-sentences/
原因	yuán yīn	nguyên nhân	jyun4 jan1	[{"meaning": "reason, cause", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%8e%9f%e5%9b%a0-yuan-yin-translation-pronunciation-and-example-sentences/
阅读	yuè dú	duệ độ	jyut6 duk6	[{"meaning": "reading", "part_of_speech": "noun"}, {"meaning": "to read", "part_of_speech": "verb"}]	https://wohok.com/dict/%e9%98%85%e8%af%bb-yue-du-translation-pronunciation-and-example-sentences/
约会	yuē huì	yêu hội	joek3 wui6	[{"meaning": "appointment, engagement, date", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%ba%a6%e4%bc%9a-yue-hui-translation-pronunciation-and-example-sentences/
允许	yǔn xǔ	dung hứa	wan4 seoi6	[{"meaning": "to permit, to allow", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%85%81%e8%ae%b8-yun-xu-translation-pronunciation-and-example-sentences/
杂志	zá zhì	tạp chí	zaap6 zi6	[{"meaning": "magazine", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%9d%82%e5%bf%97-za-zhi-translation-pronunciation-and-example-sentences/
咱们	zán men	tảo môn	zaam2 mun4	[{"meaning": "we, us", "part_of_speech": "pronoun"}]	https://wohok.com/dict/%e5%92%b1%e4%bb%ac-zan-men-translation-pronunciation-and-example-sentences/
暂时	zàn shí	tạm thời	zaam6 si4	[{"meaning": "temporary", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e6%9a%82%e6%97%b6-zan-shi-translation-pronunciation-and-example-sentences/
脏	zāng	tàng	zong1	[{"meaning": "dirty", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e8%84%8f-zang-translation-pronunciation-and-example-sentences/
责任	zé rèn	trách nhiệm	zaak3 jam6	[{"meaning": "duty, responsibility", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%b4%a3%e4%bb%bb-ze-ren-translation-pronunciation-and-example-sentences/
增加	zēng jiā	tăng gia	zang1 gaa1	[{"meaning": "to increase, to raise", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%a2%9e%e5%8a%a0-zeng-jia-translation-pronunciation-and-example-sentences/
增长	zēng zhǎng	tăng trường	zang1 zoeng6	[{"meaning": "increase, growth", "part_of_speech": "noun"}, {"meaning": "to increase, to grow", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%a2%9e%e9%95%bf-zeng-zhang-translation-pronunciation-and-example-sentences/
窄	zhǎi	trật	zoek3	[{"meaning": "narrow", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e7%aa%84-zhai-translation-pronunciation-and-example-sentences/
招聘	zhāo pìn	chiêu mộ	ziu1 ping3	[{"meaning": "recruitment", "part_of_speech": "noun"}, {"meaning": "to recruit", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%8b%9b%e8%81%98-zhao-pin-translation-pronunciation-and-example-sentences/
真正	zhēn zhèng	chân chính	zan1 zeng3	[{"meaning": "genuine, real, true", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e7%9c%9f%e6%ad%a3-zhen-zheng-translation-pronunciation-and-example-sentences/
正常	zhèng cháng	chính thường	zing3 soeng4	[{"meaning": "regular, normal, ordinary", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e6%ad%a3%e5%b8%b8-zheng-chang-translation-pronunciation-and-example-sentences/
正好	zhèng hǎo	chính hảo	zing3 hou2	[{"meaning": "just right, just at the right time", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e6%ad%a3%e5%a5%bd-zheng-hao-translation-pronunciation-and-example-sentences/
整理	zhěng lǐ	chính lý	zing2 lei5	[{"meaning": "to arrange, to tidy up", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%95%b4%e7%90%86-zheng-li-translation-pronunciation-and-example-sentences/
证明	zhèng míng	chứng minh	zing3 ming4	[{"meaning": "proof, certificate, testimonial", "part_of_speech": "noun"}, {"meaning": "to prove, to testify", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%af%81%e6%98%8e-zheng-ming-translation-pronunciation-and-example-sentences/
整齐	zhěng qí	chính tề	zing2 cai4	[{"meaning": "neat, tidy, in good order", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e6%95%b4%e9%bd%90-zheng-qi-translation-pronunciation-and-example-sentences/
正确	zhèng què	chính xác	zing3 coeng2	[{"meaning": "correct, proper", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e6%ad%a3%e7%a1%ae-zheng-que-translation-pronunciation-and-example-sentences/
正式	zhèng shì	chính thức	zing3 sik1	[{"meaning": "formal, official", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e6%ad%a3%e5%bc%8f-zheng-shi-translation-pronunciation-and-example-sentences/
指	zhǐ	chỉ	zi2	[{"meaning": "finger", "part_of_speech": "noun"}, {"meaning": "to point at or to, to indicate", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%8c%87-zhi-translation-pronunciation-and-example-sentences/
之	zhī	chi	zi1	[{"meaning": "I, he, she it, …", "part_of_speech": "pronoun"}, {"meaning": "similar to 的", "part_of_speech": "particle"}]	https://wohok.com/dict/%e4%b9%8b-zhi-translation-pronunciation-and-example-sentences/
只	zhī	chỉ	zi2	[{"meaning": "for birds and animals, a pair of things, parts of the body, etc.", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e5%8f%aa-zhi-zhi-translation-pronunciation-and-example-sentences/
支持	zhī chí	chi chi	zi1 ci4	[{"meaning": "support, backing", "part_of_speech": "noun"}, {"meaning": "to support, to back", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%94%af%e6%8c%81-zhi-chi-translation-pronunciation-and-example-sentences/
值得	zhí dé	trị giá	zi6 dak1	[{"meaning": "to be worth, to deserve", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%80%bc%e5%be%97-zhi-de-translation-pronunciation-and-example-sentences/
只好	zhǐ hǎo	chỉ hảo	zi2 hou2	[{"meaning": "have to", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e5%8f%aa%e5%a5%bd-zhi-hao-translation-pronunciation-and-example-sentences/
直接	zhí jiē	trực tiếp	zik6 zik1	[{"meaning": "direct, immediate", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e7%9b%b4%e6%8e%a5-zhi-jie-translation-pronunciation-and-example-sentences/
质量	zhì liàng	chất lượng	zat1 loeng6	[{"meaning": "quality", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%b4%a8%e9%87%8f-zhi-liang-translation-pronunciation-and-example-sentences/
至少	zhì shǎo	chí thấu	zi3 siu1	[{"meaning": "at least", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e8%87%b3%e5%b0%91-zhi-shao-translation-pronunciation-and-example-sentences/
知识	zhī shi	tri thức	zi1 sik1	[{"meaning": "knowledge", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%9f%a5%e8%af%86-zhi-shi-translation-pronunciation-and-example-sentences/
植物	zhí wù	thực vật	zik6 mat6	[{"meaning": "plant", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%a4%8d%e7%89%a9-zhi-wu-translation-pronunciation-and-example-sentences/
只要	zhǐ yào	chỉ yếu	zi2 jiu1	[{"meaning": "if only, as long as", "part_of_speech": "conjunction"}]	https://wohok.com/dict/%e5%8f%aa%e8%a6%81-zhi-yao-translation-pronunciation-and-example-sentences/
职业	zhí yè	chức nghiệp	zik1 jip6	[{"meaning": "occupation, profession", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%81%8c%e4%b8%9a-zhi-ye-translation-pronunciation-and-example-sentences/
制造	zhì zào	chế tạo	zai3 zou6	[{"meaning": "to make, to manufacture", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%88%b6%e9%80%a0-zhi-zao-translation-pronunciation-and-example-sentences/
重点	zhòng diǎn	trọng điểm	zung6 dim2	[{"meaning": "emphasis, focal point, priority", "part_of_speech": "noun"}]	https://wohok.com/dict/%e9%87%8d%e7%82%b9-zhong-dian-translation-pronunciation-and-example-sentences/
重视	zhòng shì	trọng thị	zung6 si6	[{"meaning": "to value, to attach importance to", "part_of_speech": "verb"}]	https://wohok.com/dict/%e9%87%8d%e8%a7%86-zhong-shi-translation-pronunciation-and-example-sentences/
中文	Zhōng wén	Trung văn	zung1 man4	[{"meaning": "Chinese language", "part_of_speech": "noun"}]	https://wohok.com/dict/%e4%b8%ad%e6%96%87-zhong-wen-translation-pronunciation-and-example-sentences/
周围	zhōu wéi	chu vi	zau1 wai4	[{"meaning": "surroundings, environment", "part_of_speech": "noun"}, {"meaning": "around, about", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e5%91%a8%e5%9b%b4-zhou-wei-translation-pronunciation-and-example-sentences/
猪	zhū	trư	zyu1	[{"meaning": "pig", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%8c%aa-zhu-translation-pronunciation-and-example-sentences/
主动	zhǔ dòng	chủ động	zyu2 dung6	[{"meaning": "to take the initiative", "part_of_speech": "verb"}, {"meaning": "active", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e4%b8%bb%e5%8a%a8-zhu-dong-translation-pronunciation-and-example-sentences/
祝贺	zhù hè	chúc họa	zuk1 ho2	[{"meaning": "congratulations", "part_of_speech": "noun"}, {"meaning": "to congratulate", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%a5%9d%e8%b4%ba-zhu-he-translation-pronunciation-and-example-sentences/
逐渐	zhú jiàn	trục tiến	zuk6 gaan2	[{"meaning": "gradually", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e9%80%90%e6%b8%90-zhu-jian-translation-pronunciation-and-example-sentences/
著名	zhù míng	trứ danh	zoek6 meng4	[{"meaning": "famous, well-known", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e8%91%97%e5%90%8d-zhu-ming-translation-pronunciation-and-example-sentences/
主意	zhǔ yi	chủ ý	zyu2 ji3	[{"meaning": "idea, plan, decision", "part_of_speech": "noun"}]	https://wohok.com/dict/%e4%b8%bb%e6%84%8f-zhu-yi-translation-pronunciation-and-example-sentences/
赚	zhuàn	chứa	zyun6	[{"meaning": "to earn, to make a profit", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%b5%9a-zhuan-translation-pronunciation-and-example-sentences/
专门	zhuān mén	chuyên môn	zyun1 mun4	[{"meaning": "special, specialized", "part_of_speech": "adjective"}, {"meaning": "specialized", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e4%b8%93%e9%97%a8-zhuan-men-translation-pronunciation-and-example-sentences/
专业	zhuān yè	chuyên nghiệp	zyun1 jip6	[{"meaning": "speciality, major, field of study", "part_of_speech": "noun"}]	https://wohok.com/dict/%e4%b8%93%e4%b8%9a-zhuan-ye-translation-pronunciation-and-example-sentences/
撞	zhuàng	đường	zong6	[{"meaning": "to hit, to bump against, to collide, to run into", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%92%9e-zhuang-translation-pronunciation-and-example-sentences/
准确	zhǔn què	chuẩn xác	zeon2 kok3	[{"meaning": "accurate, precise, exact", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%87%86%e7%a1%ae-zhun-que-translation-pronunciation-and-example-sentences/
准时	zhǔn shí	chuẩn thời	zeon2 si4	[{"meaning": "on time, punctual", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%87%86%e6%97%b6-zhun-shi-translation-pronunciation-and-example-sentences/
自然	zì rán	tự nhiên	zi6 jan4	[{"meaning": "nature", "part_of_speech": "noun"}, {"meaning": "natural", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e8%87%aa%e7%84%b6-zi-ran-translation-pronunciation-and-example-sentences/
仔细	zǐ xì	tử tứ	zai2 sai3	[{"meaning": "careful, attentive, cautious", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e4%bb%94%e7%bb%86-zi-xi-translation-pronunciation-and-example-sentences/
总结	zǒng jié	tông kết	zung2 git3	[{"meaning": "summary", "part_of_speech": "noun"}, {"meaning": "to sum up", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%80%bb%e7%bb%93-zong-jie-translation-pronunciation-and-example-sentences/
租	zū	tử	zou1	[{"meaning": "to rent, to hire", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%a7%9f-zu-translation-pronunciation-and-example-sentences/
组成	zǔ chéng	tố chúng	zou2 sing4	[{"meaning": "composition", "part_of_speech": "noun"}, {"meaning": "to form, to compose, to constitute", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%bb%84%e6%88%90-zu-cheng-translation-pronunciation-and-example-sentences/
组织	zǔ zhī	tố tổ	zou2 zi6	[{"meaning": "organisation", "part_of_speech": "noun"}, {"meaning": "to organize", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%bb%84%e7%bb%87-zu-zhi-translation-pronunciation-and-example-sentences/
嘴	zuǐ	tuý	zeoi2	[{"meaning": "mouth", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%98%b4-zui-translation-pronunciation-and-example-sentences/
最好	zuì hǎo	tối hảo	zeoi3 hou2	[{"meaning": "it would be best, had better", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e6%9c%80%e5%a5%bd-zui-hao-translation-pronunciation-and-example-sentences/
最后	zuì hòu	tối hậu	zeoi3 hau6	[{"meaning": "finally, at last", "part_of_speech": "time"}]	https://wohok.com/dict/%e6%9c%80%e5%90%8e-zui-hou-translation-pronunciation-and-example-sentences/
尊重	zūn zhòng	tôn trọng	zyun1 zung6	[{"meaning": "respect, esteem", "part_of_speech": "noun"}, {"meaning": "to respect, to honor", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%b0%8a%e9%87%8d-zun-zhong-translation-pronunciation-and-example-sentences/
座	zuò	toạ	zo6	[{"meaning": "seat", "part_of_speech": "noun"}, {"meaning": "for cities, buildings, mountains, etc.", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e5%ba%a7-zuo-translation-pronunciation-and-example-sentences/
做生意	zuò shēng yi	tạo sinh ý	zou6 sang1 ji3	[{"meaning": "to do business", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%81%9a%e7%94%9f%e6%84%8f-zuo-sheng-yi-translation-pronunciation-and-example-sentences/
座位	zuò wèi	toạ vị	zo6 wai6	[{"meaning": "seat, place", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%ba%a7%e4%bd%8d-zuo-wei-translation-pronunciation-and-example-sentences/
作者	zuò zhě	tác giả	co5 jo6	[{"meaning": "author, writer", "part_of_speech": "noun"}]	https://wohok.com/dict/%e4%bd%9c%e8%80%85-zuo-zhe-translation-pronunciation-and-example-sentences/
咬	yǎo	nhẩu	ngaau5	[{"meaning": "to bite", "part_of_speech": "verb"}]	\N
政策	zhèng cè	chính sách	jing3 caak1	[{"meaning": "policy", "part_of_speech": "noun"}]	\N
政府	zhèng fǔ	chính phủ	jing3 fu2	[{"meaning": "government", "part_of_speech": "noun"}]	\N
整个	zhěng gè	chính cái	jing2 go3	[{"meaning": "whole, entire", "part_of_speech": "adjective"}]	\N
证件	zhèng jiàn	chứng cứ	jing3 gin2	[{"meaning": "certificate", "part_of_speech": "noun"}]	\N
证据	zhèng jù	chứng cứ	jing3 geoi3	[{"meaning": "evidence, proof", "part_of_speech": "noun"}]	\N
争论	zhēng lùn	tranh luận	zang1 leon6	[{"meaning": "argument, debate", "part_of_speech": "noun"}, {"meaning": "to argue, to debate", "part_of_speech": "verb"}]	\N
挣钱	zhèng qián	kiếm tiền	zang1 cin2	[{"meaning": "to make money", "part_of_speech": "verb"}]	\N
征求	zhēng qiú	triều cầu	zing1 kau4	[{"meaning": "to solicit, to seek, to ask for", "part_of_speech": "verb"}]	\N
争取	zhēng qǔ	chinh phóng	zang1 ceoi2	[{"meaning": "to strive for, to fight for", "part_of_speech": "verb"}]	\N
睁	zhēng	tránh	zang1	[{"meaning": "to open (the eyes)", "part_of_speech": "verb"}]	\N
唉	āi	ai1	ai1	[{"meaning": "uh (sigh)", "part_of_speech": "particle"}]	\N
爱护	ài hù	ái hữu	oi3 wu6	[{"meaning": "to cherish, to take good care of", "part_of_speech": "verb"}]	\N
爱惜	ài xī	ái tế	oi3 sik1	[{"meaning": "to cherish, to treasure", "part_of_speech": "verb"}]	\N
爱心	ài xīn	ái tâm	oi3 sam1	[{"meaning": "tender feelings; affections", "part_of_speech": "noun"}]	\N
岸	àn	ngạn	ngon6	[{"meaning": "shore, beach, coast", "part_of_speech": "noun"}]	\N
安慰	ān wèi	an ủy	on1 wai3	[{"meaning": "comfort, consolation", "part_of_speech": "noun"}, {"meaning": "to comfort, to console", "part_of_speech": "verb"}]	\N
安装	ān zhuāng	an trang	on1 jong1	[{"meaning": "installation", "part_of_speech": "noun"}, {"meaning": "to install, to mount", "part_of_speech": "verb"}]	\N
把握	bǎ wò	bảo ác	baa2 ak1	[{"meaning": "assurance", "part_of_speech": "noun"}, {"meaning": "to grasp, to hold", "part_of_speech": "verb"}]	\N
摆	bǎi	bài	bai2	[{"meaning": "pendulum", "part_of_speech": "noun"}, {"meaning": "to put, to place, to arragne", "part_of_speech": "verb"}]	\N
办理	bàn lǐ	ban lý	baan6 lei5	[{"meaning": "to handle, to conduct", "part_of_speech": "verb"}]	\N
班主任	bān zhǔ rèn	ban chủ nhân	baan1 zyu2 jan6	[{"meaning": "teacher in charge of a class", "part_of_speech": "noun"}]	\N
棒	bàng	bàng	bong6	[{"meaning": "stick, club", "part_of_speech": "noun"}, {"meaning": "strong, capable, good", "part_of_speech": "adjective"}, {"meaning": "for legs of relay race", "part_of_speech": "measure word"}]	\N
傍晚	bàng wǎn	bàng vãn	bong6 maan5	[{"meaning": "towards evening, at nightfall", "part_of_speech": "time"}]	\N
薄	báo	bạc	bok6	[{"meaning": "thin", "part_of_speech": "adjective"}]	\N
宝贝	bǎo bèi	bảo bối	bou2 bai3	[{"meaning": "darling, baby", "part_of_speech": "noun"}]	\N
保持	bǎo chí	bảo trì	bou2 chi4	[{"meaning": "to keep, to maintain, to preserve", "part_of_speech": "verb"}]	\N
保存	bǎo cún	bảo tồn	bou2 tyun4	[{"meaning": "to conserve, to keep, to save (IT)", "part_of_speech": "verb"}]	\N
报告	bào gào	báo cáo	bou3 gou3	[{"meaning": "report, speech, talk", "part_of_speech": "noun"}, {"meaning": "to report", "part_of_speech": "verb"}]	\N
宝贵	bǎo guì	bảo quý	bou2 gwai3	[{"meaning": "valuable, precious", "part_of_speech": "adjective"}]	\N
包裹	bāo guǒ	bao quấn	baau1 gwaan3	[{"meaning": "parcel, package", "part_of_speech": "noun"}, {"meaning": "to wrap up", "part_of_speech": "verb"}]	\N
包含	bāo hán	bao hàm	baau1 ham4	[{"meaning": "to contain, to emobdy, to include", "part_of_speech": "verb"}]	\N
保留	bǎo liú	bảo lưu	bou2 lau4	[{"meaning": "reservation", "part_of_speech": "noun"}, {"meaning": "to reserve,  to hold back", "part_of_speech": "verb"}]	\N
保险	bǎo xiǎn	bảo hiểm	bou2 him2	[{"meaning": "insurance", "part_of_speech": "noun"}, {"meaning": "to insure", "part_of_speech": "verb"}, {"meaning": "safe, secure", "part_of_speech": "adjective"}]	\N
包子	bāo zi	bánh bao	baau1 zi2	[{"meaning": "steamed stuffed bun", "part_of_speech": "noun"}]	\N
背	bèi	bối	bui3	[{"meaning": "back", "part_of_speech": "noun"}, {"meaning": "to learn by heart", "part_of_speech": "verb"}]	\N
悲观	bēi guān	bi quan	bei1 gun1	[{"meaning": "pessimistic", "part_of_speech": "adjective"}]	\N
背景	bèi jǐng	bối cảnh	bui3 ging2	[{"meaning": "background, context", "part_of_speech": "noun"}]	\N
被子	bèi zi	bị tử	bei6 zi2	[{"meaning": "quilt", "part_of_speech": "noun"}]	\N
本科	běn kē	bổn khoa	bun2 fo1	[{"meaning": "Bachelor course", "part_of_speech": "noun"}]	\N
本领	běn lǐng	bổn lĩnh	bun2 ling5	[{"meaning": "skill, ability, capability", "part_of_speech": "noun"}]	\N
本质	běn zhì	bổn chất	bun2 zat1	[{"meaning": "essence, nature", "part_of_speech": "noun"}]	\N
彼此	bǐ cǐ	bỉ thứ	bei2 ci4	[{"meaning": "each other, one another", "part_of_speech": "pronoun"}]	\N
毕竟	bì jìng	tất kinh	bat1 ging2	[{"meaning": "after all, in the end", "part_of_speech": "adverb"}]	\N
比例	bǐ lì	tỷ lệ	bei2 lai6	[{"meaning": "proportion, scale", "part_of_speech": "noun"}]	\N
避免	bì miǎn	tị miễn	bei6 min5	[{"meaning": "to avoid, to prevent", "part_of_speech": "verb"}]	\N
必然	bì rán	tất nhiên	bat1 jin4	[{"meaning": "inevitable, certain", "part_of_speech": "adjective"}]	\N
比如	bǐ rú	tỷ như	bei2 jyu4	[{"meaning": "for example", "part_of_speech": "adverb"}]	\N
必需	bì xū	tất yêu	bat1 seoi1	[{"meaning": "to really need, to be essential, must", "part_of_speech": "verb"}]	\N
必要	bì yào	tất yếu	bat1 yiu1	[{"meaning": "necessary, essential", "part_of_speech": "adjective"}]	\N
便	biàn	tiện	bin6	[{"meaning": "to relieve oneself", "part_of_speech": "verb"}, {"meaning": "convenient, handy", "part_of_speech": "adjective"}, {"meaning": "then, in that case", "part_of_speech": "adverb"}]	\N
编辑	biān jí	biên soạn	bin6 zin2	[{"meaning": "editor, compiler", "part_of_speech": "noun"}, {"meaning": "to edit, to compile", "part_of_speech": "verb"}]	\N
辩论	biàn lùn	biện luận	bin6 leon6	[{"meaning": "debate, argument", "part_of_speech": "noun"}, {"meaning": "to debate, to argue", "part_of_speech": "verb"}]	\N
鞭炮	biān pào	tiên pháo	bin1 paau3	[{"meaning": "firecrackers", "part_of_speech": "noun"}]	\N
标点	biāo diǎn	tiêu điểm	biu1 dim1	[{"meaning": "punctuation, punctuation mark", "part_of_speech": "noun"}]	\N
表面	biǎo miàn	biểu diện	biu2 min6	[{"meaning": "surface, outside, appearance", "part_of_speech": "noun"}]	\N
表明	biǎo míng	biểu minh	biu2 ming4	[{"meaning": "to show, to indicate, to make clear", "part_of_speech": "verb"}]	\N
表情	biǎo qíng	biểu tình	biu2 cing4	[{"meaning": "expression", "part_of_speech": "noun"}]	\N
表现	biǎo xiàn	biểu hiện	biu2 hin6	[{"meaning": "to show, to express, to display", "part_of_speech": "verb"}]	\N
标志	biāo zhì	tiêu chí	biu1 zi6	[{"meaning": "symbol, sign", "part_of_speech": "noun"}, {"meaning": "to symbolize, to indicate", "part_of_speech": "verb"}]	\N
丙	bǐng	bính	bing2	[{"meaning": "third(ly)", "part_of_speech": "number"}]	\N
病毒	bìng dú	bệnh độc	beng6 duk6	[{"meaning": "virus", "part_of_speech": "noun"}]	\N
玻璃	bō li	bo ly	bo1 lei4	[{"meaning": "glass", "part_of_speech": "noun"}]	\N
博物馆	bó wù guǎn	bách vật quán	bok3 mat6 gun2	[{"meaning": "museum", "part_of_speech": "noun"}]	\N
脖子	bó zi	bộc tử	bot6 zi2	[{"meaning": "neck", "part_of_speech": "noun"}]	\N
布	bù	bố	bou3	[{"meaning": "cloth", "part_of_speech": "noun"}]	\N
不安	bù ān	bất an	bat1 on1	[{"meaning": "disturbed, uneasy", "part_of_speech": "adjective"}]	\N
不必	bú bì	bất cần	bat1 bit1	[{"meaning": "does not have to", "part_of_speech": "verb"}]	\N
补充	bǔ chōng	bổ sung	bou2 cung1	[{"meaning": "supplement", "part_of_speech": "noun"}, {"meaning": "to supplement, to complement", "part_of_speech": "verb"}, {"meaning": "additional, supplementary", "part_of_speech": "adjective"}]	\N
不得了	bù dé liǎo	bất đắc liễu	bat1 dak1 liu5	[{"meaning": "disastrous, terrible", "part_of_speech": "adjective"}, {"meaning": "extremely, terribly", "part_of_speech": "adverb"}]	\N
不断	bú duàn	bất đoạn	bat1 dyun6	[{"meaning": "continuous, unceasing", "part_of_speech": "adverb"}]	\N
不好意思	bù hǎo yì si	bất hảo ý tứ	bat1 hou2 ji3 si1	[{"meaning": "to feel embarrassed", "part_of_speech": "verb"}, {"meaning": "excuse me, sorry", "part_of_speech": "expression"}]	\N
不见得	bú jiàn dé	bất kiến đắc	bat1 gin3 dak1	[{"meaning": "not necessarily, not likely", "part_of_speech": "adverb"}]	\N
部门	bù mén	bộ môn	bou6 mun6	[{"meaning": "department, branch", "part_of_speech": "noun"}]	\N
不免	bù miǎn	bất miễn	bat1 min5	[{"meaning": "inevitably", "part_of_speech": "adverb"}]	\N
不耐烦	bú nài fán	bất nại phiền	bat1 noi6 faan4	[{"meaning": "impatience", "part_of_speech": "noun"}, {"meaning": "impatient", "part_of_speech": "adjective"}]	\N
不然	bù rán	bất nhiên	bat1 jin4	[{"meaning": "otherwise", "part_of_speech": "conjunction"}]	\N
不如	bù rú	bất như	bat1 jyu4	[{"meaning": "not as good as", "part_of_speech": "verb"}]	\N
不要紧	bú yào jǐn	bất yếu khanh	bat1 jiu3 gan2	[{"meaning": "it doesn’t matter, never mind", "part_of_speech": "expression"}]	\N
步骤	bù zhòu	bộ chước	bou6 zoek3	[{"meaning": "step, move, measure", "part_of_speech": "noun"}]	\N
不足	bù zú	bất túc	bat1 zuk1	[{"meaning": "shortcomings", "part_of_speech": "noun"}, {"meaning": "insufficient, not enough", "part_of_speech": "adjective"}]	\N
踩	cǎi	thải	caai2	[{"meaning": "to stamp on, to step, to press a pedal", "part_of_speech": "verb"}]	\N
财产	cái chǎn	tài sản	coi4 san2	[{"meaning": "property, possession", "part_of_speech": "noun"}]	\N
采访	cǎi fǎng	thải phỏng	caai2 fong2	[{"meaning": "to interview, to gather news", "part_of_speech": "verb"}]	\N
彩虹	cǎi hóng	thái hồng	coi2 hung4	[{"meaning": "rainbow", "part_of_speech": "noun"}]	\N
采取	cǎi qǔ	thải thủ	caai2 keoi5	[{"meaning": "to carry out, to adopt, to take", "part_of_speech": "verb"}]	\N
残疾	cán jí	tàn kịch	caan4 gat1	[{"meaning": "disability, deformity", "part_of_speech": "noun"}, {"meaning": "disabled, handicapped", "part_of_speech": "adjective"}]	\N
参考	cān kǎo	tam khảo	caam1 hou3	[{"meaning": "consultation, reference", "part_of_speech": "noun"}, {"meaning": "to consult, to refer to", "part_of_speech": "verb"}]	\N
惭愧	cán kuì	sởn quỳ	caam2 quai3	[{"meaning": "ashamed", "part_of_speech": "adjective"}]	\N
餐厅	cān tīng	thẩm đình	caan1 teng1	[{"meaning": "restaurant", "part_of_speech": "noun"}]	\N
参与	cān yù	tam dự	caam1 jyu6	[{"meaning": "to participate in, to attach oneself to", "part_of_speech": "verb"}]	\N
操场	cāo chǎng	thao trường	cou1 coeng4	[{"meaning": "playground, sports field", "part_of_speech": "noun"}]	\N
操心	cāo xīn	thao tâm	cou1 sam1	[{"meaning": "to worry about, to take pains", "part_of_speech": "verb"}]	\N
册	cè	tách	caak3	[{"meaning": "book, booklet", "part_of_speech": "noun"}, {"meaning": "for books", "part_of_speech": "measure word"}]	\N
厕所	cè suǒ	sét tục	ci3 so2	[{"meaning": "toilet", "part_of_speech": "noun"}]	\N
测验	cè yàn	thí nghiệm	caak1 jim6	[{"meaning": "test, examination", "part_of_speech": "noun"}, {"meaning": "to test", "part_of_speech": "verb"}]	\N
曾经	céng jīng	tằng kinh	cang4 ging1	[{"meaning": "once, former, previously", "part_of_speech": "adverb"}]	\N
插	chā	sáp	caap3	[{"meaning": "to insert, to stick in", "part_of_speech": "verb"}]	\N
差别	chā bié	sự bie1	caa1 bit6	[{"meaning": "difference", "part_of_speech": "noun"}]	\N
叉子	chā zi	sả tử	caa1 zi2	[{"meaning": "fork", "part_of_speech": "noun"}]	\N
拆	chāi	sởi	caai1	[{"meaning": "open, tear down", "part_of_speech": "verb"}]	\N
产品	chǎn pǐn	sản phẩm	caan1 ban2	[{"meaning": "product, goods", "part_of_speech": "noun"}]	\N
产生	chǎn shēng	sản sinh	caan1 sang1	[{"meaning": "to produce, to come about", "part_of_speech": "verb"}]	\N
常识	cháng shí	thường thức	soeng4 sik1	[{"meaning": "common sense, general knowledge", "part_of_speech": "noun"}]	\N
长途	cháng tú	trường đồ	coeng4 tou4	[{"meaning": "long distance", "part_of_speech": "noun"}]	\N
朝	cháo	triều	ciu4	[{"meaning": "dynasty, imperial or royal court", "part_of_speech": "noun"}, {"meaning": "towards, facing", "part_of_speech": "relative clause"}]	\N
炒	chǎo	xào	caau2	[{"meaning": "to fry", "part_of_speech": "verb"}]	\N
抄	chāo	sao	caau1	[{"meaning": "to copy, to plagiarize", "part_of_speech": "verb"}]	\N
朝代	cháo dài	triều đại	ciu4 doi6	[{"meaning": "dynasty", "part_of_speech": "noun"}]	\N
吵架	chǎo jià	xào nhãn	caau2 gaa3	[{"meaning": "quarrel", "part_of_speech": "noun"}, {"meaning": "to quarrel", "part_of_speech": "verb"}]	\N
彻底	chè dǐ	triệt đề	cit3 dai2	[{"meaning": "thorough", "part_of_speech": "adjective"}]	\N
车库	chē kù	xa khố	ce1 fu3	[{"meaning": "garage", "part_of_speech": "noun"}]	\N
车厢	chē xiāng	xa hàng	ce1 hoeng1	[{"meaning": "carriage", "part_of_speech": "noun"}]	\N
趁	chèn	xẻn	can3	[{"meaning": "to take advantage of", "part_of_speech": "verb"}]	\N
沉默	chén mò	trầm mặc	cam4 mok6	[{"meaning": "silence, hush", "part_of_speech": "noun"}, {"meaning": "to keep silent", "part_of_speech": "verb"}, {"meaning": "silent, uncommunicative", "part_of_speech": "adjective"}]	\N
乘	chéng	thừa	sing4	[{"meaning": "to ride on, to multiply", "part_of_speech": "verb"}]	\N
称	chēng	xưng	sing4	[{"meaning": "to weigh, to name, to state", "part_of_speech": "verb"}]	\N
承担	chéng dān	thành đảm	sing4 daam1	[{"meaning": "to undertake, to shoulder, to take (responsibility, etc.)", "part_of_speech": "verb"}]	\N
程度	chéng dù	trình độ	cing4 dou6	[{"meaning": "degree, extent, level", "part_of_speech": "noun"}]	\N
成分	chéng fèn	thành phần	sing4 fan6	[{"meaning": "ingredient, component", "part_of_speech": "noun"}]	\N
成果	chéng guǒ	thành quả	sing4 gwo2	[{"meaning": "result, achievement, gain", "part_of_speech": "noun"}]	\N
称呼	chēng hu	xưng hô	sing4 fu1	[{"meaning": "name, term of address", "part_of_speech": "noun"}, {"meaning": "to address sb., to call sb. (a name)", "part_of_speech": "verb"}]	\N
成就	chéng jiù	thành tựu	sing4 zau6	[{"meaning": "accomplishment, achievement", "part_of_speech": "noun"}]	\N
诚恳	chéng kěn	thành kính	sing4 han6	[{"meaning": "sincere, honest", "part_of_speech": "adjective"}]	\N
成立	chéng lì	thành lập	sing4 lap6	[{"meaning": "to establish, to set up, to found", "part_of_speech": "verb"}]	\N
承认	chéng rèn	thành nhận	sing4 yin1	[{"meaning": "recognition", "part_of_speech": "noun"}, {"meaning": "to admit, to recognize, to acknowledge", "part_of_speech": "verb"}]	\N
承受	chéng shòu	thành thụ	sing4 sau6	[{"meaning": "to bear, to endure, to receive", "part_of_speech": "verb"}]	\N
程序	chéng xù	trình tự	cing4 ceoi4	[{"meaning": "procedure, process, program (IT)", "part_of_speech": "noun"}]	\N
成语	chéng yǔ	thành ngữ	sing4 jyu5	[{"meaning": "idiom, proverb", "part_of_speech": "noun"}]	\N
称赞	chēng zàn	xưng tán	sing4 zaam2	[{"meaning": "to praise, to acclaim, to commend", "part_of_speech": "verb"}]	\N
成长	chéng zhǎng	thành trưởng	sing4 zoeng3	[{"meaning": "to grow up, to mature", "part_of_speech": "verb"}]	\N
翅膀	chì bǎng	sì bàng	ci4 bong2	[{"meaning": "wing", "part_of_speech": "noun"}]	\N
吃亏	chī kuī	xích thiệt	hek3 kwai1	[{"meaning": "to suffer losses, to lose out", "part_of_speech": "verb"}]	\N
持续	chí xù	trì túc	ci4 cuk1	[{"meaning": "to continue, to persist", "part_of_speech": "verb"}]	\N
池子	chí zi	trì tử	ci4 zi2	[{"meaning": "pond", "part_of_speech": "noun"}]	\N
尺子	chǐ zi	xích tử	cek3 zi2	[{"meaning": "ruler", "part_of_speech": "noun"}]	\N
冲	chōng	xung	cung1	[{"meaning": "to flush, to head for", "part_of_speech": "verb"}]	\N
充电器	chōng diàn qì	sùng điện khí	cung1 din6 hei3	[{"meaning": "battery charger", "part_of_speech": "noun"}]	\N
充分	chōng fèn	sùng phận	cung1 fan6	[{"meaning": "ample, full, abundant", "part_of_speech": "adjective"}]	\N
重复	chóng fù	trùng phỏng	cung4 fuk1	[{"meaning": "to repeat, to duplicate", "part_of_speech": "verb"}]	\N
充满	chōng mǎn	sùng mãn	cung1 maan5	[{"meaning": "brimming with, full of", "part_of_speech": "verb"}]	\N
宠物	chǒng wù	sủng vật	cung4 mat6	[{"meaning": "pet", "part_of_speech": "noun"}]	\N
臭	chòu	xú	cau3	[{"meaning": "smelly", "part_of_speech": "adjective"}]	\N
丑	chǒu	xấu	cau2	[{"meaning": "clown", "part_of_speech": "noun"}, {"meaning": "ugly, bad-looking", "part_of_speech": "adjective"}]	\N
抽屉	chōu ti	trừu đề	cau1 tai4	[{"meaning": "drawer", "part_of_speech": "noun"}]	\N
抽象	chōu xiàng	trừu tượng	cau1 coeng2	[{"meaning": "abstract", "part_of_speech": "adjective"}]	\N
除	chú	trừ	ceoi4	[{"meaning": "to divide, to exclude", "part_of_speech": "verb"}, {"meaning": "except for", "part_of_speech": "relative clause"}]	\N
出版	chū bǎn	xuất bản	ceot1 baan6	[{"meaning": "to publish", "part_of_speech": "verb"}]	\N
除非	chú fēi	trừ phi	ceoi4 fei1	[{"meaning": "only if, unless", "part_of_speech": "conjunction"}]	\N
初级	chū jí	sơ cấp	co1 kap1	[{"meaning": "primary, elementary", "part_of_speech": "adjective"}]	\N
出口	chū kǒu	xuất khẩu	ceot1 hau2	[{"meaning": "exit, export", "part_of_speech": "noun"}]	\N
处理	chǔ lǐ	xử lý	ceoi2 lei5	[{"meaning": "to deal with, to handle, to cope with", "part_of_speech": "verb"}]	\N
出色	chū sè	xuất sắc	ceot1 sik1	[{"meaning": "outstanding, remarkable", "part_of_speech": "adjective"}]	\N
除夕	chú xī	trừ tịch	ceoi4 zik6	[{"meaning": "New Year’s Eve", "part_of_speech": "noun"}]	\N
出席	chū xí	xuất tịch	ceot1 zik1	[{"meaning": "to attend, to be present", "part_of_speech": "verb"}]	\N
传播	chuán bō	truyền bá	cyun4 bo1	[{"meaning": "to spread, to propagate, to disseminate", "part_of_speech": "verb"}]	\N
传递	chuán dì	truyền đạt	cyun4 dak1	[{"meaning": "to pass on to, to transfer", "part_of_speech": "verb"}]	\N
传染	chuán rǎn	truyền nhiễm	cyun4 nam4	[{"meaning": "to infect, to be contagious", "part_of_speech": "verb"}]	\N
传说	chuán shuō	truyền thuyết	cyun4 syut3	[{"meaning": "legend, folklore", "part_of_speech": "noun"}, {"meaning": "it is said, that…", "part_of_speech": "verb"}]	\N
传统	chuán tǒng	truyền thống	cyun4 tung4	[{"meaning": "tradition", "part_of_speech": "noun"}, {"meaning": "traditional", "part_of_speech": "adjective"}]	\N
闯	chuǎng	sướng	cong2	[{"meaning": "to rush, to break through, to charge", "part_of_speech": "verb"}]	\N
窗帘	chuāng lián	song liêm	cong1 lim4	[{"meaning": "window curtains", "part_of_speech": "noun"}]	\N
创造	chuàng zào	sáng tạo	cong3 zou6	[{"meaning": "creation", "part_of_speech": "noun"}, {"meaning": "to create, to produce", "part_of_speech": "verb"}]	\N
吹	chuī	xuy	ceoi1	[{"meaning": "to blow, to boast, to fail", "part_of_speech": "verb"}]	\N
磁带	cí dài	từ đĩa	ci4 daai2	[{"meaning": "magnetic tape", "part_of_speech": "noun"}]	\N
刺激	cì jī	xích kích	ci3 gik1	[{"meaning": "stimulus, provocation", "part_of_speech": "noun"}, {"meaning": "to provoke, to stimulate, to excite", "part_of_speech": "verb"}]	\N
此外	cǐ wài	thử ngoại	ci2 ngoi6	[{"meaning": "besides, moreover", "part_of_speech": "conjunction"}]	\N
次要	cì yào	thứ yếu	ci3 jiu1	[{"meaning": "secondary, subordinate", "part_of_speech": "adjective"}]	\N
辞职	cí zhí	từ chức	ci4 zi3	[{"meaning": "to resign", "part_of_speech": "verb"}]	\N
从此	cóng cǐ	tòng từ	cung4 ci3	[{"meaning": "from now on", "part_of_speech": "conjunction"}]	\N
从而	cóng ér	tòng nhi	cung4 ji4	[{"meaning": "thus, thereby", "part_of_speech": "conjunction"}]	\N
匆忙	cōng máng	từng mông	cung1 mong4	[{"meaning": "hasty, hurried", "part_of_speech": "adjective"}]	\N
从前	cóng qián	tòng tiền	cung4 cin4	[{"meaning": "previously, formerly", "part_of_speech": "time"}]	\N
从事	cóng shì	tòng sự	cung4 si6	[{"meaning": "to engage in, to do (formal)", "part_of_speech": "verb"}]	\N
醋	cù	tồ	cou3	[{"meaning": "vinegar", "part_of_speech": "noun"}]	\N
促进	cù jìn	thúc tiến	cuk1 zeon2	[{"meaning": "to promote, to advance", "part_of_speech": "verb"}]	\N
促使	cù shǐ	thúc sự	cuk1 ci2	[{"meaning": "to urge, to push, to promote", "part_of_speech": "verb"}]	\N
催	cuī	thôi	coi1	[{"meaning": "to urge, to press", "part_of_speech": "verb"}]	\N
存	cún	tồn	cyun4	[{"meaning": "to deposit, to keep", "part_of_speech": "verb"}]	\N
存在	cún zài	tồn tại	cyun4 zaai6	[{"meaning": "to exist", "part_of_speech": "verb"}]	\N
措施	cuò shī	thổ soái	co3 sai1	[{"meaning": "measure, step", "part_of_speech": "noun"}]	\N
错误	cuò wù	sai lầm	co2 wu6	[{"meaning": "error, mistake", "part_of_speech": "noun"}]	\N
达到	dá dào	đạt đáo	daat6 doi6	[{"meaning": "to achieve, to reach, to attain", "part_of_speech": "verb"}]	\N
大方	dà fang	đại phương	daai6 fong1	[{"meaning": "generous, of good taste", "part_of_speech": "adjective"}]	\N
打工	dǎ gōng	đảo công	daa2 gung1	[{"meaning": "a part time job", "part_of_speech": "noun"}, {"meaning": "to work (temporary or casual)", "part_of_speech": "verb"}]	\N
打交道	dǎ jiāo dao	đảo giao đạo	daa2 gaau1 dou6	[{"meaning": "have dealings with", "part_of_speech": "verb"}]	\N
打喷嚏	dǎ pēn tì	đảo phản đề	daa2 pan1 tai3	[{"meaning": "to sneeze", "part_of_speech": "verb"}]	\N
打听	dǎ ting	đảo tính	daa2 ting1	[{"meaning": "to ask about, to inquire about, to nose into", "part_of_speech": "verb"}]	\N
大象	dà xiàng	đại tượng	daai6 zoeng6	[{"meaning": "elephant", "part_of_speech": "noun"}]	\N
大型	dà xíng	đại hình	daai6 jing4	[{"meaning": "large-scale", "part_of_speech": "adjective"}]	\N
答应	dā ying	đáp ứng	daap3 jing5	[{"meaning": "to agree, to promise, to respond", "part_of_speech": "verb"}]	\N
打招呼	dǎ zhāo hu	đảo chiêu hô	daa2 ziu1 fu1	[{"meaning": "to greet sbd., to give prior notice", "part_of_speech": "verb"}]	\N
呆	dāi	đãi	daai6	[{"meaning": "to stay", "part_of_speech": "verb"}, {"meaning": "dull, foolish, stupid", "part_of_speech": "adjective"}]	\N
贷款	dài kuǎn	thải khoản	daai3 fun2	[{"meaning": "loan", "part_of_speech": "noun"}, {"meaning": "to provide a loan", "part_of_speech": "verb"}]	\N
待遇	dài yù	đãi dụ	doi6 jyu6	[{"meaning": "treatment, pay, salary", "part_of_speech": "noun"}]	\N
淡	dàn	đạm	daam6	[{"meaning": "mild, (rather) tasteless, light in color", "part_of_speech": "adjective"}]	\N
单纯	dān chún	đơn thuần	daan1 seon4	[{"meaning": "pure, simple", "part_of_speech": "adjective"}]	\N
单调	dān diào	đơn điệu	daan1 diu6	[{"meaning": "monotonous, dull", "part_of_speech": "adjective"}]	\N
单独	dān dú	đơn độc	daan1 duk6	[{"meaning": "alone, solo", "part_of_speech": "adjective"}]	\N
担任	dān rèn	đảm nhận	daam1 jam6	[{"meaning": "to hold the post of, to serve as", "part_of_speech": "verb"}]	\N
单位	dān wèi	đơn vị	daan1 wai2	[{"meaning": "unit", "part_of_speech": "noun"}]	\N
耽误	dān wu	đàm ngã	dam1 ngaa6	[{"meaning": "to delay", "part_of_speech": "verb"}]	\N
胆小鬼	dǎn xiǎo guǐ	đạm tiểu quỷ	dam2 siu2 gwai2	[{"meaning": "coward", "part_of_speech": "noun"}]	\N
单元	dān yuán	đơn nguyên	daan1 jyun4	[{"meaning": "unit, cell, entrance number", "part_of_speech": "noun"}]	\N
挡	dǎng	đặng	dong2	[{"meaning": "to block, to hinder, to obstruct", "part_of_speech": "verb"}]	\N
当代	dāng dài	đương đại	dong1 doi6	[{"meaning": "present, nowadays", "part_of_speech": "time"}]	\N
倒	dào	đảo	dou2	[{"meaning": "to pour, to reverse", "part_of_speech": "verb"}, {"meaning": "on the contrary, instead", "part_of_speech": "adverb"}]	\N
岛	dǎo	đảo	dou2	[{"meaning": "island", "part_of_speech": "noun"}]	\N
到达	dào dá	đáo đạt	dou3 daat6	[{"meaning": "to arrive, to reach", "part_of_speech": "verb"}]	\N
道德	dào dé	đạo đức	dou6 dak1	[{"meaning": "morality, ethics", "part_of_speech": "noun"}]	\N
道理	dào lǐ	đạo lý	dou6 lei5	[{"meaning": "principle, reason, argument", "part_of_speech": "noun"}]	\N
倒霉	dǎo méi	đảo mội	dou2 mui6	[{"meaning": "to have bad luck", "part_of_speech": "verb"}]	\N
导演	dǎo yǎn	đạo diễn	dou6 jin2	[{"meaning": "director (film, etc.)", "part_of_speech": "noun"}, {"meaning": "to direct", "part_of_speech": "verb"}]	\N
导致	dǎo zhì	đạo trí	dou6 zi1	[{"meaning": "to lead to, to create, to bring about", "part_of_speech": "verb"}]	\N
等待	děng dài	đẳng đái	dang2 doi6	[{"meaning": "to wait for, to await", "part_of_speech": "verb"}]	\N
等候	děng hòu	đẳng hậu	dang2 hau6	[{"meaning": "to wait", "part_of_speech": "verb"}]	\N
登记	dēng jì	đăng ký	dang1 gei3	[{"meaning": "to register", "part_of_speech": "verb"}]	\N
登机牌	dēng jī pái	đăng cơ paai	dang1 gei1 paai4	[{"meaning": "boarding pass", "part_of_speech": "noun"}]	\N
等于	děng yú	đẳng vụ	dang2 jyu1	[{"meaning": "to equal, to amount to", "part_of_speech": "verb"}]	\N
递	dì	đi	dai6	[{"meaning": "to pass, to hand over", "part_of_speech": "verb"}]	\N
滴	dī	đi	dik1	[{"meaning": "to drip, to drop", "part_of_speech": "verb"}, {"meaning": "for a drop", "part_of_speech": "measure word"}]	\N
地道	dì dao	địa đạo	dei6 dou6	[{"meaning": "authentic, genuine, real", "part_of_speech": "adjective"}]	\N
地理	dì lǐ	địa lý	dei6 lei5	[{"meaning": "geography", "part_of_speech": "noun"}]	\N
地区	dì qū	địa khu	dei6 keoi1	[{"meaning": "region, district, area", "part_of_speech": "noun"}]	\N
的确	dí què	đích khẳc	dik1 kok3	[{"meaning": "really, indeed", "part_of_speech": "adverb"}]	\N
敌人	dí rén	địch nhân	dik6 jan4	[{"meaning": "enemy", "part_of_speech": "noun"}]	\N
地毯	dì tǎn	địa đằng	dei6 taam2	[{"meaning": "carpet", "part_of_speech": "noun"}]	\N
地位	dì wèi	địa vị	dei6 wai6	[{"meaning": "position, status", "part_of_speech": "noun"}]	\N
地震	dì zhèn	địa chấn	dei6 zin3	[{"meaning": "earthquake", "part_of_speech": "noun"}]	\N
电池	diàn chí	điện trì	din6 ci4	[{"meaning": "battery, electric cell", "part_of_speech": "noun"}]	\N
电台	diàn tái	điện đài	din6 toi4	[{"meaning": "broadcasting station, radio station", "part_of_speech": "noun"}]	\N
点头	diǎn tóu	điểm đầu	dim2 tau4	[{"meaning": "to nod", "part_of_speech": "verb"}]	\N
点心	diǎn xin	điểm tâm	dim2 sam1	[{"meaning": "light refreshments, Dimsum (Cantonese)", "part_of_speech": "noun"}]	\N
钓	diào	điếu	diu2	[{"meaning": "to fish", "part_of_speech": "verb"}]	\N
顶	dǐng	đỉnh	deng2	[{"meaning": "top, roof", "part_of_speech": "noun"}, {"meaning": "to carry on the head", "part_of_speech": "verb"}, {"meaning": "most, extremely, highly", "part_of_speech": "adverb"}, {"meaning": "for caps, hats, tents, etc.", "part_of_speech": "measure word"}]	\N
丁	dīng	đinh	ding1	[{"meaning": "fourth", "part_of_speech": "number"}]	\N
冻	dòng	đóng	dung3	[{"meaning": "jelly", "part_of_speech": "noun"}, {"meaning": "to freeze, to feel very cold", "part_of_speech": "verb"}]	\N
洞	dòng	động	dung6	[{"meaning": "cave, hole", "part_of_speech": "noun"}]	\N
动画片	dòng huà piàn	động họa bản	dung6 faa3 pin2	[{"meaning": "cartoon, animation", "part_of_speech": "noun"}]	\N
逗	dòu	đâu	dau3	[{"meaning": "to stay, to pause, to tease", "part_of_speech": "verb"}]	\N
豆腐	dòu fu	đậu phụ	dau6 fu6	[{"meaning": "tofu", "part_of_speech": "noun"}]	\N
度过	dù guò	độ qua	dou6 gwo3	[{"meaning": "to spend, to pass", "part_of_speech": "verb"}]	\N
独立	dú lì	độc lập	duk6 lap6	[{"meaning": "independence", "part_of_speech": "noun"}, {"meaning": "to stand alone", "part_of_speech": "verb"}, {"meaning": "independent", "part_of_speech": "adjective"}]	\N
独特	dú tè	độc đắc	duk6 dak6	[{"meaning": "unique, distinct", "part_of_speech": "adjective"}]	\N
短信	duǎn xìn	đoản tín	dyun2 seon3	[{"meaning": "text message", "part_of_speech": "noun"}]	\N
堆	duī	đôi	deoi1	[{"meaning": "pile, stack, heap", "part_of_speech": "noun"}, {"meaning": "for piles of things", "part_of_speech": "measure word"}]	\N
对比	duì bǐ	đối bĩ	deoi3 bat1	[{"meaning": "contrast, comparison", "part_of_speech": "noun"}, {"meaning": "to contrast, to compare", "part_of_speech": "verb"}]	\N
对待	duì dài	đối đối	deoi3 doi6	[{"meaning": "treatment", "part_of_speech": "noun"}, {"meaning": "to treat, to approach", "part_of_speech": "verb"}]	\N
对方	duì fāng	đối phương	deoi3 fong1	[{"meaning": "counterpart, the other side", "part_of_speech": "noun"}]	\N
对手	duì shǒu	đối thủ	deoi3 syu2	[{"meaning": "opponent, rival", "part_of_speech": "noun"}]	\N
对象	duì xiàng	đối tượng	deoi3 zoeng6	[{"meaning": "lover, partner, target, object", "part_of_speech": "noun"}]	\N
对于	duì yú	đối vụ	deoi3 jyu1	[{"meaning": "regarding, as far as sth. is concerned", "part_of_speech": "pronoun"}]	\N
吨	dūn	đoạn	dyun1	[{"meaning": "for a ton", "part_of_speech": "measure word"}]	\N
蹲	dūn	đôn	deon1	[{"meaning": "to squat", "part_of_speech": "verb"}]	\N
躲藏	duǒ cáng	nảy tràng	do2 coeng4	[{"meaning": "to hide oneself", "part_of_speech": "verb"}]	\N
多亏	duō kuī	đa quí	do1 fui1	[{"meaning": "luckily, thanks to", "part_of_speech": "adverb"}]	\N
多余	duō yú	đa dư	do1 jyu4	[{"meaning": "unnecessary, surplus, needless", "part_of_speech": "adjective"}]	\N
恶劣	è liè	ác liệt	ok3 lut3	[{"meaning": "very bad, vile, disgusting", "part_of_speech": "adjective"}]	\N
发表	fā biǎo	phát biểu	faat3 bíu2	[{"meaning": "to issue, to publish", "part_of_speech": "verb"}]	\N
发愁	fā chóu	phát sầu	faat3 caau4	[{"meaning": "to worry, to be anxious", "part_of_speech": "verb"}]	\N
发达	fā dá	phát đạt	faat3 daat6	[{"meaning": "to develop", "part_of_speech": "verb"}, {"meaning": "developed (country, etc.)", "part_of_speech": "adjective"}]	\N
发抖	fā dǒu	phát độ	faat3 dau6	[{"meaning": "to shiver, to shudder, to tremble", "part_of_speech": "verb"}]	\N
发挥	fā huī	phát hội	faat3 fai1	[{"meaning": "to develop (skill, ability, idea, etc.), to give play to", "part_of_speech": "verb"}]	\N
罚款	fá kuǎn	phạt khoản	faat3 fun2	[{"meaning": "fine, penalty", "part_of_speech": "noun"}, {"meaning": "to fine", "part_of_speech": "verb"}]	\N
发明	fā míng	phát minh	faat3 ming6	[{"meaning": "invention", "part_of_speech": "noun"}, {"meaning": "to invent", "part_of_speech": "verb"}]	\N
发票	fā piào	phát phiếu	faat3 piu3	[{"meaning": "invoice, receipt", "part_of_speech": "noun"}]	\N
发言	fā yán	phát ngôn	faat3 ngon4	[{"meaning": "statement", "part_of_speech": "noun"}, {"meaning": "to speak, to make a speech", "part_of_speech": "verb"}]	\N
法院	fǎ yuàn	pháp viện	faat3 jyun2	[{"meaning": "court of law, court", "part_of_speech": "noun"}]	\N
翻	fān	phản	faan1	[{"meaning": "to turn over, to flip over", "part_of_speech": "verb"}]	\N
分别	fēn bié	phân biệt	fan1 bit6	[{"meaning": "difference", "part_of_speech": "noun"}, {"meaning": "to leave each other, to distinguish", "part_of_speech": "verb"}, {"meaning": "separate", "part_of_speech": "adverb"}]	\N
分布	fēn bù	phân bố	fan1 bou6	[{"meaning": "to distribute, to be distributed", "part_of_speech": "verb"}]	\N
奋斗	fèn dòu	phấn đấu	fan6 dau3	[{"meaning": "to fight for, to strive for", "part_of_speech": "verb"}]	\N
纷纷	fēn fēn	phân phân	fan1 fan1	[{"meaning": "one after another", "part_of_speech": "adverb"}]	\N
愤怒	fèn nù	phẫn nộ	fan6 nou6	[{"meaning": "angry", "part_of_speech": "adjective"}]	\N
分配	fēn pèi	phân phối	fan1 pui3	[{"meaning": "to assign, to allocate", "part_of_speech": "verb"}]	\N
分析	fēn xī	phân tích	fan1 tik1	[{"meaning": "analysis", "part_of_speech": "noun"}, {"meaning": "to analyze", "part_of_speech": "verb"}]	\N
讽刺	fěng cì	phong xuy	fung6 ci3	[{"meaning": "irony, sarcasm", "part_of_speech": "noun"}, {"meaning": "to mock", "part_of_speech": "verb"}]	\N
风格	fēng gé	phong cách	fung1 gaak3	[{"meaning": "style", "part_of_speech": "noun"}]	\N
疯狂	fēng kuáng	phong khoáng	fung1 kwong4	[{"meaning": "madness", "part_of_speech": "noun"}, {"meaning": "crazy, mad", "part_of_speech": "adjective"}]	\N
风俗	fēng sú	phong tục	fung1 zuk6	[{"meaning": "(social) custom", "part_of_speech": "noun"}]	\N
风险	fēng xiǎn	phong hiểm	fung1 him2	[{"meaning": "risk,l venture", "part_of_speech": "noun"}]	\N
否定	fǒu dìng	phủ định	fau2 ding6	[{"meaning": "negation", "part_of_speech": "noun"}, {"meaning": "to negate, to deny", "part_of_speech": "verb"}]	\N
否认	fǒu rèn	phủ nhận	fau2 nin6	[{"meaning": "to deny", "part_of_speech": "verb"}]	\N
幅	fú	phước	fuk1	[{"meaning": "for pictures, paintings, textiles, etc.", "part_of_speech": "measure word"}]	\N
扶	fú	phô	fu1	[{"meaning": "to help (sb. up)", "part_of_speech": "verb"}]	\N
服从	fú cóng	phục tùng	fuk6 tung4	[{"meaning": "to obey, to submit", "part_of_speech": "verb"}]	\N
辅导	fǔ dǎo	phụ đạo	fu6 dou6	[{"meaning": "coaching", "part_of_speech": "noun"}, {"meaning": "to tutor, to coach", "part_of_speech": "verb"}]	\N
付款	fù kuǎn	phó quản	fu3 kyun2	[{"meaning": "payment", "part_of_speech": "noun"}, {"meaning": "to pay", "part_of_speech": "verb"}]	\N
妇女	fù nǚ	phụ nữ	fu5 neoi5	[{"meaning": "woman", "part_of_speech": "noun"}]	\N
复制	fù zhì	phục chế	fuk6 zai3	[{"meaning": "to copy, to reproduce", "part_of_speech": "verb"}]	\N
服装	fú zhuāng	phục trang	fuk6 jong1	[{"meaning": "clothing, dress", "part_of_speech": "noun"}]	\N
盖	gài	cái	goi3	[{"meaning": "cover", "part_of_speech": "noun"}, {"meaning": "to cover", "part_of_speech": "verb"}]	\N
家务	jiā wù	gia vụ	gaa1 mou6	[{"meaning": "housework", "part_of_speech": "noun"}]	\N
改革	gǎi gé	cải cách	goi2 gaak3	[{"meaning": "reform", "part_of_speech": "noun"}, {"meaning": "to reform", "part_of_speech": "verb"}]	\N
改进	gǎi jìn	cải tiến	goi2 zeon3	[{"meaning": "improvement", "part_of_speech": "noun"}, {"meaning": "to improve", "part_of_speech": "verb"}]	\N
概括	gài kuò	khai quát	goi2 gwat1	[{"meaning": "summary", "part_of_speech": "noun"}, {"meaning": "to summarize; to generalize", "part_of_speech": "verb"}]	\N
概念	gài niàn	khai niệm	goi2 nim6	[{"meaning": "concept, idea", "part_of_speech": "noun"}]	\N
改善	gǎi shàn	cải thiện	goi2 sin6	[{"meaning": "improvement", "part_of_speech": "noun"}, {"meaning": "to improve", "part_of_speech": "verb"}]	\N
改正	gǎi zhèng	cải chính	goi2 zing3	[{"meaning": "correction", "part_of_speech": "noun"}, {"meaning": "to correct, to amend", "part_of_speech": "verb"}]	\N
干脆	gān cuì	cạn khuất	gon1 fai3	[{"meaning": "clear-cut, straightforward", "part_of_speech": "adjective"}, {"meaning": "simply, you might as well", "part_of_speech": "adverb"}]	\N
干活儿	gàn huó r	cạn hoạt nga	gon1 wut6 ji4	[{"meaning": "to work (often hard, manual work)", "part_of_speech": "verb"}]	\N
感激	gǎn jī	cảm kích	gam2 gik1	[{"meaning": "to feel grateful, to be thankful", "part_of_speech": "verb"}]	\N
赶紧	gǎn jǐn	cảm cận	gon2 gan2	[{"meaning": "at once, losing no time", "part_of_speech": "adverb"}]	\N
赶快	gǎn kuài	cảm khuyến	gon2 faai3	[{"meaning": "at once, immediately", "part_of_speech": "adverb"}]	\N
感受	gǎn shòu	cảm thụ	gam2 sau6	[{"meaning": "feeling, perception", "part_of_speech": "noun"}, {"meaning": "to sense, to feel", "part_of_speech": "verb"}]	\N
感想	gǎn xiǎng	cảm tưởng	gam2 soeng2	[{"meaning": "impressions, reflections", "part_of_speech": "noun"}]	\N
钢铁	gāng tiě	cang thiết	gong1 tit3	[{"meaning": "steel", "part_of_speech": "noun"}]	\N
搞	gǎo	cao	gao1	[{"meaning": "to do, to make", "part_of_speech": "verb"}]	\N
告别	gào bié	cáo biệt	gou3 bit6	[{"meaning": "to leave, to say good-bye to", "part_of_speech": "verb"}]	\N
高档	gāo dàng	cáo đẳng	gou1 dong2	[{"meaning": "top grade", "part_of_speech": "adjective"}]	\N
高速公路	gāo sù gōng lù	cáo tốc công lộ	gou1 cok1 gung1 lou6	[{"meaning": "highway", "part_of_speech": "noun"}]	\N
隔壁	gé bì	cách bí	gak3 pik1	[{"meaning": "next door", "part_of_speech": "location"}]	\N
个别	gè bié	cá biệt	go3 bit6	[{"meaning": "exceptional, very few, individual", "part_of_speech": "adjective"}]	\N
胳膊	gē bo	cả bộ	gat1 bo2	[{"meaning": "arm", "part_of_speech": "noun"}]	\N
革命	gé mìng	cách mạng	gak3 ming6	[{"meaning": "revolution", "part_of_speech": "noun"}]	\N
个人	gè rén	cá nhân	go3 jan4	[{"meaning": "individual", "part_of_speech": "noun"}, {"meaning": "individual", "part_of_speech": "adjective"}]	\N
格外	gé wài	cách ngoại	gak3 ngoi6	[{"meaning": "especially, particularly", "part_of_speech": "adverb"}]	\N
个性	gè xìng	cá tính	go3 sing3	[{"meaning": "personality, character", "part_of_speech": "noun"}]	\N
鸽子	gē zi	cá tỳ	gok3 zi2	[{"meaning": "pigeon", "part_of_speech": "noun"}]	\N
各自	gè zì	các tự	gok3 zi6	[{"meaning": "each, respective", "part_of_speech": "adverb"}]	\N
根	gēn	căn	gan1	[{"meaning": "root, origin", "part_of_speech": "noun"}, {"meaning": "for long, slender objects", "part_of_speech": "measure word"}]	\N
床	chuáng	sàng	cong4	[{"meaning": "bed", "part_of_speech": "noun"}]	\N
雇佣	gù yōng	cố ý	gou3 jung6	[{"meaning": "to employ, to hire", "part_of_speech": "verb"}]	\N
挂号	guà hào	quẹt khỏa	gwaa3 hou6	[{"meaning": "to register", "part_of_speech": "verb"}]	\N
乖	guāi	côan	gwaai1	[{"meaning": "obedient, well-behaved, clever, good", "part_of_speech": "adjective"}]	\N
怪不得	guài bu de	quái bất đắc	gwaai3 bat1 dak1	[{"meaning": "no wonder so that is  why", "part_of_speech": "conjunction"}]	\N
拐弯	guǎi wān	quay ngả	gwaai2 waan1	[{"meaning": "to turn a corner, to change direction", "part_of_speech": "verb"}]	\N
官	guān	quan	gun1	[{"meaning": "officer, government official", "part_of_speech": "noun"}]	\N
关闭	guān bì	quay tắt	gwai1 bi3	[{"meaning": "to close, to shut", "part_of_speech": "verb"}]	\N
观察	guān chá	quan sát	gun1 caat6	[{"meaning": "observation", "part_of_speech": "noun"}, {"meaning": "to observe, to watch, to survey", "part_of_speech": "verb"}]	\N
观点	guān diǎn	quan điểm	gun1 dim2	[{"meaning": "point of view, viewpoint, standpoint", "part_of_speech": "noun"}]	\N
关怀	guān huái	quan huy	gun1 waai4	[{"meaning": "care, solicitude", "part_of_speech": "noun"}, {"meaning": "to care for, to show solicitude for", "part_of_speech": "verb"}]	\N
冠军	guàn jūn	quan quân	gun1 zeon1	[{"meaning": "champion", "part_of_speech": "noun"}]	\N
观念	guān niàn	quan niệm	gun1 nim6	[{"meaning": "concept, idea, thought", "part_of_speech": "noun"}]	\N
罐头	guàn tou	quan đầu	gun3 tau4	[{"meaning": "tin, can", "part_of_speech": "noun"}]	\N
管子	guǎn zi	quan tử	gun2 zi2	[{"meaning": "tube, pipe", "part_of_speech": "noun"}]	\N
广场	guǎng chǎng	quảng trường	gwong2 coeng4	[{"meaning": "public square", "part_of_speech": "noun"}]	\N
广大	guǎng dà	quảng đại	gwong2 daai6	[{"meaning": "vast, extensive, widespread", "part_of_speech": "adjective"}]	\N
广泛	guǎng fàn	quảng phổ	gwong2 faan6	[{"meaning": "extensive, wide ranging", "part_of_speech": "adjective"}]	\N
光滑	guāng huá	quang hoá	gwong1 waat6	[{"meaning": "smooth, sleek, glossy", "part_of_speech": "adjective"}]	\N
光临	guāng lín	quang lâm	gwong1 lam4	[{"meaning": "to visit as honorable guest", "part_of_speech": "verb"}]	\N
光明	guāng míng	quang minh	gwong1 ming4	[{"meaning": "light, radiance", "part_of_speech": "noun"}, {"meaning": "light, bright", "part_of_speech": "adjective"}]	\N
光盘	guāng pán	quang bản	gwong1 pun4	[{"meaning": "CD, DVD", "part_of_speech": "noun"}]	\N
光荣	guāng róng	quang vinh	gwong1 wing4	[{"meaning": "honor, glory", "part_of_speech": "noun"}, {"meaning": "glorious, honorable", "part_of_speech": "adjective"}]	\N
规矩	guī ju	quy tắc	gu1 geoi2	[{"meaning": "rule, custom, manner, practices", "part_of_speech": "noun"}]	\N
规律	guī lǜ	quy luật	gu1 leot6	[{"meaning": "law, regular pattern", "part_of_speech": "noun"}]	\N
规模	guī mó	quy mô	gu1 mo4	[{"meaning": "scale, scope, size, extent", "part_of_speech": "noun"}]	\N
柜台	guì tái	quầy	gui2 toi4	[{"meaning": "(sales) counter, bar", "part_of_speech": "noun"}]	\N
规则	guī zé	quy tắc	gu1 zak1	[{"meaning": "rule, regulation", "part_of_speech": "noun"}]	\N
滚	gǔn	cuốn	gwan2	[{"meaning": "to boil, to roll", "part_of_speech": "verb"}]	\N
锅	guō	quả	cwo2	[{"meaning": "pot, pan", "part_of_speech": "noun"}]	\N
过分	guò fèn	quá phần	gwo3 fan6	[{"meaning": "excessive, undue", "part_of_speech": "adjective"}]	\N
国籍	guó jí	quốc tịch	gwok3 zik1	[{"meaning": "nationality, citizenship", "part_of_speech": "noun"}]	\N
过敏	guò mǐn	quá mẫn	gwo3 man5	[{"meaning": "allergy", "part_of_speech": "noun"}, {"meaning": "to be allergic", "part_of_speech": "verb"}]	\N
过期	guò qī	quá kỳ	gwo3 kei4	[{"meaning": "to expire, to exceed the time limit", "part_of_speech": "verb"}]	\N
国庆节	Guó qìng jié	quốc kỉnh tiết	gwok3 hing3 zit3	[{"meaning": "National Day (October 1st)", "part_of_speech": "noun"}]	\N
果实	guǒ shí	quả thực	gwo2 sat6	[{"meaning": "fruits, gains", "part_of_speech": "noun"}]	\N
哈	hā	hạ	hap6	""	\N
海关	hǎi guān	hải quan	hoi2 gun1	[{"meaning": "customs", "part_of_speech": "noun"}]	\N
海鲜	hǎi xiān	hải sản	hoi2 sin1	[{"meaning": "seafood", "part_of_speech": "noun"}]	\N
喊	hǎn	hoán	haam3	[{"meaning": "to shout, to yell", "part_of_speech": "verb"}]	\N
行业	háng yè	hàng nghề	hang4 jip6	[{"meaning": "business, industry, profession", "part_of_speech": "noun"}]	\N
豪华	háo huá	hào hoa	hou4 faa1	[{"meaning": "luxurious", "part_of_speech": "adjective"}]	\N
好奇	hào qí	hảo kỳ	hou2 kei4	[{"meaning": "curious, inquisitive", "part_of_speech": "adjective"}]	\N
何必	hé bì	hà tất	ho4 bat1	[{"meaning": "there is no need to", "part_of_speech": "adverb"}]	\N
合法	hé fǎ	hợp pháp	hap6 faat3	[{"meaning": "legal, legitimate", "part_of_speech": "adjective"}]	\N
何况	hé kuàng	hà kuang	ho4 kwong3	[{"meaning": "let alone", "part_of_speech": "relative clause"}]	\N
合理	hé lǐ	hợp lý	hap6 lei5	[{"meaning": "reasonable, rational", "part_of_speech": "adjective"}]	\N
和平	hé píng	hòa bình	wo4 ping4	[{"meaning": "peace", "part_of_speech": "noun"}]	\N
合同	hé tong	hợp đồng	hap6 tung4	[{"meaning": "contract", "part_of_speech": "noun"}]	\N
核心	hé xīn	hạt nhân	hat6 sai1	[{"meaning": "core", "part_of_speech": "noun"}]	\N
合影	hé yǐng	hợp ảnh	hap6 jing2	[{"meaning": "group photo", "part_of_speech": "noun"}]	\N
合作	hé zuò	hợp tác	hap6 zok3	[{"meaning": "cooperation", "part_of_speech": "noun"}, {"meaning": "to cooperate, to work together", "part_of_speech": "verb"}]	\N
恨	hèn	hận	hon6	[{"meaning": "hate", "part_of_speech": "noun"}, {"meaning": "to hate", "part_of_speech": "verb"}]	\N
横	héng	hàng	hang4	[{"meaning": "horizontal, across", "part_of_speech": "adjective"}]	\N
后果	hòu guǒ	hậu quả	hau6 keoi2	[{"meaning": "consequence, aftermath", "part_of_speech": "noun"}]	\N
壶	hú	hồ	wu1	[{"meaning": "pot, kettle", "part_of_speech": "noun"}, {"meaning": "for bottled liquid", "part_of_speech": "measure word"}]	\N
蝴蝶	hú dié	hồ diệp	woo4 dip6	[{"meaning": "butterfly", "part_of_speech": "noun"}]	\N
忽视	hū shì	hốt thị	fat1 si6	[{"meaning": "to neglect, to ignore, to overlook", "part_of_speech": "verb"}]	\N
胡说	hú shuō	hồi thoại	wu4 syut3	[{"meaning": "to talk nonsense", "part_of_speech": "verb"}]	\N
胡同	hú tòng	hồ tông	wu4 tung1	[{"meaning": "lane, alley", "part_of_speech": "noun"}]	\N
糊涂	hú tu	hồ đồ	wu4 to4	[{"meaning": "confused, muddled", "part_of_speech": "adjective"}]	\N
呼吸	hū xī	hô hấp	fu1 kap1	[{"meaning": "to breathe", "part_of_speech": "verb"}]	\N
胡须	hú xū	hồ tu	wu4 seoi1	[{"meaning": "beard", "part_of_speech": "noun"}]	\N
滑冰	huá bīng	hoa băng	waa6 bing1	[{"meaning": "skating", "part_of_speech": "noun"}, {"meaning": "to skate", "part_of_speech": "verb"}]	\N
划船	huá chuán	hoa thuyền	waak6 syun4	[{"meaning": "rowing, rowing boat", "part_of_speech": "noun"}, {"meaning": "to row a boat", "part_of_speech": "verb"}]	\N
花生	huā shēng	hoa súng	faa1 sang1	[{"meaning": "peanut", "part_of_speech": "noun"}]	\N
话题	huà tí	thoại đề	faa3 tai4	[{"meaning": "topic", "part_of_speech": "noun"}]	\N
化学	huà xué	hóa học	faa3 hok6	[{"meaning": "chemistry", "part_of_speech": "noun"}]	\N
华裔	huá yì	Hoa vi	faa3 jeoi6	[{"meaning": "ethnic Chinese (but non-Chinese citizen)", "part_of_speech": "noun"}]	\N
怀念	huái niàn	hoài niệm	waai4 nim6	[{"meaning": "to cherish the memory of, to think of", "part_of_speech": "verb"}]	\N
缓解	huǎn jiě	hoãn giải	waan4 gaai2	[{"meaning": "to ease, to blunt, to help relieve (a crisis)", "part_of_speech": "verb"}]	\N
幻想	huàn xiǎng	hoàn tưởng	waan6 soeng2	[{"meaning": "illusion, fantasy", "part_of_speech": "noun"}, {"meaning": "to dream", "part_of_speech": "verb"}]	\N
皇帝	huáng dì	hoàng đế	wong4 dai3	[{"meaning": "emperor", "part_of_speech": "noun"}]	\N
黄瓜	huáng guā	hoàng qua	wong4 gwaa1	[{"meaning": "cucumber", "part_of_speech": "noun"}]	\N
皇后	huáng hòu	hoàng hậu	wong4 hau6	[{"meaning": "empress", "part_of_speech": "noun"}]	\N
黄金	huáng jīn	hoàng kim	wong4 gam1	[{"meaning": "gold", "part_of_speech": "noun"}]	\N
慌张	huāng zhāng	hoảng chưởng	wong4 zoeng1	[{"meaning": "confused, flustered", "part_of_speech": "adjective"}]	\N
挥	huī	huý	fai1	[{"meaning": "to wave, to brandish, to wipe away", "part_of_speech": "verb"}]	\N
灰	huī	hoài	fui1	[{"meaning": "ash, dust", "part_of_speech": "noun"}, {"meaning": "gray", "part_of_speech": "adjective"}]	\N
灰尘	huī chén	hoài trần	fui1 can4	[{"meaning": "dust", "part_of_speech": "noun"}]	\N
恢复	huī fù	hoàn phục	fai1 fu6	[{"meaning": "to recover, to restore", "part_of_speech": "verb"}]	\N
汇率	huì lǜ	huỷ lựa	wui6 leot6	[{"meaning": "exchange rate", "part_of_speech": "noun"}]	\N
灰心	huī xīn	hoài tâm	fui1 sam1	[{"meaning": "to lose heart, to be discouraged", "part_of_speech": "verb"}]	\N
婚礼	hūn lǐ	hôn lễ	fan1 lai5	[{"meaning": "wedding", "part_of_speech": "noun"}]	\N
婚姻	hūn yīn	hôn nhân	fan1 jan4	[{"meaning": "wedding, marriage", "part_of_speech": "noun"}]	\N
伙伴	huǒ bàn	hội bạn	foh2 baa6	[{"meaning": "partner, companion, mate", "part_of_speech": "noun"}]	\N
火柴	huǒ chái	hỏa trụ	fo2 caai4	[{"meaning": "match (for fire)", "part_of_speech": "noun"}]	\N
活跃	huó yuè	hỏa hoạt	wut6 joek6	[{"meaning": "active, vigorous", "part_of_speech": "adjective"}]	\N
基本	jī běn	cơ bản	gei1 bun1	[{"meaning": "basic, fundamental", "part_of_speech": "adjective"}]	\N
及格	jí gé	cập cách	kap6 gaak3	[{"meaning": "to pass a test", "part_of_speech": "verb"}]	\N
激烈	jī liè	kích liệt	gik1 lit6	[{"meaning": "intense, fierce", "part_of_speech": "adjective"}]	\N
系领带	jì lǐng dài	hệ lượng đới	hai6 ling5 daai3	[{"meaning": "to tie one’s necktie", "part_of_speech": "verb"}]	\N
纪录	jì lù	kỷ lục	gei2 luk6	[{"meaning": "record", "part_of_speech": "noun"}]	\N
记录	jì lù	kỷ lược	gei3 luk6	[{"meaning": "record", "part_of_speech": "noun"}]	\N
纪律	jì lǜ	kỷ luật	gei2 leot6	[{"meaning": "discipline", "part_of_speech": "noun"}]	\N
急忙	jí máng	tức mạng	gap1 mong4	[{"meaning": "hasty, in a hurry", "part_of_speech": "adjective"}]	\N
寂寞	jì mò	tịch mịch	zik6 mok6	[{"meaning": "lonely", "part_of_speech": "adjective"}]	\N
纪念	jì niàn	kỷ niệm	gei2 nim6	[{"meaning": "commemoration", "part_of_speech": "noun"}, {"meaning": "to commemorate", "part_of_speech": "verb"}]	\N
机器	jī qì	cơ khí	gei1 hei1	[{"meaning": "machine", "part_of_speech": "noun"}]	\N
肌肉	jī ròu	kỳ nạp	gei1 juk6	[{"meaning": "muscle", "part_of_speech": "noun"}]	\N
计算	jì suàn	tính toán	gai3 syun3	[{"meaning": "calculation", "part_of_speech": "noun"}, {"meaning": "to count, to calculate", "part_of_speech": "verb"}]	\N
集体	jí tǐ	tập thể	zaap6 tai4	[{"meaning": "collective", "part_of_speech": "noun"}]	\N
记忆	jì yì	ký ức	gei3 wik6	[{"meaning": "memory", "part_of_speech": "noun"}, {"meaning": "to remember", "part_of_speech": "verb"}]	\N
集中	jí zhōng	tập trung	zaap6 zung1	[{"meaning": "to concentrate, to focus", "part_of_speech": "verb"}]	\N
嫁	jià	giá	gaa3	[{"meaning": "to marry (woman -> men)", "part_of_speech": "verb"}]	\N
甲	jiǎ	gia	gaap3	[{"meaning": "first(ly)", "part_of_speech": "number"}]	\N
嘉宾	jiā bīn	gia bần	gaa1 ban1	[{"meaning": "honoured guest", "part_of_speech": "noun"}]	\N
假如	jiǎ rú	gả nhu	gaa2 jyu4	[{"meaning": "if", "part_of_speech": "conjunction"}]	\N
驾驶	jià shǐ	gia thị	gaa3 si2	[{"meaning": "to drive, to pilot", "part_of_speech": "verb"}]	\N
家庭	jiā tíng	gia đình	gaa1 ting4	[{"meaning": "family, household", "part_of_speech": "noun"}]	\N
家乡	jiā xiāng	gia hương	gaa1 hoeng1	[{"meaning": "hometown, native place", "part_of_speech": "noun"}]	\N
价值	jià zhí	gia trị	gaa3 zi6	[{"meaning": "value, worth", "part_of_speech": "noun"}]	\N
假装	jiǎ zhuāng	gả trang	gaa2 zong1	[{"meaning": "to pretend", "part_of_speech": "verb"}]	\N
夹子	jiā zi	gia trí	gaa3 zi2	[{"meaning": "clip, clamp, tongs", "part_of_speech": "noun"}]	\N
捡	jiǎn	giành	gip3	[{"meaning": "to pick up, to gather", "part_of_speech": "verb"}]	\N
煎	jiān	gian	gin1	[{"meaning": "to pan fry", "part_of_speech": "verb"}]	\N
肩膀	jiān bǎng	gánh bằng	gin1 pong2	[{"meaning": "shoulder", "part_of_speech": "noun"}]	\N
剪刀	jiǎn dāo	tiễn đao	jin2 dou1	[{"meaning": "scissors", "part_of_speech": "noun"}]	\N
艰巨	jiān jù	gian khổ	gaan1 keoi4	[{"meaning": "arduous, formidable", "part_of_speech": "adjective"}]	\N
坚决	jiān jué	kiên quyết	gaan1 kyut3	[{"meaning": "resolute, determined", "part_of_speech": "adjective"}]	\N
艰苦	jiān kǔ	gian khó	gaan1 fu2	[{"meaning": "difficult, hard", "part_of_speech": "adjective"}]	\N
建立	jiàn lì	kiến lập	gin3 lap6	[{"meaning": "to build, to establish", "part_of_speech": "verb"}]	\N
简历	jiǎn lì	giản lịch	gaan2 lik6	[{"meaning": "CV, resume", "part_of_speech": "noun"}]	\N
键盘	jiàn pán	giản bàn	gin3 paan2	[{"meaning": "keyboard", "part_of_speech": "noun"}]	\N
坚强	jiān qiáng	kiên cường	gaan1 coeng4	[{"meaning": "strong", "part_of_speech": "adjective"}]	\N
尖锐	jiān ruì	kiên nhọn	gaan1 jau4	[{"meaning": "sharp, acute (illness)", "part_of_speech": "adjective"}]	\N
建设	jiàn shè	kiến thiết	gin3 sit3	[{"meaning": "construction", "part_of_speech": "noun"}, {"meaning": "to build, to construct", "part_of_speech": "verb"}]	\N
健身房	jiàn shēn fáng	kiện thân phòng	gin6 san1 fong2	[{"meaning": "gym, gymnasium", "part_of_speech": "noun"}]	\N
建议	jiàn yì	kiến nghị	gin3 ngai6	[{"meaning": "suggestion", "part_of_speech": "noun"}, {"meaning": "to suggest", "part_of_speech": "verb"}]	\N
简直	jiǎn zhí	giản trực	gaan2 zik6	[{"meaning": "simply, totally", "part_of_speech": "adverb"}]	\N
建筑	jiàn zhù	kiến trúc	gin3 zuk1	[{"meaning": "building, architecture", "part_of_speech": "noun"}, {"meaning": "to build, to construct", "part_of_speech": "verb"}]	\N
讲究	jiǎng jiu	giảng cứu	gong2 gau3	[{"meaning": "to pay attention to", "part_of_speech": "verb"}, {"meaning": "exquisite, tasteful", "part_of_speech": "adjective"}]	\N
降落	jiàng luò	giang lạc	goeng1 lok6	[{"meaning": "to descend, to land", "part_of_speech": "verb"}]	\N
酱油	jiàng yóu	tương ướt	zoeng3 jau4	[{"meaning": "soy sauce", "part_of_speech": "noun"}]	\N
讲座	jiǎng zuò	giảng toạ	gong2 coek3	[{"meaning": "lecture", "part_of_speech": "noun"}]	\N
浇	jiāo	giáng	gaau1	[{"meaning": "to water, to pour, to sprinkle", "part_of_speech": "verb"}]	\N
教材	jiào cái	giáo tài	gaau3 coi4	[{"meaning": "teaching material", "part_of_speech": "noun"}]	\N
角度	jiǎo dù	cách nhìn	gok3 dou6	[{"meaning": "angle, point of view", "part_of_speech": "noun"}]	\N
狡猾	jiǎo huá	giao hoặc	gaau2 waat6	[{"meaning": "sly, cunning, tricky", "part_of_speech": "adjective"}]	\N
交换	jiāo huàn	giao hoán	gaau1 wun6	[{"meaning": "exchange", "part_of_speech": "noun"}, {"meaning": "to exchange, to swap, to switch", "part_of_speech": "verb"}]	\N
交际	jiāo jì	giao cảm	gaau1 cai4	[{"meaning": "communication, social intercourse", "part_of_speech": "noun"}, {"meaning": "socialize", "part_of_speech": "verb"}]	\N
教练	jiào liàn	giáo viên	gaau3 lin6	[{"meaning": "sports coach, instructor", "part_of_speech": "noun"}]	\N
郊区	jiāo qū	giao khu	gaau1 keoi1	[{"meaning": "suburbs", "part_of_speech": "noun"}]	\N
胶水	jiāo shuǐ	cao su	gaau1 seoi2	[{"meaning": "glue", "part_of_speech": "noun"}]	\N
教训	jiào xùn	giáo huấn	gaau3 hon6	[{"meaning": "lesson", "part_of_speech": "noun"}, {"meaning": "to teach sb. a lesson", "part_of_speech": "verb"}]	\N
节	jié	tiết	zit3	[{"meaning": "festival, holiday, segmet, joint, part", "part_of_speech": "noun"}, {"meaning": "to save, to economize", "part_of_speech": "verb"}, {"meaning": "for segments", "part_of_speech": "measure word"}]	\N
届	jiè	giới	gaai3	[{"meaning": "to become due", "part_of_speech": "verb"}, {"meaning": "for events, meetings, etc.", "part_of_speech": "measure word"}]	\N
接触	jiē chù	tiếp xúc	zip3 cuk1	[{"meaning": "to touch, to contact, to get in touch with", "part_of_speech": "verb"}]	\N
接待	jiē dài	tiếp đón	zip3 doi6	[{"meaning": "to receive (visitor)", "part_of_speech": "verb"}]	\N
阶段	jiē duàn	giai đoạn	gaai1 dyun6	[{"meaning": "stage, section, phase", "part_of_speech": "noun"}]	\N
解放	jiě fàng	giải phóng	gaai2 fong3	[{"meaning": "liberation", "part_of_speech": "noun"}, {"meaning": "to liberate, to emancipate", "part_of_speech": "verb"}]	\N
结构	jié gòu	cấu trúc	git3 guk6	[{"meaning": "structure, makeup, composition", "part_of_speech": "noun"}]	\N
结合	jié hé	kết hợp	git3 hap6	[{"meaning": "binding", "part_of_speech": "noun"}, {"meaning": "to combine, to link, to integrate", "part_of_speech": "verb"}]	\N
接近	jiē jìn	tiếp cận	zip3 gan6	[{"meaning": "to near, to approach, to be close to", "part_of_speech": "verb"}]	\N
借口	jiè kǒu	giả danh	zit3 hau2	[{"meaning": "excuse, pretext", "part_of_speech": "noun"}]	\N
结论	jié lùn	kết luận	git3 leon6	[{"meaning": "conclusion", "part_of_speech": "noun"}]	\N
节省	jié shěng	tiết kiệm	zit3 sang2	[{"meaning": "to save, to economize, to use sparingly", "part_of_speech": "verb"}]	\N
结实	jiē shi	kiến trúc	git3 sat6	[{"meaning": "solid, durable, sturdy", "part_of_speech": "adjective"}]	\N
解说员	jiě shuō yuán	giải thuyết viên	gaai2 syut3 jyun4	[{"meaning": "commentator", "part_of_speech": "noun"}]	\N
戒烟	jiè yān	từ thuốc lá	gaai3 jin1	[{"meaning": "to give up smoking", "part_of_speech": "verb"}]	\N
结账	jié zhàng	kết kinh	git3 zong6	[{"meaning": "to pay the bill", "part_of_speech": "verb"}]	\N
接着	jiē zhe	tiếp tục	zip3 zoek3	[{"meaning": "to follow, to carry on", "part_of_speech": "verb"}, {"meaning": "then, after that", "part_of_speech": "adverb"}]	\N
戒指	jiè zhi	nhẫn	gaai3 zi2	[{"meaning": "ring (for finger)", "part_of_speech": "noun"}]	\N
紧	jǐn	cật	gan2	[{"meaning": "thight, tense, urgent", "part_of_speech": "adjective"}]	\N
进步	jìn bù	tăng tiến	zeon3 bou6	[{"meaning": "progress, improvement", "part_of_speech": "noun"}, {"meaning": "to improve, make progress", "part_of_speech": "verb"}]	\N
近代	jìn dài	cận đại	gan6 doi6	[{"meaning": "modern times", "part_of_speech": "time"}]	\N
紧急	jǐn jí	cấp cứu	gan2 gap1	[{"meaning": "urgent, pressing", "part_of_speech": "adjective"}]	\N
进口	jìn kǒu	nhập khẩu	zeon3 hau2	[{"meaning": "import", "part_of_speech": "noun"}, {"meaning": "to import", "part_of_speech": "verb"}]	\N
尽力	jìn lì	tận lực	zeon6 lik6	[{"meaning": "to do all one can", "part_of_speech": "verb"}]	\N
尽量	jǐn liàng	tận cố gắng	zeon6 loeng6	[{"meaning": "to the best of one’s ability", "part_of_speech": "adverb"}]	\N
谨慎	jǐn shèn	cẩn thận	gam2 sam2	[{"meaning": "cautious, prudent", "part_of_speech": "adjective"}]	\N
金属	jīn shǔ	kim loại	gam1 suk6	[{"meaning": "metal", "part_of_speech": "noun"}]	\N
敬爱	jìng ài	tôn kính	geng3 oi3	[{"meaning": "to respect and love", "part_of_speech": "verb"}]	\N
经典	jīng diǎn	kinh điển	ging1 din6	[{"meaning": "classics, scriptures", "part_of_speech": "noun"}, {"meaning": "classical", "part_of_speech": "adjective"}]	\N
精力	jīng lì	tinh lực	zing1 lik6	[{"meaning": "energy", "part_of_speech": "noun"}]	\N
景色	jǐng sè	cảnh sắc	ging2 sik1	[{"meaning": "scenery, view, landscape", "part_of_speech": "noun"}]	\N
经营	jīng yíng	kinh doanh	ging1 jing4	[{"meaning": "to run, to operate, to engage in (business, etc.)", "part_of_speech": "verb"}]	\N
救	jiù	giúp	gau3	[{"meaning": "to relieve, to rescue", "part_of_speech": "verb"}]	\N
酒吧	jiǔ bā	tiệm rượu	zau2 baa1	[{"meaning": "bar, pub", "part_of_speech": "noun"}]	\N
救护车	jiù hù chē	xe cứu thương	gau3 fu6 ce1	[{"meaning": "ambulance", "part_of_speech": "noun"}]	\N
舅舅	jiù jiu	chu cầu	kau2 kau2	[{"meaning": "uncle (maternal)", "part_of_speech": "noun"}]	\N
举	jǔ	giơ	geoi2	[{"meaning": "to raise, to hold up, to elect", "part_of_speech": "verb"}]	\N
俱乐部	jù lè bù	cừ lạc bộ	keoi1 lok6 bou6	[{"meaning": "club", "part_of_speech": "noun"}]	\N
居然	jū rán	cư nhiên	geoi1 jin4	[{"meaning": "unexpectedly", "part_of_speech": "adverb"}]	\N
据说	jù shuō	cứ thuyết	geoi3 syut3	[{"meaning": "it is said, reportedly", "part_of_speech": "adverb"}]	\N
具体	jù tǐ	cụ thể	geoi6 tai2	[{"meaning": "concrete, specific", "part_of_speech": "adjective"}]	\N
桔子	jú zi	cát tử	gwat1 zi2	[{"meaning": "tangerine", "part_of_speech": "noun"}]	\N
捐	juān	toán	gyun1	[{"meaning": "tax, contribution", "part_of_speech": "noun"}, {"meaning": "to contribute, to donate, to give up", "part_of_speech": "verb"}]	\N
卷	juǎn	quyển	gyun2	[{"meaning": "roll", "part_of_speech": "noun"}, {"meaning": "to roll", "part_of_speech": "verb"}, {"meaning": "for roll, spool", "part_of_speech": "measure word"}]	\N
绝对	jué duì	tuyệt đối	zyut6 deoi6	[{"meaning": "absolute, unconditional", "part_of_speech": "adjective"}]	\N
决赛	jué sài	quyết trại	kyut3 coi3	[{"meaning": "final (competition)", "part_of_speech": "noun"}]	\N
角色	jué sè	cách sử	gok3 sik1	[{"meaning": "character (in a book, play, etc.)", "part_of_speech": "noun"}]	\N
决心	jué xīn	quyết tâm	kyut3 sam1	[{"meaning": "determination, resolution", "part_of_speech": "noun"}, {"meaning": "to make up one’s mind", "part_of_speech": "verb"}]	\N
军事	jūn shì	quân sự	gwan1 si6	[{"meaning": "military affairs", "part_of_speech": "noun"}]	\N
均匀	jūn yún	quân đềm	gwan1 wan4	[{"meaning": "even, homogeneous", "part_of_speech": "adjective"}]	\N
卡车	kǎ chē	khóa xa	kaa1 ce1	[{"meaning": "truck, lorry", "part_of_speech": "noun"}]	\N
开发	kāi fā	khai phát	hoi1 faat3	[{"meaning": "to develop (e.g. IT), to exploit (a resource)", "part_of_speech": "verb"}]	\N
开放	kāi fàng	khai phóng	hoi1 fong3	[{"meaning": "to open up (for public, etc.)", "part_of_speech": "verb"}]	\N
开幕式	kāi mù shì	khai mạc thức	hoi1 mok6 sik1	[{"meaning": "opening ceremony", "part_of_speech": "noun"}]	\N
开心	kāi xīn	khai tâm	hoi1 sam1	[{"meaning": "to feel happy, to make fun of sb.", "part_of_speech": "verb"}, {"meaning": "happy", "part_of_speech": "adjective"}]	\N
砍	kǎn	khảm	ham2	[{"meaning": "to chop, to cut down", "part_of_speech": "verb"}]	\N
看不起	kàn bu qǐ	khán bất khí	gon2 bat1 hei2	[{"meaning": "to look down upon", "part_of_speech": "verb"}]	\N
看来	kàn lái	khán lai	gon2 loi4	[{"meaning": "it seems, it appears", "part_of_speech": "conjunction"}]	\N
抗议	kàng yì	khang nghị	kong3 ji5	[{"meaning": "to protest", "part_of_speech": "verb"}]	\N
烤鸭	kǎo yā	khảo ác	haau1 aap3	[{"meaning": "roast duck", "part_of_speech": "noun"}]	\N
克	kè	khắc	hak1	[{"meaning": "to subdue, to restrain", "part_of_speech": "verb"}, {"meaning": "1 gram", "part_of_speech": "measure word"}]	\N
颗	kē	khả	koi3	[{"meaning": "for grain, pearls, teeth, stars, etc.", "part_of_speech": "measure word"}]	\N
课程	kè chéng	khóa đình	fo3 cang4	[{"meaning": "course, class", "part_of_speech": "noun"}]	\N
克服	kè fú	khắc phục	hak1 fuk6	[{"meaning": "to overcome, to conquer, to put up with", "part_of_speech": "verb"}]	\N
客观	kè guān	khách quan	hak3 gun1	[{"meaning": "objective, impartial", "part_of_speech": "adjective"}]	\N
可见	kě jiàn	khả kiến	ho2 gin3	[{"meaning": "it is obvious that, it can clearly be seen that", "part_of_speech": "conjunction"}]	\N
可靠	kě kào	khả khảo	ho2 kaau3	[{"meaning": "reliable, dependable", "part_of_speech": "adjective"}]	\N
刻苦	kè kǔ	khắc khổ	hak1 fu2	[{"meaning": "hardworking, assiduous", "part_of_speech": "adjective"}]	\N
可怕	kě pà	khả phạ	ho2 paa3	[{"meaning": "awful, terrible", "part_of_speech": "adjective"}]	\N
客厅	kè tīng	khách đình	hak3 ting1	[{"meaning": "living room", "part_of_speech": "noun"}]	\N
恐怖	kǒng bù	khủng bố	hung2 bou6	[{"meaning": "terrble, fearful, frightening", "part_of_speech": "adjective"}]	\N
空间	kōng jiān	không gian	hung1 gaan1	[{"meaning": "space", "part_of_speech": "noun"}]	\N
空闲	kòng xián	không nhàn	hung1 haan4	[{"meaning": "leisure", "part_of_speech": "noun"}, {"meaning": "idle", "part_of_speech": "adjective"}]	\N
控制	kòng zhì	khống chế	hung3 zai3	[{"meaning": "control", "part_of_speech": "noun"}, {"meaning": "to control", "part_of_speech": "verb"}]	\N
口味	kǒu wèi	khẩu vị	hau2 mei6	[{"meaning": "taste, flavour", "part_of_speech": "noun"}]	\N
夸	kuā	khoa	kwaa1	[{"meaning": "to praise, to boast", "part_of_speech": "verb"}]	\N
会计	kuài jì	hội kế	wooi6 gai3	[{"meaning": "accountant, accounting", "part_of_speech": "noun"}]	\N
矿泉水	kuàng quán shuǐ	khoáng toàn thuỷ	kwong3 cyun4 seoi2	[{"meaning": "mineral water", "part_of_speech": "noun"}]	\N
辣椒	là jiāo	lạt tiêu	laat6 ziu1	[{"meaning": "hot pepper, chili", "part_of_speech": "noun"}]	\N
蜡烛	là zhú	lạc chú	lap6 zuk1	[{"meaning": "candle", "part_of_speech": "noun"}]	\N
来自	lái zì	lai tự	loi4 zi6	[{"meaning": "to come from", "part_of_speech": "verb"}]	\N
拦	lán	lãn	laan2	[{"meaning": "to block, to hinder", "part_of_speech": "verb"}]	\N
烂	làn	lạc	laan6	[{"meaning": "to rot", "part_of_speech": "verb"}, {"meaning": "rotten, mushy, soft", "part_of_speech": "adjective"}]	\N
狼	láng	lãng	leong4	[{"meaning": "wolf", "part_of_speech": "noun"}]	\N
老百姓	lǎo bǎi xìng	lão bách tính	lou5 baak3 sing1	[{"meaning": "ordinary people", "part_of_speech": "noun"}]	\N
老板	lǎo bǎn	lão bản	lou5 baan2	[{"meaning": "boss, owner", "part_of_speech": "noun"}]	\N
劳动	láo dòng	lao động	 lou4 dung6	[{"meaning": "work, labour", "part_of_speech": "noun"}]	\N
劳驾	láo jià	lao giá	lou4 gaai2	[{"meaning": "excuse me", "part_of_speech": "expression"}]	\N
姥姥	lǎo lao	lão lão	lou5 lou5	[{"meaning": "grandmother (mother’s mum)", "part_of_speech": "noun"}]	\N
老实	lǎo shi	lão thực	lou5 sat6	[{"meaning": "honest, sincere", "part_of_speech": "adjective"}]	\N
老鼠	lǎo shǔ	lão thử	lou5 syu2	[{"meaning": "rat, mouse", "part_of_speech": "noun"}]	\N
乐观	lè guān	lạc quan	lok6 gun1	[{"meaning": "optimistic, hopeful", "part_of_speech": "adjective"}]	\N
雷	léi	lôi	leoi4	[{"meaning": "thunder", "part_of_speech": "noun"}]	\N
类	lèi	lọai	leoi6	[{"meaning": "sort, kind, category", "part_of_speech": "noun"}, {"meaning": "for sorts, types, categories, etc.", "part_of_speech": "measure word"}]	\N
梨	lí	lê	lei4	[{"meaning": "pear", "part_of_speech": "noun"}]	\N
粒	lì	lạp	lap1	[{"meaning": "grain", "part_of_speech": "noun"}, {"meaning": "for small roung things", "part_of_speech": "measure word"}]	\N
礼拜天	lǐ bài tiān	lễ bái thiên	lei5 baai3 tin1	[{"meaning": "Sunday", "part_of_speech": "time"}]	\N
立方	lì fāng	lập phương	laap6 fong1	[{"meaning": "cube", "part_of_speech": "noun"}]	\N
离婚	lí hūn	ly hôn	lei4 fan6	[{"meaning": "divorce", "part_of_speech": "noun"}, {"meaning": "to divorce (from)", "part_of_speech": "verb"}]	\N
立即	lì jí	lập tức	laap6 zik6	[{"meaning": "immediately, at once", "part_of_speech": "adverb"}]	\N
立刻	lì kè	lập khắc	laap6 hak1	[{"meaning": "immediately, at once", "part_of_speech": "adverb"}]	\N
力量	lì liàng	lực lượng	lik6 loeng6	[{"meaning": "power, force, strength", "part_of_speech": "noun"}]	\N
理论	lǐ lùn	lí luận	lei5 leon6	[{"meaning": "theory", "part_of_speech": "noun"}]	\N
厘米	lí mǐ	lí mỉ	lei4 mai5	[{"meaning": "centimeter", "part_of_speech": "measure word"}]	\N
利润	lì rùn	lợi nhuận	lei6 wan6	[{"meaning": "profit", "part_of_speech": "noun"}]	\N
利息	lì xī	lợi tức	lei6 sik1	[{"meaning": "interest (on a loan)", "part_of_speech": "noun"}]	\N
利益	lì yì	lợi ích	lei6 jik1	[{"meaning": "benefit", "part_of_speech": "noun"}]	\N
利用	lì yòng	lợi dụng	lei6 jung6	[{"meaning": "to make use of, to utilize", "part_of_speech": "verb"}]	\N
理由	lǐ yóu	lí do	lei5 jau4	[{"meaning": "reason, justification", "part_of_speech": "noun"}]	\N
恋爱	liàn ài	luân ái	lyun2 oi3	[{"meaning": "love", "part_of_speech": "noun"}, {"meaning": "to be in love, to have an affair", "part_of_speech": "verb"}]	\N
联合	lián hé	liên hoạch	lyun4 hap6	[{"meaning": "alliance, union", "part_of_speech": "noun"}, {"meaning": "to unite, to join", "part_of_speech": "verb"}, {"meaning": "combined, joint", "part_of_speech": "adjective"}]	\N
连忙	lián máng	liên mang	lyun4 mong4	[{"meaning": "promptly, at once", "part_of_speech": "adverb"}]	\N
连续剧	lián xù jù	liên tục cốc	lyun4 zuk6 kek6	[{"meaning": "(TV) series", "part_of_speech": "noun"}]	\N
良好	liáng hǎo	lương hảo	loeng4 hou2	[{"meaning": "good, favorable, fine", "part_of_speech": "adjective"}]	\N
粮食	liáng shi	lương thực	loeng4 sik1	[{"meaning": "food, cereals", "part_of_speech": "noun"}]	\N
了不起	liǎo bu qǐ	liễu bất kỳ	liu5 bat1 hei2	[{"meaning": "amazing, extraordnary", "part_of_speech": "adjective"}]	\N
临时	lín shí	lâm thời	leon4 si4	[{"meaning": "temporary", "part_of_speech": "adjective"}]	\N
铃	líng	lĩnh	ling4	[{"meaning": "bell", "part_of_speech": "noun"}]	\N
领导	lǐng dǎo	lĩnh đạo	ling5 dou6	[{"meaning": "leader, leadership", "part_of_speech": "noun"}, {"meaning": "to lead", "part_of_speech": "verb"}]	\N
灵活	líng huó	linh hoạt	ling4 waat6	[{"meaning": "flexible, agile, nimble", "part_of_speech": "adjective"}]	\N
零件	líng jiàn	lĩnh tiện	ling4 gin6	[{"meaning": "part, component", "part_of_speech": "noun"}]	\N
零钱	líng qián	lĩnh tiền	ling4 cin2	[{"meaning": "change (money)", "part_of_speech": "noun"}]	\N
零食	líng shí	lĩnh thực	ling4 sik1	[{"meaning": "snack", "part_of_speech": "noun"}]	\N
领域	lǐng yù	lĩnh vực	ling5 jik6	[{"meaning": "field, domain, area, territory", "part_of_speech": "noun"}]	\N
流传	liú chuán	lưu truyền	lau4 chyun4	[{"meaning": "to spread, to circulate, to hand down", "part_of_speech": "verb"}]	\N
浏览	liú lǎn	lưu lan	lau4 laam2	[{"meaning": "to skim over, to browse, to surf (IT)", "part_of_speech": "verb"}]	\N
龙	lóng	lỗng	lung4	[{"meaning": "dragon", "part_of_speech": "noun"}]	\N
漏	lòu	lậu	lau6	[{"meaning": "to leak", "part_of_speech": "verb"}]	\N
露	lù	lộc	lou6	[{"meaning": "dew, syrup, nectar", "part_of_speech": "noun"}, {"meaning": "to uncover, to expose, to reveal", "part_of_speech": "verb"}]	\N
陆地	lù dì	lục địa	luk6 dei6	[{"meaning": "land, dry land", "part_of_speech": "noun"}]	\N
录取	lù qǔ	lục thủ	luk6 ceoi2	[{"meaning": "to enroll, being admitted (e.g. university)", "part_of_speech": "verb"}]	\N
陆续	lù xù	lục túc	luk6 zuk6	[{"meaning": "one after another, bit by bit", "part_of_speech": "adverb"}]	\N
录音	lù yīn	lục âm	luk6 jam1	[{"meaning": "sound recording", "part_of_speech": "noun"}, {"meaning": "to record", "part_of_speech": "verb"}]	\N
轮流	lún liú	luân lưu	leon4 lau4	[{"meaning": "to alternate, to take turns", "part_of_speech": "verb"}]	\N
论文	lùn wén	luận văn	leon4 man4	[{"meaning": "paper, thesis", "part_of_speech": "noun"}]	\N
落后	luò hòu	lạc hậu	lok6 hau6	[{"meaning": "to fall behind, to lag", "part_of_speech": "verb"}]	\N
逻辑	luó ji	la logic	lo4 zik1	[{"meaning": "logic", "part_of_speech": "noun"}]	\N
骂	mà	mạt	maat6	[{"meaning": "abuse", "part_of_speech": "noun"}, {"meaning": "to abuse, to curse", "part_of_speech": "verb"}]	\N
麦克风	mài kè fēng	mạch mục phong	maak6 mak6 fung1	[{"meaning": "microphone", "part_of_speech": "noun"}]	\N
馒头	mán tou	môn đầu	maan6 tau4	[{"meaning": "steamed bun", "part_of_speech": "noun"}]	\N
满足	mǎn zú	mãn túc	mun5 zuk6	[{"meaning": "to satisfy", "part_of_speech": "verb"}]	\N
毛	máo	mao	mou4	[{"meaning": "hair, down", "part_of_speech": "noun"}, {"meaning": "for 0.1 RMB", "part_of_speech": "measure word"}]	\N
毛病	máo bìng	mao bệnh	mou4 beng6	[{"meaning": "defect, fault, trouble", "part_of_speech": "noun"}]	\N
矛盾	máo dùn	mao đốn	mou4 deon6	[{"meaning": "contradiction", "part_of_speech": "noun"}, {"meaning": "contradictory", "part_of_speech": "adjective"}]	\N
冒险	mào xiǎn	mạo hiểm	maau6 him2	[{"meaning": "to take a risk", "part_of_speech": "verb"}]	\N
贸易	mào yì	mậu dịch	maau6 jik6	[{"meaning": "trade", "part_of_speech": "noun"}]	\N
魅力	mèi lì	mị lực	mei6 lik6	[{"meaning": "charm, fascination", "part_of_speech": "noun"}]	\N
眉毛	méi mao	mi mao	mei4 mou4	[{"meaning": "eyebrow", "part_of_speech": "noun"}]	\N
美术	měi shù	mỹ thuật	mei5 seot6	[{"meaning": "fine arts, art", "part_of_speech": "noun"}]	\N
煤炭	méi tàn	môi than	mui4 taan3	[{"meaning": "coal", "part_of_speech": "noun"}]	\N
蜜蜂	mì fēng	mật phong	mat6 fung1	[{"meaning": "honeybee", "part_of_speech": "noun"}]	\N
迷路	mí lù	mê lạc	mai4 lou6	[{"meaning": "to get lost, to lose the way", "part_of_speech": "verb"}]	\N
秘密	mì mì	bí mật	bei3 mat6	[{"meaning": "secret", "part_of_speech": "noun"}, {"meaning": "secret, confidential", "part_of_speech": "adjective"}]	\N
密切	mì qiè	mật tiệt	mat6 tit3	[{"meaning": "close, intimate", "part_of_speech": "adjective"}]	\N
秘书	mì shū	bí thư	bei3 syu1	[{"meaning": "secretary", "part_of_speech": "noun"}]	\N
谜语	mí yǔ	mê dụ	mai4 jyu5	[{"meaning": "riddle", "part_of_speech": "noun"}]	\N
面对	miàn duì	diện đối	min6 deoi3	[{"meaning": "to face, to confront", "part_of_speech": "verb"}]	\N
棉花	mián hua	miên hoa	min4 faa1	[{"meaning": "cotton", "part_of_speech": "noun"}]	\N
面积	miàn jī	diện tích	min6 gei6	[{"meaning": "area", "part_of_speech": "noun"}]	\N
面临	miàn lín	diện lâm	min6 lam4	[{"meaning": "to face sth., to be confronted with", "part_of_speech": "verb"}]	\N
秒	miǎo	miếu	miu5	[{"meaning": "second", "part_of_speech": "time"}]	\N
苗条	miáo tiao	miêu đạo	miu4 tiu4	[{"meaning": "slim, slender, graceful", "part_of_speech": "adjective"}]	\N
描写	miáo xiě	miêu tả	miu4 se2	[{"meaning": "description", "part_of_speech": "noun"}, {"meaning": "to describe, to depict, to portray", "part_of_speech": "verb"}]	\N
民主	mín zhǔ	dân chủ	man4 zu2	[{"meaning": "democracy", "part_of_speech": "noun"}, {"meaning": "democratic", "part_of_speech": "adjective"}]	\N
命令	mìng lìng	mệnh lệnh	ming6 ling6	[{"meaning": "order, command", "part_of_speech": "noun"}, {"meaning": "to order, to command", "part_of_speech": "verb"}]	\N
名牌	míng pái	danh bản	ming4 paai4	[{"meaning": "famous brand", "part_of_speech": "noun"}]	\N
名片	míng piàn	danh phiến	ming4 pin2	[{"meaning": "(business) card", "part_of_speech": "noun"}]	\N
明确	míng què	minh khắc	ming4 hak1	[{"meaning": "clear, definite, explicit", "part_of_speech": "adjective"}]	\N
名胜古迹	míng shèng gǔ jì	danh thắng cổ tích	ming4 sing3 gu2 zik1	[{"meaning": "historical sites and scenic spots", "part_of_speech": "noun"}]	\N
明显	míng xiǎn	minh hiện	ming4 jin6	[{"meaning": "clear, obvious", "part_of_speech": "adjective"}]	\N
明信片	míng xìn piàn	minh tín phiến	ming4 seon3 pin2	[{"meaning": "postcard", "part_of_speech": "noun"}]	\N
明星	míng xīng	minh tinh	ming4 sing1	[{"meaning": "star, celebrity", "part_of_speech": "noun"}]	\N
命运	mìng yùn	mệnh vận	ming6 wan6	[{"meaning": "fate, destiny", "part_of_speech": "noun"}]	\N
摸	mō	mô	mou4	[{"meaning": "to touch, to feel with the hand, to grope", "part_of_speech": "verb"}]	\N
模仿	mó fǎng	mô phỏng	mou4 fong6	[{"meaning": "to imitate, to copy", "part_of_speech": "verb"}]	\N
模糊	mó hu	mô hồ	mou4 wu4	[{"meaning": "fuzzy, blurred, indistinct", "part_of_speech": "adjective"}]	\N
陌生	mò shēng	mạc sinh	mak6 sang1	[{"meaning": "strange, unfamiliar", "part_of_speech": "adjective"}]	\N
摩托车	mó tuō chē	mô tổ trạc	mou4 to4 ce1	[{"meaning": "motorbike", "part_of_speech": "noun"}]	\N
某	mǒu	mẩu	mou5	[{"meaning": "some, certain", "part_of_speech": "pronoun"}]	\N
目标	mù biāo	mục tiêu	muk6 biau1	[{"meaning": "goal, target, objective", "part_of_speech": "noun"}]	\N
目录	mù lù	mục lục	muk6 luk6	[{"meaning": "catalog, table of contents", "part_of_speech": "noun"}]	\N
目前	mù qián	mục tiền	muk6 cin4	[{"meaning": "at present, now", "part_of_speech": "time"}]	\N
木头	mù tou	mộc đầu	muk6 tau4	[{"meaning": "log of wood, blockhead", "part_of_speech": "noun"}]	\N
哪怕	nǎ pà	na phạ	nä5 paa3	[{"meaning": "even if", "part_of_speech": "conjunction"}]	\N
难怪	nán guài	nan quải	naan4 gwaai3	[{"meaning": "no wonder (that)", "part_of_speech": "expression"}]	\N
难看	nán kàn	nan khánh	naan4 hon3	[{"meaning": "ugly", "part_of_speech": "adjective"}]	\N
脑袋	nǎo dai	não đại	naau4 doi6	[{"meaning": "head, skull, brain", "part_of_speech": "noun"}]	\N
内科	nèi kē	nội khoa	naap6 fo3	[{"meaning": "internal medicine", "part_of_speech": "noun"}]	\N
嫩	nèn	nhẹn	naan2	[{"meaning": "tender, soft, inexperienced", "part_of_speech": "adjective"}]	\N
能干	néng gàn	năng can	nang4 gon6	[{"meaning": "able, capable, competent", "part_of_speech": "adjective"}]	\N
能源	néng yuán	năng nguyên	nang4 jyun4	[{"meaning": "energy, energy source", "part_of_speech": "noun"}]	\N
念	niàn	niệm	nim6	[{"meaning": "to read aloud", "part_of_speech": "verb"}]	\N
年代	nián dài	niên đại	nin4 doi6	[{"meaning": "decade, age, period", "part_of_speech": "time"}]	\N
年纪	nián jì	niên kỷ	nin4 gei2	[{"meaning": "age", "part_of_speech": "noun"}]	\N
宁可	nìng kě	nguyện khả	nang4 ho2	[{"meaning": "would rather, preferably", "part_of_speech": "conjunction"}]	\N
牛仔裤	niú zǎi kù	ngưu tải khố	ngau4 zai2 fu2	[{"meaning": "jeans", "part_of_speech": "noun"}]	\N
浓	nóng	nồng	nung4	[{"meaning": "dense, concentrated, thick", "part_of_speech": "adjective"}]	\N
农民	nóng mín	nông dân	nung4 man4	[{"meaning": "peasant, farmer", "part_of_speech": "noun"}]	\N
农业	nóng yè	nông nghiệp	nung4 jip6	[{"meaning": "agriculture, farming", "part_of_speech": "noun"}]	\N
女士	nǚ shì	nữ thị	neoi5 si6	[{"meaning": "lady, madam", "part_of_speech": "noun"}]	\N
偶然	ǒu rán	âu nhiên	ngau5 jin4	[{"meaning": "accidentally, by chance", "part_of_speech": "adverb"}]	\N
派	pài	phái	paai3	[{"meaning": "school, group, pi (π)", "part_of_speech": "noun"}, {"meaning": "to send, to assign", "part_of_speech": "verb"}]	\N
拍	pāi	phác	pak3	[{"meaning": "to clap, to slap, to take (a photo)", "part_of_speech": "verb"}]	\N
排队	pái duì	bài đội	paai4 deoi6	[{"meaning": "to queue, to line up", "part_of_speech": "verb"}]	\N
排球	pái qiú	bài cầu	paai4 kau4	[{"meaning": "volleyball", "part_of_speech": "noun"}]	\N
盼望	pàn wàng	bản vọng	paan3 mong6	[{"meaning": "to hope for, to look forward to", "part_of_speech": "verb"}]	\N
赔偿	péi cháng	bồi thường	pui3 coeng4	[{"meaning": "compensation", "part_of_speech": "noun"}, {"meaning": "to compensate", "part_of_speech": "verb"}]	\N
佩服	pèi fu	bối phục	pui3 fuk6	[{"meaning": "to admire", "part_of_speech": "verb"}]	\N
配合	pèi hé	phối hợp	pui4 hap6	[{"meaning": "to coordinate, to cooperate, to fit", "part_of_speech": "verb"}]	\N
培养	péi yǎng	bồi dưỡng	pui4 joeng5	[{"meaning": "to train, to cultivate, to bring up", "part_of_speech": "verb"}]	\N
盆	pén	bần	pan4	[{"meaning": "basin, tub, pot", "part_of_speech": "noun"}, {"meaning": "for approx. 128 liters", "part_of_speech": "measure word"}]	\N
碰见	pèng jiàn	bằng kiến	paang5 gin3	[{"meaning": "to run into, to bump into", "part_of_speech": "verb"}]	\N
匹	pǐ	bỉ	pat1	[{"meaning": "ordinary person", "part_of_speech": "noun"}, {"meaning": "for horses and cloth", "part_of_speech": "measure word"}]	\N
批	pī	bì	pai1	[{"meaning": "to criticize", "part_of_speech": "verb"}, {"meaning": "for batches, lots, etc.", "part_of_speech": "measure word"}]	\N
披	pī	bĩ	pai1	[{"meaning": "to drape over one’s shoulder, to crack", "part_of_speech": "verb"}]	\N
疲劳	pí láo	bì lao	bei1 lou4	[{"meaning": "wariness, fatigue", "part_of_speech": "noun"}, {"meaning": "tired, weary, exhausted", "part_of_speech": "adjective"}]	\N
皮鞋	pí xié	bì điệp	bi2 haai4	[{"meaning": "leather shoes", "part_of_speech": "noun"}]	\N
批准	pī zhǔn	bi chấp	pei1 zyun1	[{"meaning": "to approve, to ratify", "part_of_speech": "verb"}]	\N
片	piàn	phiến	pin3	[{"meaning": "thin piece, slice, film", "part_of_speech": "noun"}, {"meaning": "for movies, scenes, etc. pieces of things", "part_of_speech": "measure word"}]	\N
片面	piàn miàn	phiến diện	 pin3 min6	[{"meaning": "unilateral, one-sided", "part_of_speech": "adjective"}]	\N
飘	piāo	phiêu	piau1	[{"meaning": "to flutter, to float (in the wind)", "part_of_speech": "verb"}]	\N
频道	pín dào	tần đạo	pan4 dou6	[{"meaning": "frequency, (TV) channel", "part_of_speech": "noun"}]	\N
品种	pǐn zhǒng	phẩm chủng	ban2 zung2	[{"meaning": "variety, breed", "part_of_speech": "noun"}]	\N
凭	píng	bằng	pan4	[{"meaning": "proof", "part_of_speech": "noun"}, {"meaning": "to rely on, to lean against", "part_of_speech": "verb"}, {"meaning": "according to, on the basis of", "part_of_speech": "relative clause"}]	\N
平	píng	bình	ping4	[{"meaning": "flat, level, calm, peaceful", "part_of_speech": "adjective"}]	\N
平常	píng cháng	bình thường	ping4 soeng4	[{"meaning": "ordinary, common", "part_of_speech": "adjective"}, {"meaning": "generally, usually", "part_of_speech": "adverb"}]	\N
平等	píng děng	bình đẳng	ping4 dang2	[{"meaning": "equality", "part_of_speech": "noun"}, {"meaning": "equal", "part_of_speech": "adjective"}]	\N
平方	píng fāng	bình phương	ping4 fong1	[{"meaning": "square", "part_of_speech": "noun"}]	\N
平衡	píng héng	bình hòa	ping4 hang4	[{"meaning": "balance, equilibrium", "part_of_speech": "noun"}]	\N
评价	píng jià	bình giá	ping4 gaai3	[{"meaning": "to assess, to evaluate", "part_of_speech": "verb"}]	\N
平静	píng jìng	bình tĩnh	ping4 zing6	[{"meaning": "calm, quiet, tranquil", "part_of_speech": "noun"}]	\N
平均	píng jūn	bình quân	ping4 kwan4	[{"meaning": "average", "part_of_speech": "noun"}, {"meaning": "average, mean", "part_of_speech": "adjective"}]	\N
破产	pò chǎn	phá sản	po3 san3	[{"meaning": "bankruptcy", "part_of_speech": "noun"}, {"meaning": "to go bankrupt", "part_of_speech": "verb"}]	\N
破坏	pò huài	phá hoại	po3 waai6	[{"meaning": "destruction, damage", "part_of_speech": "noun"}, {"meaning": "to destroy, to break", "part_of_speech": "verb"}]	\N
迫切	pò qiè	bức thiết	paak1 cit3	[{"meaning": "urgent, pressing", "part_of_speech": "adjective"}]	\N
朴素	pǔ sù	phác tố	paak3 sou3	[{"meaning": "plain, simple", "part_of_speech": "adjective"}]	\N
期待	qī dài	kì đại	kei4 doi6	[{"meaning": "expectation", "part_of_speech": "noun"}, {"meaning": "to look forward to", "part_of_speech": "verb"}]	\N
启发	qǐ fā	khởi phát	kai2 faat3	[{"meaning": "inspiration, enlightenment", "part_of_speech": "noun"}, {"meaning": "to inspire, to enlighten", "part_of_speech": "verb"}]	\N
气氛	qì fēn	khí phân	hei3 fan1	[{"meaning": "atmosphere, mood", "part_of_speech": "noun"}]	\N
奇迹	qí jì	kì tích	kei4 zik1	[{"meaning": "miracle, wonder", "part_of_speech": "noun"}]	\N
期间	qī jiān	kì đoạn	kei4 gaan1	[{"meaning": "period of time, period", "part_of_speech": "noun"}]	\N
企图	qǐ tú	khí đồ	kei5 tou4	[{"meaning": "attempt", "part_of_speech": "noun"}, {"meaning": "to attempt", "part_of_speech": "verb"}]	\N
企业	qǐ yè	khí nghiệp	kei5 jip6	[{"meaning": "enterprise, company", "part_of_speech": "noun"}]	\N
汽油	qì yóu	khí dầu	hei3 jau4	[{"meaning": "gas, gasoline", "part_of_speech": "noun"}]	\N
其余	qí yú	kì dư	kei4 jyu4	[{"meaning": "the rest, the others", "part_of_speech": "pronoun"}]	\N
欠	qiàn	khảm	ham5	[{"meaning": "to owe", "part_of_speech": "verb"}, {"meaning": "deficient", "part_of_speech": "adjective"}]	\N
浅	qiǎn	tiển	sin2	[{"meaning": "shallow, light", "part_of_speech": "adjective"}]	\N
牵	qiān	ken	khin1	[{"meaning": "to pull, to lead, to hold hands", "part_of_speech": "verb"}]	\N
前途	qián tú	tiền đồ	 cin4 tou4	[{"meaning": "prospect, future", "part_of_speech": "noun"}]	\N
谦虚	qiān xū	kiến hư	kim4 heoi1	[{"meaning": "modest", "part_of_speech": "adjective"}]	\N
签字	qiān zì	kiên tự	kim4 zi6	[{"meaning": "to sign (signature)", "part_of_speech": "verb"}]	\N
抢	qiǎng	khiếm	kong1	[{"meaning": "to grab, to rob", "part_of_speech": "verb"}]	\N
枪	qiāng	khương	coeng1	[{"meaning": "gun, spear", "part_of_speech": "noun"}]	\N
强调	qiáng diào	cưỡng điệu	goeng6 diu6	[{"meaning": "to emphasize, to stress, to underling", "part_of_speech": "verb"}]	\N
强烈	qiáng liè	cường liệt	goeng6 lit6	[{"meaning": "intense, strong, violent", "part_of_speech": "adjective"}]	\N
瞧	qiáo	kiêu	kiu2	[{"meaning": "to look at, to see", "part_of_speech": "verb"}]	\N
巧妙	qiǎo miào	kiệt miêu	haau2 miu6	[{"meaning": "ingenious, clever", "part_of_speech": "adjective"}]	\N
悄悄	qiāo qiāo	khẻo khẻo	hau1 hau1	[{"meaning": "quietly, secretly", "part_of_speech": "adverb"}]	\N
切	qiē	thiết	tsit3	[{"meaning": "to cut, to chop", "part_of_speech": "verb"}]	\N
亲爱	qīn ài	thân ái	can1 oi3	[{"meaning": "dear, beloved", "part_of_speech": "adjective"}]	\N
勤奋	qín fèn	cần phấn	kan4 fan5	[{"meaning": "hardworking, diligent", "part_of_speech": "adjective"}]	\N
勤劳	qín láo	cần lao	kan4 lou4	[{"meaning": "hardworking, industrious", "part_of_speech": "adjective"}]	\N
侵略	qīn lüè	xâm lược	chàm lui6	[{"meaning": "invasion, aggression", "part_of_speech": "noun"}, {"meaning": "to invade", "part_of_speech": "verb"}]	\N
亲切	qīn qiè	thân thiết	can1 cit3	[{"meaning": "friendliness, hospitality", "part_of_speech": "noun"}, {"meaning": "kind, cordial, amiable", "part_of_speech": "adjective"}]	\N
亲自	qīn zì	thân tự	can1 zi6	[{"meaning": "personally", "part_of_speech": "adverb"}]	\N
青	qīng	thanh	cing1	[{"meaning": "blue/green", "part_of_speech": "adjective"}]	\N
青春	qīng chūn	thanh xuân	cing1 ceon1	[{"meaning": "youth, youthfulness", "part_of_speech": "time"}]	\N
清淡	qīng dàn	thanh đạm	cing1 daam6	[{"meaning": "light (food)", "part_of_speech": "adjective"}]	\N
情景	qíng jǐng	tình cảnh	cing4 ging2	[{"meaning": "scene, sight, condition, circumstances", "part_of_speech": "noun"}]	\N
请求	qǐng qiú	đệ yêu	keoi4 jau1	[{"meaning": "request", "part_of_speech": "noun"}, {"meaning": "to request, to ask", "part_of_speech": "verb"}]	\N
青少年	qīng shào nián	thanh thiếu niên	cing1 siu2 nin4	[{"meaning": "young person, teenager", "part_of_speech": "noun"}]	\N
轻视	qīng shì	khinh thị	heng1 si6	[{"meaning": "to look down upon, to contempt", "part_of_speech": "verb"}]	\N
情绪	qíng xù	tình tự	cing4 seoi6	[{"meaning": "feeling, mood, sentiment", "part_of_speech": "noun"}]	\N
庆祝	qìng zhù	khánh chúc	hing3 zuk1	[{"meaning": "to celebrate", "part_of_speech": "verb"}]	\N
球迷	qiú mí	cầu mi	 kau4 mai4	[{"meaning": "football fan", "part_of_speech": "noun"}]	\N
娶	qǔ	cưới	keoi2	[{"meaning": "to marry (men -> woman)", "part_of_speech": "verb"}]	\N
去世	qù shì	thủ thế	heoi3 sai6	[{"meaning": "to pass away, to die", "part_of_speech": "verb"}]	\N
趋势	qū shì	thú thế	ceoi1 sai6	[{"meaning": "trend, tendency", "part_of_speech": "noun"}]	\N
取消	qǔ xiāo	từ khước	heoi1 hei2	[{"meaning": "cancellation", "part_of_speech": "noun"}, {"meaning": "to cancel", "part_of_speech": "verb"}]	\N
劝	quàn	khuuyến	kun3	[{"meaning": "to advise, to persuade, to encourage", "part_of_speech": "verb"}]	\N
圈	quān	khuyên	kun1	[{"meaning": "circle, ring, loop", "part_of_speech": "noun"}, {"meaning": "for loops, laps, etc.", "part_of_speech": "measure word"}]	\N
故宫	gù gōng	cố cung	gu3 gung1	[{"meaning": "Forbidden City", "part_of_speech": "noun"}]	\N
\.


--
-- Data for Name: vocab_sandbox; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vocab_sandbox (simplified, pinyin, hanviet, cantonese, english, wohok_link) FROM stdin;
啊	a	a1	a	[{"meaning": "showing approval", "part_of_speech": "particle"}]	https://wohok.com/dict/%e5%95%8a-a-a-translation-pronunciation-and-example-sentences/
阿姨	ā yí	a1 yi2	a1 ji2	[{"meaning": "aunt", "part_of_speech": "noun"}]	https://wohok.com/dict/%e9%98%bf%e5%a7%a8-a-yi-translation-pronunciation-and-example-sentences/
矮	ǎi	ai1	ngaai2	[{"meaning": "low, short", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e7%9f%ae-ai-translation-pronunciation-and-example-sentences/
脚	jiǎo	chiếu	gok3	[{"meaning": "foot", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%84%9a-jiao-translation-pronunciation-and-example-sentences/
爱好	ài hào	ái hào	oi3 hou2	[{"meaning": "hobby, interest", "part_of_speech": "noun"}, {"meaning": "to like", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%88%b1%e5%a5%bd-ai-hao-translation-pronunciation-and-example-sentences/
安静	ān jìng	an ninh	on1 zing6	[{"meaning": "quiet, peaceful", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%ae%89%e9%9d%99-an-jing-translation-pronunciation-and-example-sentences/
把	bǎ	bả	baa2	[{"meaning": "handle", "part_of_speech": "noun"}, {"meaning": "to grasp, to hold", "part_of_speech": "verb"}, {"meaning": "for ba-sentences", "part_of_speech": "particle"}, {"meaning": "for a bunch or objects with handle", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e6%8a%8a-ba-translation-pronunciation-and-example-sentences/
半	bàn	bán	boon3	[{"meaning": "half", "part_of_speech": "number"}]	https://wohok.com/dict/%e5%8d%8a-ban-translation-pronunciation-and-example-sentences/
搬	bān	bàn	baan1	[{"meaning": "to move, to shift", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%90%ac-ban-translation-pronunciation-and-example-sentences/
班	bān	ban	baan1	[{"meaning": "class, team, squad", "part_of_speech": "noun"}, {"meaning": "for groups, rankings, etc.", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e7%8f%ad-ban-translation-pronunciation-and-example-sentences/
办法	bàn fǎ	bạn pháp	baan6 faat3	[{"meaning": "method, way, means", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%8a%9e%e6%b3%95-ban-fa-translation-pronunciation-and-example-sentences/
云	yún	 vân	 wan4	[{"meaning": "cloud", "part_of_speech": "noun"}]	https://wohok.com/dict/%e4%ba%91-yun-translation-pronunciation-and-example-sentences/
办公室	bàn gōng shì	bạn cơng thất	baan6 gung1 sat1	[{"meaning": "office, bureau", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%8a%9e%e5%85%ac%e5%ae%a4-ban-gong-shi-translation-pronunciation-and-example-sentences/
帮忙	bāng máng	bằng mạnh	baang1 mong4	[{"meaning": "to help, to do a favour", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%b8%ae%e5%bf%99-bang-mang-translation-pronunciation-and-example-sentences/
饱	bǎo	bão	bou2	[{"meaning": "full (from eating)", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e9%a5%b1-bao-translation-pronunciation-and-example-sentences/
包	bāo	bao	bāau1	[{"meaning": "bag, package", "part_of_speech": "noun"}, {"meaning": "to cover, to wrap, to hold, to include", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%8c%85-bao-translation-pronunciation-and-example-sentences/
被	bèi	bị	bei6	[{"meaning": "by (for passive sentence)", "part_of_speech": "relative clause"}]	https://wohok.com/dict/%e8%a2%ab-bei-translation-pronunciation-and-example-sentences/
北方	běi fāng	bắc phương	bak1 fong1	[{"meaning": "north, northern part of a country", "part_of_speech": "location"}]	https://wohok.com/dict/%e5%8c%97%e6%96%b9-bei-fang-translation-pronunciation-and-example-sentences/
比较	bǐ jiào	bỉ giới	bei2 gaau2	[{"meaning": "quite, rather, fairly, comparatively", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e6%af%94%e8%be%83-bi-jiao-translation-pronunciation-and-example-sentences/
比赛	bǐ sài	bỉ tại	bei2 coi3	[{"meaning": "competition, match", "part_of_speech": "noun"}, {"meaning": "to compete", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%af%94%e8%b5%9b-bi-sai-translation-pronunciation-and-example-sentences/
必须	bì xū	tất hủ	bit1 heoi1	[{"meaning": "to have to, to must", "part_of_speech": "auxiliary verb"}]	https://wohok.com/dict/%e5%bf%85%e9%a1%bb-bi-xu-translation-pronunciation-and-example-sentences/
鼻子	bí zi	mũi bí	bei6 zi2	[{"meaning": "nose", "part_of_speech": "noun"}]	https://wohok.com/dict/%e9%bc%bb%e5%ad%90-bi-zi-translation-pronunciation-and-example-sentences/
变化	biàn huà	biến hoá	bin3 faa3	[{"meaning": "change, variation", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%8f%98%e5%8c%96-bian-hua-translation-pronunciation-and-example-sentences/
表示	biǎo shì	biểu thị	biu2 tai2	[{"meaning": "to express, to show, to indicate", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%a1%a8%e7%a4%ba-biao-shi-translation-pronunciation-and-example-sentences/
表演	biǎo yǎn	biểu diễn	biu2 jin6	[{"meaning": "performance, show", "part_of_speech": "noun"}, {"meaning": "to perform, to act", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%a1%a8%e6%bc%94-biao-yan-translation-pronunciation-and-example-sentences/
别人	bié ren	biệt nhân	bit6 jan4	[{"meaning": "others, other people", "part_of_speech": "pronoun"}]	https://wohok.com/dict/%e5%88%ab%e4%ba%ba-bie-ren-translation-pronunciation-and-example-sentences/
宾馆	bīn guǎn	tân quán	ban1 gun2	[{"meaning": "hotel", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%ae%be%e9%a6%86-bin-guan-translation-pronunciation-and-example-sentences/
冰箱	bīng xiāng	băng tường	bing1 seong1	[{"meaning": "fridge, icebox", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%86%b0%e7%ae%b1-bing-xiang-translation-pronunciation-and-example-sentences/
才	cái	tài	coi4	[{"meaning": "ability, talent", "part_of_speech": "noun"}, {"meaning": "just, only if", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e6%89%8d-cai-translation-pronunciation-and-example-sentences/
菜单	cài dān	thực đơn	coi3 daan6	[{"meaning": "menu", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%8f%9c%e5%8d%95-cai-dan-translation-pronunciation-and-example-sentences/
参加	cān jiā	tam gia	chaam1 gaa1	[{"meaning": "to attend, to take part, to join", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%8f%82%e5%8a%a0-can-jia-translation-pronunciation-and-example-sentences/
草	cǎo	thảo	cou2	[{"meaning": "grass, straw", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%8d%89-cao-translation-pronunciation-and-example-sentences/
层	céng	tằng	cang4	[{"meaning": "layer, floor", "part_of_speech": "noun"}, {"meaning": "for layer, story, floor", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e5%b1%82-ceng-translation-pronunciation-and-example-sentences/
差	chà	sai	chaai1	[{"meaning": "to lack, short of", "part_of_speech": "verb"}, {"meaning": "poor", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%b7%ae-cha-translation-pronunciation-and-example-sentences/
超市	chāo shì	siêu thị	ciu1 si5	[{"meaning": "supermarket", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%b6%85%e5%b8%82-chao-shi-translation-pronunciation-and-example-sentences/
衬衫	chèn shān	soàm sơ	can3 saam1	[{"meaning": "shirt, blouse", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%a1%ac%e8%a1%ab-chen-shan-translation-pronunciation-and-example-sentences/
成绩	chéng jì	thành tích	cing4 zik1	[{"meaning": "score, achievement, grades", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%88%90%e7%bb%a9-cheng-ji-translation-pronunciation-and-example-sentences/
城市	chéng shì	thành phố	sing4 si5	[{"meaning": "city, town", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%9f%8e%e5%b8%82-cheng-shi-translation-pronunciation-and-example-sentences/
迟到	chí dào	trì đáo	ci4 dou3	[{"meaning": "to be late", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%bf%9f%e5%88%b0-chi-dao-translation-pronunciation-and-example-sentences/
厨房	chú fáng	trù phòng	ceoi4 fong2	[{"meaning": "kitchen", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%8e%a8%e6%88%bf-chu-fang-translation-pronunciation-and-example-sentences/
除了	chú le	trừ liễu	ceoi4 liu5	[{"meaning": "except for, apart from, besides", "part_of_speech": "conjunction"}]	https://wohok.com/dict/%e9%99%a4%e4%ba%86-chu-le-translation-pronunciation-and-example-sentences/
出现	chū xiàn	xuất hiện	ceot1 hin6	[{"meaning": "to appear, to arise", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%87%ba%e7%8e%b0-chu-xian-translation-pronunciation-and-example-sentences/
春	chūn	xuân	ceon1	[{"meaning": "spring", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%98%a5-chun-translation-pronunciation-and-example-sentences/
词语	cí yǔ	từ ngữ	ci4 jyu5	[{"meaning": "word, expression", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%af%8d%e8%af%ad-ci-yu-translation-pronunciation-and-example-sentences/
聪明	cōng ming	thông minh	cong1 ming4	[{"meaning": "clever, intelligent, smart", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e8%81%aa%e6%98%8e-cong-ming-translation-pronunciation-and-example-sentences/
打扫	dǎ sǎo	đả tảo	daa2 sou3	[{"meaning": "to clean", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%89%93%e6%89%ab-da-sao-translation-pronunciation-and-example-sentences/
打算	dǎ suàn	đả toán	daa2 syun3	[{"meaning": "plan, intention", "part_of_speech": "noun"}, {"meaning": "to plan, to think of, to calculate", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%89%93%e7%ae%97-da-suan-translation-pronunciation-and-example-sentences/
带	dài	đái	daai3	[{"meaning": "band, belt, area, region", "part_of_speech": "noun"}, {"meaning": "to wear, to carry, to bring, to lead", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%b8%a6-dai-translation-pronunciation-and-example-sentences/
蛋糕	dàn gāo	đánh khao	daan6 gou1	[{"meaning": "cake", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%9b%8b%e7%b3%95-dan-gao-translation-pronunciation-and-example-sentences/
担心	dān xīn	đảm tâm	daam6 sam1	[{"meaning": "to worry", "part_of_speech": "verb"}, {"meaning": "worried, anxious", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e6%8b%85%e5%bf%83-dan-xin-translation-pronunciation-and-example-sentences/
当然	dāng rán	đương nhiên	doong6 jin4	[{"meaning": "certainly, of course", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e5%bd%93%e7%84%b6-dang-ran-translation-pronunciation-and-example-sentences/
地	de	địa	dei6	[{"meaning": "used before a verb", "part_of_speech": "particle"}]	https://wohok.com/dict/%e5%9c%b0-de-di-translation-pronunciation-and-example-sentences/
灯	dēng	đèn	dang1	[{"meaning": "lamp, light", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%81%af-deng-translation-pronunciation-and-example-sentences/
低	dī	dĩ	dai1	[{"meaning": "low", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e4%bd%8e-di-translation-pronunciation-and-example-sentences/
地方	dì fang	địa phương	dei6 fong1	[{"meaning": "region, place, location", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%9c%b0%e6%96%b9-di-fang-translation-pronunciation-and-example-sentences/
地铁	dì tiě	địa thiết	dei6 tit3	[{"meaning": "subway", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%9c%b0%e9%93%81-di-tie-translation-pronunciation-and-example-sentences/
地图	dì tú	địa đồ	dei6 tou4	[{"meaning": "map", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%9c%b0%e5%9b%be-di-tu-translation-pronunciation-and-example-sentences/
电梯	diàn tī	điện thang	 din6 tai1	[{"meaning": "elevator", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%94%b5%e6%a2%af-dian-ti-translation-pronunciation-and-example-sentences/
电子邮件	diàn zǐ yóu jiàn	điện tử duyệt viên	din6 zi2 jau4 min6	[{"meaning": "email", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%94%b5%e5%ad%90%e9%82%ae%e4%bb%b6-dian-zi-you-jian-translation-pronunciation-and-example-sentences/
东	dōng	đông	dung1	[{"meaning": "east", "part_of_speech": "location"}]	https://wohok.com/dict/%e4%b8%9c-dong-translation-pronunciation-and-example-sentences/
冬	dōng	đông	dung1	[{"meaning": "winter", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%86%ac-dong-translation-pronunciation-and-example-sentences/
动物	dòng wù	động vật	dung6 mat6	[{"meaning": "animal", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%8a%a8%e7%89%a9-dong-wu-translation-pronunciation-and-example-sentences/
段	duàn	đoạn	dyun6	[{"meaning": "for paragraphs, segments, periods, stories", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e6%ae%b5-duan-translation-pronunciation-and-example-sentences/
短	duǎn	đoản	dyun2	[{"meaning": "short, brief", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e7%9f%ad-duan-translation-pronunciation-and-example-sentences/
锻炼	duàn liàn	đoàn liễn	dyun3 lin6	[{"meaning": "to exercise, to engage in physical exercise", "part_of_speech": "verb"}]	https://wohok.com/dict/%e9%94%bb%e7%82%bc-duan-lian-translation-pronunciation-and-example-sentences/
多么	duō me	đa mạc	do1 maa5	[{"meaning": "how, what", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e5%a4%9a%e4%b9%88-duo-me-translation-pronunciation-and-example-sentences/
饿	è	ngạc	aak6	[{"meaning": "hungry", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e9%a5%bf-e-translation-pronunciation-and-example-sentences/
耳朵	ěr duo	nhi đảo	ji5 dou2	[{"meaning": "ear", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%80%b3%e6%9c%b5-er-duo-translation-pronunciation-and-example-sentences/
而且	ér qiě	như thích	ji4 ci3	[{"meaning": "moreover, in addition, furthermore", "part_of_speech": "conjunction"}]	https://wohok.com/dict/%e8%80%8c%e4%b8%94-er-qie-translation-pronunciation-and-example-sentences/
发烧	fā shāo	phát triều	faat3 siu1	[{"meaning": "to have fever", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%8f%91%e7%83%a7-fa-shao-translation-pronunciation-and-example-sentences/
发现	fā xiàn	phát hiện	faat3 jin6	[{"meaning": "to discover, to find", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%8f%91%e7%8e%b0-fa-xian-translation-pronunciation-and-example-sentences/
放	fàng	phóng	fong3	[{"meaning": "to let go, to put, have a vacation", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%94%be-fang-translation-pronunciation-and-example-sentences/
方便	fāng biàn	phương tiện	fong1 bin6	[{"meaning": "convenient", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e6%96%b9%e4%be%bf-fang-bian-translation-pronunciation-and-example-sentences/
放心	fàng xīn	phóng tâm	fong3 sam1	[{"meaning": "to rest, to be at ease", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%94%be%e5%bf%83-fang-xin-translation-pronunciation-and-example-sentences/
分	fēn	phân	fan1	[{"meaning": "minute, point, 0.01 Yuan", "part_of_speech": "noun"}, {"meaning": "to divide, to distinguish", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%88%86-fen-translation-pronunciation-and-example-sentences/
附近	fù jìn	phụ cận	fu6 gan6	[{"meaning": "vicinity", "part_of_speech": "noun"}, {"meaning": "nearby", "part_of_speech": "adverb"}, {"meaning": "next to", "part_of_speech": "relative clause"}]	https://wohok.com/dict/%e9%99%84%e8%bf%91-fu-jin-translation-pronunciation-and-example-sentences/
会议	huì yì	hoạt nghị	wo6 jui6	[{"meaning": "meeting, conference", "part_of_speech": "noun"}]	https://wohok.com/dict/%e4%bc%9a%e8%ae%ae-hui-yi-translation-pronunciation-and-example-sentences/
复习	fù xí	phục tập	fu6 zaap6	[{"meaning": "revision", "part_of_speech": "noun"}, {"meaning": "to revise", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%a4%8d%e4%b9%a0-fu-xi-translation-pronunciation-and-example-sentences/
敢	gǎn	cảm	kam2	[{"meaning": "to dare", "part_of_speech": "auxiliary verb"}]	https://wohok.com/dict/%e6%95%a2-gan-translation-pronunciation-and-example-sentences/
干净	gān jìng	càn kính	gon1 jing1	[{"meaning": "clean, tidy", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%b9%b2%e5%87%80-gan-jing-translation-pronunciation-and-example-sentences/
感冒	gǎn mào	cảm mạo	kam2 mou6	[{"meaning": "common cold", "part_of_speech": "noun"}, {"meaning": "to catch a cold", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%84%9f%e5%86%92-gan-mao-translation-pronunciation-and-example-sentences/
刚才	gāng cái	cang tài	gong1 coi4	[{"meaning": "just a moment ago", "part_of_speech": "time"}]	https://wohok.com/dict/%e5%88%9a%e6%89%8d-gang-cai-translation-pronunciation-and-example-sentences/
跟	gēn	cân	kun1	[{"meaning": "to follow", "part_of_speech": "verb"}, {"meaning": "with", "part_of_speech": "relative clause"}, {"meaning": "and", "part_of_speech": "conjunction"}]	https://wohok.com/dict/%e8%b7%9f-gen-translation-pronunciation-and-example-sentences/
根据	gēn jù	căn cứ	gan1 geoi2	[{"meaning": "basis, foundation", "part_of_speech": "noun"}, {"meaning": "to base on", "part_of_speech": "verb"}, {"meaning": "according to, based on", "part_of_speech": "relative clause"}]	https://wohok.com/dict/%e6%a0%b9%e6%8d%ae-gen-ju-translation-pronunciation-and-example-sentences/
更	gèng	canh	gaang1	[{"meaning": "even more", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e6%9b%b4-geng-translation-pronunciation-and-example-sentences/
公园	gōng yuán	công viên	gung1 jyun2	[{"meaning": "park", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%85%ac%e5%9b%ad-gong-yuan-translation-pronunciation-and-example-sentences/
故事	gù shi	cố sự	gu3 si6	[{"meaning": "story, tale", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%95%85%e4%ba%8b-gu-shi-translation-pronunciation-and-example-sentences/
刮风	guā fēng	quát phong	gwaa3 fung1	[{"meaning": "to be windy", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%88%ae%e9%a3%8e-gua-feng-translation-pronunciation-and-example-sentences/
关	guān	gwan	guan1	[{"meaning": "mountain pass, barrier", "part_of_speech": "noun"}, {"meaning": "to close, to shut, to turn off", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%85%b3-guan-translation-pronunciation-and-example-sentences/
关系	guān xì	quan hệ	guan1 hai6	[{"meaning": "relationship, relation", "part_of_speech": "noun"}, {"meaning": "to affect, to have to do with", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%85%b3%e7%b3%bb-guan-xi-translation-pronunciation-and-example-sentences/
关心	guān xīn	quan tâm	guan1 sam1	[{"meaning": "concern", "part_of_speech": "noun"}, {"meaning": "to care for", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%85%b3%e5%bf%83-guan-xin-translation-pronunciation-and-example-sentences/
关于	guān yú	quan vụ	guan1 jyu1	[{"meaning": "concerning, with regards to, about", "part_of_speech": "relative clause"}]	https://wohok.com/dict/%e5%85%b3%e4%ba%8e-guan-yu-translation-pronunciation-and-example-sentences/
国家	guó jiā	quốc gia	guok3 gaai1	[{"meaning": "country, state, nation", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%9b%bd%e5%ae%b6-guo-jia-translation-pronunciation-and-example-sentences/
过去	guò qù	quá khứ	gwo3 heoi3	[{"meaning": "to go over, to pass by", "part_of_speech": "verb"}, {"meaning": "past, former", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e8%bf%87%e5%8e%bb-guo-qu-translation-pronunciation-and-example-sentences/
果汁	guǒ zhī	quả trí	gwo2 zat1	[{"meaning": "fruit juice", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%9e%9c%e6%b1%81-guo-zhi-translation-pronunciation-and-example-sentences/
害怕	hài pà	hại phạ	hoi6 paa3	[{"meaning": "to be afraid, to fear", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%ae%b3%e6%80%95-hai-pa-translation-pronunciation-and-example-sentences/
还是	hái shì	hòa thị	waan4 si6	[{"meaning": "still, nevertheless", "part_of_speech": "adverb"}, {"meaning": "or", "part_of_speech": "conjunction"}]	https://wohok.com/dict/%e8%bf%98%e6%98%af-hai-shi-translation-pronunciation-and-example-sentences/
河	hé	hà	sai1	[{"meaning": "river", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%b2%b3-he-translation-pronunciation-and-example-sentences/
黑板	hēi bǎn	hắc bảng	hak1 bong2	[{"meaning": "blackboard", "part_of_speech": "noun"}]	https://wohok.com/dict/%e9%bb%91%e6%9d%bf-hei-ban-translation-pronunciation-and-example-sentences/
护照	hù zhào	hộ chiếu	ho6 ciu3	[{"meaning": "passport", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%8a%a4%e7%85%a7-hu-zhao-translation-pronunciation-and-example-sentences/
画	huà	hoa	waak6	[{"meaning": "picture, painting", "part_of_speech": "noun"}, {"meaning": "to draw, to paint", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%94%bb-hua-translation-pronunciation-and-example-sentences/
花	huā	hoa	faa1	[{"meaning": "flower", "part_of_speech": "noun"}, {"meaning": "to spend", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%8a%b1-hua-translation-pronunciation-and-example-sentences/
花园	huā yuán	hoa viên	faa1 jyun4	[{"meaning": "garden", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%8a%b1%e5%9b%ad-hua-yuan-translation-pronunciation-and-example-sentences/
坏	huài	hoại	waai6	[{"meaning": "bad, broken, spoiled", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%9d%8f-huai-translation-pronunciation-and-example-sentences/
还	huán	hoàn	waan4	[{"meaning": "to give back, to return", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%bf%98-hai-huan-translation-pronunciation-and-example-sentences/
换	huàn	hoán	woon6	[{"meaning": "to change, to exchange", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%8d%a2-huan-translation-pronunciation-and-example-sentences/
环境	huán jìng	hoàn cảnh	waan4 ging2	[{"meaning": "environment, surroundings", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%8e%af%e5%a2%83-huan-jing-translation-pronunciation-and-example-sentences/
黄	huáng	hoàng	wong4	[{"meaning": "to fall through", "part_of_speech": "verb"}, {"meaning": "yellow, pornographic", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e9%bb%84-huang-translation-pronunciation-and-example-sentences/
或者	huò zhě	hoặc giả	waak6 gaa2	[{"meaning": "or, possibly", "part_of_speech": "conjunction"}]	https://wohok.com/dict/%e6%88%96%e8%80%85-huo-zhe-translation-pronunciation-and-example-sentences/
极	jí	cực	cuk1	[{"meaning": "pole", "part_of_speech": "noun"}, {"meaning": "extremely, highly", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e6%9e%81-ji-translation-pronunciation-and-example-sentences/
记得	jì de	ký đảo	gei3 dou3	[{"meaning": "to remember", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%ae%b0%e5%be%97-ji-de-translation-pronunciation-and-example-sentences/
几乎	jī hū	kỳ hồ	gei2 fu1	[{"meaning": "almost, nearly", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e5%87%a0%e4%b9%8e-ji-hu-translation-pronunciation-and-example-sentences/
机会	jī huì	cơ hội	gei1 wui6	[{"meaning": "opportunity, chance", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%9c%ba%e4%bc%9a-ji-hui-translation-pronunciation-and-example-sentences/
季节	jì jié	kỳ tiết	gei3 jit3	[{"meaning": "season, period", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%ad%a3%e8%8a%82-ji-jie-translation-pronunciation-and-example-sentences/
检查	jiǎn chá	kiểm tra	gim2 chaak1	[{"meaning": "inspection", "part_of_speech": "noun"}, {"meaning": "to check, to inspect, to examine", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%a3%80%e6%9f%a5-jian-cha-translation-pronunciation-and-example-sentences/
简单	jiǎn dān	giản đơn	gaan2 daan1	[{"meaning": "simple, uncomplicated", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e7%ae%80%e5%8d%95-jian-dan-translation-pronunciation-and-example-sentences/
健康	jiàn kāng	cường tráng	gin6 hong1	[{"meaning": "health", "part_of_speech": "noun"}, {"meaning": "healthy", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%81%a5%e5%ba%b7-jian-kang-translation-pronunciation-and-example-sentences/
见面	jiàn miàn	kiến diện	gin3 min6	[{"meaning": "to meet, to see sb.", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%a7%81%e9%9d%a2-jian-mian-translation-pronunciation-and-example-sentences/
讲	jiǎng	giang	gong2	[{"meaning": "speech, lecture", "part_of_speech": "noun"}, {"meaning": "to speak, to explain, to negotiate", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%ae%b2-jiang-translation-pronunciation-and-example-sentences/
角	jiǎo	cước	gok3	[{"meaning": "angle, corner, horn", "part_of_speech": "noun"}, {"meaning": "for 0.1 yuan", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e8%a7%92-jiao-translation-pronunciation-and-example-sentences/
教	jiāo	giao	gaau3	[{"meaning": "to teach, to instruct", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%95%99-jiao-translation-pronunciation-and-example-sentences/
借	jiè	tá	ze3	[{"meaning": "to lend, to borrow, to make use of (an opportunity)", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%80%9f-jie-translation-pronunciation-and-example-sentences/
接	jiē	tập	zip3	[{"meaning": "to receive, to meet, to connect, to catch", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%8e%a5-jie-translation-pronunciation-and-example-sentences/
街道	jiē dào	gia đạo	gai1 dou6	[{"meaning": "street", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%a1%97%e9%81%93-jie-dao-translation-pronunciation-and-example-sentences/
结婚	jié hūn	kết hôn	git3 fan1	[{"meaning": "marriage, wedding", "part_of_speech": "noun"}, {"meaning": "to marry", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%bb%93%e5%a9%9a-jie-hun-translation-pronunciation-and-example-sentences/
解决	jiě jué	giải quyết	gai2 kyut3	[{"meaning": "to settle (dispute), to resolve, to solve", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%a7%a3%e5%86%b3-jie-jue-translation-pronunciation-and-example-sentences/
节目	jié mù	tiết mục	zit3 muk6	[{"meaning": "program, item", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%8a%82%e7%9b%ae-jie-mu-translation-pronunciation-and-example-sentences/
节日	jié rì	tiết ngày	zit3 jat6	[{"meaning": "holiday, festival", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%8a%82%e6%97%a5-jie-ri-translation-pronunciation-and-example-sentences/
结束	jié shù	kết thúc	jit3 suk6	[{"meaning": "termination, end", "part_of_speech": "noun"}, {"meaning": "to finish, to end, to conclude", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%bb%93%e6%9d%9f-jie-shu-translation-pronunciation-and-example-sentences/
经常	jīng cháng	kinh thường	ging1 soeng4	[{"meaning": "often, frequently", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e7%bb%8f%e5%b8%b8-jing-chang-translation-pronunciation-and-example-sentences/
经过	jīng guò	kinh qua	ging1 gwo3	[{"meaning": "to pass, to go through", "part_of_speech": "verb"}, {"meaning": "after, as a result of", "part_of_speech": "relative clause"}]	https://wohok.com/dict/%e7%bb%8f%e8%bf%87-jing-guo-translation-pronunciation-and-example-sentences/
经理	jīng lǐ	kinh lý	ging1 lei5	[{"meaning": "manager, director", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%bb%8f%e7%90%86-jing-li-translation-pronunciation-and-example-sentences/
旧	jiù	cựu	gau6	[{"meaning": "old, used, worn", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e6%97%a7-jiu-translation-pronunciation-and-example-sentences/
久	jiǔ	cửu	gau2	[{"meaning": "long (time)", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e4%b9%85-jiu-translation-pronunciation-and-example-sentences/
举行	jǔ xíng	lễ hành	geoi2 hang4	[{"meaning": "to hold (meeting, etc.)", "part_of_speech": "verb"}]	https://wohok.com/dict/%e4%b8%be%e8%a1%8c-ju-xing-translation-pronunciation-and-example-sentences/
句子	jù zi	câu tử	guk1 zi2	[{"meaning": "sentence", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%8f%a5%e5%ad%90-ju-zi-translation-pronunciation-and-example-sentences/
决定	jué dìng	quyết định	kyut3 ding6	[{"meaning": "decision", "part_of_speech": "noun"}, {"meaning": "to decide", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%86%b3%e5%ae%9a-jue-ding-translation-pronunciation-and-example-sentences/
刻	kè	khắc	hak1	[{"meaning": "to cut, to carve", "part_of_speech": "verb"}, {"meaning": "for quarter of an hour", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e5%88%bb-ke-translation-pronunciation-and-example-sentences/
渴	kě	khát	hot3	[{"meaning": "thirsty", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e6%b8%b4-ke-translation-pronunciation-and-example-sentences/
可爱	kě ài	khả ái	ho2 oi3	[{"meaning": "cute, lovely", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%8f%af%e7%88%b1-ke-ai-translation-pronunciation-and-example-sentences/
客人	kè rén	khách nhân	haak6 jan4	[{"meaning": "guest, customer, visitor", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%ae%a2%e4%ba%ba-ke-ren-translation-pronunciation-and-example-sentences/
空调	kōng tiáo	không điều	hung1 tiu4	[{"meaning": "air conditioning", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%a9%ba%e8%b0%83-kong-tiao-translation-pronunciation-and-example-sentences/
口	kǒu	 khẩu	hau2	[{"meaning": "mouth", "part_of_speech": "noun"}, {"meaning": "for things with mouths or a mouth full of", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e5%8f%a3-kou-translation-pronunciation-and-example-sentences/
哭	kū	khốc	huk1	[{"meaning": "to cry, to weep", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%93%ad-ku-translation-pronunciation-and-example-sentences/
裤子	kù zi	quần	bou3 zi2	[{"meaning": "trousers", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%a3%a4%e5%ad%90-ku-zi-translation-pronunciation-and-example-sentences/
筷子	kuài zi	quải tử	kwaai2 zi2	[{"meaning": "chopsticks", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%ad%b7%e5%ad%90-kuai-zi-translation-pronunciation-and-example-sentences/
蓝	lán	lam4	laam4	[{"meaning": "blue", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e8%93%9d-lan-translation-pronunciation-and-example-sentences/
老	lǎo	lão	lou5	[{"meaning": "old", "part_of_speech": "adjective"}, {"meaning": "always", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e8%80%81-lao-translation-pronunciation-and-example-sentences/
离开	lí kāi	ly khai	lai4 hoi1	[{"meaning": "to depart, to leave", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%a6%bb%e5%bc%80-li-kai-translation-pronunciation-and-example-sentences/
历史	lì shǐ	lịch sử	lik6 si6	[{"meaning": "history", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%8e%86%e5%8f%b2-li-shi-translation-pronunciation-and-example-sentences/
礼物	lǐ wù	lễ vật	lei5 mat6	[{"meaning": "gift, present", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%a4%bc%e7%89%a9-li-wu-translation-pronunciation-and-example-sentences/
脸	liǎn	liễn	lim5	[{"meaning": "face", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%84%b8-lian-translation-pronunciation-and-example-sentences/
练习	liàn xí	liễn tập	lin6 zaap6	[{"meaning": "exercise, practice", "part_of_speech": "noun"}, {"meaning": "to practice", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%bb%83%e4%b9%a0-lian-xi-translation-pronunciation-and-example-sentences/
辆	liàng	lượng	loeng6	[{"meaning": "for vehicles", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e8%be%86-liang-translation-pronunciation-and-example-sentences/
了解	liǎo jiě	liễu giải	liu5 gaai2	[{"meaning": "to understand", "part_of_speech": "verb"}]	https://wohok.com/dict/%e4%ba%86%e8%a7%a3-liao-jie-translation-pronunciation-and-example-sentences/
邻居	lín jū	lân cư	lun4 keoi1	[{"meaning": "neighbour", "part_of_speech": "noun"}]	https://wohok.com/dict/%e9%82%bb%e5%b1%85-lin-ju-translation-pronunciation-and-example-sentences/
楼	lóu	lâu	lau4	[{"meaning": "storied building", "part_of_speech": "noun"}, {"meaning": "for floor", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e6%a5%bc-lou-translation-pronunciation-and-example-sentences/
绿	lǜ	lục	luk6	[{"meaning": "green", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e7%bb%bf-lu-translation-pronunciation-and-example-sentences/
马	mǎ	mã	maa5	[{"meaning": "horse", "part_of_speech": "noun"}]	https://wohok.com/dict/%e9%a9%ac-ma-translation-pronunciation-and-example-sentences/
马上	mǎ shàng	mã thượng	maa5 soeng6	[{"meaning": "immediately, at once", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e9%a9%ac%e4%b8%8a-ma-shang-translation-pronunciation-and-example-sentences/
满意	mǎn yì	mãn ý	mun5 ji3	[{"meaning": "to satisfy", "part_of_speech": "verb"}, {"meaning": "satisfied", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e6%bb%a1%e6%84%8f-man-yi-translation-pronunciation-and-example-sentences/
帽子	mào zi	mạo tử	maau6 zi2	[{"meaning": "hat, cap", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%b8%bd%e5%ad%90-mao-zi-translation-pronunciation-and-example-sentences/
米	mǐ	mễ	mai5	[{"meaning": "rice", "part_of_speech": "noun"}, {"meaning": "for meter", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e7%b1%b3-mi-translation-pronunciation-and-example-sentences/
面包	miàn bāo	diện bao	 min6 baau1	[{"meaning": "bread", "part_of_speech": "noun"}]	https://wohok.com/dict/%e9%9d%a2%e5%8c%85-mian-bao-translation-pronunciation-and-example-sentences/
面条	miàn tiáo	diện điếu	min6 tiu4	[{"meaning": "noodles", "part_of_speech": "noun"}]	https://wohok.com/dict/%e9%9d%a2%e6%9d%a1-mian-tiao-translation-pronunciation-and-example-sentences/
明白	míng bai	minh bạch	meng4 baak6	[{"meaning": "to understand", "part_of_speech": "verb"}, {"meaning": "clear, obvious", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e6%98%8e%e7%99%bd-ming-bai-translation-pronunciation-and-example-sentences/
拿	ná	nhã	náah4	[{"meaning": "to hold, to seize", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%8b%bf-na-translation-pronunciation-and-example-sentences/
奶奶	nǎi nai	nại nại	nai5 nai5	[{"meaning": "grandmother (father’s mother)", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%a5%b6%e5%a5%b6-nai-nai-translation-pronunciation-and-example-sentences/
南	nán	nam	nam4	[{"meaning": "south", "part_of_speech": "location"}]	https://wohok.com/dict/%e5%8d%97-nan-translation-pronunciation-and-example-sentences/
难	nán	nan	nan4	[{"meaning": "difficult", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e9%9a%be-nan-translation-pronunciation-and-example-sentences/
难过	nán guò	nan khốc	nan4 huk1	[{"meaning": "to feel sorry, sad", "part_of_speech": "verb"}]	https://wohok.com/dict/%e9%9a%be%e8%bf%87-nan-guo-translation-pronunciation-and-example-sentences/
年级	nián jí	niên cấp	nin4 gap1	[{"meaning": "grade, year", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%b9%b4%e7%ba%a7-nian-ji-translation-pronunciation-and-example-sentences/
年轻	nián qīng	niên kinh	nin4 hing1	[{"meaning": "young", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%b9%b4%e8%bd%bb-nian-qing-translation-pronunciation-and-example-sentences/
鸟	niǎo	diểu	niu5	[{"meaning": "bird", "part_of_speech": "noun"}]	https://wohok.com/dict/%e9%b8%9f-niao-translation-pronunciation-and-example-sentences/
努力	nǔ lì	nỗ lực	no6 lik6	[{"meaning": "great effort", "part_of_speech": "noun"}, {"meaning": "to strive, to work/study hard", "part_of_speech": "verb"}, {"meaning": "hard, hardworking", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%8a%aa%e5%8a%9b-nu-li-translation-pronunciation-and-example-sentences/
爬山	pá shān	bà sơn	paa4 saan1	[{"meaning": "hiking", "part_of_speech": "noun"}, {"meaning": "to climb a mountain", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%88%ac%e5%b1%b1-pa-shan-translation-pronunciation-and-example-sentences/
盘子	pán zi	phiến tử	paan4 zi2	[{"meaning": "tray, plate, dish", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%9b%98%e5%ad%90-pan-zi-translation-pronunciation-and-example-sentences/
胖	pàng	bạnh	paang5	[{"meaning": "fat, plump", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e8%83%96-pang-translation-pronunciation-and-example-sentences/
啤酒	pí jiǔ	bia	pei1 zau2	[{"meaning": "beer", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%95%a4%e9%85%92-pi-jiu-translation-pronunciation-and-example-sentences/
葡萄	pú tao	phong thảo	pou4 tou4	[{"meaning": "grape", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%91%a1%e8%90%84-pu-tao-translation-pronunciation-and-example-sentences/
普通话	pǔ tōng huà	bình thường thoại	pou2 tung1 waa6	[{"meaning": "Mandarin", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%99%ae%e9%80%9a%e8%af%9d-pu-tong-hua-translation-pronunciation-and-example-sentences/
骑	qí	khí	kei4	[{"meaning": "to ride (animal or bike)", "part_of_speech": "verb"}]	https://wohok.com/dict/%e9%aa%91-qi-translation-pronunciation-and-example-sentences/
奇怪	qí guài	kỳ quái	kei4 gwaai3	[{"meaning": "strange, weird", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%a5%87%e6%80%aa-qi-guai-translation-pronunciation-and-example-sentences/
其实	qí shí	kỳ thự	kèi4 sat6	[{"meaning": "actually, in fact", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e5%85%b6%e5%ae%9e-qi-shi-translation-pronunciation-and-example-sentences/
其他	qí tā	khác thứ	kei4 ta1	[{"meaning": "other, others", "part_of_speech": "pronoun"}]	https://wohok.com/dict/%e5%85%b6%e4%bb%96-qi-ta-translation-pronunciation-and-example-sentences/
铅笔	qiān bǐ	thiêm bút	jin1 bat1	[{"meaning": "pencil", "part_of_speech": "noun"}]	https://wohok.com/dict/%e9%93%85%e7%ac%94-qian-bi-translation-pronunciation-and-example-sentences/
清楚	qīng chu	thanh rõ	cing1 co2	[{"meaning": "clear, distinct", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e6%b8%85%e6%a5%9a-qing-chu-translation-pronunciation-and-example-sentences/
秋	qiū	thu	cau1	[{"meaning": "autumn, fall", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%a7%8b-qiu-translation-pronunciation-and-example-sentences/
裙子	qún zi	côn tử	kwan4 zi2	[{"meaning": "skirt", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%a3%99%e5%ad%90-qun-zi-translation-pronunciation-and-example-sentences/
然后	rán hòu	nhãn hạ	jin4 hau6	[{"meaning": "then, afterwards", "part_of_speech": "conjunction"}]	https://wohok.com/dict/%e7%84%b6%e5%90%8e-ran-hou-translation-pronunciation-and-example-sentences/
热情	rè qíng	nhiệt tình	jit6 tinh4	[{"meaning": "enthusiasm, passion", "part_of_speech": "noun"}, {"meaning": "enthusiastic, passionate, cordial", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e7%83%ad%e6%83%85-re-qing-translation-pronunciation-and-example-sentences/
认为	rèn wéi	nhận vi	 jin6 wai4	[{"meaning": "to think, to believe, to consider", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%ae%a4%e4%b8%ba-ren-wei-translation-pronunciation-and-example-sentences/
认真	rèn zhēn	nhận chân	 jin6 jan1	[{"meaning": "conscientious, earnest, serious", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e8%ae%a4%e7%9c%9f-ren-zhen-translation-pronunciation-and-example-sentences/
容易	róng yì	dung dị	 jung4 ji6	[{"meaning": "easy", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e5%ae%b9%e6%98%93-rong-yi-translation-pronunciation-and-example-sentences/
如果	rú guǒ	nhược khảo	 jyu4 gwo2	[{"meaning": "if", "part_of_speech": "conjunction"}]	https://wohok.com/dict/%e5%a6%82%e6%9e%9c-ru-guo-translation-pronunciation-and-example-sentences/
伞	sǎn	tán	san3	[{"meaning": "umbrella", "part_of_speech": "noun"}]	https://wohok.com/dict/%e4%bc%9e-san-translation-pronunciation-and-example-sentences/
上网	shàng wǎng	thượng mạng	soeng6 mong5	[{"meaning": "to be on the internet", "part_of_speech": "verb"}]	https://wohok.com/dict/%e4%b8%8a%e7%bd%91-shang-wang-translation-pronunciation-and-example-sentences/
生气	shēng qì	 sinh khí	 sang1 hei3	[{"meaning": "to be/get angry", "part_of_speech": "verb"}, {"meaning": "angry, mad", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e7%94%9f%e6%b0%94-sheng-qi-translation-pronunciation-and-example-sentences/
声音	shēng yīn	 thanh âm	 sing1 jam1	[{"meaning": "voice, sound", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%a3%b0%e9%9f%b3-sheng-yin-translation-pronunciation-and-example-sentences/
使	shǐ	 sứ	 si2	[{"meaning": "envoy, messenger", "part_of_speech": "noun"}, {"meaning": "to make, to cause, to use, to employ", "part_of_speech": "verb"}]	https://wohok.com/dict/%e4%bd%bf-shi-translation-pronunciation-and-example-sentences/
世界	shì jiè	 thế giới	 sai3 gaai3	[{"meaning": "world", "part_of_speech": "noun"}]	https://wohok.com/dict/%e4%b8%96%e7%95%8c-shi-jie-translation-pronunciation-and-example-sentences/
瘦	shòu	 sấu	 sau3	[{"meaning": "thin, slim", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e7%98%a6-shou-translation-pronunciation-and-example-sentences/
树	shù	 thụ	 syu6	[{"meaning": "tree", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%a0%91-shu-translation-pronunciation-and-example-sentences/
舒服	shū fu	 thư phục	 syu1 fuk6	[{"meaning": "comfortable", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e8%88%92%e6%9c%8d-shu-fu-translation-pronunciation-and-example-sentences/
叔叔	shū shu	 thúc thúc	 suk1 suk1	[{"meaning": "uncle", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%8f%94%e5%8f%94-shu-shu-translation-pronunciation-and-example-sentences/
数学	shù xué	 sổ học	 sou3 hok6	[{"meaning": "mathematics", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%95%b0%e5%ad%a6-shu-xue-translation-pronunciation-and-example-sentences/
刷牙	shuā yá	 soát nha	 saat3 ngaa4	[{"meaning": "to brush teeth", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%88%b7%e7%89%99-shua-ya-translation-pronunciation-and-example-sentences/
双	shuāng	 song	 soeng1	[{"meaning": "two, pair, both", "part_of_speech": "adjective"}, {"meaning": "for a pair (of shoes, etc.)", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e5%8f%8c-shuang-translation-pronunciation-and-example-sentences/
水平	shuǐ píng	 thuỷ bình	 seoi2 ping4	[{"meaning": "level, standard", "part_of_speech": "noun"}, {"meaning": "horizontal", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e6%b0%b4%e5%b9%b3-shui-ping-translation-pronunciation-and-example-sentences/
司机	sī jī	 tức cơ	 si1 gei1	[{"meaning": "driver", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%8f%b8%e6%9c%ba-si-ji-translation-pronunciation-and-example-sentences/
虽然	suī rán	 tuy nhiên	 seoi1 jin4	[{"meaning": "although", "part_of_speech": "conjunction"}]	https://wohok.com/dict/%e8%99%bd%e7%84%b6-sui-ran-translation-pronunciation-and-example-sentences/
太阳	tài yáng	 thái dương	 taai3 joeng4	[{"meaning": "sun", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%a4%aa%e9%98%b3-tai-yang-translation-pronunciation-and-example-sentences/
糖	táng	 đường	 tong4	[{"meaning": "sugar, sweets, candy", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%b3%96-tang-translation-pronunciation-and-example-sentences/
特别	tè bié	 đặc biệt	 dak6 bit6	[{"meaning": "special, particular", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e7%89%b9%e5%88%ab-te-bie-translation-pronunciation-and-example-sentences/
疼	téng	 đau	 tang4	[{"meaning": "pain", "part_of_speech": "noun"}, {"meaning": "to ache, to hurt", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%96%bc-teng-translation-pronunciation-and-example-sentences/
提高	tí gāo	 đề cao	 tai4 gou1	[{"meaning": "to raise, to increase", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%8f%90%e9%ab%98-ti-gao-translation-pronunciation-and-example-sentences/
体育	tǐ yù	 thể dục	 tai2 juk6	[{"meaning": "sports", "part_of_speech": "noun"}]	https://wohok.com/dict/%e4%bd%93%e8%82%b2-ti-yu-translation-pronunciation-and-example-sentences/
甜	tián	 ngọt	 tim4	[{"meaning": "sweet", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e7%94%9c-tian-translation-pronunciation-and-example-sentences/
条	tiáo	 điều	 tiu4	[{"meaning": "strip, clause", "part_of_speech": "noun"}, {"meaning": "for long thin things", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e6%9d%a1-tiao-translation-pronunciation-and-example-sentences/
同事	tóng shì	 đồng sự	 tung4 si6	[{"meaning": "colleague", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%90%8c%e4%ba%8b-tong-shi-translation-pronunciation-and-example-sentences/
同意	tóng yì	 đồng ý	 tung4 ji3	[{"meaning": "to agree, to consent, to approve", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%90%8c%e6%84%8f-tong-yi-translation-pronunciation-and-example-sentences/
头发	tóu fa	 đầu phát	 tau4 faat3	[{"meaning": "hair (on the head)", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%a4%b4%e5%8f%91-tou-fa-translation-pronunciation-and-example-sentences/
突然	tū rán	 đột nhiên	 dat6 nam4	[{"meaning": "sudden, abrupt", "part_of_speech": "adjective"}, {"meaning": "suddenly, unexpectedly", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e7%aa%81%e7%84%b6-tu-ran-translation-pronunciation-and-example-sentences/
图书馆	tú shū guǎn	 đồ thư quán	 tou4 syu1 gun2	[{"meaning": "library", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%9b%be%e4%b9%a6%e9%a6%86-tu-shu-guan-translation-pronunciation-and-example-sentences/
腿	tuǐ	 thối	 tui2	[{"meaning": "leg", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%85%bf-tui-translation-pronunciation-and-example-sentences/
万	wàn	 vạn	 maan6	[{"meaning": "10000", "part_of_speech": "number"}]	https://wohok.com/dict/%e4%b8%87-wan-translation-pronunciation-and-example-sentences/
碗	wǎn	 hoàn	 wan2	[{"meaning": "bowl", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%a2%97-wan-translation-pronunciation-and-example-sentences/
完成	wán chéng	 hoàn thành	 wan4 cin4	[{"meaning": "to complete, to accomplish", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%ae%8c%e6%88%90-wan-cheng-translation-pronunciation-and-example-sentences/
忘记	wàng jì	 vong kí	 mong6 gei3	[{"meaning": "to forget", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%bf%98%e8%ae%b0-wang-ji-translation-pronunciation-and-example-sentences/
为	wèi	 vi	 wai4	[{"meaning": "to do, to act, to be, to become", "part_of_speech": "verb"}, {"meaning": "for (sb.)", "part_of_speech": "relative clause"}]	https://wohok.com/dict/%e4%b8%ba-wei-wei-translation-pronunciation-and-example-sentences/
位	wèi	 vị	 wai6	[{"meaning": "position, place, seat", "part_of_speech": "noun"}, {"meaning": "for people", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e4%bd%8d-wei-translation-pronunciation-and-example-sentences/
为了	wèi le	 vì ly	 wai4 liu5	[{"meaning": "for, in order to", "part_of_speech": "relative clause"}]	https://wohok.com/dict/%e4%b8%ba%e4%ba%86-wei-le-translation-pronunciation-and-example-sentences/
文化	wén huà	 văn hóa	 man4 faa3	[{"meaning": "culture", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%96%87%e5%8c%96-wen-hua-translation-pronunciation-and-example-sentences/
西	xī	 tây	 sai1	[{"meaning": "west", "part_of_speech": "location"}]	https://wohok.com/dict/%e8%a5%bf-xi-translation-pronunciation-and-example-sentences/
习惯	xí guàn	 tập quán	 jap6 gun2	[{"meaning": "habit, usual practice, custom", "part_of_speech": "noun"}, {"meaning": "to be/get used to", "part_of_speech": "verb"}]	https://wohok.com/dict/%e4%b9%a0%e6%83%af-xi-guan-translation-pronunciation-and-example-sentences/
洗手间	xǐ shǒu jiān	 tẩy thủ gian	 sai2 sau2 gaan1	[{"meaning": "toilet, bathroom", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%b4%97%e6%89%8b%e9%97%b4-xi-shou-jian-translation-pronunciation-and-example-sentences/
洗澡	xǐ zǎo	 tẩy tạo	 sai2 zou6	[{"meaning": "to take a shower, to have a bath", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%b4%97%e6%be%a1-xi-zao-translation-pronunciation-and-example-sentences/
夏	xià	 hạ	 haa6	[{"meaning": "summer", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%a4%8f-xia-translation-pronunciation-and-example-sentences/
先	xiān	 tiên	 sin1	[{"meaning": "early, former, first, before", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e5%85%88-xian-translation-pronunciation-and-example-sentences/
像	xiàng	 tượng	 zoeng6	[{"meaning": "be/look like, to appear, to seem", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%83%8f-xiang-translation-pronunciation-and-example-sentences/
香蕉	xiāng jiāo	 hương điều	 hoeng1 diu6	[{"meaning": "banana", "part_of_speech": "noun"}]	https://wohok.com/dict/%e9%a6%99%e8%95%89-xiang-jiao-translation-pronunciation-and-example-sentences/
相同	xiāng tóng	 tương đồng	 soeng1 tung4	[{"meaning": "identical, same", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e7%9b%b8%e5%90%8c-xiang-tong-translation-pronunciation-and-example-sentences/
相信	xiāng xìn	 tương tín	 soeng1 seon3	[{"meaning": "to believe in, have faith in", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%9b%b8%e4%bf%a1-xiang-xin-translation-pronunciation-and-example-sentences/
小心	xiǎo xīn	 tiểu tâm	 siu2 sam1	[{"meaning": "to be careful", "part_of_speech": "verb"}, {"meaning": "careful", "part_of_speech": "adjective"}, {"meaning": "Take care!", "part_of_speech": "expression"}]	https://wohok.com/dict/%e5%b0%8f%e5%bf%83-xiao-xin-translation-pronunciation-and-example-sentences/
校长	xiào zhǎng	 hiệu trưởng	 haau6 zoeng2	[{"meaning": "headmaster, president (university)", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%a0%a1%e9%95%bf-xiao-zhang-translation-pronunciation-and-example-sentences/
鞋	xié	 giày	 haai4	[{"meaning": "shoe", "part_of_speech": "noun"}]	https://wohok.com/dict/%e9%9e%8b-xie-translation-pronunciation-and-example-sentences/
信	xìn	 tín	 seon3	[{"meaning": "letter, trust", "part_of_speech": "noun"}, {"meaning": "to believe, to trust", "part_of_speech": "verb"}]	https://wohok.com/dict/%e4%bf%a1-xin-translation-pronunciation-and-example-sentences/
新闻	xīn wén	 tin vấn	 san1 man4	[{"meaning": "news", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%96%b0%e9%97%bb-xin-wen-translation-pronunciation-and-example-sentences/
新鲜	xīn xiān	 tân tiên	 san1 sin1	[{"meaning": "fresh (food, experience, etc.)", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e6%96%b0%e9%b2%9c-xin-xian-translation-pronunciation-and-example-sentences/
行李箱	xíng li xiāng	 hành ly hư	 haang4 lei5 soeng1	[{"meaning": "suitcase", "part_of_speech": "noun"}]	https://wohok.com/dict/%e8%a1%8c%e6%9d%8e%e7%ae%b1-xing-li-xiang-translation-pronunciation-and-example-sentences/
兴趣	xìng qù	 hưng thú	 hing1 ceoi3	[{"meaning": "interest", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%85%b4%e8%b6%a3-xing-qu-translation-pronunciation-and-example-sentences/
熊猫	xióng māo	 hùng mao	 hung4 maau1	[{"meaning": "panda", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%86%8a%e7%8c%ab-xiong-mao-translation-pronunciation-and-example-sentences/
需要	xū yào	 nhu cầu	 seoi1 jiu3	[{"meaning": "needs", "part_of_speech": "noun"}, {"meaning": "to need, to want", "part_of_speech": "verb"}]	https://wohok.com/dict/%e9%9c%80%e8%a6%81-xu-yao-translation-pronunciation-and-example-sentences/
选择	xuǎn zé	 tuyển trọng	 zeon2 zoek3	[{"meaning": "choice, option", "part_of_speech": "noun"}, {"meaning": "to choose, to select", "part_of_speech": "verb"}]	https://wohok.com/dict/%e9%80%89%e6%8b%a9-xuan-ze-translation-pronunciation-and-example-sentences/
眼镜	yǎn jìng	 nhãn kính	 ngaan5 geng1	[{"meaning": "eyeglasses", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%9c%bc%e9%95%9c-yan-jing-translation-pronunciation-and-example-sentences/
要求	yāo qiú	 yêu cầu	 ji4 kau4	[{"meaning": "demand, requirement", "part_of_speech": "noun"}, {"meaning": "to require, to demand", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%a6%81%e6%b1%82-yao-qiu-translation-pronunciation-and-example-sentences/
爷爷	yé ye	 ông nội	 je4 je4	[{"meaning": "grandfather (father’s father)", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%88%b7%e7%88%b7-ye-ye-translation-pronunciation-and-example-sentences/
一般	yì bān	 nhất ban	 jat1 baan1	[{"meaning": "ordinary, general, common", "part_of_speech": "adjective"}, {"meaning": "in general, generally", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e4%b8%80%e8%88%ac-yi-ban-translation-pronunciation-and-example-sentences/
一边	yì biān	 nhất biên	 jat1 bin1	[{"meaning": "one side", "part_of_speech": "location"}, {"meaning": "on the one hand", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e4%b8%80%e8%be%b9-yi-bian-translation-pronunciation-and-example-sentences/
一定	yí dìng	 nhất định	 jat1 ding6	[{"meaning": "definite, fixed, given", "part_of_speech": "adjective"}, {"meaning": "surely, certainly", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e4%b8%80%e5%ae%9a-yi-ding-translation-pronunciation-and-example-sentences/
一共	yí gòng	 nhất cùng	 jat1 gung6	[{"meaning": "althogether", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e4%b8%80%e5%85%b1-yi-gong-translation-pronunciation-and-example-sentences/
以后	yǐ hòu	 dĩ hậu	 ji5 hau6	[{"meaning": "after, afterwards", "part_of_speech": "time"}]	https://wohok.com/dict/%e4%bb%a5%e5%90%8e-yi-hou-translation-pronunciation-and-example-sentences/
一会儿	yí huì r	 nhất hội nhĩ	 jat1 wui6 ji5	[{"meaning": "a while", "part_of_speech": "time"}, {"meaning": "in a moment, a little while", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e4%b8%80%e4%bc%9a%e5%84%bf-yi-hui-er-translation-pronunciation-and-example-sentences/
以前	yǐ qián	 dĩ tiền	 ji5 cin4	[{"meaning": "before", "part_of_speech": "time"}, {"meaning": "previous, formerly", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e4%bb%a5%e5%89%8d-yi-qian-translation-pronunciation-and-example-sentences/
以为	yǐ wéi	 dĩ vị	 ji5 wai4	[{"meaning": "to think (wrongly), to be under the (wrong) impression", "part_of_speech": "verb"}]	https://wohok.com/dict/%e4%bb%a5%e4%b8%ba-yi-wei-translation-pronunciation-and-example-sentences/
一样	yí yàng	 nhất dạng	 jat1 joeng6	[{"meaning": "alike, equal to", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e4%b8%80%e6%a0%b7-yi-yang-translation-pronunciation-and-example-sentences/
一直	yī zhí	 nhất trực	 jat1 zik6	[{"meaning": "always, continuously, straight", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e4%b8%80%e7%9b%b4-yi-zhi-translation-pronunciation-and-example-sentences/
银行	yín háng	 ngân hàng	 ngan4 hong4	[{"meaning": "bank (for money)", "part_of_speech": "noun"}]	https://wohok.com/dict/%e9%93%b6%e8%a1%8c-yin-hang-translation-pronunciation-and-example-sentences/
音乐	yīn yuè	 âm nhạc	 jam1 ngok6	[{"meaning": "music", "part_of_speech": "noun"}]	https://wohok.com/dict/%e9%9f%b3%e4%b9%90-yin-yue-translation-pronunciation-and-example-sentences/
应该	yīng gāi	 ứng cận	 jing1 hoi6	[{"meaning": "should, ought to", "part_of_speech": "auxiliary verb"}]	https://wohok.com/dict/%e5%ba%94%e8%af%a5-ying-gai-translation-pronunciation-and-example-sentences/
影响	yǐng xiǎng	 ảnh hưởng	 jing2 hyung2	[{"meaning": "influence, effect", "part_of_speech": "noun"}, {"meaning": "to influence, to affect", "part_of_speech": "verb"}]	https://wohok.com/dict/%e5%bd%b1%e5%93%8d-ying-xiang-translation-pronunciation-and-example-sentences/
用	yòng	 dụng	 jung6	[{"meaning": "to use, to employ, to apply", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%94%a8-yong-translation-pronunciation-and-example-sentences/
又	yòu	 hữu	 jau6	[{"meaning": "again", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e5%8f%88-you-translation-pronunciation-and-example-sentences/
有名	yǒu míng	 hữu danh	 jau5 ming4	[{"meaning": "famous, well known", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e6%9c%89%e5%90%8d-you-ming-translation-pronunciation-and-example-sentences/
游戏	yóu xì	 du hí	 jau4 jik6	[{"meaning": "game, play", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%b8%b8%e6%88%8f-you-xi-translation-pronunciation-and-example-sentences/
遇到	yù dào	 ngộ đáo	 jyu6 dou3	[{"meaning": "to meet, to run into", "part_of_speech": "verb"}]	https://wohok.com/dict/%e9%81%87%e5%88%b0-yu-dao-translation-pronunciation-and-example-sentences/
愿意	yuàn yì	 nguyện ý	 jyun6 ji3	[{"meaning": "to be willing, be ready, to wish, to want", "part_of_speech": "auxiliary verb"}]	https://wohok.com/dict/%e6%84%bf%e6%84%8f-yuan-yi-translation-pronunciation-and-example-sentences/
越	yuè	 dưới	 jyut6	[{"meaning": "to exceed, to climb over, to surpass", "part_of_speech": "verb"}]	https://wohok.com/dict/%e8%b6%8a-yue-translation-pronunciation-and-example-sentences/
月亮	yuè liang	 nguyệt lượng	 jyut6 loeng6	[{"meaning": "moon", "part_of_speech": "noun"}]	https://wohok.com/dict/%e6%9c%88%e4%ba%ae-yue-liang-translation-pronunciation-and-example-sentences/
站	zhàn	 trạm	 zaam6	[{"meaning": "station, stop", "part_of_speech": "noun"}, {"meaning": "to stand, to stop, to halt", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%ab%99-zhan-translation-pronunciation-and-example-sentences/
长	zhǎng	 trường	 zoeng4	[{"meaning": "chief, head", "part_of_speech": "noun"}, {"meaning": "to grow, to develop", "part_of_speech": "verb"}]	https://wohok.com/dict/%e9%95%bf-chang-zhang-translation-pronunciation-and-example-sentences/
照顾	zhào gù	 chiếu cố	 ziu3 gu3	[{"meaning": "to take care of, to look after", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%85%a7%e9%a1%be-zhao-gu-translation-pronunciation-and-example-sentences/
着急	zháo jí	 trước cấp	 zoek3 gap1	[{"meaning": "to worry, to be nervous", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%9d%80%e6%80%a5-zhao-ji-translation-pronunciation-and-example-sentences/
照片	zhào piàn	 chiếu bản	 ziu3 pin3	[{"meaning": "photo, picture", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%85%a7%e7%89%87-zhao-pian-translation-pronunciation-and-example-sentences/
照相机	zhào xiàng jī	 chiếu tượng cơ	 ziu3 zoeng6 gei1	[{"meaning": "camera", "part_of_speech": "noun"}]	https://wohok.com/dict/%e7%85%a7%e7%9b%b8%e6%9c%ba-zhao-xiang-ji-translation-pronunciation-and-example-sentences/
只	zhǐ	 chỉ	 zi2	[{"meaning": "only, just, merely", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e5%8f%aa-zhi-zhi-translation-pronunciation-and-example-sentences/
种	zhǒng	 chủng	 zung2	[{"meaning": "species, race, breed", "part_of_speech": "noun"}, {"meaning": "type, kind, sort or for languages", "part_of_speech": "measure word"}]	https://wohok.com/dict/%e7%a7%8d-zhong-zhong-translation-pronunciation-and-example-sentences/
中间	zhōng jiān	 trung gian	 zung1 gaan1	[{"meaning": "between, in the middle, mid", "part_of_speech": "location"}]	https://wohok.com/dict/%e4%b8%ad%e9%97%b4-zhong-jian-translation-pronunciation-and-example-sentences/
重要	zhòng yào	 trọng yếu	 zung6 jiu6	[{"meaning": "important", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e9%87%8d%e8%a6%81-zhong-yao-translation-pronunciation-and-example-sentences/
终于	zhōng yú	 chung ư	 zung1 jyu4	[{"meaning": "at last, finally, eventually", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e7%bb%88%e4%ba%8e-zhong-yu-translation-pronunciation-and-example-sentences/
周末	zhōu mò	 chuỗi mạt	 zau1 mut6	[{"meaning": "weekend", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%91%a8%e6%9c%ab-zhou-mo-translation-pronunciation-and-example-sentences/
祝	zhù	 chúc	 zuk1	[{"meaning": "to wish, to express good wishes", "part_of_speech": "verb"}]	https://wohok.com/dict/%e7%a5%9d-zhu-translation-pronunciation-and-example-sentences/
主要	zhǔ yào	 chủ yếu	 zyu2 jiu6	[{"meaning": "main, principal, major", "part_of_speech": "adjective"}]	https://wohok.com/dict/%e4%b8%bb%e8%a6%81-zhu-yao-translation-pronunciation-and-example-sentences/
注意	zhù yì	 chú ý	 zyu3 zi6	[{"meaning": "to pay attention to", "part_of_speech": "verb"}]	https://wohok.com/dict/%e6%b3%a8%e6%84%8f-zhu-yi-translation-pronunciation-and-example-sentences/
字典	zì diǎn	 tự điển	 zi6 din2	[{"meaning": "dictionary, character book", "part_of_speech": "noun"}]	https://wohok.com/dict/%e5%ad%97%e5%85%b8-zi-dian-translation-pronunciation-and-example-sentences/
自己	zì jǐ	 tự kỷ	 zi6 gei2	[{"meaning": "oneself, self", "part_of_speech": "pronoun"}]	https://wohok.com/dict/%e8%87%aa%e5%b7%b1-zi-ji-translation-pronunciation-and-example-sentences/
总是	zǒng shì	 tông thị	 zung2 si6	[{"meaning": "always", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e6%80%bb%e6%98%af-zong-shi-translation-pronunciation-and-example-sentences/
最近	zuì jìn	 tối cận	 zeoi3 gan6	[{"meaning": "recently, lately, soon", "part_of_speech": "adverb"}]	https://wohok.com/dict/%e6%9c%80%e8%bf%91-zui-jin-translation-pronunciation-and-example-sentences/
作业	zuò yè	 tác nghiệp	 zok3 jip6	[{"meaning": "homework, task, work", "part_of_speech": "noun"}]	https://wohok.com/dict/%e4%bd%9c%e4%b8%9a-zuo-ye-translation-pronunciation-and-example-sentences/
作用	zuò yòng	 tác dụng	 zok3 jung6	[{"meaning": "action, function, impact, effect", "part_of_speech": "noun"}, {"meaning": "to affect", "part_of_speech": "verb"}]	https://wohok.com/dict/%e4%bd%9c%e7%94%a8-zuo-yong-translation-pronunciation-and-example-sentences/
\.


--
-- Data for Name: broadcasts; Type: TABLE DATA; Schema: realtime; Owner: supabase_realtime_admin
--

COPY realtime.broadcasts (id, channel_id, inserted_at, updated_at) FROM stdin;
\.


--
-- Data for Name: channels; Type: TABLE DATA; Schema: realtime; Owner: supabase_realtime_admin
--

COPY realtime.channels (id, name, inserted_at, updated_at) FROM stdin;
\.


--
-- Data for Name: presences; Type: TABLE DATA; Schema: realtime; Owner: supabase_realtime_admin
--

COPY realtime.presences (id, channel_id, inserted_at, updated_at) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.schema_migrations (version, inserted_at) FROM stdin;
20211116024918	2024-05-04 12:58:35
20211116045059	2024-05-04 12:58:35
20211116050929	2024-05-04 12:58:35
20211116051442	2024-05-04 12:58:35
20211116212300	2024-05-04 12:58:35
20211116213355	2024-05-04 12:58:35
20211116213934	2024-05-04 12:58:35
20211116214523	2024-05-04 12:58:35
20211122062447	2024-05-04 12:58:35
20211124070109	2024-05-04 12:58:35
20211202204204	2024-05-04 12:58:35
20211202204605	2024-05-04 12:58:35
20211210212804	2024-05-04 12:58:35
20211228014915	2024-05-04 12:58:35
20220107221237	2024-05-04 12:58:35
20220228202821	2024-05-04 12:58:35
20220312004840	2024-05-04 12:58:35
20220603231003	2024-05-04 12:58:35
20220603232444	2024-05-04 12:58:36
20220615214548	2024-05-04 12:58:36
20220712093339	2024-05-04 12:58:36
20220908172859	2024-05-04 12:58:36
20220916233421	2024-05-04 12:58:36
20230119133233	2024-05-04 12:58:36
20230128025114	2024-05-04 12:58:36
20230128025212	2024-05-04 12:58:36
20230227211149	2024-05-04 12:58:36
20230228184745	2024-05-04 12:58:36
20230308225145	2024-05-04 12:58:36
20230328144023	2024-05-04 12:58:36
20231018144023	2024-05-04 12:58:36
20231204144023	2024-05-04 12:58:36
20231204144024	2024-05-04 12:58:36
20231204144025	2024-05-04 12:58:36
20240108234812	2024-05-04 12:58:36
20240109165339	2024-05-04 12:58:36
20240227174441	2024-05-04 12:58:36
20240311171622	2024-05-04 12:58:36
20240321100241	2024-05-04 12:58:36
20240401105812	2024-05-04 12:58:36
20240418121054	2024-05-04 12:58:36
\.


--
-- Data for Name: subscription; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.subscription (id, subscription_id, entity, filters, claims, created_at) FROM stdin;
\.


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets (id, name, owner, created_at, updated_at, public, avif_autodetection, file_size_limit, allowed_mime_types, owner_id) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.migrations (id, name, hash, executed_at) FROM stdin;
0	create-migrations-table	e18db593bcde2aca2a408c4d1100f6abba2195df	2024-05-03 23:45:45.767834
1	initialmigration	6ab16121fbaa08bbd11b712d05f358f9b555d777	2024-05-03 23:45:45.822968
2	storage-schema	5c7968fd083fcea04050c1b7f6253c9771b99011	2024-05-03 23:45:45.874895
3	pathtoken-column	2cb1b0004b817b29d5b0a971af16bafeede4b70d	2024-05-03 23:45:45.943041
4	add-migrations-rls	427c5b63fe1c5937495d9c635c263ee7a5905058	2024-05-03 23:45:46.012718
5	add-size-functions	79e081a1455b63666c1294a440f8ad4b1e6a7f84	2024-05-03 23:45:46.066977
6	change-column-name-in-get-size	f93f62afdf6613ee5e7e815b30d02dc990201044	2024-05-03 23:45:46.122752
7	add-rls-to-buckets	e7e7f86adbc51049f341dfe8d30256c1abca17aa	2024-05-03 23:45:46.178802
8	add-public-to-buckets	fd670db39ed65f9d08b01db09d6202503ca2bab3	2024-05-03 23:45:46.234576
9	fix-search-function	3a0af29f42e35a4d101c259ed955b67e1bee6825	2024-05-03 23:45:46.286861
10	search-files-search-function	68dc14822daad0ffac3746a502234f486182ef6e	2024-05-03 23:45:46.342942
11	add-trigger-to-auto-update-updated_at-column	7425bdb14366d1739fa8a18c83100636d74dcaa2	2024-05-03 23:45:46.398591
12	add-automatic-avif-detection-flag	8e92e1266eb29518b6a4c5313ab8f29dd0d08df9	2024-05-03 23:45:46.454847
13	add-bucket-custom-limits	cce962054138135cd9a8c4bcd531598684b25e7d	2024-05-03 23:45:46.510902
14	use-bytes-for-max-size	941c41b346f9802b411f06f30e972ad4744dad27	2024-05-03 23:45:46.567002
15	add-can-insert-object-function	934146bc38ead475f4ef4b555c524ee5d66799e5	2024-05-03 23:45:46.639184
16	add-version	76debf38d3fd07dcfc747ca49096457d95b1221b	2024-05-03 23:45:46.695094
17	drop-owner-foreign-key	f1cbb288f1b7a4c1eb8c38504b80ae2a0153d101	2024-05-03 23:45:46.750859
18	add_owner_id_column_deprecate_owner	e7a511b379110b08e2f214be852c35414749fe66	2024-05-03 23:45:46.807642
19	alter-default-value-objects-id	02e5e22a78626187e00d173dc45f58fa66a4f043	2024-05-03 23:45:46.863203
20	list-objects-with-delimiter	cd694ae708e51ba82bf012bba00caf4f3b6393b7	2024-05-03 23:45:46.874807
21	s3-multipart-uploads	8c804d4a566c40cd1e4cc5b3725a664a9303657f	2024-05-03 23:45:46.934842
22	s3-multipart-uploads-big-ints	9737dc258d2397953c9953d9b86920b8be0cdb73	2024-05-03 23:45:47.011207
23	optimize-search-function	9d7e604cddc4b56a5422dc68c9313f4a1b6f132c	2024-05-03 23:45:47.084267
\.


--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.objects (id, bucket_id, name, owner, created_at, updated_at, last_accessed_at, metadata, version, owner_id) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads (id, in_progress_size, upload_signature, bucket_id, key, version, owner_id, created_at) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads_parts (id, upload_id, size, part_number, bucket_id, key, etag, owner_id, version, created_at) FROM stdin;
\.


--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--

COPY vault.secrets (id, name, description, secret, key_id, nonce, created_at, updated_at) FROM stdin;
\.


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 1, false);


--
-- Name: key_key_id_seq; Type: SEQUENCE SET; Schema: pgsodium; Owner: supabase_admin
--

SELECT pg_catalog.setval('pgsodium.key_key_id_seq', 1, false);


--
-- Name: broadcasts_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: supabase_realtime_admin
--

SELECT pg_catalog.setval('realtime.broadcasts_id_seq', 1, false);


--
-- Name: channels_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: supabase_realtime_admin
--

SELECT pg_catalog.setval('realtime.channels_id_seq', 1, false);


--
-- Name: presences_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: supabase_realtime_admin
--

SELECT pg_catalog.setval('realtime.presences_id_seq', 1, false);


--
-- Name: subscription_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: supabase_admin
--

SELECT pg_catalog.setval('realtime.subscription_id_seq', 1, false);


--
-- Name: mfa_amr_claims amr_id_pk; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT amr_id_pk PRIMARY KEY (id);


--
-- Name: audit_log_entries audit_log_entries_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.audit_log_entries
    ADD CONSTRAINT audit_log_entries_pkey PRIMARY KEY (id);


--
-- Name: flow_state flow_state_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.flow_state
    ADD CONSTRAINT flow_state_pkey PRIMARY KEY (id);


--
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- Name: identities identities_provider_id_provider_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_provider_id_provider_unique UNIQUE (provider_id, provider);


--
-- Name: instances instances_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_authentication_method_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey UNIQUE (session_id, authentication_method);


--
-- Name: mfa_challenges mfa_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_pkey PRIMARY KEY (id);


--
-- Name: mfa_factors mfa_factors_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_token_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_token_unique UNIQUE (token);


--
-- Name: saml_providers saml_providers_entity_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_entity_id_key UNIQUE (entity_id);


--
-- Name: saml_providers saml_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_pkey PRIMARY KEY (id);


--
-- Name: saml_relay_states saml_relay_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sso_domains sso_domains_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_pkey PRIMARY KEY (id);


--
-- Name: sso_providers sso_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_providers
    ADD CONSTRAINT sso_providers_pkey PRIMARY KEY (id);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: listing listing_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.listing
    ADD CONSTRAINT listing_pkey PRIMARY KEY (id);


--
-- Name: vocab vocab_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vocab
    ADD CONSTRAINT vocab_pkey PRIMARY KEY (simplified);


--
-- Name: vocab_sandbox vocab_sandbox_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vocab_sandbox
    ADD CONSTRAINT vocab_sandbox_pkey PRIMARY KEY (simplified);


--
-- Name: broadcasts broadcasts_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.broadcasts
    ADD CONSTRAINT broadcasts_pkey PRIMARY KEY (id);


--
-- Name: channels channels_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.channels
    ADD CONSTRAINT channels_pkey PRIMARY KEY (id);


--
-- Name: subscription pk_subscription; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.subscription
    ADD CONSTRAINT pk_subscription PRIMARY KEY (id);


--
-- Name: presences presences_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.presences
    ADD CONSTRAINT presences_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: buckets buckets_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets
    ADD CONSTRAINT buckets_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_name_key; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_name_key UNIQUE (name);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: objects objects_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT objects_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_pkey PRIMARY KEY (id);


--
-- Name: audit_logs_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX audit_logs_instance_id_idx ON auth.audit_log_entries USING btree (instance_id);


--
-- Name: confirmation_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX confirmation_token_idx ON auth.users USING btree (confirmation_token) WHERE ((confirmation_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_current_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_current_idx ON auth.users USING btree (email_change_token_current) WHERE ((email_change_token_current)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_new_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_new_idx ON auth.users USING btree (email_change_token_new) WHERE ((email_change_token_new)::text !~ '^[0-9 ]*$'::text);


--
-- Name: factor_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX factor_id_created_at_idx ON auth.mfa_factors USING btree (user_id, created_at);


--
-- Name: flow_state_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX flow_state_created_at_idx ON auth.flow_state USING btree (created_at DESC);


--
-- Name: identities_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_email_idx ON auth.identities USING btree (email text_pattern_ops);


--
-- Name: INDEX identities_email_idx; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.identities_email_idx IS 'Auth: Ensures indexed queries on the email column';


--
-- Name: identities_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_user_id_idx ON auth.identities USING btree (user_id);


--
-- Name: idx_auth_code; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_auth_code ON auth.flow_state USING btree (auth_code);


--
-- Name: idx_user_id_auth_method; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_user_id_auth_method ON auth.flow_state USING btree (user_id, authentication_method);


--
-- Name: mfa_challenge_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_challenge_created_at_idx ON auth.mfa_challenges USING btree (created_at DESC);


--
-- Name: mfa_factors_user_friendly_name_unique; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX mfa_factors_user_friendly_name_unique ON auth.mfa_factors USING btree (friendly_name, user_id) WHERE (TRIM(BOTH FROM friendly_name) <> ''::text);


--
-- Name: mfa_factors_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_factors_user_id_idx ON auth.mfa_factors USING btree (user_id);


--
-- Name: reauthentication_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX reauthentication_token_idx ON auth.users USING btree (reauthentication_token) WHERE ((reauthentication_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: recovery_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX recovery_token_idx ON auth.users USING btree (recovery_token) WHERE ((recovery_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: refresh_tokens_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_idx ON auth.refresh_tokens USING btree (instance_id);


--
-- Name: refresh_tokens_instance_id_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_user_id_idx ON auth.refresh_tokens USING btree (instance_id, user_id);


--
-- Name: refresh_tokens_parent_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_parent_idx ON auth.refresh_tokens USING btree (parent);


--
-- Name: refresh_tokens_session_id_revoked_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_session_id_revoked_idx ON auth.refresh_tokens USING btree (session_id, revoked);


--
-- Name: refresh_tokens_updated_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_updated_at_idx ON auth.refresh_tokens USING btree (updated_at DESC);


--
-- Name: saml_providers_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_providers_sso_provider_id_idx ON auth.saml_providers USING btree (sso_provider_id);


--
-- Name: saml_relay_states_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_created_at_idx ON auth.saml_relay_states USING btree (created_at DESC);


--
-- Name: saml_relay_states_for_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_for_email_idx ON auth.saml_relay_states USING btree (for_email);


--
-- Name: saml_relay_states_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_sso_provider_id_idx ON auth.saml_relay_states USING btree (sso_provider_id);


--
-- Name: sessions_not_after_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_not_after_idx ON auth.sessions USING btree (not_after DESC);


--
-- Name: sessions_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_user_id_idx ON auth.sessions USING btree (user_id);


--
-- Name: sso_domains_domain_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_domains_domain_idx ON auth.sso_domains USING btree (lower(domain));


--
-- Name: sso_domains_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_domains_sso_provider_id_idx ON auth.sso_domains USING btree (sso_provider_id);


--
-- Name: sso_providers_resource_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_providers_resource_id_idx ON auth.sso_providers USING btree (lower(resource_id));


--
-- Name: user_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX user_id_created_at_idx ON auth.sessions USING btree (user_id, created_at);


--
-- Name: users_email_partial_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX users_email_partial_key ON auth.users USING btree (email) WHERE (is_sso_user = false);


--
-- Name: INDEX users_email_partial_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.users_email_partial_key IS 'Auth: A partial unique index that applies only when is_sso_user is false';


--
-- Name: users_instance_id_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_email_idx ON auth.users USING btree (instance_id, lower((email)::text));


--
-- Name: users_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_idx ON auth.users USING btree (instance_id);


--
-- Name: users_is_anonymous_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_is_anonymous_idx ON auth.users USING btree (is_anonymous);


--
-- Name: broadcasts_channel_id_index; Type: INDEX; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE UNIQUE INDEX broadcasts_channel_id_index ON realtime.broadcasts USING btree (channel_id);


--
-- Name: channels_name_index; Type: INDEX; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE UNIQUE INDEX channels_name_index ON realtime.channels USING btree (name);


--
-- Name: ix_realtime_subscription_entity; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX ix_realtime_subscription_entity ON realtime.subscription USING hash (entity);


--
-- Name: presences_channel_id_index; Type: INDEX; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE UNIQUE INDEX presences_channel_id_index ON realtime.presences USING btree (channel_id);


--
-- Name: subscription_subscription_id_entity_filters_key; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX subscription_subscription_id_entity_filters_key ON realtime.subscription USING btree (subscription_id, entity, filters);


--
-- Name: bname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bname ON storage.buckets USING btree (name);


--
-- Name: bucketid_objname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bucketid_objname ON storage.objects USING btree (bucket_id, name);


--
-- Name: idx_multipart_uploads_list; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_multipart_uploads_list ON storage.s3_multipart_uploads USING btree (bucket_id, key, created_at);


--
-- Name: idx_objects_bucket_id_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_bucket_id_name ON storage.objects USING btree (bucket_id, name COLLATE "C");


--
-- Name: name_prefix_search; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX name_prefix_search ON storage.objects USING btree (name text_pattern_ops);


--
-- Name: subscription tr_check_filters; Type: TRIGGER; Schema: realtime; Owner: supabase_admin
--

CREATE TRIGGER tr_check_filters BEFORE INSERT OR UPDATE ON realtime.subscription FOR EACH ROW EXECUTE FUNCTION realtime.subscription_check_filters();


--
-- Name: objects update_objects_updated_at; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER update_objects_updated_at BEFORE UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.update_updated_at_column();


--
-- Name: identities identities_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: mfa_challenges mfa_challenges_auth_factor_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_auth_factor_id_fkey FOREIGN KEY (factor_id) REFERENCES auth.mfa_factors(id) ON DELETE CASCADE;


--
-- Name: mfa_factors mfa_factors_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: refresh_tokens refresh_tokens_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: saml_providers saml_providers_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_flow_state_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_flow_state_id_fkey FOREIGN KEY (flow_state_id) REFERENCES auth.flow_state(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: sso_domains sso_domains_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: broadcasts broadcasts_channel_id_fkey; Type: FK CONSTRAINT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.broadcasts
    ADD CONSTRAINT broadcasts_channel_id_fkey FOREIGN KEY (channel_id) REFERENCES realtime.channels(id) ON DELETE CASCADE;


--
-- Name: presences presences_channel_id_fkey; Type: FK CONSTRAINT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.presences
    ADD CONSTRAINT presences_channel_id_fkey FOREIGN KEY (channel_id) REFERENCES realtime.channels(id) ON DELETE CASCADE;


--
-- Name: objects objects_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT "objects_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_upload_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_upload_id_fkey FOREIGN KEY (upload_id) REFERENCES storage.s3_multipart_uploads(id) ON DELETE CASCADE;


--
-- Name: listing Enable read access for all users; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Enable read access for all users" ON public.listing FOR SELECT USING (true);


--
-- Name: vocab Enable read access for all users; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Enable read access for all users" ON public.vocab FOR SELECT USING (true);


--
-- Name: listing; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.listing ENABLE ROW LEVEL SECURITY;

--
-- Name: vocab; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.vocab ENABLE ROW LEVEL SECURITY;

--
-- Name: vocab_sandbox; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.vocab_sandbox ENABLE ROW LEVEL SECURITY;

--
-- Name: broadcasts; Type: ROW SECURITY; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE realtime.broadcasts ENABLE ROW LEVEL SECURITY;

--
-- Name: channels; Type: ROW SECURITY; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE realtime.channels ENABLE ROW LEVEL SECURITY;

--
-- Name: presences; Type: ROW SECURITY; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE realtime.presences ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets ENABLE ROW LEVEL SECURITY;

--
-- Name: migrations; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: objects; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads_parts; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads_parts ENABLE ROW LEVEL SECURITY;

--
-- Name: supabase_realtime; Type: PUBLICATION; Schema: -; Owner: postgres
--

CREATE PUBLICATION supabase_realtime WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION supabase_realtime OWNER TO postgres;

--
-- Name: SCHEMA auth; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA auth TO anon;
GRANT USAGE ON SCHEMA auth TO authenticated;
GRANT USAGE ON SCHEMA auth TO service_role;
GRANT ALL ON SCHEMA auth TO supabase_auth_admin;
GRANT ALL ON SCHEMA auth TO dashboard_user;
GRANT ALL ON SCHEMA auth TO postgres;


--
-- Name: SCHEMA extensions; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA extensions TO anon;
GRANT USAGE ON SCHEMA extensions TO authenticated;
GRANT USAGE ON SCHEMA extensions TO service_role;
GRANT ALL ON SCHEMA extensions TO dashboard_user;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT USAGE ON SCHEMA public TO postgres;
GRANT USAGE ON SCHEMA public TO anon;
GRANT USAGE ON SCHEMA public TO authenticated;
GRANT USAGE ON SCHEMA public TO service_role;


--
-- Name: SCHEMA realtime; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA realtime TO postgres;
GRANT USAGE ON SCHEMA realtime TO anon;
GRANT USAGE ON SCHEMA realtime TO authenticated;
GRANT USAGE ON SCHEMA realtime TO service_role;
GRANT ALL ON SCHEMA realtime TO supabase_realtime_admin;


--
-- Name: SCHEMA storage; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT ALL ON SCHEMA storage TO postgres;
GRANT USAGE ON SCHEMA storage TO anon;
GRANT USAGE ON SCHEMA storage TO authenticated;
GRANT USAGE ON SCHEMA storage TO service_role;
GRANT ALL ON SCHEMA storage TO supabase_storage_admin;
GRANT ALL ON SCHEMA storage TO dashboard_user;


--
-- Name: FUNCTION email(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.email() TO dashboard_user;


--
-- Name: FUNCTION jwt(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.jwt() TO postgres;
GRANT ALL ON FUNCTION auth.jwt() TO dashboard_user;


--
-- Name: FUNCTION role(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.role() TO dashboard_user;


--
-- Name: FUNCTION uid(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.uid() TO dashboard_user;


--
-- Name: FUNCTION algorithm_sign(signables text, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.algorithm_sign(signables text, secret text, algorithm text) FROM postgres;
GRANT ALL ON FUNCTION extensions.algorithm_sign(signables text, secret text, algorithm text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.algorithm_sign(signables text, secret text, algorithm text) TO dashboard_user;


--
-- Name: FUNCTION armor(bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.armor(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO dashboard_user;


--
-- Name: FUNCTION armor(bytea, text[], text[]); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.armor(bytea, text[], text[]) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO dashboard_user;


--
-- Name: FUNCTION crypt(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.crypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO dashboard_user;


--
-- Name: FUNCTION dearmor(text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.dearmor(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO dashboard_user;


--
-- Name: FUNCTION decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION decrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION digest(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.digest(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION digest(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.digest(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO dashboard_user;


--
-- Name: FUNCTION encrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION encrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION gen_random_bytes(integer); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_random_bytes(integer) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO dashboard_user;


--
-- Name: FUNCTION gen_random_uuid(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_random_uuid() FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO dashboard_user;


--
-- Name: FUNCTION gen_salt(text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_salt(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO dashboard_user;


--
-- Name: FUNCTION gen_salt(text, integer); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_salt(text, integer) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO dashboard_user;


--
-- Name: FUNCTION grant_pg_cron_access(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.grant_pg_cron_access() FROM postgres;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO dashboard_user;


--
-- Name: FUNCTION grant_pg_graphql_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.grant_pg_graphql_access() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION grant_pg_net_access(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.grant_pg_net_access() FROM postgres;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO dashboard_user;


--
-- Name: FUNCTION hmac(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.hmac(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION hmac(text, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.hmac(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements_reset(userid oid, dbid oid, queryid bigint); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint) TO dashboard_user;


--
-- Name: FUNCTION pgp_armor_headers(text, OUT key text, OUT value text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO dashboard_user;


--
-- Name: FUNCTION pgp_key_id(bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_key_id(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgrst_ddl_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_ddl_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgrst_drop_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_drop_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION set_graphql_placeholder(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.set_graphql_placeholder() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION sign(payload json, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.sign(payload json, secret text, algorithm text) FROM postgres;
GRANT ALL ON FUNCTION extensions.sign(payload json, secret text, algorithm text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.sign(payload json, secret text, algorithm text) TO dashboard_user;


--
-- Name: FUNCTION try_cast_double(inp text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.try_cast_double(inp text) FROM postgres;
GRANT ALL ON FUNCTION extensions.try_cast_double(inp text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.try_cast_double(inp text) TO dashboard_user;


--
-- Name: FUNCTION url_decode(data text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.url_decode(data text) FROM postgres;
GRANT ALL ON FUNCTION extensions.url_decode(data text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.url_decode(data text) TO dashboard_user;


--
-- Name: FUNCTION url_encode(data bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.url_encode(data bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.url_encode(data bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.url_encode(data bytea) TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v1(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v1() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v1mc(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v1mc() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v3(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v4(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v4() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v5(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO dashboard_user;


--
-- Name: FUNCTION uuid_nil(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_nil() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_dns(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_dns() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_oid(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_oid() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_url(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_url() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_x500(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_x500() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO dashboard_user;


--
-- Name: FUNCTION verify(token text, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.verify(token text, secret text, algorithm text) FROM postgres;
GRANT ALL ON FUNCTION extensions.verify(token text, secret text, algorithm text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.verify(token text, secret text, algorithm text) TO dashboard_user;


--
-- Name: FUNCTION comment_directive(comment_ text); Type: ACL; Schema: graphql; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql.comment_directive(comment_ text) TO postgres;
GRANT ALL ON FUNCTION graphql.comment_directive(comment_ text) TO anon;
GRANT ALL ON FUNCTION graphql.comment_directive(comment_ text) TO authenticated;
GRANT ALL ON FUNCTION graphql.comment_directive(comment_ text) TO service_role;


--
-- Name: FUNCTION exception(message text); Type: ACL; Schema: graphql; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql.exception(message text) TO postgres;
GRANT ALL ON FUNCTION graphql.exception(message text) TO anon;
GRANT ALL ON FUNCTION graphql.exception(message text) TO authenticated;
GRANT ALL ON FUNCTION graphql.exception(message text) TO service_role;


--
-- Name: FUNCTION get_schema_version(); Type: ACL; Schema: graphql; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql.get_schema_version() TO postgres;
GRANT ALL ON FUNCTION graphql.get_schema_version() TO anon;
GRANT ALL ON FUNCTION graphql.get_schema_version() TO authenticated;
GRANT ALL ON FUNCTION graphql.get_schema_version() TO service_role;


--
-- Name: FUNCTION increment_schema_version(); Type: ACL; Schema: graphql; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql.increment_schema_version() TO postgres;
GRANT ALL ON FUNCTION graphql.increment_schema_version() TO anon;
GRANT ALL ON FUNCTION graphql.increment_schema_version() TO authenticated;
GRANT ALL ON FUNCTION graphql.increment_schema_version() TO service_role;


--
-- Name: FUNCTION graphql("operationName" text, query text, variables jsonb, extensions jsonb); Type: ACL; Schema: graphql_public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO postgres;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO anon;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO authenticated;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO service_role;


--
-- Name: FUNCTION lo_export(oid, text); Type: ACL; Schema: pg_catalog; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION pg_catalog.lo_export(oid, text) FROM postgres;
GRANT ALL ON FUNCTION pg_catalog.lo_export(oid, text) TO supabase_admin;


--
-- Name: FUNCTION lo_import(text); Type: ACL; Schema: pg_catalog; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION pg_catalog.lo_import(text) FROM postgres;
GRANT ALL ON FUNCTION pg_catalog.lo_import(text) TO supabase_admin;


--
-- Name: FUNCTION lo_import(text, oid); Type: ACL; Schema: pg_catalog; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION pg_catalog.lo_import(text, oid) FROM postgres;
GRANT ALL ON FUNCTION pg_catalog.lo_import(text, oid) TO supabase_admin;


--
-- Name: FUNCTION get_auth(p_usename text); Type: ACL; Schema: pgbouncer; Owner: postgres
--

REVOKE ALL ON FUNCTION pgbouncer.get_auth(p_usename text) FROM PUBLIC;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO pgbouncer;


--
-- Name: FUNCTION crypto_aead_det_decrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea); Type: ACL; Schema: pgsodium; Owner: pgsodium_keymaker
--

GRANT ALL ON FUNCTION pgsodium.crypto_aead_det_decrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea) TO service_role;


--
-- Name: FUNCTION crypto_aead_det_encrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea); Type: ACL; Schema: pgsodium; Owner: pgsodium_keymaker
--

GRANT ALL ON FUNCTION pgsodium.crypto_aead_det_encrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea) TO service_role;


--
-- Name: FUNCTION crypto_aead_det_keygen(); Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT ALL ON FUNCTION pgsodium.crypto_aead_det_keygen() TO service_role;


--
-- Name: TABLE vocab; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.vocab TO anon;
GRANT ALL ON TABLE public.vocab TO authenticated;
GRANT ALL ON TABLE public.vocab TO service_role;


--
-- Name: FUNCTION get_vocab_by_category(category text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.get_vocab_by_category(category text) TO anon;
GRANT ALL ON FUNCTION public.get_vocab_by_category(category text) TO authenticated;
GRANT ALL ON FUNCTION public.get_vocab_by_category(category text) TO service_role;


--
-- Name: FUNCTION apply_rls(wal jsonb, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO postgres;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO anon;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO service_role;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION "cast"(val text, type_ regtype); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO postgres;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO dashboard_user;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO anon;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO authenticated;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO service_role;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO supabase_realtime_admin;


--
-- Name: FUNCTION channel_name(); Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON FUNCTION realtime.channel_name() TO postgres;
GRANT ALL ON FUNCTION realtime.channel_name() TO dashboard_user;


--
-- Name: FUNCTION check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO postgres;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO anon;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO authenticated;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO service_role;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO supabase_realtime_admin;


--
-- Name: FUNCTION is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO postgres;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO anon;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO service_role;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION quote_wal2json(entity regclass); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO postgres;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO anon;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO authenticated;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO service_role;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO supabase_realtime_admin;


--
-- Name: FUNCTION subscription_check_filters(); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO postgres;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO dashboard_user;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO anon;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO authenticated;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO service_role;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO supabase_realtime_admin;


--
-- Name: FUNCTION to_regrole(role_name text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO postgres;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO anon;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO authenticated;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO service_role;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO supabase_realtime_admin;


--
-- Name: TABLE audit_log_entries; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.audit_log_entries TO dashboard_user;
GRANT ALL ON TABLE auth.audit_log_entries TO postgres;


--
-- Name: TABLE flow_state; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.flow_state TO postgres;
GRANT ALL ON TABLE auth.flow_state TO dashboard_user;


--
-- Name: TABLE identities; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.identities TO postgres;
GRANT ALL ON TABLE auth.identities TO dashboard_user;


--
-- Name: TABLE instances; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.instances TO dashboard_user;
GRANT ALL ON TABLE auth.instances TO postgres;


--
-- Name: TABLE mfa_amr_claims; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.mfa_amr_claims TO postgres;
GRANT ALL ON TABLE auth.mfa_amr_claims TO dashboard_user;


--
-- Name: TABLE mfa_challenges; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.mfa_challenges TO postgres;
GRANT ALL ON TABLE auth.mfa_challenges TO dashboard_user;


--
-- Name: TABLE mfa_factors; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.mfa_factors TO postgres;
GRANT ALL ON TABLE auth.mfa_factors TO dashboard_user;


--
-- Name: TABLE refresh_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.refresh_tokens TO dashboard_user;
GRANT ALL ON TABLE auth.refresh_tokens TO postgres;


--
-- Name: SEQUENCE refresh_tokens_id_seq; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO dashboard_user;
GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO postgres;


--
-- Name: TABLE saml_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.saml_providers TO postgres;
GRANT ALL ON TABLE auth.saml_providers TO dashboard_user;


--
-- Name: TABLE saml_relay_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.saml_relay_states TO postgres;
GRANT ALL ON TABLE auth.saml_relay_states TO dashboard_user;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.schema_migrations TO dashboard_user;
GRANT ALL ON TABLE auth.schema_migrations TO postgres;


--
-- Name: TABLE sessions; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.sessions TO postgres;
GRANT ALL ON TABLE auth.sessions TO dashboard_user;


--
-- Name: TABLE sso_domains; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.sso_domains TO postgres;
GRANT ALL ON TABLE auth.sso_domains TO dashboard_user;


--
-- Name: TABLE sso_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.sso_providers TO postgres;
GRANT ALL ON TABLE auth.sso_providers TO dashboard_user;


--
-- Name: TABLE users; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.users TO dashboard_user;
GRANT ALL ON TABLE auth.users TO postgres;


--
-- Name: TABLE pg_stat_statements; Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON TABLE extensions.pg_stat_statements FROM postgres;
GRANT ALL ON TABLE extensions.pg_stat_statements TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements TO dashboard_user;


--
-- Name: TABLE pg_stat_statements_info; Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON TABLE extensions.pg_stat_statements_info FROM postgres;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO dashboard_user;


--
-- Name: SEQUENCE seq_schema_version; Type: ACL; Schema: graphql; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE graphql.seq_schema_version TO postgres;
GRANT ALL ON SEQUENCE graphql.seq_schema_version TO anon;
GRANT ALL ON SEQUENCE graphql.seq_schema_version TO authenticated;
GRANT ALL ON SEQUENCE graphql.seq_schema_version TO service_role;


--
-- Name: TABLE decrypted_key; Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT ALL ON TABLE pgsodium.decrypted_key TO pgsodium_keyholder;


--
-- Name: TABLE masking_rule; Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT ALL ON TABLE pgsodium.masking_rule TO pgsodium_keyholder;


--
-- Name: TABLE mask_columns; Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT ALL ON TABLE pgsodium.mask_columns TO pgsodium_keyholder;


--
-- Name: TABLE listing; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.listing TO anon;
GRANT ALL ON TABLE public.listing TO authenticated;
GRANT ALL ON TABLE public.listing TO service_role;


--
-- Name: TABLE vocab_sandbox; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.vocab_sandbox TO anon;
GRANT ALL ON TABLE public.vocab_sandbox TO authenticated;
GRANT ALL ON TABLE public.vocab_sandbox TO service_role;


--
-- Name: TABLE broadcasts; Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON TABLE realtime.broadcasts TO postgres;
GRANT ALL ON TABLE realtime.broadcasts TO dashboard_user;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.broadcasts TO anon;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.broadcasts TO authenticated;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.broadcasts TO service_role;


--
-- Name: SEQUENCE broadcasts_id_seq; Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON SEQUENCE realtime.broadcasts_id_seq TO postgres;
GRANT ALL ON SEQUENCE realtime.broadcasts_id_seq TO dashboard_user;
GRANT USAGE ON SEQUENCE realtime.broadcasts_id_seq TO anon;
GRANT USAGE ON SEQUENCE realtime.broadcasts_id_seq TO authenticated;
GRANT USAGE ON SEQUENCE realtime.broadcasts_id_seq TO service_role;


--
-- Name: TABLE channels; Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON TABLE realtime.channels TO postgres;
GRANT ALL ON TABLE realtime.channels TO dashboard_user;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE realtime.channels TO anon;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE realtime.channels TO authenticated;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE realtime.channels TO service_role;


--
-- Name: SEQUENCE channels_id_seq; Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON SEQUENCE realtime.channels_id_seq TO postgres;
GRANT ALL ON SEQUENCE realtime.channels_id_seq TO dashboard_user;
GRANT USAGE ON SEQUENCE realtime.channels_id_seq TO anon;
GRANT USAGE ON SEQUENCE realtime.channels_id_seq TO authenticated;
GRANT USAGE ON SEQUENCE realtime.channels_id_seq TO service_role;


--
-- Name: TABLE presences; Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON TABLE realtime.presences TO postgres;
GRANT ALL ON TABLE realtime.presences TO dashboard_user;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.presences TO anon;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.presences TO authenticated;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.presences TO service_role;


--
-- Name: SEQUENCE presences_id_seq; Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON SEQUENCE realtime.presences_id_seq TO postgres;
GRANT ALL ON SEQUENCE realtime.presences_id_seq TO dashboard_user;
GRANT USAGE ON SEQUENCE realtime.presences_id_seq TO anon;
GRANT USAGE ON SEQUENCE realtime.presences_id_seq TO authenticated;
GRANT USAGE ON SEQUENCE realtime.presences_id_seq TO service_role;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.schema_migrations TO postgres;
GRANT ALL ON TABLE realtime.schema_migrations TO dashboard_user;
GRANT SELECT ON TABLE realtime.schema_migrations TO anon;
GRANT SELECT ON TABLE realtime.schema_migrations TO authenticated;
GRANT SELECT ON TABLE realtime.schema_migrations TO service_role;
GRANT ALL ON TABLE realtime.schema_migrations TO supabase_realtime_admin;


--
-- Name: TABLE subscription; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.subscription TO postgres;
GRANT ALL ON TABLE realtime.subscription TO dashboard_user;
GRANT SELECT ON TABLE realtime.subscription TO anon;
GRANT SELECT ON TABLE realtime.subscription TO authenticated;
GRANT SELECT ON TABLE realtime.subscription TO service_role;
GRANT ALL ON TABLE realtime.subscription TO supabase_realtime_admin;


--
-- Name: SEQUENCE subscription_id_seq; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO postgres;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO dashboard_user;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO anon;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO authenticated;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO service_role;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO supabase_realtime_admin;


--
-- Name: TABLE buckets; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.buckets TO anon;
GRANT ALL ON TABLE storage.buckets TO authenticated;
GRANT ALL ON TABLE storage.buckets TO service_role;
GRANT ALL ON TABLE storage.buckets TO postgres;


--
-- Name: TABLE migrations; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.migrations TO anon;
GRANT ALL ON TABLE storage.migrations TO authenticated;
GRANT ALL ON TABLE storage.migrations TO service_role;
GRANT ALL ON TABLE storage.migrations TO postgres;


--
-- Name: TABLE objects; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.objects TO anon;
GRANT ALL ON TABLE storage.objects TO authenticated;
GRANT ALL ON TABLE storage.objects TO service_role;
GRANT ALL ON TABLE storage.objects TO postgres;


--
-- Name: TABLE s3_multipart_uploads; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO anon;


--
-- Name: TABLE s3_multipart_uploads_parts; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads_parts TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO anon;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON SEQUENCES  TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON FUNCTIONS  TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON TABLES  TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: pgsodium; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium GRANT ALL ON SEQUENCES  TO pgsodium_keyholder;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: pgsodium; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium GRANT ALL ON TABLES  TO pgsodium_keyholder;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: pgsodium_masks; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium_masks GRANT ALL ON SEQUENCES  TO pgsodium_keyiduser;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: pgsodium_masks; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium_masks GRANT ALL ON FUNCTIONS  TO pgsodium_keyiduser;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: pgsodium_masks; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium_masks GRANT ALL ON TABLES  TO pgsodium_keyiduser;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES  TO service_role;


--
-- Name: issue_graphql_placeholder; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_graphql_placeholder ON sql_drop
         WHEN TAG IN ('DROP EXTENSION')
   EXECUTE FUNCTION extensions.set_graphql_placeholder();


ALTER EVENT TRIGGER issue_graphql_placeholder OWNER TO supabase_admin;

--
-- Name: issue_pg_cron_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_cron_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_cron_access();


ALTER EVENT TRIGGER issue_pg_cron_access OWNER TO supabase_admin;

--
-- Name: issue_pg_graphql_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_graphql_access ON ddl_command_end
         WHEN TAG IN ('CREATE FUNCTION')
   EXECUTE FUNCTION extensions.grant_pg_graphql_access();


ALTER EVENT TRIGGER issue_pg_graphql_access OWNER TO supabase_admin;

--
-- Name: issue_pg_net_access; Type: EVENT TRIGGER; Schema: -; Owner: postgres
--

CREATE EVENT TRIGGER issue_pg_net_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_net_access();


ALTER EVENT TRIGGER issue_pg_net_access OWNER TO postgres;

--
-- Name: pgrst_ddl_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_ddl_watch ON ddl_command_end
   EXECUTE FUNCTION extensions.pgrst_ddl_watch();


ALTER EVENT TRIGGER pgrst_ddl_watch OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_drop_watch ON sql_drop
   EXECUTE FUNCTION extensions.pgrst_drop_watch();


ALTER EVENT TRIGGER pgrst_drop_watch OWNER TO supabase_admin;

--
-- PostgreSQL database dump complete
--

