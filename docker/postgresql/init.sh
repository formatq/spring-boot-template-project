#!/bin/bash

set -e
set -u

echo "==  Create user and database... =="
psql -v ON_ERROR_STOP=1 <<-EOSQL
CREATE USER $USER WITH
    LOGIN
    SUPERUSER
    INHERIT
    CREATEDB
    CREATEROLE
    NOREPLICATION
    ENCRYPTED PASSWORD '$PASSWORD';

CREATE DATABASE $USER
    WITH
    OWNER = $USER
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.UTF-8'
    LC_CTYPE = 'en_US.UTF-8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    TEMPLATE = template0;

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;
EOSQL

echo "==  Create scheme for postgresql_user...   =="
psql -v ON_ERROR_STOP=1 -d $USER <<-EOSQL
	CREATE SCHEMA $SCHEMA;
	ALTER SCHEMA $SCHEMA OWNER TO $USER;
EOSQL

echo "==  Create scheme_liquibase for postgresql_user...   =="
psql -v ON_ERROR_STOP=1 -d $USER <<-EOSQL
	CREATE SCHEMA $SCHEMA_LIQUIBASE;
	ALTER SCHEMA $SCHEMA_LIQUIBASE OWNER TO $USER;
EOSQL