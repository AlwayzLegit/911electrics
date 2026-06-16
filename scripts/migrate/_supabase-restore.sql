--
-- PostgreSQL database dump
--


-- Dumped from database version 16.13 (Ubuntu 16.13-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.13 (Ubuntu 16.13-0ubuntu0.24.04.1)

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--



--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--



--
-- Name: enum__cities_v_version_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum__cities_v_version_status AS ENUM (
    'draft',
    'published'
);


--
-- Name: enum__pages_v_blocks_archive_populate_by; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum__pages_v_blocks_archive_populate_by AS ENUM (
    'collection',
    'selection'
);


--
-- Name: enum__pages_v_blocks_archive_relation_to; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum__pages_v_blocks_archive_relation_to AS ENUM (
    'posts'
);


--
-- Name: enum__pages_v_blocks_content_columns_link_appearance; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum__pages_v_blocks_content_columns_link_appearance AS ENUM (
    'default',
    'outline'
);


--
-- Name: enum__pages_v_blocks_content_columns_link_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum__pages_v_blocks_content_columns_link_type AS ENUM (
    'reference',
    'custom'
);


--
-- Name: enum__pages_v_blocks_content_columns_size; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum__pages_v_blocks_content_columns_size AS ENUM (
    'oneThird',
    'half',
    'twoThirds',
    'full'
);


--
-- Name: enum__pages_v_blocks_cta_links_link_appearance; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum__pages_v_blocks_cta_links_link_appearance AS ENUM (
    'default',
    'outline'
);


--
-- Name: enum__pages_v_blocks_cta_links_link_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum__pages_v_blocks_cta_links_link_type AS ENUM (
    'reference',
    'custom'
);


--
-- Name: enum__pages_v_version_hero_links_link_appearance; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum__pages_v_version_hero_links_link_appearance AS ENUM (
    'default',
    'outline'
);


--
-- Name: enum__pages_v_version_hero_links_link_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum__pages_v_version_hero_links_link_type AS ENUM (
    'reference',
    'custom'
);


--
-- Name: enum__pages_v_version_hero_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum__pages_v_version_hero_type AS ENUM (
    'none',
    'highImpact',
    'mediumImpact',
    'lowImpact'
);


--
-- Name: enum__pages_v_version_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum__pages_v_version_status AS ENUM (
    'draft',
    'published'
);


--
-- Name: enum__posts_v_version_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum__posts_v_version_status AS ENUM (
    'draft',
    'published'
);


--
-- Name: enum__services_v_version_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum__services_v_version_status AS ENUM (
    'draft',
    'published'
);


--
-- Name: enum_cities_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum_cities_status AS ENUM (
    'draft',
    'published'
);


--
-- Name: enum_leads_form_location; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum_leads_form_location AS ENUM (
    'hero',
    'contact',
    'contact-page'
);


--
-- Name: enum_leads_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum_leads_status AS ENUM (
    'new',
    'contacted',
    'quoted',
    'won',
    'lost',
    'spam'
);


--
-- Name: enum_pages_blocks_archive_populate_by; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum_pages_blocks_archive_populate_by AS ENUM (
    'collection',
    'selection'
);


--
-- Name: enum_pages_blocks_archive_relation_to; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum_pages_blocks_archive_relation_to AS ENUM (
    'posts'
);


--
-- Name: enum_pages_blocks_content_columns_link_appearance; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum_pages_blocks_content_columns_link_appearance AS ENUM (
    'default',
    'outline'
);


--
-- Name: enum_pages_blocks_content_columns_link_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum_pages_blocks_content_columns_link_type AS ENUM (
    'reference',
    'custom'
);


--
-- Name: enum_pages_blocks_content_columns_size; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum_pages_blocks_content_columns_size AS ENUM (
    'oneThird',
    'half',
    'twoThirds',
    'full'
);


--
-- Name: enum_pages_blocks_cta_links_link_appearance; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum_pages_blocks_cta_links_link_appearance AS ENUM (
    'default',
    'outline'
);


--
-- Name: enum_pages_blocks_cta_links_link_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum_pages_blocks_cta_links_link_type AS ENUM (
    'reference',
    'custom'
);


--
-- Name: enum_pages_hero_links_link_appearance; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum_pages_hero_links_link_appearance AS ENUM (
    'default',
    'outline'
);


--
-- Name: enum_pages_hero_links_link_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum_pages_hero_links_link_type AS ENUM (
    'reference',
    'custom'
);


--
-- Name: enum_pages_hero_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum_pages_hero_type AS ENUM (
    'none',
    'highImpact',
    'mediumImpact',
    'lowImpact'
);


--
-- Name: enum_pages_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum_pages_status AS ENUM (
    'draft',
    'published'
);


--
-- Name: enum_payload_folders_folder_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum_payload_folders_folder_type AS ENUM (
    'media'
);


--
-- Name: enum_payload_jobs_log_state; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum_payload_jobs_log_state AS ENUM (
    'failed',
    'succeeded'
);


--
-- Name: enum_payload_jobs_log_task_slug; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum_payload_jobs_log_task_slug AS ENUM (
    'inline',
    'schedulePublish'
);


--
-- Name: enum_payload_jobs_task_slug; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum_payload_jobs_task_slug AS ENUM (
    'inline',
    'schedulePublish'
);


--
-- Name: enum_posts_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum_posts_status AS ENUM (
    'draft',
    'published'
);


--
-- Name: enum_redirects_to_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum_redirects_to_type AS ENUM (
    'reference',
    'custom'
);


--
-- Name: enum_services_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum_services_status AS ENUM (
    'draft',
    'published'
);


--
-- Name: enum_site_settings_socials_platform; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum_site_settings_socials_platform AS ENUM (
    'facebook',
    'instagram',
    'x',
    'pinterest',
    'google',
    'yelp'
);


--
-- Name: enum_testimonials_source; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.enum_testimonials_source AS ENUM (
    'google',
    'yelp',
    'facebook',
    'direct'
);


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: _cities_v; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public._cities_v (
    id integer NOT NULL,
    parent_id integer,
    version_city_name character varying,
    version_region character varying,
    version_title character varying,
    version_hero_heading_override character varying,
    version_intro_override jsonb,
    version_local_notes jsonb,
    version_meta_title character varying,
    version_meta_image_id integer,
    version_meta_description character varying,
    version_path_override character varying,
    version_generate_slug boolean DEFAULT true,
    version_slug character varying,
    version_updated_at timestamp(3) with time zone,
    version_created_at timestamp(3) with time zone,
    version__status public.enum__cities_v_version_status DEFAULT 'draft'::public.enum__cities_v_version_status,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    latest boolean,
    autosave boolean
);


--
-- Name: _cities_v_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public._cities_v_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _cities_v_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public._cities_v_id_seq OWNED BY public._cities_v.id;


--
-- Name: _cities_v_rels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public._cities_v_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    testimonials_id integer
);


--
-- Name: _cities_v_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public._cities_v_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _cities_v_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public._cities_v_rels_id_seq OWNED BY public._cities_v_rels.id;


--
-- Name: _cities_v_version_faqs_override; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public._cities_v_version_faqs_override (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id integer NOT NULL,
    question character varying,
    answer jsonb,
    _uuid character varying
);


--
-- Name: _cities_v_version_faqs_override_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public._cities_v_version_faqs_override_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _cities_v_version_faqs_override_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public._cities_v_version_faqs_override_id_seq OWNED BY public._cities_v_version_faqs_override.id;


--
-- Name: _cities_v_version_neighborhoods; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public._cities_v_version_neighborhoods (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id integer NOT NULL,
    name character varying,
    _uuid character varying
);


--
-- Name: _cities_v_version_neighborhoods_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public._cities_v_version_neighborhoods_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _cities_v_version_neighborhoods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public._cities_v_version_neighborhoods_id_seq OWNED BY public._cities_v_version_neighborhoods.id;


--
-- Name: _cities_v_version_zip_codes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public._cities_v_version_zip_codes (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id integer NOT NULL,
    zip character varying,
    _uuid character varying
);


--
-- Name: _cities_v_version_zip_codes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public._cities_v_version_zip_codes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _cities_v_version_zip_codes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public._cities_v_version_zip_codes_id_seq OWNED BY public._cities_v_version_zip_codes.id;


--
-- Name: _pages_v; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public._pages_v (
    id integer NOT NULL,
    parent_id integer,
    version_title character varying,
    version_hero_type public.enum__pages_v_version_hero_type DEFAULT 'lowImpact'::public.enum__pages_v_version_hero_type,
    version_hero_rich_text jsonb,
    version_hero_media_id integer,
    version_meta_title character varying,
    version_meta_image_id integer,
    version_meta_description character varying,
    version_published_at timestamp(3) with time zone,
    version_generate_slug boolean DEFAULT true,
    version_slug character varying,
    version_updated_at timestamp(3) with time zone,
    version_created_at timestamp(3) with time zone,
    version__status public.enum__pages_v_version_status DEFAULT 'draft'::public.enum__pages_v_version_status,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    latest boolean,
    autosave boolean
);


--
-- Name: _pages_v_blocks_archive; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public._pages_v_blocks_archive (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id integer NOT NULL,
    intro_content jsonb,
    populate_by public.enum__pages_v_blocks_archive_populate_by DEFAULT 'collection'::public.enum__pages_v_blocks_archive_populate_by,
    relation_to public.enum__pages_v_blocks_archive_relation_to DEFAULT 'posts'::public.enum__pages_v_blocks_archive_relation_to,
    "limit" numeric DEFAULT 10,
    _uuid character varying,
    block_name character varying
);


--
-- Name: _pages_v_blocks_archive_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public._pages_v_blocks_archive_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _pages_v_blocks_archive_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public._pages_v_blocks_archive_id_seq OWNED BY public._pages_v_blocks_archive.id;


--
-- Name: _pages_v_blocks_content; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public._pages_v_blocks_content (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id integer NOT NULL,
    _uuid character varying,
    block_name character varying
);


--
-- Name: _pages_v_blocks_content_columns; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public._pages_v_blocks_content_columns (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id integer NOT NULL,
    size public.enum__pages_v_blocks_content_columns_size DEFAULT 'oneThird'::public.enum__pages_v_blocks_content_columns_size,
    rich_text jsonb,
    enable_link boolean,
    link_type public.enum__pages_v_blocks_content_columns_link_type DEFAULT 'reference'::public.enum__pages_v_blocks_content_columns_link_type,
    link_new_tab boolean,
    link_url character varying,
    link_label character varying,
    link_appearance public.enum__pages_v_blocks_content_columns_link_appearance DEFAULT 'default'::public.enum__pages_v_blocks_content_columns_link_appearance,
    _uuid character varying
);


--
-- Name: _pages_v_blocks_content_columns_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public._pages_v_blocks_content_columns_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _pages_v_blocks_content_columns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public._pages_v_blocks_content_columns_id_seq OWNED BY public._pages_v_blocks_content_columns.id;


--
-- Name: _pages_v_blocks_content_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public._pages_v_blocks_content_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _pages_v_blocks_content_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public._pages_v_blocks_content_id_seq OWNED BY public._pages_v_blocks_content.id;


--
-- Name: _pages_v_blocks_cta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public._pages_v_blocks_cta (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id integer NOT NULL,
    rich_text jsonb,
    _uuid character varying,
    block_name character varying
);


--
-- Name: _pages_v_blocks_cta_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public._pages_v_blocks_cta_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _pages_v_blocks_cta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public._pages_v_blocks_cta_id_seq OWNED BY public._pages_v_blocks_cta.id;


--
-- Name: _pages_v_blocks_cta_links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public._pages_v_blocks_cta_links (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id integer NOT NULL,
    link_type public.enum__pages_v_blocks_cta_links_link_type DEFAULT 'reference'::public.enum__pages_v_blocks_cta_links_link_type,
    link_new_tab boolean,
    link_url character varying,
    link_label character varying,
    link_appearance public.enum__pages_v_blocks_cta_links_link_appearance DEFAULT 'default'::public.enum__pages_v_blocks_cta_links_link_appearance,
    _uuid character varying
);


--
-- Name: _pages_v_blocks_cta_links_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public._pages_v_blocks_cta_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _pages_v_blocks_cta_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public._pages_v_blocks_cta_links_id_seq OWNED BY public._pages_v_blocks_cta_links.id;


--
-- Name: _pages_v_blocks_media_block; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public._pages_v_blocks_media_block (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id integer NOT NULL,
    media_id integer,
    _uuid character varying,
    block_name character varying
);


--
-- Name: _pages_v_blocks_media_block_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public._pages_v_blocks_media_block_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _pages_v_blocks_media_block_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public._pages_v_blocks_media_block_id_seq OWNED BY public._pages_v_blocks_media_block.id;


--
-- Name: _pages_v_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public._pages_v_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _pages_v_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public._pages_v_id_seq OWNED BY public._pages_v.id;


--
-- Name: _pages_v_rels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public._pages_v_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    pages_id integer,
    posts_id integer,
    categories_id integer
);


--
-- Name: _pages_v_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public._pages_v_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _pages_v_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public._pages_v_rels_id_seq OWNED BY public._pages_v_rels.id;


--
-- Name: _pages_v_version_hero_links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public._pages_v_version_hero_links (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id integer NOT NULL,
    link_type public.enum__pages_v_version_hero_links_link_type DEFAULT 'reference'::public.enum__pages_v_version_hero_links_link_type,
    link_new_tab boolean,
    link_url character varying,
    link_label character varying,
    link_appearance public.enum__pages_v_version_hero_links_link_appearance DEFAULT 'default'::public.enum__pages_v_version_hero_links_link_appearance,
    _uuid character varying
);


--
-- Name: _pages_v_version_hero_links_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public._pages_v_version_hero_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _pages_v_version_hero_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public._pages_v_version_hero_links_id_seq OWNED BY public._pages_v_version_hero_links.id;


--
-- Name: _posts_v; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public._posts_v (
    id integer NOT NULL,
    parent_id integer,
    version_title character varying,
    version_hero_image_id integer,
    version_content jsonb,
    version_meta_title character varying,
    version_meta_image_id integer,
    version_meta_description character varying,
    version_published_at timestamp(3) with time zone,
    version_generate_slug boolean DEFAULT true,
    version_slug character varying,
    version_updated_at timestamp(3) with time zone,
    version_created_at timestamp(3) with time zone,
    version__status public.enum__posts_v_version_status DEFAULT 'draft'::public.enum__posts_v_version_status,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    latest boolean,
    autosave boolean
);


--
-- Name: _posts_v_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public._posts_v_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _posts_v_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public._posts_v_id_seq OWNED BY public._posts_v.id;


--
-- Name: _posts_v_rels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public._posts_v_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    posts_id integer,
    categories_id integer,
    users_id integer
);


--
-- Name: _posts_v_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public._posts_v_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _posts_v_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public._posts_v_rels_id_seq OWNED BY public._posts_v_rels.id;


--
-- Name: _posts_v_version_populated_authors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public._posts_v_version_populated_authors (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id integer NOT NULL,
    _uuid character varying,
    name character varying
);


--
-- Name: _posts_v_version_populated_authors_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public._posts_v_version_populated_authors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _posts_v_version_populated_authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public._posts_v_version_populated_authors_id_seq OWNED BY public._posts_v_version_populated_authors.id;


--
-- Name: _services_v; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public._services_v (
    id integer NOT NULL,
    parent_id integer,
    version_title character varying,
    version_nav_label character varying,
    version_hero_subheading character varying,
    version_hero_image_id integer,
    version_show_rating_badge boolean DEFAULT true,
    version_short_description character varying,
    version_card_image_id integer,
    version_intro jsonb,
    version_meta_title character varying,
    version_meta_image_id integer,
    version_meta_description character varying,
    version_display_order numeric DEFAULT 0,
    version_generate_slug boolean DEFAULT true,
    version_slug character varying,
    version_updated_at timestamp(3) with time zone,
    version_created_at timestamp(3) with time zone,
    version__status public.enum__services_v_version_status DEFAULT 'draft'::public.enum__services_v_version_status,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    latest boolean,
    autosave boolean
);


--
-- Name: _services_v_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public._services_v_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _services_v_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public._services_v_id_seq OWNED BY public._services_v.id;


--
-- Name: _services_v_rels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public._services_v_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    posts_id integer
);


--
-- Name: _services_v_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public._services_v_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _services_v_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public._services_v_rels_id_seq OWNED BY public._services_v_rels.id;


--
-- Name: _services_v_version_benefits; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public._services_v_version_benefits (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id integer NOT NULL,
    title character varying,
    text character varying,
    _uuid character varying
);


--
-- Name: _services_v_version_benefits_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public._services_v_version_benefits_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _services_v_version_benefits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public._services_v_version_benefits_id_seq OWNED BY public._services_v_version_benefits.id;


--
-- Name: _services_v_version_faqs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public._services_v_version_faqs (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id integer NOT NULL,
    question character varying,
    answer jsonb,
    _uuid character varying
);


--
-- Name: _services_v_version_faqs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public._services_v_version_faqs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _services_v_version_faqs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public._services_v_version_faqs_id_seq OWNED BY public._services_v_version_faqs.id;


--
-- Name: _services_v_version_features; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public._services_v_version_features (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id integer NOT NULL,
    title character varying,
    text character varying,
    _uuid character varying
);


--
-- Name: _services_v_version_features_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public._services_v_version_features_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _services_v_version_features_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public._services_v_version_features_id_seq OWNED BY public._services_v_version_features.id;


--
-- Name: _services_v_version_gallery; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public._services_v_version_gallery (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id integer NOT NULL,
    image_id integer,
    _uuid character varying
);


--
-- Name: _services_v_version_gallery_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public._services_v_version_gallery_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: _services_v_version_gallery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public._services_v_version_gallery_id_seq OWNED BY public._services_v_version_gallery.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    title character varying NOT NULL,
    generate_slug boolean DEFAULT true,
    slug character varying NOT NULL,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: cities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cities (
    id integer NOT NULL,
    city_name character varying,
    region character varying,
    title character varying,
    hero_heading_override character varying,
    intro_override jsonb,
    local_notes jsonb,
    meta_title character varying,
    meta_image_id integer,
    meta_description character varying,
    path_override character varying,
    generate_slug boolean DEFAULT true,
    slug character varying,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    _status public.enum_cities_status DEFAULT 'draft'::public.enum_cities_status
);


--
-- Name: cities_faqs_override; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cities_faqs_override (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    question character varying,
    answer jsonb
);


--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;


--
-- Name: cities_neighborhoods; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cities_neighborhoods (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    name character varying
);


--
-- Name: cities_rels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cities_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    testimonials_id integer
);


--
-- Name: cities_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cities_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cities_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cities_rels_id_seq OWNED BY public.cities_rels.id;


--
-- Name: cities_zip_codes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cities_zip_codes (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    zip character varying
);


--
-- Name: city_page_template; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.city_page_template (
    id integer NOT NULL,
    hero_heading character varying DEFAULT 'Electrician in {{city}}, CA for Repairs, Panel Upgrades & EV Chargers'::character varying NOT NULL,
    hero_subheading character varying,
    hero_image_id integer,
    intro jsonb,
    process_heading character varying DEFAULT 'From Consultation to Completion in 3 Easy Steps'::character varying,
    services_heading character varying DEFAULT 'Our Electrical Services in {{city}}, CA'::character varying,
    services_intro character varying,
    about_heading character varying,
    about_body jsonb,
    cta_heading character varying DEFAULT 'Need an Electrician in {{city}}? Call Us 24/7'::character varying,
    cta_body character varying,
    updated_at timestamp(3) with time zone,
    created_at timestamp(3) with time zone
);


--
-- Name: city_page_template_differentiators; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.city_page_template_differentiators (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    title character varying NOT NULL,
    text character varying NOT NULL
);


--
-- Name: city_page_template_faqs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.city_page_template_faqs (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    question character varying NOT NULL,
    answer jsonb NOT NULL
);


--
-- Name: city_page_template_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.city_page_template_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: city_page_template_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.city_page_template_id_seq OWNED BY public.city_page_template.id;


--
-- Name: city_page_template_process_steps; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.city_page_template_process_steps (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    title character varying NOT NULL,
    text character varying NOT NULL
);


--
-- Name: homepage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.homepage (
    id integer NOT NULL,
    hero_heading character varying DEFAULT 'Licensed Electrician in Los Angeles, CA'::character varying NOT NULL,
    hero_subheading character varying,
    hero_image_id integer,
    process_heading character varying DEFAULT 'From Consultation to Completion in 3 Easy Steps'::character varying,
    services_heading character varying DEFAULT 'Electrical Solutions We Offer'::character varying,
    services_intro character varying,
    about_heading character varying DEFAULT 'Why Choose 911 Construction & Electric'::character varying,
    about_body jsonb,
    about_image_id integer,
    reviews_heading character varying DEFAULT 'What Our Customers Say'::character varying,
    contact_heading character varying DEFAULT 'Get Your Free Quote Today'::character varying,
    contact_body character varying,
    meta_title character varying,
    meta_image_id integer,
    meta_description character varying,
    updated_at timestamp(3) with time zone,
    created_at timestamp(3) with time zone
);


--
-- Name: homepage_differentiators; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.homepage_differentiators (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    title character varying NOT NULL,
    text character varying NOT NULL
);


--
-- Name: homepage_faqs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.homepage_faqs (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    question character varying NOT NULL,
    answer jsonb NOT NULL
);


--
-- Name: homepage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.homepage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: homepage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.homepage_id_seq OWNED BY public.homepage.id;


--
-- Name: homepage_process_steps; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.homepage_process_steps (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    title character varying NOT NULL,
    text character varying NOT NULL
);


--
-- Name: leads; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.leads (
    id integer NOT NULL,
    status public.enum_leads_status DEFAULT 'new'::public.enum_leads_status,
    name character varying NOT NULL,
    phone character varying NOT NULL,
    email character varying,
    service character varying,
    address character varying,
    message character varying,
    source_path character varying,
    form_location public.enum_leads_form_location,
    utm_source character varying,
    utm_medium character varying,
    utm_campaign character varying,
    utm_term character varying,
    utm_content character varying,
    email_sent boolean DEFAULT false,
    ip character varying,
    user_agent character varying,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


--
-- Name: leads_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.leads_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: leads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.leads_id_seq OWNED BY public.leads.id;


--
-- Name: media; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.media (
    id integer NOT NULL,
    alt character varying,
    caption jsonb,
    folder_id integer,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    url character varying,
    thumbnail_u_r_l character varying,
    filename character varying,
    mime_type character varying,
    filesize numeric,
    width numeric,
    height numeric,
    focal_x numeric,
    focal_y numeric,
    sizes_thumbnail_url character varying,
    sizes_thumbnail_width numeric,
    sizes_thumbnail_height numeric,
    sizes_thumbnail_mime_type character varying,
    sizes_thumbnail_filesize numeric,
    sizes_thumbnail_filename character varying,
    sizes_square_url character varying,
    sizes_square_width numeric,
    sizes_square_height numeric,
    sizes_square_mime_type character varying,
    sizes_square_filesize numeric,
    sizes_square_filename character varying,
    sizes_small_url character varying,
    sizes_small_width numeric,
    sizes_small_height numeric,
    sizes_small_mime_type character varying,
    sizes_small_filesize numeric,
    sizes_small_filename character varying,
    sizes_medium_url character varying,
    sizes_medium_width numeric,
    sizes_medium_height numeric,
    sizes_medium_mime_type character varying,
    sizes_medium_filesize numeric,
    sizes_medium_filename character varying,
    sizes_large_url character varying,
    sizes_large_width numeric,
    sizes_large_height numeric,
    sizes_large_mime_type character varying,
    sizes_large_filesize numeric,
    sizes_large_filename character varying,
    sizes_xlarge_url character varying,
    sizes_xlarge_width numeric,
    sizes_xlarge_height numeric,
    sizes_xlarge_mime_type character varying,
    sizes_xlarge_filesize numeric,
    sizes_xlarge_filename character varying,
    sizes_og_url character varying,
    sizes_og_width numeric,
    sizes_og_height numeric,
    sizes_og_mime_type character varying,
    sizes_og_filesize numeric,
    sizes_og_filename character varying
);


--
-- Name: media_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.media_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: media_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.media_id_seq OWNED BY public.media.id;


--
-- Name: pages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pages (
    id integer NOT NULL,
    title character varying,
    hero_type public.enum_pages_hero_type DEFAULT 'lowImpact'::public.enum_pages_hero_type,
    hero_rich_text jsonb,
    hero_media_id integer,
    meta_title character varying,
    meta_image_id integer,
    meta_description character varying,
    published_at timestamp(3) with time zone,
    generate_slug boolean DEFAULT true,
    slug character varying,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    _status public.enum_pages_status DEFAULT 'draft'::public.enum_pages_status
);


--
-- Name: pages_blocks_archive; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pages_blocks_archive (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id character varying NOT NULL,
    intro_content jsonb,
    populate_by public.enum_pages_blocks_archive_populate_by DEFAULT 'collection'::public.enum_pages_blocks_archive_populate_by,
    relation_to public.enum_pages_blocks_archive_relation_to DEFAULT 'posts'::public.enum_pages_blocks_archive_relation_to,
    "limit" numeric DEFAULT 10,
    block_name character varying
);


--
-- Name: pages_blocks_content; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pages_blocks_content (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id character varying NOT NULL,
    block_name character varying
);


--
-- Name: pages_blocks_content_columns; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pages_blocks_content_columns (
    _order integer NOT NULL,
    _parent_id character varying NOT NULL,
    id character varying NOT NULL,
    size public.enum_pages_blocks_content_columns_size DEFAULT 'oneThird'::public.enum_pages_blocks_content_columns_size,
    rich_text jsonb,
    enable_link boolean,
    link_type public.enum_pages_blocks_content_columns_link_type DEFAULT 'reference'::public.enum_pages_blocks_content_columns_link_type,
    link_new_tab boolean,
    link_url character varying,
    link_label character varying,
    link_appearance public.enum_pages_blocks_content_columns_link_appearance DEFAULT 'default'::public.enum_pages_blocks_content_columns_link_appearance
);


--
-- Name: pages_blocks_cta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pages_blocks_cta (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id character varying NOT NULL,
    rich_text jsonb,
    block_name character varying
);


--
-- Name: pages_blocks_cta_links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pages_blocks_cta_links (
    _order integer NOT NULL,
    _parent_id character varying NOT NULL,
    id character varying NOT NULL,
    link_type public.enum_pages_blocks_cta_links_link_type DEFAULT 'reference'::public.enum_pages_blocks_cta_links_link_type,
    link_new_tab boolean,
    link_url character varying,
    link_label character varying,
    link_appearance public.enum_pages_blocks_cta_links_link_appearance DEFAULT 'default'::public.enum_pages_blocks_cta_links_link_appearance
);


--
-- Name: pages_blocks_media_block; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pages_blocks_media_block (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id character varying NOT NULL,
    media_id integer,
    block_name character varying
);


--
-- Name: pages_hero_links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pages_hero_links (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    link_type public.enum_pages_hero_links_link_type DEFAULT 'reference'::public.enum_pages_hero_links_link_type,
    link_new_tab boolean,
    link_url character varying,
    link_label character varying,
    link_appearance public.enum_pages_hero_links_link_appearance DEFAULT 'default'::public.enum_pages_hero_links_link_appearance
);


--
-- Name: pages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pages_id_seq OWNED BY public.pages.id;


--
-- Name: pages_rels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pages_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    pages_id integer,
    posts_id integer,
    categories_id integer
);


--
-- Name: pages_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pages_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pages_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pages_rels_id_seq OWNED BY public.pages_rels.id;


--
-- Name: payload_folders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.payload_folders (
    id integer NOT NULL,
    name character varying NOT NULL,
    folder_id integer,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


--
-- Name: payload_folders_folder_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.payload_folders_folder_type (
    "order" integer NOT NULL,
    parent_id integer NOT NULL,
    value public.enum_payload_folders_folder_type,
    id integer NOT NULL
);


--
-- Name: payload_folders_folder_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.payload_folders_folder_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: payload_folders_folder_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.payload_folders_folder_type_id_seq OWNED BY public.payload_folders_folder_type.id;


--
-- Name: payload_folders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.payload_folders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: payload_folders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.payload_folders_id_seq OWNED BY public.payload_folders.id;


--
-- Name: payload_jobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.payload_jobs (
    id integer NOT NULL,
    input jsonb,
    completed_at timestamp(3) with time zone,
    total_tried numeric DEFAULT 0,
    has_error boolean DEFAULT false,
    error jsonb,
    task_slug public.enum_payload_jobs_task_slug,
    queue character varying DEFAULT 'default'::character varying,
    wait_until timestamp(3) with time zone,
    processing boolean DEFAULT false,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


--
-- Name: payload_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.payload_jobs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: payload_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.payload_jobs_id_seq OWNED BY public.payload_jobs.id;


--
-- Name: payload_jobs_log; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.payload_jobs_log (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    executed_at timestamp(3) with time zone NOT NULL,
    completed_at timestamp(3) with time zone NOT NULL,
    task_slug public.enum_payload_jobs_log_task_slug NOT NULL,
    task_i_d character varying NOT NULL,
    input jsonb,
    output jsonb,
    state public.enum_payload_jobs_log_state NOT NULL,
    error jsonb
);


--
-- Name: payload_kv; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.payload_kv (
    id integer NOT NULL,
    key character varying NOT NULL,
    data jsonb NOT NULL
);


--
-- Name: payload_kv_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.payload_kv_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: payload_kv_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.payload_kv_id_seq OWNED BY public.payload_kv.id;


--
-- Name: payload_locked_documents; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.payload_locked_documents (
    id integer NOT NULL,
    global_slug character varying,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


--
-- Name: payload_locked_documents_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.payload_locked_documents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: payload_locked_documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.payload_locked_documents_id_seq OWNED BY public.payload_locked_documents.id;


--
-- Name: payload_locked_documents_rels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.payload_locked_documents_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    services_id integer,
    cities_id integer,
    posts_id integer,
    pages_id integer,
    testimonials_id integer,
    leads_id integer,
    media_id integer,
    categories_id integer,
    users_id integer,
    redirects_id integer,
    payload_folders_id integer
);


--
-- Name: payload_locked_documents_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.payload_locked_documents_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: payload_locked_documents_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.payload_locked_documents_rels_id_seq OWNED BY public.payload_locked_documents_rels.id;


--
-- Name: payload_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.payload_migrations (
    id integer NOT NULL,
    name character varying,
    batch numeric,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


--
-- Name: payload_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.payload_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: payload_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.payload_migrations_id_seq OWNED BY public.payload_migrations.id;


--
-- Name: payload_preferences; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.payload_preferences (
    id integer NOT NULL,
    key character varying,
    value jsonb,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


--
-- Name: payload_preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.payload_preferences_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: payload_preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.payload_preferences_id_seq OWNED BY public.payload_preferences.id;


--
-- Name: payload_preferences_rels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.payload_preferences_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    users_id integer
);


--
-- Name: payload_preferences_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.payload_preferences_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: payload_preferences_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.payload_preferences_rels_id_seq OWNED BY public.payload_preferences_rels.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.posts (
    id integer NOT NULL,
    title character varying,
    hero_image_id integer,
    content jsonb,
    meta_title character varying,
    meta_image_id integer,
    meta_description character varying,
    published_at timestamp(3) with time zone,
    generate_slug boolean DEFAULT true,
    slug character varying,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    _status public.enum_posts_status DEFAULT 'draft'::public.enum_posts_status
);


--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: posts_populated_authors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.posts_populated_authors (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    name character varying
);


--
-- Name: posts_rels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.posts_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    posts_id integer,
    categories_id integer,
    users_id integer
);


--
-- Name: posts_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.posts_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: posts_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.posts_rels_id_seq OWNED BY public.posts_rels.id;


--
-- Name: redirects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.redirects (
    id integer NOT NULL,
    "from" character varying NOT NULL,
    to_type public.enum_redirects_to_type DEFAULT 'reference'::public.enum_redirects_to_type,
    to_url character varying,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


--
-- Name: redirects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.redirects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: redirects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.redirects_id_seq OWNED BY public.redirects.id;


--
-- Name: redirects_rels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.redirects_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    pages_id integer,
    posts_id integer,
    services_id integer,
    cities_id integer
);


--
-- Name: redirects_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.redirects_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: redirects_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.redirects_rels_id_seq OWNED BY public.redirects_rels.id;


--
-- Name: services; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.services (
    id integer NOT NULL,
    title character varying,
    nav_label character varying,
    hero_subheading character varying,
    hero_image_id integer,
    show_rating_badge boolean DEFAULT true,
    short_description character varying,
    card_image_id integer,
    intro jsonb,
    meta_title character varying,
    meta_image_id integer,
    meta_description character varying,
    display_order numeric DEFAULT 0,
    generate_slug boolean DEFAULT true,
    slug character varying,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    _status public.enum_services_status DEFAULT 'draft'::public.enum_services_status
);


--
-- Name: services_benefits; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.services_benefits (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    title character varying,
    text character varying
);


--
-- Name: services_faqs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.services_faqs (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    question character varying,
    answer jsonb
);


--
-- Name: services_features; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.services_features (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    title character varying,
    text character varying
);


--
-- Name: services_gallery; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.services_gallery (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    image_id integer
);


--
-- Name: services_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.services_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.services_id_seq OWNED BY public.services.id;


--
-- Name: services_rels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.services_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    posts_id integer
);


--
-- Name: services_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.services_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: services_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.services_rels_id_seq OWNED BY public.services_rels.id;


--
-- Name: site_settings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.site_settings (
    id integer NOT NULL,
    business_name character varying DEFAULT '911 Construction & Electric Inc.'::character varying NOT NULL,
    license_number character varying DEFAULT '1027421'::character varying NOT NULL,
    phone character varying DEFAULT '747-255-8595'::character varying NOT NULL,
    email character varying DEFAULT 'info@911electrics.com'::character varying NOT NULL,
    address_street character varying DEFAULT '1308 East Colorado Blvd Ste 141'::character varying,
    address_city character varying DEFAULT 'Pasadena'::character varying,
    address_state character varying DEFAULT 'CA'::character varying,
    address_zip character varying DEFAULT '91106'::character varying,
    geo_lat numeric DEFAULT 34.1453,
    geo_lng numeric DEFAULT '-118.1182'::numeric,
    hours_label character varying DEFAULT '24/7 Emergency Service'::character varying,
    aggregate_rating_value numeric DEFAULT 5,
    aggregate_rating_count numeric DEFAULT 0,
    logo_id integer,
    default_o_g_image_id integer,
    updated_at timestamp(3) with time zone,
    created_at timestamp(3) with time zone
);


--
-- Name: site_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.site_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: site_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.site_settings_id_seq OWNED BY public.site_settings.id;


--
-- Name: site_settings_socials; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.site_settings_socials (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    platform public.enum_site_settings_socials_platform NOT NULL,
    url character varying NOT NULL
);


--
-- Name: testimonials; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.testimonials (
    id integer NOT NULL,
    author_name character varying NOT NULL,
    location character varying,
    rating numeric DEFAULT 5 NOT NULL,
    text character varying NOT NULL,
    source public.enum_testimonials_source DEFAULT 'google'::public.enum_testimonials_source,
    date timestamp(3) with time zone,
    featured boolean DEFAULT false,
    external_id character varying,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


--
-- Name: testimonials_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.testimonials_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: testimonials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.testimonials_id_seq OWNED BY public.testimonials.id;


--
-- Name: testimonials_rels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.testimonials_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    cities_id integer
);


--
-- Name: testimonials_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.testimonials_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: testimonials_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.testimonials_rels_id_seq OWNED BY public.testimonials_rels.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    email character varying NOT NULL,
    reset_password_token character varying,
    reset_password_expiration timestamp(3) with time zone,
    salt character varying,
    hash character varying,
    login_attempts numeric DEFAULT 0,
    lock_until timestamp(3) with time zone
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: users_sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users_sessions (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    created_at timestamp(3) with time zone,
    expires_at timestamp(3) with time zone NOT NULL
);


--
-- Name: _cities_v id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._cities_v ALTER COLUMN id SET DEFAULT nextval('public._cities_v_id_seq'::regclass);


--
-- Name: _cities_v_rels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._cities_v_rels ALTER COLUMN id SET DEFAULT nextval('public._cities_v_rels_id_seq'::regclass);


--
-- Name: _cities_v_version_faqs_override id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._cities_v_version_faqs_override ALTER COLUMN id SET DEFAULT nextval('public._cities_v_version_faqs_override_id_seq'::regclass);


--
-- Name: _cities_v_version_neighborhoods id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._cities_v_version_neighborhoods ALTER COLUMN id SET DEFAULT nextval('public._cities_v_version_neighborhoods_id_seq'::regclass);


--
-- Name: _cities_v_version_zip_codes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._cities_v_version_zip_codes ALTER COLUMN id SET DEFAULT nextval('public._cities_v_version_zip_codes_id_seq'::regclass);


--
-- Name: _pages_v id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v ALTER COLUMN id SET DEFAULT nextval('public._pages_v_id_seq'::regclass);


--
-- Name: _pages_v_blocks_archive id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v_blocks_archive ALTER COLUMN id SET DEFAULT nextval('public._pages_v_blocks_archive_id_seq'::regclass);


--
-- Name: _pages_v_blocks_content id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v_blocks_content ALTER COLUMN id SET DEFAULT nextval('public._pages_v_blocks_content_id_seq'::regclass);


--
-- Name: _pages_v_blocks_content_columns id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v_blocks_content_columns ALTER COLUMN id SET DEFAULT nextval('public._pages_v_blocks_content_columns_id_seq'::regclass);


--
-- Name: _pages_v_blocks_cta id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v_blocks_cta ALTER COLUMN id SET DEFAULT nextval('public._pages_v_blocks_cta_id_seq'::regclass);


--
-- Name: _pages_v_blocks_cta_links id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v_blocks_cta_links ALTER COLUMN id SET DEFAULT nextval('public._pages_v_blocks_cta_links_id_seq'::regclass);


--
-- Name: _pages_v_blocks_media_block id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v_blocks_media_block ALTER COLUMN id SET DEFAULT nextval('public._pages_v_blocks_media_block_id_seq'::regclass);


--
-- Name: _pages_v_rels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v_rels ALTER COLUMN id SET DEFAULT nextval('public._pages_v_rels_id_seq'::regclass);


--
-- Name: _pages_v_version_hero_links id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v_version_hero_links ALTER COLUMN id SET DEFAULT nextval('public._pages_v_version_hero_links_id_seq'::regclass);


--
-- Name: _posts_v id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._posts_v ALTER COLUMN id SET DEFAULT nextval('public._posts_v_id_seq'::regclass);


--
-- Name: _posts_v_rels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._posts_v_rels ALTER COLUMN id SET DEFAULT nextval('public._posts_v_rels_id_seq'::regclass);


--
-- Name: _posts_v_version_populated_authors id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._posts_v_version_populated_authors ALTER COLUMN id SET DEFAULT nextval('public._posts_v_version_populated_authors_id_seq'::regclass);


--
-- Name: _services_v id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._services_v ALTER COLUMN id SET DEFAULT nextval('public._services_v_id_seq'::regclass);


--
-- Name: _services_v_rels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._services_v_rels ALTER COLUMN id SET DEFAULT nextval('public._services_v_rels_id_seq'::regclass);


--
-- Name: _services_v_version_benefits id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._services_v_version_benefits ALTER COLUMN id SET DEFAULT nextval('public._services_v_version_benefits_id_seq'::regclass);


--
-- Name: _services_v_version_faqs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._services_v_version_faqs ALTER COLUMN id SET DEFAULT nextval('public._services_v_version_faqs_id_seq'::regclass);


--
-- Name: _services_v_version_features id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._services_v_version_features ALTER COLUMN id SET DEFAULT nextval('public._services_v_version_features_id_seq'::regclass);


--
-- Name: _services_v_version_gallery id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._services_v_version_gallery ALTER COLUMN id SET DEFAULT nextval('public._services_v_version_gallery_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- Name: cities_rels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities_rels ALTER COLUMN id SET DEFAULT nextval('public.cities_rels_id_seq'::regclass);


--
-- Name: city_page_template id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.city_page_template ALTER COLUMN id SET DEFAULT nextval('public.city_page_template_id_seq'::regclass);


--
-- Name: homepage id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.homepage ALTER COLUMN id SET DEFAULT nextval('public.homepage_id_seq'::regclass);


--
-- Name: leads id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.leads ALTER COLUMN id SET DEFAULT nextval('public.leads_id_seq'::regclass);


--
-- Name: media id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.media ALTER COLUMN id SET DEFAULT nextval('public.media_id_seq'::regclass);


--
-- Name: pages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages ALTER COLUMN id SET DEFAULT nextval('public.pages_id_seq'::regclass);


--
-- Name: pages_rels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_rels ALTER COLUMN id SET DEFAULT nextval('public.pages_rels_id_seq'::regclass);


--
-- Name: payload_folders id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payload_folders ALTER COLUMN id SET DEFAULT nextval('public.payload_folders_id_seq'::regclass);


--
-- Name: payload_folders_folder_type id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payload_folders_folder_type ALTER COLUMN id SET DEFAULT nextval('public.payload_folders_folder_type_id_seq'::regclass);


--
-- Name: payload_jobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payload_jobs ALTER COLUMN id SET DEFAULT nextval('public.payload_jobs_id_seq'::regclass);


--
-- Name: payload_kv id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payload_kv ALTER COLUMN id SET DEFAULT nextval('public.payload_kv_id_seq'::regclass);


--
-- Name: payload_locked_documents id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payload_locked_documents ALTER COLUMN id SET DEFAULT nextval('public.payload_locked_documents_id_seq'::regclass);


--
-- Name: payload_locked_documents_rels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payload_locked_documents_rels ALTER COLUMN id SET DEFAULT nextval('public.payload_locked_documents_rels_id_seq'::regclass);


--
-- Name: payload_migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payload_migrations ALTER COLUMN id SET DEFAULT nextval('public.payload_migrations_id_seq'::regclass);


--
-- Name: payload_preferences id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payload_preferences ALTER COLUMN id SET DEFAULT nextval('public.payload_preferences_id_seq'::regclass);


--
-- Name: payload_preferences_rels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payload_preferences_rels ALTER COLUMN id SET DEFAULT nextval('public.payload_preferences_rels_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: posts_rels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts_rels ALTER COLUMN id SET DEFAULT nextval('public.posts_rels_id_seq'::regclass);


--
-- Name: redirects id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.redirects ALTER COLUMN id SET DEFAULT nextval('public.redirects_id_seq'::regclass);


--
-- Name: redirects_rels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.redirects_rels ALTER COLUMN id SET DEFAULT nextval('public.redirects_rels_id_seq'::regclass);


--
-- Name: services id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.services ALTER COLUMN id SET DEFAULT nextval('public.services_id_seq'::regclass);


--
-- Name: services_rels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.services_rels ALTER COLUMN id SET DEFAULT nextval('public.services_rels_id_seq'::regclass);


--
-- Name: site_settings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.site_settings ALTER COLUMN id SET DEFAULT nextval('public.site_settings_id_seq'::regclass);


--
-- Name: testimonials id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.testimonials ALTER COLUMN id SET DEFAULT nextval('public.testimonials_id_seq'::regclass);


--
-- Name: testimonials_rels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.testimonials_rels ALTER COLUMN id SET DEFAULT nextval('public.testimonials_rels_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: _cities_v _cities_v_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._cities_v
    ADD CONSTRAINT _cities_v_pkey PRIMARY KEY (id);


--
-- Name: _cities_v_rels _cities_v_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._cities_v_rels
    ADD CONSTRAINT _cities_v_rels_pkey PRIMARY KEY (id);


--
-- Name: _cities_v_version_faqs_override _cities_v_version_faqs_override_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._cities_v_version_faqs_override
    ADD CONSTRAINT _cities_v_version_faqs_override_pkey PRIMARY KEY (id);


--
-- Name: _cities_v_version_neighborhoods _cities_v_version_neighborhoods_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._cities_v_version_neighborhoods
    ADD CONSTRAINT _cities_v_version_neighborhoods_pkey PRIMARY KEY (id);


--
-- Name: _cities_v_version_zip_codes _cities_v_version_zip_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._cities_v_version_zip_codes
    ADD CONSTRAINT _cities_v_version_zip_codes_pkey PRIMARY KEY (id);


--
-- Name: _pages_v_blocks_archive _pages_v_blocks_archive_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v_blocks_archive
    ADD CONSTRAINT _pages_v_blocks_archive_pkey PRIMARY KEY (id);


--
-- Name: _pages_v_blocks_content_columns _pages_v_blocks_content_columns_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v_blocks_content_columns
    ADD CONSTRAINT _pages_v_blocks_content_columns_pkey PRIMARY KEY (id);


--
-- Name: _pages_v_blocks_content _pages_v_blocks_content_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v_blocks_content
    ADD CONSTRAINT _pages_v_blocks_content_pkey PRIMARY KEY (id);


--
-- Name: _pages_v_blocks_cta_links _pages_v_blocks_cta_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v_blocks_cta_links
    ADD CONSTRAINT _pages_v_blocks_cta_links_pkey PRIMARY KEY (id);


--
-- Name: _pages_v_blocks_cta _pages_v_blocks_cta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v_blocks_cta
    ADD CONSTRAINT _pages_v_blocks_cta_pkey PRIMARY KEY (id);


--
-- Name: _pages_v_blocks_media_block _pages_v_blocks_media_block_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v_blocks_media_block
    ADD CONSTRAINT _pages_v_blocks_media_block_pkey PRIMARY KEY (id);


--
-- Name: _pages_v _pages_v_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v
    ADD CONSTRAINT _pages_v_pkey PRIMARY KEY (id);


--
-- Name: _pages_v_rels _pages_v_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v_rels
    ADD CONSTRAINT _pages_v_rels_pkey PRIMARY KEY (id);


--
-- Name: _pages_v_version_hero_links _pages_v_version_hero_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v_version_hero_links
    ADD CONSTRAINT _pages_v_version_hero_links_pkey PRIMARY KEY (id);


--
-- Name: _posts_v _posts_v_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._posts_v
    ADD CONSTRAINT _posts_v_pkey PRIMARY KEY (id);


--
-- Name: _posts_v_rels _posts_v_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._posts_v_rels
    ADD CONSTRAINT _posts_v_rels_pkey PRIMARY KEY (id);


--
-- Name: _posts_v_version_populated_authors _posts_v_version_populated_authors_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._posts_v_version_populated_authors
    ADD CONSTRAINT _posts_v_version_populated_authors_pkey PRIMARY KEY (id);


--
-- Name: _services_v _services_v_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._services_v
    ADD CONSTRAINT _services_v_pkey PRIMARY KEY (id);


--
-- Name: _services_v_rels _services_v_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._services_v_rels
    ADD CONSTRAINT _services_v_rels_pkey PRIMARY KEY (id);


--
-- Name: _services_v_version_benefits _services_v_version_benefits_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._services_v_version_benefits
    ADD CONSTRAINT _services_v_version_benefits_pkey PRIMARY KEY (id);


--
-- Name: _services_v_version_faqs _services_v_version_faqs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._services_v_version_faqs
    ADD CONSTRAINT _services_v_version_faqs_pkey PRIMARY KEY (id);


--
-- Name: _services_v_version_features _services_v_version_features_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._services_v_version_features
    ADD CONSTRAINT _services_v_version_features_pkey PRIMARY KEY (id);


--
-- Name: _services_v_version_gallery _services_v_version_gallery_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._services_v_version_gallery
    ADD CONSTRAINT _services_v_version_gallery_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: cities_faqs_override cities_faqs_override_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities_faqs_override
    ADD CONSTRAINT cities_faqs_override_pkey PRIMARY KEY (id);


--
-- Name: cities_neighborhoods cities_neighborhoods_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities_neighborhoods
    ADD CONSTRAINT cities_neighborhoods_pkey PRIMARY KEY (id);


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: cities_rels cities_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities_rels
    ADD CONSTRAINT cities_rels_pkey PRIMARY KEY (id);


--
-- Name: cities_zip_codes cities_zip_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities_zip_codes
    ADD CONSTRAINT cities_zip_codes_pkey PRIMARY KEY (id);


--
-- Name: city_page_template_differentiators city_page_template_differentiators_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.city_page_template_differentiators
    ADD CONSTRAINT city_page_template_differentiators_pkey PRIMARY KEY (id);


--
-- Name: city_page_template_faqs city_page_template_faqs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.city_page_template_faqs
    ADD CONSTRAINT city_page_template_faqs_pkey PRIMARY KEY (id);


--
-- Name: city_page_template city_page_template_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.city_page_template
    ADD CONSTRAINT city_page_template_pkey PRIMARY KEY (id);


--
-- Name: city_page_template_process_steps city_page_template_process_steps_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.city_page_template_process_steps
    ADD CONSTRAINT city_page_template_process_steps_pkey PRIMARY KEY (id);


--
-- Name: homepage_differentiators homepage_differentiators_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.homepage_differentiators
    ADD CONSTRAINT homepage_differentiators_pkey PRIMARY KEY (id);


--
-- Name: homepage_faqs homepage_faqs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.homepage_faqs
    ADD CONSTRAINT homepage_faqs_pkey PRIMARY KEY (id);


--
-- Name: homepage homepage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.homepage
    ADD CONSTRAINT homepage_pkey PRIMARY KEY (id);


--
-- Name: homepage_process_steps homepage_process_steps_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.homepage_process_steps
    ADD CONSTRAINT homepage_process_steps_pkey PRIMARY KEY (id);


--
-- Name: leads leads_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.leads
    ADD CONSTRAINT leads_pkey PRIMARY KEY (id);


--
-- Name: media media_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.media
    ADD CONSTRAINT media_pkey PRIMARY KEY (id);


--
-- Name: pages_blocks_archive pages_blocks_archive_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_blocks_archive
    ADD CONSTRAINT pages_blocks_archive_pkey PRIMARY KEY (id);


--
-- Name: pages_blocks_content_columns pages_blocks_content_columns_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_blocks_content_columns
    ADD CONSTRAINT pages_blocks_content_columns_pkey PRIMARY KEY (id);


--
-- Name: pages_blocks_content pages_blocks_content_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_blocks_content
    ADD CONSTRAINT pages_blocks_content_pkey PRIMARY KEY (id);


--
-- Name: pages_blocks_cta_links pages_blocks_cta_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_blocks_cta_links
    ADD CONSTRAINT pages_blocks_cta_links_pkey PRIMARY KEY (id);


--
-- Name: pages_blocks_cta pages_blocks_cta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_blocks_cta
    ADD CONSTRAINT pages_blocks_cta_pkey PRIMARY KEY (id);


--
-- Name: pages_blocks_media_block pages_blocks_media_block_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_blocks_media_block
    ADD CONSTRAINT pages_blocks_media_block_pkey PRIMARY KEY (id);


--
-- Name: pages_hero_links pages_hero_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_hero_links
    ADD CONSTRAINT pages_hero_links_pkey PRIMARY KEY (id);


--
-- Name: pages pages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


--
-- Name: pages_rels pages_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_rels
    ADD CONSTRAINT pages_rels_pkey PRIMARY KEY (id);


--
-- Name: payload_folders_folder_type payload_folders_folder_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payload_folders_folder_type
    ADD CONSTRAINT payload_folders_folder_type_pkey PRIMARY KEY (id);


--
-- Name: payload_folders payload_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payload_folders
    ADD CONSTRAINT payload_folders_pkey PRIMARY KEY (id);


--
-- Name: payload_jobs_log payload_jobs_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payload_jobs_log
    ADD CONSTRAINT payload_jobs_log_pkey PRIMARY KEY (id);


--
-- Name: payload_jobs payload_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payload_jobs
    ADD CONSTRAINT payload_jobs_pkey PRIMARY KEY (id);


--
-- Name: payload_kv payload_kv_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payload_kv
    ADD CONSTRAINT payload_kv_pkey PRIMARY KEY (id);


--
-- Name: payload_locked_documents payload_locked_documents_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payload_locked_documents
    ADD CONSTRAINT payload_locked_documents_pkey PRIMARY KEY (id);


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_pkey PRIMARY KEY (id);


--
-- Name: payload_migrations payload_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payload_migrations
    ADD CONSTRAINT payload_migrations_pkey PRIMARY KEY (id);


--
-- Name: payload_preferences payload_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payload_preferences
    ADD CONSTRAINT payload_preferences_pkey PRIMARY KEY (id);


--
-- Name: payload_preferences_rels payload_preferences_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payload_preferences_rels
    ADD CONSTRAINT payload_preferences_rels_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: posts_populated_authors posts_populated_authors_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts_populated_authors
    ADD CONSTRAINT posts_populated_authors_pkey PRIMARY KEY (id);


--
-- Name: posts_rels posts_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts_rels
    ADD CONSTRAINT posts_rels_pkey PRIMARY KEY (id);


--
-- Name: redirects redirects_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.redirects
    ADD CONSTRAINT redirects_pkey PRIMARY KEY (id);


--
-- Name: redirects_rels redirects_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.redirects_rels
    ADD CONSTRAINT redirects_rels_pkey PRIMARY KEY (id);


--
-- Name: services_benefits services_benefits_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.services_benefits
    ADD CONSTRAINT services_benefits_pkey PRIMARY KEY (id);


--
-- Name: services_faqs services_faqs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.services_faqs
    ADD CONSTRAINT services_faqs_pkey PRIMARY KEY (id);


--
-- Name: services_features services_features_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.services_features
    ADD CONSTRAINT services_features_pkey PRIMARY KEY (id);


--
-- Name: services_gallery services_gallery_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.services_gallery
    ADD CONSTRAINT services_gallery_pkey PRIMARY KEY (id);


--
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- Name: services_rels services_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.services_rels
    ADD CONSTRAINT services_rels_pkey PRIMARY KEY (id);


--
-- Name: site_settings site_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.site_settings
    ADD CONSTRAINT site_settings_pkey PRIMARY KEY (id);


--
-- Name: site_settings_socials site_settings_socials_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.site_settings_socials
    ADD CONSTRAINT site_settings_socials_pkey PRIMARY KEY (id);


--
-- Name: testimonials testimonials_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.testimonials
    ADD CONSTRAINT testimonials_pkey PRIMARY KEY (id);


--
-- Name: testimonials_rels testimonials_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.testimonials_rels
    ADD CONSTRAINT testimonials_rels_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users_sessions users_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_sessions
    ADD CONSTRAINT users_sessions_pkey PRIMARY KEY (id);


--
-- Name: _cities_v_autosave_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _cities_v_autosave_idx ON public._cities_v USING btree (autosave);


--
-- Name: _cities_v_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _cities_v_created_at_idx ON public._cities_v USING btree (created_at);


--
-- Name: _cities_v_latest_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _cities_v_latest_idx ON public._cities_v USING btree (latest);


--
-- Name: _cities_v_parent_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _cities_v_parent_idx ON public._cities_v USING btree (parent_id);


--
-- Name: _cities_v_rels_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _cities_v_rels_order_idx ON public._cities_v_rels USING btree ("order");


--
-- Name: _cities_v_rels_parent_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _cities_v_rels_parent_idx ON public._cities_v_rels USING btree (parent_id);


--
-- Name: _cities_v_rels_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _cities_v_rels_path_idx ON public._cities_v_rels USING btree (path);


--
-- Name: _cities_v_rels_testimonials_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _cities_v_rels_testimonials_id_idx ON public._cities_v_rels USING btree (testimonials_id);


--
-- Name: _cities_v_updated_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _cities_v_updated_at_idx ON public._cities_v USING btree (updated_at);


--
-- Name: _cities_v_version_faqs_override_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _cities_v_version_faqs_override_order_idx ON public._cities_v_version_faqs_override USING btree (_order);


--
-- Name: _cities_v_version_faqs_override_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _cities_v_version_faqs_override_parent_id_idx ON public._cities_v_version_faqs_override USING btree (_parent_id);


--
-- Name: _cities_v_version_meta_version_meta_image_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _cities_v_version_meta_version_meta_image_idx ON public._cities_v USING btree (version_meta_image_id);


--
-- Name: _cities_v_version_neighborhoods_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _cities_v_version_neighborhoods_order_idx ON public._cities_v_version_neighborhoods USING btree (_order);


--
-- Name: _cities_v_version_neighborhoods_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _cities_v_version_neighborhoods_parent_id_idx ON public._cities_v_version_neighborhoods USING btree (_parent_id);


--
-- Name: _cities_v_version_version__status_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _cities_v_version_version__status_idx ON public._cities_v USING btree (version__status);


--
-- Name: _cities_v_version_version_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _cities_v_version_version_created_at_idx ON public._cities_v USING btree (version_created_at);


--
-- Name: _cities_v_version_version_slug_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _cities_v_version_version_slug_idx ON public._cities_v USING btree (version_slug);


--
-- Name: _cities_v_version_version_updated_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _cities_v_version_version_updated_at_idx ON public._cities_v USING btree (version_updated_at);


--
-- Name: _cities_v_version_zip_codes_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _cities_v_version_zip_codes_order_idx ON public._cities_v_version_zip_codes USING btree (_order);


--
-- Name: _cities_v_version_zip_codes_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _cities_v_version_zip_codes_parent_id_idx ON public._cities_v_version_zip_codes USING btree (_parent_id);


--
-- Name: _pages_v_autosave_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_autosave_idx ON public._pages_v USING btree (autosave);


--
-- Name: _pages_v_blocks_archive_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_blocks_archive_order_idx ON public._pages_v_blocks_archive USING btree (_order);


--
-- Name: _pages_v_blocks_archive_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_blocks_archive_parent_id_idx ON public._pages_v_blocks_archive USING btree (_parent_id);


--
-- Name: _pages_v_blocks_archive_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_blocks_archive_path_idx ON public._pages_v_blocks_archive USING btree (_path);


--
-- Name: _pages_v_blocks_content_columns_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_blocks_content_columns_order_idx ON public._pages_v_blocks_content_columns USING btree (_order);


--
-- Name: _pages_v_blocks_content_columns_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_blocks_content_columns_parent_id_idx ON public._pages_v_blocks_content_columns USING btree (_parent_id);


--
-- Name: _pages_v_blocks_content_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_blocks_content_order_idx ON public._pages_v_blocks_content USING btree (_order);


--
-- Name: _pages_v_blocks_content_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_blocks_content_parent_id_idx ON public._pages_v_blocks_content USING btree (_parent_id);


--
-- Name: _pages_v_blocks_content_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_blocks_content_path_idx ON public._pages_v_blocks_content USING btree (_path);


--
-- Name: _pages_v_blocks_cta_links_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_blocks_cta_links_order_idx ON public._pages_v_blocks_cta_links USING btree (_order);


--
-- Name: _pages_v_blocks_cta_links_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_blocks_cta_links_parent_id_idx ON public._pages_v_blocks_cta_links USING btree (_parent_id);


--
-- Name: _pages_v_blocks_cta_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_blocks_cta_order_idx ON public._pages_v_blocks_cta USING btree (_order);


--
-- Name: _pages_v_blocks_cta_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_blocks_cta_parent_id_idx ON public._pages_v_blocks_cta USING btree (_parent_id);


--
-- Name: _pages_v_blocks_cta_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_blocks_cta_path_idx ON public._pages_v_blocks_cta USING btree (_path);


--
-- Name: _pages_v_blocks_media_block_media_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_blocks_media_block_media_idx ON public._pages_v_blocks_media_block USING btree (media_id);


--
-- Name: _pages_v_blocks_media_block_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_blocks_media_block_order_idx ON public._pages_v_blocks_media_block USING btree (_order);


--
-- Name: _pages_v_blocks_media_block_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_blocks_media_block_parent_id_idx ON public._pages_v_blocks_media_block USING btree (_parent_id);


--
-- Name: _pages_v_blocks_media_block_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_blocks_media_block_path_idx ON public._pages_v_blocks_media_block USING btree (_path);


--
-- Name: _pages_v_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_created_at_idx ON public._pages_v USING btree (created_at);


--
-- Name: _pages_v_latest_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_latest_idx ON public._pages_v USING btree (latest);


--
-- Name: _pages_v_parent_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_parent_idx ON public._pages_v USING btree (parent_id);


--
-- Name: _pages_v_rels_categories_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_rels_categories_id_idx ON public._pages_v_rels USING btree (categories_id);


--
-- Name: _pages_v_rels_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_rels_order_idx ON public._pages_v_rels USING btree ("order");


--
-- Name: _pages_v_rels_pages_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_rels_pages_id_idx ON public._pages_v_rels USING btree (pages_id);


--
-- Name: _pages_v_rels_parent_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_rels_parent_idx ON public._pages_v_rels USING btree (parent_id);


--
-- Name: _pages_v_rels_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_rels_path_idx ON public._pages_v_rels USING btree (path);


--
-- Name: _pages_v_rels_posts_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_rels_posts_id_idx ON public._pages_v_rels USING btree (posts_id);


--
-- Name: _pages_v_updated_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_updated_at_idx ON public._pages_v USING btree (updated_at);


--
-- Name: _pages_v_version_hero_links_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_version_hero_links_order_idx ON public._pages_v_version_hero_links USING btree (_order);


--
-- Name: _pages_v_version_hero_links_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_version_hero_links_parent_id_idx ON public._pages_v_version_hero_links USING btree (_parent_id);


--
-- Name: _pages_v_version_hero_version_hero_media_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_version_hero_version_hero_media_idx ON public._pages_v USING btree (version_hero_media_id);


--
-- Name: _pages_v_version_meta_version_meta_image_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_version_meta_version_meta_image_idx ON public._pages_v USING btree (version_meta_image_id);


--
-- Name: _pages_v_version_version__status_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_version_version__status_idx ON public._pages_v USING btree (version__status);


--
-- Name: _pages_v_version_version_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_version_version_created_at_idx ON public._pages_v USING btree (version_created_at);


--
-- Name: _pages_v_version_version_slug_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_version_version_slug_idx ON public._pages_v USING btree (version_slug);


--
-- Name: _pages_v_version_version_updated_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _pages_v_version_version_updated_at_idx ON public._pages_v USING btree (version_updated_at);


--
-- Name: _posts_v_autosave_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _posts_v_autosave_idx ON public._posts_v USING btree (autosave);


--
-- Name: _posts_v_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _posts_v_created_at_idx ON public._posts_v USING btree (created_at);


--
-- Name: _posts_v_latest_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _posts_v_latest_idx ON public._posts_v USING btree (latest);


--
-- Name: _posts_v_parent_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _posts_v_parent_idx ON public._posts_v USING btree (parent_id);


--
-- Name: _posts_v_rels_categories_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _posts_v_rels_categories_id_idx ON public._posts_v_rels USING btree (categories_id);


--
-- Name: _posts_v_rels_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _posts_v_rels_order_idx ON public._posts_v_rels USING btree ("order");


--
-- Name: _posts_v_rels_parent_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _posts_v_rels_parent_idx ON public._posts_v_rels USING btree (parent_id);


--
-- Name: _posts_v_rels_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _posts_v_rels_path_idx ON public._posts_v_rels USING btree (path);


--
-- Name: _posts_v_rels_posts_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _posts_v_rels_posts_id_idx ON public._posts_v_rels USING btree (posts_id);


--
-- Name: _posts_v_rels_users_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _posts_v_rels_users_id_idx ON public._posts_v_rels USING btree (users_id);


--
-- Name: _posts_v_updated_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _posts_v_updated_at_idx ON public._posts_v USING btree (updated_at);


--
-- Name: _posts_v_version_meta_version_meta_image_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _posts_v_version_meta_version_meta_image_idx ON public._posts_v USING btree (version_meta_image_id);


--
-- Name: _posts_v_version_populated_authors_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _posts_v_version_populated_authors_order_idx ON public._posts_v_version_populated_authors USING btree (_order);


--
-- Name: _posts_v_version_populated_authors_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _posts_v_version_populated_authors_parent_id_idx ON public._posts_v_version_populated_authors USING btree (_parent_id);


--
-- Name: _posts_v_version_version__status_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _posts_v_version_version__status_idx ON public._posts_v USING btree (version__status);


--
-- Name: _posts_v_version_version_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _posts_v_version_version_created_at_idx ON public._posts_v USING btree (version_created_at);


--
-- Name: _posts_v_version_version_hero_image_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _posts_v_version_version_hero_image_idx ON public._posts_v USING btree (version_hero_image_id);


--
-- Name: _posts_v_version_version_slug_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _posts_v_version_version_slug_idx ON public._posts_v USING btree (version_slug);


--
-- Name: _posts_v_version_version_updated_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _posts_v_version_version_updated_at_idx ON public._posts_v USING btree (version_updated_at);


--
-- Name: _services_v_autosave_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _services_v_autosave_idx ON public._services_v USING btree (autosave);


--
-- Name: _services_v_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _services_v_created_at_idx ON public._services_v USING btree (created_at);


--
-- Name: _services_v_latest_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _services_v_latest_idx ON public._services_v USING btree (latest);


--
-- Name: _services_v_parent_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _services_v_parent_idx ON public._services_v USING btree (parent_id);


--
-- Name: _services_v_rels_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _services_v_rels_order_idx ON public._services_v_rels USING btree ("order");


--
-- Name: _services_v_rels_parent_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _services_v_rels_parent_idx ON public._services_v_rels USING btree (parent_id);


--
-- Name: _services_v_rels_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _services_v_rels_path_idx ON public._services_v_rels USING btree (path);


--
-- Name: _services_v_rels_posts_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _services_v_rels_posts_id_idx ON public._services_v_rels USING btree (posts_id);


--
-- Name: _services_v_updated_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _services_v_updated_at_idx ON public._services_v USING btree (updated_at);


--
-- Name: _services_v_version_benefits_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _services_v_version_benefits_order_idx ON public._services_v_version_benefits USING btree (_order);


--
-- Name: _services_v_version_benefits_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _services_v_version_benefits_parent_id_idx ON public._services_v_version_benefits USING btree (_parent_id);


--
-- Name: _services_v_version_faqs_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _services_v_version_faqs_order_idx ON public._services_v_version_faqs USING btree (_order);


--
-- Name: _services_v_version_faqs_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _services_v_version_faqs_parent_id_idx ON public._services_v_version_faqs USING btree (_parent_id);


--
-- Name: _services_v_version_features_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _services_v_version_features_order_idx ON public._services_v_version_features USING btree (_order);


--
-- Name: _services_v_version_features_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _services_v_version_features_parent_id_idx ON public._services_v_version_features USING btree (_parent_id);


--
-- Name: _services_v_version_gallery_image_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _services_v_version_gallery_image_idx ON public._services_v_version_gallery USING btree (image_id);


--
-- Name: _services_v_version_gallery_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _services_v_version_gallery_order_idx ON public._services_v_version_gallery USING btree (_order);


--
-- Name: _services_v_version_gallery_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _services_v_version_gallery_parent_id_idx ON public._services_v_version_gallery USING btree (_parent_id);


--
-- Name: _services_v_version_meta_version_meta_image_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _services_v_version_meta_version_meta_image_idx ON public._services_v USING btree (version_meta_image_id);


--
-- Name: _services_v_version_version__status_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _services_v_version_version__status_idx ON public._services_v USING btree (version__status);


--
-- Name: _services_v_version_version_card_image_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _services_v_version_version_card_image_idx ON public._services_v USING btree (version_card_image_id);


--
-- Name: _services_v_version_version_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _services_v_version_version_created_at_idx ON public._services_v USING btree (version_created_at);


--
-- Name: _services_v_version_version_hero_image_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _services_v_version_version_hero_image_idx ON public._services_v USING btree (version_hero_image_id);


--
-- Name: _services_v_version_version_slug_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _services_v_version_version_slug_idx ON public._services_v USING btree (version_slug);


--
-- Name: _services_v_version_version_updated_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _services_v_version_version_updated_at_idx ON public._services_v USING btree (version_updated_at);


--
-- Name: categories_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX categories_created_at_idx ON public.categories USING btree (created_at);


--
-- Name: categories_slug_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX categories_slug_idx ON public.categories USING btree (slug);


--
-- Name: categories_updated_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX categories_updated_at_idx ON public.categories USING btree (updated_at);


--
-- Name: cities__status_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX cities__status_idx ON public.cities USING btree (_status);


--
-- Name: cities_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX cities_created_at_idx ON public.cities USING btree (created_at);


--
-- Name: cities_faqs_override_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX cities_faqs_override_order_idx ON public.cities_faqs_override USING btree (_order);


--
-- Name: cities_faqs_override_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX cities_faqs_override_parent_id_idx ON public.cities_faqs_override USING btree (_parent_id);


--
-- Name: cities_meta_meta_image_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX cities_meta_meta_image_idx ON public.cities USING btree (meta_image_id);


--
-- Name: cities_neighborhoods_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX cities_neighborhoods_order_idx ON public.cities_neighborhoods USING btree (_order);


--
-- Name: cities_neighborhoods_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX cities_neighborhoods_parent_id_idx ON public.cities_neighborhoods USING btree (_parent_id);


--
-- Name: cities_rels_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX cities_rels_order_idx ON public.cities_rels USING btree ("order");


--
-- Name: cities_rels_parent_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX cities_rels_parent_idx ON public.cities_rels USING btree (parent_id);


--
-- Name: cities_rels_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX cities_rels_path_idx ON public.cities_rels USING btree (path);


--
-- Name: cities_rels_testimonials_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX cities_rels_testimonials_id_idx ON public.cities_rels USING btree (testimonials_id);


--
-- Name: cities_slug_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX cities_slug_idx ON public.cities USING btree (slug);


--
-- Name: cities_updated_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX cities_updated_at_idx ON public.cities USING btree (updated_at);


--
-- Name: cities_zip_codes_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX cities_zip_codes_order_idx ON public.cities_zip_codes USING btree (_order);


--
-- Name: cities_zip_codes_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX cities_zip_codes_parent_id_idx ON public.cities_zip_codes USING btree (_parent_id);


--
-- Name: city_page_template_differentiators_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX city_page_template_differentiators_order_idx ON public.city_page_template_differentiators USING btree (_order);


--
-- Name: city_page_template_differentiators_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX city_page_template_differentiators_parent_id_idx ON public.city_page_template_differentiators USING btree (_parent_id);


--
-- Name: city_page_template_faqs_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX city_page_template_faqs_order_idx ON public.city_page_template_faqs USING btree (_order);


--
-- Name: city_page_template_faqs_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX city_page_template_faqs_parent_id_idx ON public.city_page_template_faqs USING btree (_parent_id);


--
-- Name: city_page_template_hero_image_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX city_page_template_hero_image_idx ON public.city_page_template USING btree (hero_image_id);


--
-- Name: city_page_template_process_steps_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX city_page_template_process_steps_order_idx ON public.city_page_template_process_steps USING btree (_order);


--
-- Name: city_page_template_process_steps_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX city_page_template_process_steps_parent_id_idx ON public.city_page_template_process_steps USING btree (_parent_id);


--
-- Name: homepage_about_image_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX homepage_about_image_idx ON public.homepage USING btree (about_image_id);


--
-- Name: homepage_differentiators_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX homepage_differentiators_order_idx ON public.homepage_differentiators USING btree (_order);


--
-- Name: homepage_differentiators_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX homepage_differentiators_parent_id_idx ON public.homepage_differentiators USING btree (_parent_id);


--
-- Name: homepage_faqs_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX homepage_faqs_order_idx ON public.homepage_faqs USING btree (_order);


--
-- Name: homepage_faqs_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX homepage_faqs_parent_id_idx ON public.homepage_faqs USING btree (_parent_id);


--
-- Name: homepage_hero_image_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX homepage_hero_image_idx ON public.homepage USING btree (hero_image_id);


--
-- Name: homepage_meta_meta_image_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX homepage_meta_meta_image_idx ON public.homepage USING btree (meta_image_id);


--
-- Name: homepage_process_steps_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX homepage_process_steps_order_idx ON public.homepage_process_steps USING btree (_order);


--
-- Name: homepage_process_steps_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX homepage_process_steps_parent_id_idx ON public.homepage_process_steps USING btree (_parent_id);


--
-- Name: leads_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX leads_created_at_idx ON public.leads USING btree (created_at);


--
-- Name: leads_updated_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX leads_updated_at_idx ON public.leads USING btree (updated_at);


--
-- Name: media_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX media_created_at_idx ON public.media USING btree (created_at);


--
-- Name: media_filename_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX media_filename_idx ON public.media USING btree (filename);


--
-- Name: media_folder_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX media_folder_idx ON public.media USING btree (folder_id);


--
-- Name: media_sizes_large_sizes_large_filename_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX media_sizes_large_sizes_large_filename_idx ON public.media USING btree (sizes_large_filename);


--
-- Name: media_sizes_medium_sizes_medium_filename_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX media_sizes_medium_sizes_medium_filename_idx ON public.media USING btree (sizes_medium_filename);


--
-- Name: media_sizes_og_sizes_og_filename_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX media_sizes_og_sizes_og_filename_idx ON public.media USING btree (sizes_og_filename);


--
-- Name: media_sizes_small_sizes_small_filename_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX media_sizes_small_sizes_small_filename_idx ON public.media USING btree (sizes_small_filename);


--
-- Name: media_sizes_square_sizes_square_filename_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX media_sizes_square_sizes_square_filename_idx ON public.media USING btree (sizes_square_filename);


--
-- Name: media_sizes_thumbnail_sizes_thumbnail_filename_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX media_sizes_thumbnail_sizes_thumbnail_filename_idx ON public.media USING btree (sizes_thumbnail_filename);


--
-- Name: media_sizes_xlarge_sizes_xlarge_filename_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX media_sizes_xlarge_sizes_xlarge_filename_idx ON public.media USING btree (sizes_xlarge_filename);


--
-- Name: media_updated_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX media_updated_at_idx ON public.media USING btree (updated_at);


--
-- Name: pages__status_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages__status_idx ON public.pages USING btree (_status);


--
-- Name: pages_blocks_archive_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_blocks_archive_order_idx ON public.pages_blocks_archive USING btree (_order);


--
-- Name: pages_blocks_archive_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_blocks_archive_parent_id_idx ON public.pages_blocks_archive USING btree (_parent_id);


--
-- Name: pages_blocks_archive_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_blocks_archive_path_idx ON public.pages_blocks_archive USING btree (_path);


--
-- Name: pages_blocks_content_columns_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_blocks_content_columns_order_idx ON public.pages_blocks_content_columns USING btree (_order);


--
-- Name: pages_blocks_content_columns_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_blocks_content_columns_parent_id_idx ON public.pages_blocks_content_columns USING btree (_parent_id);


--
-- Name: pages_blocks_content_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_blocks_content_order_idx ON public.pages_blocks_content USING btree (_order);


--
-- Name: pages_blocks_content_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_blocks_content_parent_id_idx ON public.pages_blocks_content USING btree (_parent_id);


--
-- Name: pages_blocks_content_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_blocks_content_path_idx ON public.pages_blocks_content USING btree (_path);


--
-- Name: pages_blocks_cta_links_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_blocks_cta_links_order_idx ON public.pages_blocks_cta_links USING btree (_order);


--
-- Name: pages_blocks_cta_links_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_blocks_cta_links_parent_id_idx ON public.pages_blocks_cta_links USING btree (_parent_id);


--
-- Name: pages_blocks_cta_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_blocks_cta_order_idx ON public.pages_blocks_cta USING btree (_order);


--
-- Name: pages_blocks_cta_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_blocks_cta_parent_id_idx ON public.pages_blocks_cta USING btree (_parent_id);


--
-- Name: pages_blocks_cta_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_blocks_cta_path_idx ON public.pages_blocks_cta USING btree (_path);


--
-- Name: pages_blocks_media_block_media_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_blocks_media_block_media_idx ON public.pages_blocks_media_block USING btree (media_id);


--
-- Name: pages_blocks_media_block_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_blocks_media_block_order_idx ON public.pages_blocks_media_block USING btree (_order);


--
-- Name: pages_blocks_media_block_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_blocks_media_block_parent_id_idx ON public.pages_blocks_media_block USING btree (_parent_id);


--
-- Name: pages_blocks_media_block_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_blocks_media_block_path_idx ON public.pages_blocks_media_block USING btree (_path);


--
-- Name: pages_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_created_at_idx ON public.pages USING btree (created_at);


--
-- Name: pages_hero_hero_media_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_hero_hero_media_idx ON public.pages USING btree (hero_media_id);


--
-- Name: pages_hero_links_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_hero_links_order_idx ON public.pages_hero_links USING btree (_order);


--
-- Name: pages_hero_links_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_hero_links_parent_id_idx ON public.pages_hero_links USING btree (_parent_id);


--
-- Name: pages_meta_meta_image_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_meta_meta_image_idx ON public.pages USING btree (meta_image_id);


--
-- Name: pages_rels_categories_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_rels_categories_id_idx ON public.pages_rels USING btree (categories_id);


--
-- Name: pages_rels_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_rels_order_idx ON public.pages_rels USING btree ("order");


--
-- Name: pages_rels_pages_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_rels_pages_id_idx ON public.pages_rels USING btree (pages_id);


--
-- Name: pages_rels_parent_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_rels_parent_idx ON public.pages_rels USING btree (parent_id);


--
-- Name: pages_rels_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_rels_path_idx ON public.pages_rels USING btree (path);


--
-- Name: pages_rels_posts_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_rels_posts_id_idx ON public.pages_rels USING btree (posts_id);


--
-- Name: pages_slug_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX pages_slug_idx ON public.pages USING btree (slug);


--
-- Name: pages_updated_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pages_updated_at_idx ON public.pages USING btree (updated_at);


--
-- Name: payload_folders_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX payload_folders_created_at_idx ON public.payload_folders USING btree (created_at);


--
-- Name: payload_folders_folder_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX payload_folders_folder_idx ON public.payload_folders USING btree (folder_id);


--
-- Name: payload_folders_folder_type_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX payload_folders_folder_type_order_idx ON public.payload_folders_folder_type USING btree ("order");


--
-- Name: payload_folders_folder_type_parent_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX payload_folders_folder_type_parent_idx ON public.payload_folders_folder_type USING btree (parent_id);


--
-- Name: payload_folders_name_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX payload_folders_name_idx ON public.payload_folders USING btree (name);


--
-- Name: payload_folders_updated_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX payload_folders_updated_at_idx ON public.payload_folders USING btree (updated_at);


--
-- Name: payload_jobs_completed_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX payload_jobs_completed_at_idx ON public.payload_jobs USING btree (completed_at);


--
-- Name: payload_jobs_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX payload_jobs_created_at_idx ON public.payload_jobs USING btree (created_at);


--
-- Name: payload_jobs_has_error_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX payload_jobs_has_error_idx ON public.payload_jobs USING btree (has_error);


--
-- Name: payload_jobs_log_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX payload_jobs_log_order_idx ON public.payload_jobs_log USING btree (_order);


--
-- Name: payload_jobs_log_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX payload_jobs_log_parent_id_idx ON public.payload_jobs_log USING btree (_parent_id);


--
-- Name: payload_jobs_processing_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX payload_jobs_processing_idx ON public.payload_jobs USING btree (processing);


--
-- Name: payload_jobs_queue_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX payload_jobs_queue_idx ON public.payload_jobs USING btree (queue);


--
-- Name: payload_jobs_task_slug_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX payload_jobs_task_slug_idx ON public.payload_jobs USING btree (task_slug);


--
-- Name: payload_jobs_total_tried_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX payload_jobs_total_tried_idx ON public.payload_jobs USING btree (total_tried);


--
-- Name: payload_jobs_updated_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX payload_jobs_updated_at_idx ON public.payload_jobs USING btree (updated_at);


--
-- Name: payload_jobs_wait_until_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX payload_jobs_wait_until_idx ON public.payload_jobs USING btree (wait_until);


--
-- Name: payload_kv_key_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX payload_kv_key_idx ON public.payload_kv USING btree (key);


--
-- Name: payload_locked_documents_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX payload_locked_documents_created_at_idx ON public.payload_locked_documents USING btree (created_at);


--
-- Name: payload_locked_documents_global_slug_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX payload_locked_documents_global_slug_idx ON public.payload_locked_documents USING btree (global_slug);


--
-- Name: payload_locked_documents_rels_categories_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX payload_locked_documents_rels_categories_id_idx ON public.payload_locked_documents_rels USING btree (categories_id);


--
-- Name: payload_locked_documents_rels_cities_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX payload_locked_documents_rels_cities_id_idx ON public.payload_locked_documents_rels USING btree (cities_id);


--
-- Name: payload_locked_documents_rels_leads_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX payload_locked_documents_rels_leads_id_idx ON public.payload_locked_documents_rels USING btree (leads_id);


--
-- Name: payload_locked_documents_rels_media_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX payload_locked_documents_rels_media_id_idx ON public.payload_locked_documents_rels USING btree (media_id);


--
-- Name: payload_locked_documents_rels_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX payload_locked_documents_rels_order_idx ON public.payload_locked_documents_rels USING btree ("order");


--
-- Name: payload_locked_documents_rels_pages_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX payload_locked_documents_rels_pages_id_idx ON public.payload_locked_documents_rels USING btree (pages_id);


--
-- Name: payload_locked_documents_rels_parent_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX payload_locked_documents_rels_parent_idx ON public.payload_locked_documents_rels USING btree (parent_id);


--
-- Name: payload_locked_documents_rels_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX payload_locked_documents_rels_path_idx ON public.payload_locked_documents_rels USING btree (path);


--
-- Name: payload_locked_documents_rels_payload_folders_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX payload_locked_documents_rels_payload_folders_id_idx ON public.payload_locked_documents_rels USING btree (payload_folders_id);


--
-- Name: payload_locked_documents_rels_posts_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX payload_locked_documents_rels_posts_id_idx ON public.payload_locked_documents_rels USING btree (posts_id);


--
-- Name: payload_locked_documents_rels_redirects_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX payload_locked_documents_rels_redirects_id_idx ON public.payload_locked_documents_rels USING btree (redirects_id);


--
-- Name: payload_locked_documents_rels_services_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX payload_locked_documents_rels_services_id_idx ON public.payload_locked_documents_rels USING btree (services_id);


--
-- Name: payload_locked_documents_rels_testimonials_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX payload_locked_documents_rels_testimonials_id_idx ON public.payload_locked_documents_rels USING btree (testimonials_id);


--
-- Name: payload_locked_documents_rels_users_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX payload_locked_documents_rels_users_id_idx ON public.payload_locked_documents_rels USING btree (users_id);


--
-- Name: payload_locked_documents_updated_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX payload_locked_documents_updated_at_idx ON public.payload_locked_documents USING btree (updated_at);


--
-- Name: payload_migrations_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX payload_migrations_created_at_idx ON public.payload_migrations USING btree (created_at);


--
-- Name: payload_migrations_updated_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX payload_migrations_updated_at_idx ON public.payload_migrations USING btree (updated_at);


--
-- Name: payload_preferences_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX payload_preferences_created_at_idx ON public.payload_preferences USING btree (created_at);


--
-- Name: payload_preferences_key_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX payload_preferences_key_idx ON public.payload_preferences USING btree (key);


--
-- Name: payload_preferences_rels_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX payload_preferences_rels_order_idx ON public.payload_preferences_rels USING btree ("order");


--
-- Name: payload_preferences_rels_parent_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX payload_preferences_rels_parent_idx ON public.payload_preferences_rels USING btree (parent_id);


--
-- Name: payload_preferences_rels_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX payload_preferences_rels_path_idx ON public.payload_preferences_rels USING btree (path);


--
-- Name: payload_preferences_rels_users_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX payload_preferences_rels_users_id_idx ON public.payload_preferences_rels USING btree (users_id);


--
-- Name: payload_preferences_updated_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX payload_preferences_updated_at_idx ON public.payload_preferences USING btree (updated_at);


--
-- Name: posts__status_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX posts__status_idx ON public.posts USING btree (_status);


--
-- Name: posts_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX posts_created_at_idx ON public.posts USING btree (created_at);


--
-- Name: posts_hero_image_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX posts_hero_image_idx ON public.posts USING btree (hero_image_id);


--
-- Name: posts_meta_meta_image_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX posts_meta_meta_image_idx ON public.posts USING btree (meta_image_id);


--
-- Name: posts_populated_authors_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX posts_populated_authors_order_idx ON public.posts_populated_authors USING btree (_order);


--
-- Name: posts_populated_authors_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX posts_populated_authors_parent_id_idx ON public.posts_populated_authors USING btree (_parent_id);


--
-- Name: posts_rels_categories_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX posts_rels_categories_id_idx ON public.posts_rels USING btree (categories_id);


--
-- Name: posts_rels_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX posts_rels_order_idx ON public.posts_rels USING btree ("order");


--
-- Name: posts_rels_parent_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX posts_rels_parent_idx ON public.posts_rels USING btree (parent_id);


--
-- Name: posts_rels_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX posts_rels_path_idx ON public.posts_rels USING btree (path);


--
-- Name: posts_rels_posts_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX posts_rels_posts_id_idx ON public.posts_rels USING btree (posts_id);


--
-- Name: posts_rels_users_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX posts_rels_users_id_idx ON public.posts_rels USING btree (users_id);


--
-- Name: posts_slug_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX posts_slug_idx ON public.posts USING btree (slug);


--
-- Name: posts_updated_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX posts_updated_at_idx ON public.posts USING btree (updated_at);


--
-- Name: redirects_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX redirects_created_at_idx ON public.redirects USING btree (created_at);


--
-- Name: redirects_from_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX redirects_from_idx ON public.redirects USING btree ("from");


--
-- Name: redirects_rels_cities_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX redirects_rels_cities_id_idx ON public.redirects_rels USING btree (cities_id);


--
-- Name: redirects_rels_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX redirects_rels_order_idx ON public.redirects_rels USING btree ("order");


--
-- Name: redirects_rels_pages_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX redirects_rels_pages_id_idx ON public.redirects_rels USING btree (pages_id);


--
-- Name: redirects_rels_parent_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX redirects_rels_parent_idx ON public.redirects_rels USING btree (parent_id);


--
-- Name: redirects_rels_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX redirects_rels_path_idx ON public.redirects_rels USING btree (path);


--
-- Name: redirects_rels_posts_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX redirects_rels_posts_id_idx ON public.redirects_rels USING btree (posts_id);


--
-- Name: redirects_rels_services_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX redirects_rels_services_id_idx ON public.redirects_rels USING btree (services_id);


--
-- Name: redirects_updated_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX redirects_updated_at_idx ON public.redirects USING btree (updated_at);


--
-- Name: services__status_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX services__status_idx ON public.services USING btree (_status);


--
-- Name: services_benefits_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX services_benefits_order_idx ON public.services_benefits USING btree (_order);


--
-- Name: services_benefits_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX services_benefits_parent_id_idx ON public.services_benefits USING btree (_parent_id);


--
-- Name: services_card_image_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX services_card_image_idx ON public.services USING btree (card_image_id);


--
-- Name: services_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX services_created_at_idx ON public.services USING btree (created_at);


--
-- Name: services_faqs_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX services_faqs_order_idx ON public.services_faqs USING btree (_order);


--
-- Name: services_faqs_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX services_faqs_parent_id_idx ON public.services_faqs USING btree (_parent_id);


--
-- Name: services_features_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX services_features_order_idx ON public.services_features USING btree (_order);


--
-- Name: services_features_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX services_features_parent_id_idx ON public.services_features USING btree (_parent_id);


--
-- Name: services_gallery_image_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX services_gallery_image_idx ON public.services_gallery USING btree (image_id);


--
-- Name: services_gallery_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX services_gallery_order_idx ON public.services_gallery USING btree (_order);


--
-- Name: services_gallery_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX services_gallery_parent_id_idx ON public.services_gallery USING btree (_parent_id);


--
-- Name: services_hero_image_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX services_hero_image_idx ON public.services USING btree (hero_image_id);


--
-- Name: services_meta_meta_image_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX services_meta_meta_image_idx ON public.services USING btree (meta_image_id);


--
-- Name: services_rels_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX services_rels_order_idx ON public.services_rels USING btree ("order");


--
-- Name: services_rels_parent_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX services_rels_parent_idx ON public.services_rels USING btree (parent_id);


--
-- Name: services_rels_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX services_rels_path_idx ON public.services_rels USING btree (path);


--
-- Name: services_rels_posts_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX services_rels_posts_id_idx ON public.services_rels USING btree (posts_id);


--
-- Name: services_slug_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX services_slug_idx ON public.services USING btree (slug);


--
-- Name: services_updated_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX services_updated_at_idx ON public.services USING btree (updated_at);


--
-- Name: site_settings_default_o_g_image_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX site_settings_default_o_g_image_idx ON public.site_settings USING btree (default_o_g_image_id);


--
-- Name: site_settings_logo_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX site_settings_logo_idx ON public.site_settings USING btree (logo_id);


--
-- Name: site_settings_socials_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX site_settings_socials_order_idx ON public.site_settings_socials USING btree (_order);


--
-- Name: site_settings_socials_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX site_settings_socials_parent_id_idx ON public.site_settings_socials USING btree (_parent_id);


--
-- Name: testimonials_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX testimonials_created_at_idx ON public.testimonials USING btree (created_at);


--
-- Name: testimonials_external_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX testimonials_external_id_idx ON public.testimonials USING btree (external_id);


--
-- Name: testimonials_rels_cities_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX testimonials_rels_cities_id_idx ON public.testimonials_rels USING btree (cities_id);


--
-- Name: testimonials_rels_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX testimonials_rels_order_idx ON public.testimonials_rels USING btree ("order");


--
-- Name: testimonials_rels_parent_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX testimonials_rels_parent_idx ON public.testimonials_rels USING btree (parent_id);


--
-- Name: testimonials_rels_path_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX testimonials_rels_path_idx ON public.testimonials_rels USING btree (path);


--
-- Name: testimonials_updated_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX testimonials_updated_at_idx ON public.testimonials USING btree (updated_at);


--
-- Name: users_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX users_created_at_idx ON public.users USING btree (created_at);


--
-- Name: users_email_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX users_email_idx ON public.users USING btree (email);


--
-- Name: users_sessions_order_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX users_sessions_order_idx ON public.users_sessions USING btree (_order);


--
-- Name: users_sessions_parent_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX users_sessions_parent_id_idx ON public.users_sessions USING btree (_parent_id);


--
-- Name: users_updated_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX users_updated_at_idx ON public.users USING btree (updated_at);


--
-- Name: _cities_v _cities_v_parent_id_cities_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._cities_v
    ADD CONSTRAINT _cities_v_parent_id_cities_id_fk FOREIGN KEY (parent_id) REFERENCES public.cities(id) ON DELETE SET NULL;


--
-- Name: _cities_v_rels _cities_v_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._cities_v_rels
    ADD CONSTRAINT _cities_v_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public._cities_v(id) ON DELETE CASCADE;


--
-- Name: _cities_v_rels _cities_v_rels_testimonials_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._cities_v_rels
    ADD CONSTRAINT _cities_v_rels_testimonials_fk FOREIGN KEY (testimonials_id) REFERENCES public.testimonials(id) ON DELETE CASCADE;


--
-- Name: _cities_v_version_faqs_override _cities_v_version_faqs_override_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._cities_v_version_faqs_override
    ADD CONSTRAINT _cities_v_version_faqs_override_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._cities_v(id) ON DELETE CASCADE;


--
-- Name: _cities_v _cities_v_version_meta_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._cities_v
    ADD CONSTRAINT _cities_v_version_meta_image_id_media_id_fk FOREIGN KEY (version_meta_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: _cities_v_version_neighborhoods _cities_v_version_neighborhoods_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._cities_v_version_neighborhoods
    ADD CONSTRAINT _cities_v_version_neighborhoods_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._cities_v(id) ON DELETE CASCADE;


--
-- Name: _cities_v_version_zip_codes _cities_v_version_zip_codes_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._cities_v_version_zip_codes
    ADD CONSTRAINT _cities_v_version_zip_codes_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._cities_v(id) ON DELETE CASCADE;


--
-- Name: _pages_v_blocks_archive _pages_v_blocks_archive_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v_blocks_archive
    ADD CONSTRAINT _pages_v_blocks_archive_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._pages_v(id) ON DELETE CASCADE;


--
-- Name: _pages_v_blocks_content_columns _pages_v_blocks_content_columns_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v_blocks_content_columns
    ADD CONSTRAINT _pages_v_blocks_content_columns_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._pages_v_blocks_content(id) ON DELETE CASCADE;


--
-- Name: _pages_v_blocks_content _pages_v_blocks_content_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v_blocks_content
    ADD CONSTRAINT _pages_v_blocks_content_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._pages_v(id) ON DELETE CASCADE;


--
-- Name: _pages_v_blocks_cta_links _pages_v_blocks_cta_links_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v_blocks_cta_links
    ADD CONSTRAINT _pages_v_blocks_cta_links_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._pages_v_blocks_cta(id) ON DELETE CASCADE;


--
-- Name: _pages_v_blocks_cta _pages_v_blocks_cta_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v_blocks_cta
    ADD CONSTRAINT _pages_v_blocks_cta_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._pages_v(id) ON DELETE CASCADE;


--
-- Name: _pages_v_blocks_media_block _pages_v_blocks_media_block_media_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v_blocks_media_block
    ADD CONSTRAINT _pages_v_blocks_media_block_media_id_media_id_fk FOREIGN KEY (media_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: _pages_v_blocks_media_block _pages_v_blocks_media_block_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v_blocks_media_block
    ADD CONSTRAINT _pages_v_blocks_media_block_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._pages_v(id) ON DELETE CASCADE;


--
-- Name: _pages_v _pages_v_parent_id_pages_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v
    ADD CONSTRAINT _pages_v_parent_id_pages_id_fk FOREIGN KEY (parent_id) REFERENCES public.pages(id) ON DELETE SET NULL;


--
-- Name: _pages_v_rels _pages_v_rels_categories_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v_rels
    ADD CONSTRAINT _pages_v_rels_categories_fk FOREIGN KEY (categories_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: _pages_v_rels _pages_v_rels_pages_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v_rels
    ADD CONSTRAINT _pages_v_rels_pages_fk FOREIGN KEY (pages_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: _pages_v_rels _pages_v_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v_rels
    ADD CONSTRAINT _pages_v_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public._pages_v(id) ON DELETE CASCADE;


--
-- Name: _pages_v_rels _pages_v_rels_posts_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v_rels
    ADD CONSTRAINT _pages_v_rels_posts_fk FOREIGN KEY (posts_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: _pages_v_version_hero_links _pages_v_version_hero_links_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v_version_hero_links
    ADD CONSTRAINT _pages_v_version_hero_links_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._pages_v(id) ON DELETE CASCADE;


--
-- Name: _pages_v _pages_v_version_hero_media_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v
    ADD CONSTRAINT _pages_v_version_hero_media_id_media_id_fk FOREIGN KEY (version_hero_media_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: _pages_v _pages_v_version_meta_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._pages_v
    ADD CONSTRAINT _pages_v_version_meta_image_id_media_id_fk FOREIGN KEY (version_meta_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: _posts_v _posts_v_parent_id_posts_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._posts_v
    ADD CONSTRAINT _posts_v_parent_id_posts_id_fk FOREIGN KEY (parent_id) REFERENCES public.posts(id) ON DELETE SET NULL;


--
-- Name: _posts_v_rels _posts_v_rels_categories_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._posts_v_rels
    ADD CONSTRAINT _posts_v_rels_categories_fk FOREIGN KEY (categories_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: _posts_v_rels _posts_v_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._posts_v_rels
    ADD CONSTRAINT _posts_v_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public._posts_v(id) ON DELETE CASCADE;


--
-- Name: _posts_v_rels _posts_v_rels_posts_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._posts_v_rels
    ADD CONSTRAINT _posts_v_rels_posts_fk FOREIGN KEY (posts_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: _posts_v_rels _posts_v_rels_users_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._posts_v_rels
    ADD CONSTRAINT _posts_v_rels_users_fk FOREIGN KEY (users_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: _posts_v _posts_v_version_hero_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._posts_v
    ADD CONSTRAINT _posts_v_version_hero_image_id_media_id_fk FOREIGN KEY (version_hero_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: _posts_v _posts_v_version_meta_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._posts_v
    ADD CONSTRAINT _posts_v_version_meta_image_id_media_id_fk FOREIGN KEY (version_meta_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: _posts_v_version_populated_authors _posts_v_version_populated_authors_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._posts_v_version_populated_authors
    ADD CONSTRAINT _posts_v_version_populated_authors_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._posts_v(id) ON DELETE CASCADE;


--
-- Name: _services_v _services_v_parent_id_services_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._services_v
    ADD CONSTRAINT _services_v_parent_id_services_id_fk FOREIGN KEY (parent_id) REFERENCES public.services(id) ON DELETE SET NULL;


--
-- Name: _services_v_rels _services_v_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._services_v_rels
    ADD CONSTRAINT _services_v_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public._services_v(id) ON DELETE CASCADE;


--
-- Name: _services_v_rels _services_v_rels_posts_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._services_v_rels
    ADD CONSTRAINT _services_v_rels_posts_fk FOREIGN KEY (posts_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: _services_v_version_benefits _services_v_version_benefits_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._services_v_version_benefits
    ADD CONSTRAINT _services_v_version_benefits_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._services_v(id) ON DELETE CASCADE;


--
-- Name: _services_v _services_v_version_card_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._services_v
    ADD CONSTRAINT _services_v_version_card_image_id_media_id_fk FOREIGN KEY (version_card_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: _services_v_version_faqs _services_v_version_faqs_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._services_v_version_faqs
    ADD CONSTRAINT _services_v_version_faqs_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._services_v(id) ON DELETE CASCADE;


--
-- Name: _services_v_version_features _services_v_version_features_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._services_v_version_features
    ADD CONSTRAINT _services_v_version_features_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._services_v(id) ON DELETE CASCADE;


--
-- Name: _services_v_version_gallery _services_v_version_gallery_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._services_v_version_gallery
    ADD CONSTRAINT _services_v_version_gallery_image_id_media_id_fk FOREIGN KEY (image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: _services_v_version_gallery _services_v_version_gallery_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._services_v_version_gallery
    ADD CONSTRAINT _services_v_version_gallery_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._services_v(id) ON DELETE CASCADE;


--
-- Name: _services_v _services_v_version_hero_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._services_v
    ADD CONSTRAINT _services_v_version_hero_image_id_media_id_fk FOREIGN KEY (version_hero_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: _services_v _services_v_version_meta_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._services_v
    ADD CONSTRAINT _services_v_version_meta_image_id_media_id_fk FOREIGN KEY (version_meta_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: cities_faqs_override cities_faqs_override_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities_faqs_override
    ADD CONSTRAINT cities_faqs_override_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.cities(id) ON DELETE CASCADE;


--
-- Name: cities cities_meta_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_meta_image_id_media_id_fk FOREIGN KEY (meta_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: cities_neighborhoods cities_neighborhoods_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities_neighborhoods
    ADD CONSTRAINT cities_neighborhoods_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.cities(id) ON DELETE CASCADE;


--
-- Name: cities_rels cities_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities_rels
    ADD CONSTRAINT cities_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.cities(id) ON DELETE CASCADE;


--
-- Name: cities_rels cities_rels_testimonials_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities_rels
    ADD CONSTRAINT cities_rels_testimonials_fk FOREIGN KEY (testimonials_id) REFERENCES public.testimonials(id) ON DELETE CASCADE;


--
-- Name: cities_zip_codes cities_zip_codes_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities_zip_codes
    ADD CONSTRAINT cities_zip_codes_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.cities(id) ON DELETE CASCADE;


--
-- Name: city_page_template_differentiators city_page_template_differentiators_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.city_page_template_differentiators
    ADD CONSTRAINT city_page_template_differentiators_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.city_page_template(id) ON DELETE CASCADE;


--
-- Name: city_page_template_faqs city_page_template_faqs_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.city_page_template_faqs
    ADD CONSTRAINT city_page_template_faqs_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.city_page_template(id) ON DELETE CASCADE;


--
-- Name: city_page_template city_page_template_hero_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.city_page_template
    ADD CONSTRAINT city_page_template_hero_image_id_media_id_fk FOREIGN KEY (hero_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: city_page_template_process_steps city_page_template_process_steps_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.city_page_template_process_steps
    ADD CONSTRAINT city_page_template_process_steps_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.city_page_template(id) ON DELETE CASCADE;


--
-- Name: homepage homepage_about_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.homepage
    ADD CONSTRAINT homepage_about_image_id_media_id_fk FOREIGN KEY (about_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: homepage_differentiators homepage_differentiators_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.homepage_differentiators
    ADD CONSTRAINT homepage_differentiators_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.homepage(id) ON DELETE CASCADE;


--
-- Name: homepage_faqs homepage_faqs_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.homepage_faqs
    ADD CONSTRAINT homepage_faqs_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.homepage(id) ON DELETE CASCADE;


--
-- Name: homepage homepage_hero_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.homepage
    ADD CONSTRAINT homepage_hero_image_id_media_id_fk FOREIGN KEY (hero_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: homepage homepage_meta_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.homepage
    ADD CONSTRAINT homepage_meta_image_id_media_id_fk FOREIGN KEY (meta_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: homepage_process_steps homepage_process_steps_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.homepage_process_steps
    ADD CONSTRAINT homepage_process_steps_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.homepage(id) ON DELETE CASCADE;


--
-- Name: media media_folder_id_payload_folders_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.media
    ADD CONSTRAINT media_folder_id_payload_folders_id_fk FOREIGN KEY (folder_id) REFERENCES public.payload_folders(id) ON DELETE SET NULL;


--
-- Name: pages_blocks_archive pages_blocks_archive_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_blocks_archive
    ADD CONSTRAINT pages_blocks_archive_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: pages_blocks_content_columns pages_blocks_content_columns_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_blocks_content_columns
    ADD CONSTRAINT pages_blocks_content_columns_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.pages_blocks_content(id) ON DELETE CASCADE;


--
-- Name: pages_blocks_content pages_blocks_content_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_blocks_content
    ADD CONSTRAINT pages_blocks_content_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: pages_blocks_cta_links pages_blocks_cta_links_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_blocks_cta_links
    ADD CONSTRAINT pages_blocks_cta_links_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.pages_blocks_cta(id) ON DELETE CASCADE;


--
-- Name: pages_blocks_cta pages_blocks_cta_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_blocks_cta
    ADD CONSTRAINT pages_blocks_cta_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: pages_blocks_media_block pages_blocks_media_block_media_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_blocks_media_block
    ADD CONSTRAINT pages_blocks_media_block_media_id_media_id_fk FOREIGN KEY (media_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: pages_blocks_media_block pages_blocks_media_block_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_blocks_media_block
    ADD CONSTRAINT pages_blocks_media_block_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: pages_hero_links pages_hero_links_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_hero_links
    ADD CONSTRAINT pages_hero_links_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: pages pages_hero_media_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_hero_media_id_media_id_fk FOREIGN KEY (hero_media_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: pages pages_meta_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_meta_image_id_media_id_fk FOREIGN KEY (meta_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: pages_rels pages_rels_categories_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_rels
    ADD CONSTRAINT pages_rels_categories_fk FOREIGN KEY (categories_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: pages_rels pages_rels_pages_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_rels
    ADD CONSTRAINT pages_rels_pages_fk FOREIGN KEY (pages_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: pages_rels pages_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_rels
    ADD CONSTRAINT pages_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: pages_rels pages_rels_posts_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages_rels
    ADD CONSTRAINT pages_rels_posts_fk FOREIGN KEY (posts_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: payload_folders payload_folders_folder_id_payload_folders_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payload_folders
    ADD CONSTRAINT payload_folders_folder_id_payload_folders_id_fk FOREIGN KEY (folder_id) REFERENCES public.payload_folders(id) ON DELETE SET NULL;


--
-- Name: payload_folders_folder_type payload_folders_folder_type_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payload_folders_folder_type
    ADD CONSTRAINT payload_folders_folder_type_parent_fk FOREIGN KEY (parent_id) REFERENCES public.payload_folders(id) ON DELETE CASCADE;


--
-- Name: payload_jobs_log payload_jobs_log_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payload_jobs_log
    ADD CONSTRAINT payload_jobs_log_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.payload_jobs(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_categories_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_categories_fk FOREIGN KEY (categories_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_cities_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_cities_fk FOREIGN KEY (cities_id) REFERENCES public.cities(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_leads_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_leads_fk FOREIGN KEY (leads_id) REFERENCES public.leads(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_media_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_media_fk FOREIGN KEY (media_id) REFERENCES public.media(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_pages_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_pages_fk FOREIGN KEY (pages_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.payload_locked_documents(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_payload_folders_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_payload_folders_fk FOREIGN KEY (payload_folders_id) REFERENCES public.payload_folders(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_posts_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_posts_fk FOREIGN KEY (posts_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_redirects_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_redirects_fk FOREIGN KEY (redirects_id) REFERENCES public.redirects(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_services_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_services_fk FOREIGN KEY (services_id) REFERENCES public.services(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_testimonials_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_testimonials_fk FOREIGN KEY (testimonials_id) REFERENCES public.testimonials(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_users_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_users_fk FOREIGN KEY (users_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: payload_preferences_rels payload_preferences_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payload_preferences_rels
    ADD CONSTRAINT payload_preferences_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.payload_preferences(id) ON DELETE CASCADE;


--
-- Name: payload_preferences_rels payload_preferences_rels_users_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payload_preferences_rels
    ADD CONSTRAINT payload_preferences_rels_users_fk FOREIGN KEY (users_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: posts posts_hero_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_hero_image_id_media_id_fk FOREIGN KEY (hero_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: posts posts_meta_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_meta_image_id_media_id_fk FOREIGN KEY (meta_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: posts_populated_authors posts_populated_authors_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts_populated_authors
    ADD CONSTRAINT posts_populated_authors_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: posts_rels posts_rels_categories_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts_rels
    ADD CONSTRAINT posts_rels_categories_fk FOREIGN KEY (categories_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: posts_rels posts_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts_rels
    ADD CONSTRAINT posts_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: posts_rels posts_rels_posts_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts_rels
    ADD CONSTRAINT posts_rels_posts_fk FOREIGN KEY (posts_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: posts_rels posts_rels_users_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts_rels
    ADD CONSTRAINT posts_rels_users_fk FOREIGN KEY (users_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: redirects_rels redirects_rels_cities_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.redirects_rels
    ADD CONSTRAINT redirects_rels_cities_fk FOREIGN KEY (cities_id) REFERENCES public.cities(id) ON DELETE CASCADE;


--
-- Name: redirects_rels redirects_rels_pages_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.redirects_rels
    ADD CONSTRAINT redirects_rels_pages_fk FOREIGN KEY (pages_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: redirects_rels redirects_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.redirects_rels
    ADD CONSTRAINT redirects_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.redirects(id) ON DELETE CASCADE;


--
-- Name: redirects_rels redirects_rels_posts_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.redirects_rels
    ADD CONSTRAINT redirects_rels_posts_fk FOREIGN KEY (posts_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: redirects_rels redirects_rels_services_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.redirects_rels
    ADD CONSTRAINT redirects_rels_services_fk FOREIGN KEY (services_id) REFERENCES public.services(id) ON DELETE CASCADE;


--
-- Name: services_benefits services_benefits_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.services_benefits
    ADD CONSTRAINT services_benefits_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.services(id) ON DELETE CASCADE;


--
-- Name: services services_card_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_card_image_id_media_id_fk FOREIGN KEY (card_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: services_faqs services_faqs_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.services_faqs
    ADD CONSTRAINT services_faqs_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.services(id) ON DELETE CASCADE;


--
-- Name: services_features services_features_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.services_features
    ADD CONSTRAINT services_features_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.services(id) ON DELETE CASCADE;


--
-- Name: services_gallery services_gallery_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.services_gallery
    ADD CONSTRAINT services_gallery_image_id_media_id_fk FOREIGN KEY (image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: services_gallery services_gallery_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.services_gallery
    ADD CONSTRAINT services_gallery_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.services(id) ON DELETE CASCADE;


--
-- Name: services services_hero_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_hero_image_id_media_id_fk FOREIGN KEY (hero_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: services services_meta_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_meta_image_id_media_id_fk FOREIGN KEY (meta_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: services_rels services_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.services_rels
    ADD CONSTRAINT services_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.services(id) ON DELETE CASCADE;


--
-- Name: services_rels services_rels_posts_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.services_rels
    ADD CONSTRAINT services_rels_posts_fk FOREIGN KEY (posts_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: site_settings site_settings_default_o_g_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.site_settings
    ADD CONSTRAINT site_settings_default_o_g_image_id_media_id_fk FOREIGN KEY (default_o_g_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: site_settings site_settings_logo_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.site_settings
    ADD CONSTRAINT site_settings_logo_id_media_id_fk FOREIGN KEY (logo_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: site_settings_socials site_settings_socials_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.site_settings_socials
    ADD CONSTRAINT site_settings_socials_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.site_settings(id) ON DELETE CASCADE;


--
-- Name: testimonials_rels testimonials_rels_cities_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.testimonials_rels
    ADD CONSTRAINT testimonials_rels_cities_fk FOREIGN KEY (cities_id) REFERENCES public.cities(id) ON DELETE CASCADE;


--
-- Name: testimonials_rels testimonials_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.testimonials_rels
    ADD CONSTRAINT testimonials_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.testimonials(id) ON DELETE CASCADE;


--
-- Name: users_sessions users_sessions_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_sessions
    ADD CONSTRAINT users_sessions_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--



SET session_replication_role = replica;

--
-- PostgreSQL database dump
--


-- Dumped from database version 16.13 (Ubuntu 16.13-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.13 (Ubuntu 16.13-0ubuntu0.24.04.1)

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
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.categories (id, title, generate_slug, slug, updated_at, created_at) VALUES (1, 'Electrical Tips', false, 'electrical-tips', '2026-06-16 16:01:33.635+00', '2026-06-16 16:01:33.635+00');
INSERT INTO public.categories (id, title, generate_slug, slug, updated_at, created_at) VALUES (2, 'Maecenas', false, 'maecenas', '2026-06-16 16:01:33.64+00', '2026-06-16 16:01:33.64+00');


--
-- Data for Name: payload_folders; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: media; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.media (id, alt, caption, folder_id, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_square_url, sizes_square_width, sizes_square_height, sizes_square_mime_type, sizes_square_filesize, sizes_square_filename, sizes_small_url, sizes_small_width, sizes_small_height, sizes_small_mime_type, sizes_small_filesize, sizes_small_filename, sizes_medium_url, sizes_medium_width, sizes_medium_height, sizes_medium_mime_type, sizes_medium_filesize, sizes_medium_filename, sizes_large_url, sizes_large_width, sizes_large_height, sizes_large_mime_type, sizes_large_filesize, sizes_large_filename, sizes_xlarge_url, sizes_xlarge_width, sizes_xlarge_height, sizes_xlarge_mime_type, sizes_xlarge_filesize, sizes_xlarge_filename, sizes_og_url, sizes_og_width, sizes_og_height, sizes_og_mime_type, sizes_og_filesize, sizes_og_filename) VALUES (1, 'Satishfaction Gaurantee', NULL, NULL, '2026-06-16 16:00:48.093+00', '2026-06-16 16:00:48.093+00', '/api/media/file/100-Satishfaction-Gaurantee-1.svg', NULL, '100-Satishfaction-Gaurantee-1.svg', 'image/svg+xml', 424798, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.media (id, alt, caption, folder_id, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_square_url, sizes_square_width, sizes_square_height, sizes_square_mime_type, sizes_square_filesize, sizes_square_filename, sizes_small_url, sizes_small_width, sizes_small_height, sizes_small_mime_type, sizes_small_filesize, sizes_small_filename, sizes_medium_url, sizes_medium_width, sizes_medium_height, sizes_medium_mime_type, sizes_medium_filesize, sizes_medium_filename, sizes_large_url, sizes_large_width, sizes_large_height, sizes_large_mime_type, sizes_large_filesize, sizes_large_filename, sizes_xlarge_url, sizes_xlarge_width, sizes_xlarge_height, sizes_xlarge_mime_type, sizes_xlarge_filesize, sizes_xlarge_filename, sizes_og_url, sizes_og_width, sizes_og_height, sizes_og_mime_type, sizes_og_filesize, sizes_og_filename) VALUES (2, 'logo 1 1', NULL, NULL, '2026-06-16 16:00:48.275+00', '2026-06-16 16:00:48.275+00', '/api/media/file/logo-1-2.png', NULL, 'logo-1-2.png', 'image/png', 16894, 1200, 1200, 50, 50, '/api/media/file/logo-1-2-300x300.png', 300, 300, 'image/png', 16409, 'logo-1-2-300x300.png', '/api/media/file/logo-1-2-500x500.png', 500, 500, 'image/png', 28580, 'logo-1-2-500x500.png', '/api/media/file/logo-1-2-600x600.png', 600, 600, 'image/png', 34472, 'logo-1-2-600x600.png', '/api/media/file/logo-1-2-900x900.png', 900, 900, 'image/png', 59314, 'logo-1-2-900x900.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/api/media/file/logo-1-2-1200x630.png', 1200, 630, 'image/png', 24996, 'logo-1-2-1200x630.png');
INSERT INTO public.media (id, alt, caption, folder_id, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_square_url, sizes_square_width, sizes_square_height, sizes_square_mime_type, sizes_square_filesize, sizes_square_filename, sizes_small_url, sizes_small_width, sizes_small_height, sizes_small_mime_type, sizes_small_filesize, sizes_small_filename, sizes_medium_url, sizes_medium_width, sizes_medium_height, sizes_medium_mime_type, sizes_medium_filesize, sizes_medium_filename, sizes_large_url, sizes_large_width, sizes_large_height, sizes_large_mime_type, sizes_large_filesize, sizes_large_filename, sizes_xlarge_url, sizes_xlarge_width, sizes_xlarge_height, sizes_xlarge_mime_type, sizes_xlarge_filesize, sizes_xlarge_filename, sizes_og_url, sizes_og_width, sizes_og_height, sizes_og_mime_type, sizes_og_filesize, sizes_og_filename) VALUES (3, 'Construction Electric Inc Logo', NULL, NULL, '2026-06-16 16:00:48.99+00', '2026-06-16 16:00:48.99+00', '/api/media/file/911-Construction-Electric-Inc_-Logo-1.avif', NULL, '911-Construction-Electric-Inc_-Logo-1.avif', 'image/avif', 8608, 428, 206, 50, 50, '/api/media/file/911-Construction-Electric-Inc_-Logo-1-300x144.avif', 300, 144, 'image/avif', 5712, '911-Construction-Electric-Inc_-Logo-1-300x144.avif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.media (id, alt, caption, folder_id, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_square_url, sizes_square_width, sizes_square_height, sizes_square_mime_type, sizes_square_filesize, sizes_square_filename, sizes_small_url, sizes_small_width, sizes_small_height, sizes_small_mime_type, sizes_small_filesize, sizes_small_filename, sizes_medium_url, sizes_medium_width, sizes_medium_height, sizes_medium_mime_type, sizes_medium_filesize, sizes_medium_filename, sizes_large_url, sizes_large_width, sizes_large_height, sizes_large_mime_type, sizes_large_filesize, sizes_large_filename, sizes_xlarge_url, sizes_xlarge_width, sizes_xlarge_height, sizes_xlarge_mime_type, sizes_xlarge_filesize, sizes_xlarge_filename, sizes_og_url, sizes_og_width, sizes_og_height, sizes_og_mime_type, sizes_og_filesize, sizes_og_filename) VALUES (4, 'Hero Form Logos', NULL, NULL, '2026-06-16 16:00:49.476+00', '2026-06-16 16:00:49.476+00', '/api/media/file/Hero-Form-Logos-1.png', NULL, 'Hero-Form-Logos-1.png', 'image/png', 54591, 1920, 170, 50, 50, '/api/media/file/Hero-Form-Logos-1-300x27.png', 300, 27, 'image/png', 6502, 'Hero-Form-Logos-1-300x27.png', '/api/media/file/Hero-Form-Logos-1-500x500.png', 500, 500, 'image/png', 68344, 'Hero-Form-Logos-1-500x500.png', '/api/media/file/Hero-Form-Logos-1-600x53.png', 600, 53, 'image/png', 16272, 'Hero-Form-Logos-1-600x53.png', '/api/media/file/Hero-Form-Logos-1-900x80.png', 900, 80, 'image/png', 30089, 'Hero-Form-Logos-1-900x80.png', '/api/media/file/Hero-Form-Logos-1-1400x124.png', 1400, 124, 'image/png', 65101, 'Hero-Form-Logos-1-1400x124.png', '/api/media/file/Hero-Form-Logos-1-1920x170.png', 1920, 170, 'image/png', 86105, 'Hero-Form-Logos-1-1920x170.png', '/api/media/file/Hero-Form-Logos-1-1200x630.png', 1200, 630, 'image/png', 193547, 'Hero-Form-Logos-1-1200x630.png');
INSERT INTO public.media (id, alt, caption, folder_id, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_square_url, sizes_square_width, sizes_square_height, sizes_square_mime_type, sizes_square_filesize, sizes_square_filename, sizes_small_url, sizes_small_width, sizes_small_height, sizes_small_mime_type, sizes_small_filesize, sizes_small_filename, sizes_medium_url, sizes_medium_width, sizes_medium_height, sizes_medium_mime_type, sizes_medium_filesize, sizes_medium_filename, sizes_large_url, sizes_large_width, sizes_large_height, sizes_large_mime_type, sizes_large_filesize, sizes_large_filename, sizes_xlarge_url, sizes_xlarge_width, sizes_xlarge_height, sizes_xlarge_mime_type, sizes_xlarge_filesize, sizes_xlarge_filename, sizes_og_url, sizes_og_width, sizes_og_height, sizes_og_mime_type, sizes_og_filesize, sizes_og_filename) VALUES (5, 'Hero Video', NULL, NULL, '2026-06-16 16:00:49.884+00', '2026-06-16 16:00:49.883+00', '/api/media/file/Hero-Video-1.mp4', NULL, 'Hero-Video-1.mp4', 'video/mp4', 23813647, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.media (id, alt, caption, folder_id, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_square_url, sizes_square_width, sizes_square_height, sizes_square_mime_type, sizes_square_filesize, sizes_square_filename, sizes_small_url, sizes_small_width, sizes_small_height, sizes_small_mime_type, sizes_small_filesize, sizes_small_filename, sizes_medium_url, sizes_medium_width, sizes_medium_height, sizes_medium_mime_type, sizes_medium_filesize, sizes_medium_filename, sizes_large_url, sizes_large_width, sizes_large_height, sizes_large_mime_type, sizes_large_filesize, sizes_large_filename, sizes_xlarge_url, sizes_xlarge_width, sizes_xlarge_height, sizes_xlarge_mime_type, sizes_xlarge_filesize, sizes_xlarge_filename, sizes_og_url, sizes_og_width, sizes_og_height, sizes_og_mime_type, sizes_og_filesize, sizes_og_filename) VALUES (6, 'CE removebg preview', NULL, NULL, '2026-06-16 16:00:49.993+00', '2026-06-16 16:00:49.993+00', '/api/media/file/911CE-removebg-preview-1.png', NULL, '911CE-removebg-preview-1.png', 'image/png', 50705, 728, 343, 50, 50, '/api/media/file/911CE-removebg-preview-1-300x141.png', 300, 141, 'image/png', 35112, '911CE-removebg-preview-1-300x141.png', '/api/media/file/911CE-removebg-preview-1-500x500.png', 500, 500, 'image/png', 136161, '911CE-removebg-preview-1-500x500.png', '/api/media/file/911CE-removebg-preview-1-600x283.png', 600, 283, 'image/png', 110684, '911CE-removebg-preview-1-600x283.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.media (id, alt, caption, folder_id, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_square_url, sizes_square_width, sizes_square_height, sizes_square_mime_type, sizes_square_filesize, sizes_square_filename, sizes_small_url, sizes_small_width, sizes_small_height, sizes_small_mime_type, sizes_small_filesize, sizes_small_filename, sizes_medium_url, sizes_medium_width, sizes_medium_height, sizes_medium_mime_type, sizes_medium_filesize, sizes_medium_filename, sizes_large_url, sizes_large_width, sizes_large_height, sizes_large_mime_type, sizes_large_filesize, sizes_large_filename, sizes_xlarge_url, sizes_xlarge_width, sizes_xlarge_height, sizes_xlarge_mime_type, sizes_xlarge_filesize, sizes_xlarge_filename, sizes_og_url, sizes_og_width, sizes_og_height, sizes_og_mime_type, sizes_og_filesize, sizes_og_filename) VALUES (7, 'ccb7 Construction Electric Inc. Logo White Background removebg preview', NULL, NULL, '2026-06-16 16:00:50.088+00', '2026-06-16 16:00:50.088+00', '/api/media/file/94142c042cb7-911_Construction___Electric_Inc._Logo_White_Background-removebg-preview-1.png', NULL, '94142c042cb7-911_Construction___Electric_Inc._Logo_White_Background-removebg-preview-1.png', 'image/png', 23195, 612, 408, 50, 50, '/api/media/file/94142c042cb7-911_Construction___Electric_Inc._Logo_White_Background-removebg-preview-1-300x200.png', 300, 200, 'image/png', 20859, '94142c042cb7-911_Construction___Electric_Inc._Logo_White_Background-removebg-preview-1-300x200.png', '/api/media/file/94142c042cb7-911_Construction___Electric_Inc._Logo_White_Background-removebg-preview-1-500x500.png', 500, 500, 'image/png', 89456, '94142c042cb7-911_Construction___Electric_Inc._Logo_White_Background-removebg-preview-1-500x500.png', '/api/media/file/94142c042cb7-911_Construction___Electric_Inc._Logo_White_Background-removebg-preview-1-600x400.png', 600, 400, 'image/png', 67504, '94142c042cb7-911_Construction___Electric_Inc._Logo_White_Background-removebg-preview-1-600x400.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.media (id, alt, caption, folder_id, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_square_url, sizes_square_width, sizes_square_height, sizes_square_mime_type, sizes_square_filesize, sizes_square_filename, sizes_small_url, sizes_small_width, sizes_small_height, sizes_small_mime_type, sizes_small_filesize, sizes_small_filename, sizes_medium_url, sizes_medium_width, sizes_medium_height, sizes_medium_mime_type, sizes_medium_filesize, sizes_medium_filename, sizes_large_url, sizes_large_width, sizes_large_height, sizes_large_mime_type, sizes_large_filesize, sizes_large_filename, sizes_xlarge_url, sizes_xlarge_width, sizes_xlarge_height, sizes_xlarge_mime_type, sizes_xlarge_filesize, sizes_xlarge_filename, sizes_og_url, sizes_og_width, sizes_og_height, sizes_og_mime_type, sizes_og_filesize, sizes_og_filename) VALUES (8, 'ccb7 Construction Electric Inc. Logo White Background', NULL, NULL, '2026-06-16 16:00:50.375+00', '2026-06-16 16:00:50.375+00', '/api/media/file/94142c042cb7-911_Construction___Electric_Inc._Logo_White_Background-1.png', NULL, '94142c042cb7-911_Construction___Electric_Inc._Logo_White_Background-1.png', 'image/jpeg', 39386, 1536, 1024, 50, 50, '/api/media/file/94142c042cb7-911_Construction___Electric_Inc._Logo_White_Background-1-300x200.jpg', 300, 200, 'image/jpeg', 6148, '94142c042cb7-911_Construction___Electric_Inc._Logo_White_Background-1-300x200.jpg', '/api/media/file/94142c042cb7-911_Construction___Electric_Inc._Logo_White_Background-1-500x500.jpg', 500, 500, 'image/jpeg', 21464, '94142c042cb7-911_Construction___Electric_Inc._Logo_White_Background-1-500x500.jpg', '/api/media/file/94142c042cb7-911_Construction___Electric_Inc._Logo_White_Background-1-600x400.jpg', 600, 400, 'image/jpeg', 16557, '94142c042cb7-911_Construction___Electric_Inc._Logo_White_Background-1-600x400.jpg', '/api/media/file/94142c042cb7-911_Construction___Electric_Inc._Logo_White_Background-1-900x600.jpg', 900, 600, 'image/jpeg', 28566, '94142c042cb7-911_Construction___Electric_Inc._Logo_White_Background-1-900x600.jpg', '/api/media/file/94142c042cb7-911_Construction___Electric_Inc._Logo_White_Background-1-1400x933.jpg', 1400, 933, 'image/jpeg', 50718, '94142c042cb7-911_Construction___Electric_Inc._Logo_White_Background-1-1400x933.jpg', NULL, NULL, NULL, NULL, NULL, NULL, '/api/media/file/94142c042cb7-911_Construction___Electric_Inc._Logo_White_Background-1-1200x630.jpg', 1200, 630, 'image/jpeg', 39576, '94142c042cb7-911_Construction___Electric_Inc._Logo_White_Background-1-1200x630.jpg');
INSERT INTO public.media (id, alt, caption, folder_id, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_square_url, sizes_square_width, sizes_square_height, sizes_square_mime_type, sizes_square_filesize, sizes_square_filename, sizes_small_url, sizes_small_width, sizes_small_height, sizes_small_mime_type, sizes_small_filesize, sizes_small_filename, sizes_medium_url, sizes_medium_width, sizes_medium_height, sizes_medium_mime_type, sizes_medium_filesize, sizes_medium_filename, sizes_large_url, sizes_large_width, sizes_large_height, sizes_large_mime_type, sizes_large_filesize, sizes_large_filename, sizes_xlarge_url, sizes_xlarge_width, sizes_xlarge_height, sizes_xlarge_mime_type, sizes_xlarge_filesize, sizes_xlarge_filename, sizes_og_url, sizes_og_width, sizes_og_height, sizes_og_mime_type, sizes_og_filesize, sizes_og_filename) VALUES (9, 'Gemini Generated Image ho9ho9h', NULL, NULL, '2026-06-16 16:00:51.343+00', '2026-06-16 16:00:51.343+00', '/api/media/file/Gemini_Generated_Image_h923o9h923o9h923-1.webp', NULL, 'Gemini_Generated_Image_h923o9h923o9h923-1.webp', 'image/webp', 178222, 1024, 1024, 50, 50, '/api/media/file/Gemini_Generated_Image_h923o9h923o9h923-1-300x300.webp', 300, 300, 'image/webp', 20826, 'Gemini_Generated_Image_h923o9h923o9h923-1-300x300.webp', '/api/media/file/Gemini_Generated_Image_h923o9h923o9h923-1-500x500.webp', 500, 500, 'image/webp', 49170, 'Gemini_Generated_Image_h923o9h923o9h923-1-500x500.webp', '/api/media/file/Gemini_Generated_Image_h923o9h923o9h923-1-600x600.webp', 600, 600, 'image/webp', 71910, 'Gemini_Generated_Image_h923o9h923o9h923-1-600x600.webp', '/api/media/file/Gemini_Generated_Image_h923o9h923o9h923-1-900x900.webp', 900, 900, 'image/webp', 142818, 'Gemini_Generated_Image_h923o9h923o9h923-1-900x900.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/api/media/file/Gemini_Generated_Image_h923o9h923o9h923-1-1200x630.webp', 1200, 630, 'image/webp', 114748, 'Gemini_Generated_Image_h923o9h923o9h923-1-1200x630.webp');
INSERT INTO public.media (id, alt, caption, folder_id, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_square_url, sizes_square_width, sizes_square_height, sizes_square_mime_type, sizes_square_filesize, sizes_square_filename, sizes_small_url, sizes_small_width, sizes_small_height, sizes_small_mime_type, sizes_small_filesize, sizes_small_filename, sizes_medium_url, sizes_medium_width, sizes_medium_height, sizes_medium_mime_type, sizes_medium_filesize, sizes_medium_filename, sizes_large_url, sizes_large_width, sizes_large_height, sizes_large_mime_type, sizes_large_filesize, sizes_large_filename, sizes_xlarge_url, sizes_xlarge_width, sizes_xlarge_height, sizes_xlarge_mime_type, sizes_xlarge_filesize, sizes_xlarge_filename, sizes_og_url, sizes_og_width, sizes_og_height, sizes_og_mime_type, sizes_og_filesize, sizes_og_filename) VALUES (10, 'IMG', NULL, NULL, '2026-06-16 16:00:51.51+00', '2026-06-16 16:00:51.51+00', '/api/media/file/IMG_2782-1.jpg', NULL, 'IMG_2782-1.jpg', 'image/jpeg', 202798, 1179, 1563, 50, 50, '/api/media/file/IMG_2782-1-300x398.jpg', 300, 398, 'image/jpeg', 22268, 'IMG_2782-1-300x398.jpg', '/api/media/file/IMG_2782-1-500x500.jpg', 500, 500, 'image/jpeg', 48057, 'IMG_2782-1-500x500.jpg', '/api/media/file/IMG_2782-1-600x795.jpg', 600, 795, 'image/jpeg', 75821, 'IMG_2782-1-600x795.jpg', '/api/media/file/IMG_2782-1-900x1193.jpg', 900, 1193, 'image/jpeg', 154786, 'IMG_2782-1-900x1193.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/api/media/file/IMG_2782-1-1200x630.jpg', 1200, 630, 'image/jpeg', 118204, 'IMG_2782-1-1200x630.jpg');
INSERT INTO public.media (id, alt, caption, folder_id, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_square_url, sizes_square_width, sizes_square_height, sizes_square_mime_type, sizes_square_filesize, sizes_square_filename, sizes_small_url, sizes_small_width, sizes_small_height, sizes_small_mime_type, sizes_small_filesize, sizes_small_filename, sizes_medium_url, sizes_medium_width, sizes_medium_height, sizes_medium_mime_type, sizes_medium_filesize, sizes_medium_filename, sizes_large_url, sizes_large_width, sizes_large_height, sizes_large_mime_type, sizes_large_filesize, sizes_large_filename, sizes_xlarge_url, sizes_xlarge_width, sizes_xlarge_height, sizes_xlarge_mime_type, sizes_xlarge_filesize, sizes_xlarge_filename, sizes_og_url, sizes_og_width, sizes_og_height, sizes_og_mime_type, sizes_og_filesize, sizes_og_filename) VALUES (11, 'IMG', NULL, NULL, '2026-06-16 16:00:51.645+00', '2026-06-16 16:00:51.645+00', '/api/media/file/IMG_2783-1.jpg', NULL, 'IMG_2783-1.jpg', 'image/jpeg', 125220, 1179, 793, 50, 50, '/api/media/file/IMG_2783-1-300x202.jpg', 300, 202, 'image/jpeg', 14347, 'IMG_2783-1-300x202.jpg', '/api/media/file/IMG_2783-1-500x500.jpg', 500, 500, 'image/jpeg', 56311, 'IMG_2783-1-500x500.jpg', '/api/media/file/IMG_2783-1-600x404.jpg', 600, 404, 'image/jpeg', 49243, 'IMG_2783-1-600x404.jpg', '/api/media/file/IMG_2783-1-900x605.jpg', 900, 605, 'image/jpeg', 98875, 'IMG_2783-1-900x605.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/api/media/file/IMG_2783-1-1200x630.jpg', 1200, 630, 'image/jpeg', 133505, 'IMG_2783-1-1200x630.jpg');
INSERT INTO public.media (id, alt, caption, folder_id, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_square_url, sizes_square_width, sizes_square_height, sizes_square_mime_type, sizes_square_filesize, sizes_square_filename, sizes_small_url, sizes_small_width, sizes_small_height, sizes_small_mime_type, sizes_small_filesize, sizes_small_filename, sizes_medium_url, sizes_medium_width, sizes_medium_height, sizes_medium_mime_type, sizes_medium_filesize, sizes_medium_filename, sizes_large_url, sizes_large_width, sizes_large_height, sizes_large_mime_type, sizes_large_filesize, sizes_large_filename, sizes_xlarge_url, sizes_xlarge_width, sizes_xlarge_height, sizes_xlarge_mime_type, sizes_xlarge_filesize, sizes_xlarge_filename, sizes_og_url, sizes_og_width, sizes_og_height, sizes_og_mime_type, sizes_og_filesize, sizes_og_filename) VALUES (22, 'Call cta', NULL, NULL, '2026-06-16 16:01:20.435+00', '2026-06-16 16:01:20.435+00', '/api/media/file/Call-cta-1.png', NULL, 'Call-cta-1.png', 'image/png', 57411, 510, 489, 50, 50, '/api/media/file/Call-cta-1-300x288.png', 300, 288, 'image/png', 64055, 'Call-cta-1-300x288.png', '/api/media/file/Call-cta-1-500x500.png', 500, 500, 'image/png', 141529, 'Call-cta-1-500x500.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.media (id, alt, caption, folder_id, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_square_url, sizes_square_width, sizes_square_height, sizes_square_mime_type, sizes_square_filesize, sizes_square_filename, sizes_small_url, sizes_small_width, sizes_small_height, sizes_small_mime_type, sizes_small_filesize, sizes_small_filename, sizes_medium_url, sizes_medium_width, sizes_medium_height, sizes_medium_mime_type, sizes_medium_filesize, sizes_medium_filename, sizes_large_url, sizes_large_width, sizes_large_height, sizes_large_mime_type, sizes_large_filesize, sizes_large_filename, sizes_xlarge_url, sizes_xlarge_width, sizes_xlarge_height, sizes_xlarge_mime_type, sizes_xlarge_filesize, sizes_xlarge_filename, sizes_og_url, sizes_og_width, sizes_og_height, sizes_og_mime_type, sizes_og_filesize, sizes_og_filename) VALUES (12, 'IMG', NULL, NULL, '2026-06-16 16:00:51.822+00', '2026-06-16 16:00:51.822+00', '/api/media/file/IMG_2784-1.jpg', NULL, 'IMG_2784-1.jpg', 'image/jpeg', 209207, 1179, 1508, 50, 50, '/api/media/file/IMG_2784-1-300x384.jpg', 300, 384, 'image/jpeg', 23593, 'IMG_2784-1-300x384.jpg', '/api/media/file/IMG_2784-1-500x500.jpg', 500, 500, 'image/jpeg', 45238, 'IMG_2784-1-500x500.jpg', '/api/media/file/IMG_2784-1-600x767.jpg', 600, 767, 'image/jpeg', 78268, 'IMG_2784-1-600x767.jpg', '/api/media/file/IMG_2784-1-900x1151.jpg', 900, 1151, 'image/jpeg', 160380, 'IMG_2784-1-900x1151.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/api/media/file/IMG_2784-1-1200x630.jpg', 1200, 630, 'image/jpeg', 97356, 'IMG_2784-1-1200x630.jpg');
INSERT INTO public.media (id, alt, caption, folder_id, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_square_url, sizes_square_width, sizes_square_height, sizes_square_mime_type, sizes_square_filesize, sizes_square_filename, sizes_small_url, sizes_small_width, sizes_small_height, sizes_small_mime_type, sizes_small_filesize, sizes_small_filename, sizes_medium_url, sizes_medium_width, sizes_medium_height, sizes_medium_mime_type, sizes_medium_filesize, sizes_medium_filename, sizes_large_url, sizes_large_width, sizes_large_height, sizes_large_mime_type, sizes_large_filesize, sizes_large_filename, sizes_xlarge_url, sizes_xlarge_width, sizes_xlarge_height, sizes_xlarge_mime_type, sizes_xlarge_filesize, sizes_xlarge_filename, sizes_og_url, sizes_og_width, sizes_og_height, sizes_og_mime_type, sizes_og_filesize, sizes_og_filename) VALUES (13, 'IMG', NULL, NULL, '2026-06-16 16:00:52.008+00', '2026-06-16 16:00:52.007+00', '/api/media/file/IMG_2785-1.jpg', NULL, 'IMG_2785-1.jpg', 'image/jpeg', 120528, 1179, 1522, 50, 50, '/api/media/file/IMG_2785-1-300x387.jpg', 300, 387, 'image/jpeg', 16715, 'IMG_2785-1-300x387.jpg', '/api/media/file/IMG_2785-1-500x500.jpg', 500, 500, 'image/jpeg', 29529, 'IMG_2785-1-500x500.jpg', '/api/media/file/IMG_2785-1-600x775.jpg', 600, 775, 'image/jpeg', 50699, 'IMG_2785-1-600x775.jpg', '/api/media/file/IMG_2785-1-900x1162.jpg', 900, 1162, 'image/jpeg', 97315, 'IMG_2785-1-900x1162.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/api/media/file/IMG_2785-1-1200x630.jpg', 1200, 630, 'image/jpeg', 58119, 'IMG_2785-1-1200x630.jpg');
INSERT INTO public.media (id, alt, caption, folder_id, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_square_url, sizes_square_width, sizes_square_height, sizes_square_mime_type, sizes_square_filesize, sizes_square_filename, sizes_small_url, sizes_small_width, sizes_small_height, sizes_small_mime_type, sizes_small_filesize, sizes_small_filename, sizes_medium_url, sizes_medium_width, sizes_medium_height, sizes_medium_mime_type, sizes_medium_filesize, sizes_medium_filename, sizes_large_url, sizes_large_width, sizes_large_height, sizes_large_mime_type, sizes_large_filesize, sizes_large_filename, sizes_xlarge_url, sizes_xlarge_width, sizes_xlarge_height, sizes_xlarge_mime_type, sizes_xlarge_filesize, sizes_xlarge_filename, sizes_og_url, sizes_og_width, sizes_og_height, sizes_og_mime_type, sizes_og_filesize, sizes_og_filename) VALUES (14, 'IMG', NULL, NULL, '2026-06-16 16:00:52.159+00', '2026-06-16 16:00:52.159+00', '/api/media/file/IMG_2786-1.jpg', NULL, 'IMG_2786-1.jpg', 'image/jpeg', 128281, 1179, 1523, 50, 50, '/api/media/file/IMG_2786-1-300x388.jpg', 300, 388, 'image/jpeg', 17028, 'IMG_2786-1-300x388.jpg', '/api/media/file/IMG_2786-1-500x500.jpg', 500, 500, 'image/jpeg', 33015, 'IMG_2786-1-500x500.jpg', '/api/media/file/IMG_2786-1-600x775.jpg', 600, 775, 'image/jpeg', 51845, 'IMG_2786-1-600x775.jpg', '/api/media/file/IMG_2786-1-900x1163.jpg', 900, 1163, 'image/jpeg', 99617, 'IMG_2786-1-900x1163.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/api/media/file/IMG_2786-1-1200x630.jpg', 1200, 630, 'image/jpeg', 82196, 'IMG_2786-1-1200x630.jpg');
INSERT INTO public.media (id, alt, caption, folder_id, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_square_url, sizes_square_width, sizes_square_height, sizes_square_mime_type, sizes_square_filesize, sizes_square_filename, sizes_small_url, sizes_small_width, sizes_small_height, sizes_small_mime_type, sizes_small_filesize, sizes_small_filename, sizes_medium_url, sizes_medium_width, sizes_medium_height, sizes_medium_mime_type, sizes_medium_filesize, sizes_medium_filename, sizes_large_url, sizes_large_width, sizes_large_height, sizes_large_mime_type, sizes_large_filesize, sizes_large_filename, sizes_xlarge_url, sizes_xlarge_width, sizes_xlarge_height, sizes_xlarge_mime_type, sizes_xlarge_filesize, sizes_xlarge_filename, sizes_og_url, sizes_og_width, sizes_og_height, sizes_og_mime_type, sizes_og_filesize, sizes_og_filename) VALUES (15, 'IMG', NULL, NULL, '2026-06-16 16:00:52.304+00', '2026-06-16 16:00:52.304+00', '/api/media/file/IMG_2787-1.jpg', NULL, 'IMG_2787-1.jpg', 'image/jpeg', 85220, 1179, 1137, 50, 50, '/api/media/file/IMG_2787-1-300x289.jpg', 300, 289, 'image/jpeg', 12199, 'IMG_2787-1-300x289.jpg', '/api/media/file/IMG_2787-1-500x500.jpg', 500, 500, 'image/jpeg', 28466, 'IMG_2787-1-500x500.jpg', '/api/media/file/IMG_2787-1-600x579.jpg', 600, 579, 'image/jpeg', 35987, 'IMG_2787-1-600x579.jpg', '/api/media/file/IMG_2787-1-900x868.jpg', 900, 868, 'image/jpeg', 68164, 'IMG_2787-1-900x868.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/api/media/file/IMG_2787-1-1200x630.jpg', 1200, 630, 'image/jpeg', 68817, 'IMG_2787-1-1200x630.jpg');
INSERT INTO public.media (id, alt, caption, folder_id, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_square_url, sizes_square_width, sizes_square_height, sizes_square_mime_type, sizes_square_filesize, sizes_square_filename, sizes_small_url, sizes_small_width, sizes_small_height, sizes_small_mime_type, sizes_small_filesize, sizes_small_filename, sizes_medium_url, sizes_medium_width, sizes_medium_height, sizes_medium_mime_type, sizes_medium_filesize, sizes_medium_filename, sizes_large_url, sizes_large_width, sizes_large_height, sizes_large_mime_type, sizes_large_filesize, sizes_large_filename, sizes_xlarge_url, sizes_xlarge_width, sizes_xlarge_height, sizes_xlarge_mime_type, sizes_xlarge_filesize, sizes_xlarge_filename, sizes_og_url, sizes_og_width, sizes_og_height, sizes_og_mime_type, sizes_og_filesize, sizes_og_filename) VALUES (16, 'bcd 1ff8f7ae98adfdfdmv2', NULL, NULL, '2026-06-16 16:01:01.326+00', '2026-06-16 16:01:01.326+00', '/api/media/file/bcd640_1f5593f8f7a8497e98adfd5091fd4762mv2-1.avif', NULL, 'bcd640_1f5593f8f7a8497e98adfd5091fd4762mv2-1.avif', 'image/avif', 70719, 1360, 496, 50, 50, '/api/media/file/bcd640_1f5593f8f7a8497e98adfd5091fd4762mv2-1-300x109.avif', 300, 109, 'image/avif', 6033, 'bcd640_1f5593f8f7a8497e98adfd5091fd4762mv2-1-300x109.avif', '/api/media/file/bcd640_1f5593f8f7a8497e98adfd5091fd4762mv2-1-500x500.avif', 500, 500, 'image/avif', 21492, 'bcd640_1f5593f8f7a8497e98adfd5091fd4762mv2-1-500x500.avif', '/api/media/file/bcd640_1f5593f8f7a8497e98adfd5091fd4762mv2-1-600x219.avif', 600, 219, 'image/avif', 18620, 'bcd640_1f5593f8f7a8497e98adfd5091fd4762mv2-1-600x219.avif', '/api/media/file/bcd640_1f5593f8f7a8497e98adfd5091fd4762mv2-1-900x328.avif', 900, 328, 'image/avif', 36484, 'bcd640_1f5593f8f7a8497e98adfd5091fd4762mv2-1-900x328.avif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/api/media/file/bcd640_1f5593f8f7a8497e98adfd5091fd4762mv2-1-1200x630.avif', 1200, 630, 'image/avif', 45130, 'bcd640_1f5593f8f7a8497e98adfd5091fd4762mv2-1-1200x630.avif');
INSERT INTO public.media (id, alt, caption, folder_id, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_square_url, sizes_square_width, sizes_square_height, sizes_square_mime_type, sizes_square_filesize, sizes_square_filename, sizes_small_url, sizes_small_width, sizes_small_height, sizes_small_mime_type, sizes_small_filesize, sizes_small_filename, sizes_medium_url, sizes_medium_width, sizes_medium_height, sizes_medium_mime_type, sizes_medium_filesize, sizes_medium_filename, sizes_large_url, sizes_large_width, sizes_large_height, sizes_large_mime_type, sizes_large_filesize, sizes_large_filename, sizes_xlarge_url, sizes_xlarge_width, sizes_xlarge_height, sizes_xlarge_mime_type, sizes_xlarge_filesize, sizes_xlarge_filename, sizes_og_url, sizes_og_width, sizes_og_height, sizes_og_mime_type, sizes_og_filesize, sizes_og_filename) VALUES (17, 'cdd 21edd94fd5a80dc97dbba7mv2', NULL, NULL, '2026-06-16 16:01:10.172+00', '2026-06-16 16:01:10.172+00', '/api/media/file/cdd688_21ed453808d94fd5a80dc97dbb7902a7mv2-1.avif', NULL, 'cdd688_21ed453808d94fd5a80dc97dbb7902a7mv2-1.avif', 'image/avif', 29133, 1200, 437, 50, 50, '/api/media/file/cdd688_21ed453808d94fd5a80dc97dbb7902a7mv2-1-300x109.avif', 300, 109, 'image/avif', 4366, 'cdd688_21ed453808d94fd5a80dc97dbb7902a7mv2-1-300x109.avif', '/api/media/file/cdd688_21ed453808d94fd5a80dc97dbb7902a7mv2-1-500x500.avif', 500, 500, 'image/avif', 17072, 'cdd688_21ed453808d94fd5a80dc97dbb7902a7mv2-1-500x500.avif', '/api/media/file/cdd688_21ed453808d94fd5a80dc97dbb7902a7mv2-1-600x219.avif', 600, 219, 'image/avif', 11121, 'cdd688_21ed453808d94fd5a80dc97dbb7902a7mv2-1-600x219.avif', '/api/media/file/cdd688_21ed453808d94fd5a80dc97dbb7902a7mv2-1-900x328.avif', 900, 328, 'image/avif', 19279, 'cdd688_21ed453808d94fd5a80dc97dbb7902a7mv2-1-900x328.avif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/api/media/file/cdd688_21ed453808d94fd5a80dc97dbb7902a7mv2-1-1200x630.avif', 1200, 630, 'image/avif', 27952, 'cdd688_21ed453808d94fd5a80dc97dbb7902a7mv2-1-1200x630.avif');
INSERT INTO public.media (id, alt, caption, folder_id, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_square_url, sizes_square_width, sizes_square_height, sizes_square_mime_type, sizes_square_filesize, sizes_square_filename, sizes_small_url, sizes_small_width, sizes_small_height, sizes_small_mime_type, sizes_small_filesize, sizes_small_filename, sizes_medium_url, sizes_medium_width, sizes_medium_height, sizes_medium_mime_type, sizes_medium_filesize, sizes_medium_filename, sizes_large_url, sizes_large_width, sizes_large_height, sizes_large_mime_type, sizes_large_filesize, sizes_large_filename, sizes_xlarge_url, sizes_xlarge_width, sizes_xlarge_height, sizes_xlarge_mime_type, sizes_xlarge_filesize, sizes_xlarge_filename, sizes_og_url, sizes_og_width, sizes_og_height, sizes_og_mime_type, sizes_og_filesize, sizes_og_filename) VALUES (18, 'cdd fef10cace4bee8c7b91famv2', NULL, NULL, '2026-06-16 16:01:20.227+00', '2026-06-16 16:01:20.227+00', '/api/media/file/cdd688_fef10ca785ce4b4991e4425e8c7b91famv2-1.avif', NULL, 'cdd688_fef10ca785ce4b4991e4425e8c7b91famv2-1.avif', 'image/avif', 49746, 1200, 437, 50, 50, '/api/media/file/cdd688_fef10ca785ce4b4991e4425e8c7b91famv2-1-300x109.avif', 300, 109, 'image/avif', 7438, 'cdd688_fef10ca785ce4b4991e4425e8c7b91famv2-1-300x109.avif', '/api/media/file/cdd688_fef10ca785ce4b4991e4425e8c7b91famv2-1-500x500.avif', 500, 500, 'image/avif', 26298, 'cdd688_fef10ca785ce4b4991e4425e8c7b91famv2-1-500x500.avif', '/api/media/file/cdd688_fef10ca785ce4b4991e4425e8c7b91famv2-1-600x219.avif', 600, 219, 'image/avif', 20003, 'cdd688_fef10ca785ce4b4991e4425e8c7b91famv2-1-600x219.avif', '/api/media/file/cdd688_fef10ca785ce4b4991e4425e8c7b91famv2-1-900x328.avif', 900, 328, 'image/avif', 32619, 'cdd688_fef10ca785ce4b4991e4425e8c7b91famv2-1-900x328.avif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/api/media/file/cdd688_fef10ca785ce4b4991e4425e8c7b91famv2-1-1200x630.avif', 1200, 630, 'image/avif', 52083, 'cdd688_fef10ca785ce4b4991e4425e8c7b91famv2-1-1200x630.avif');
INSERT INTO public.media (id, alt, caption, folder_id, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_square_url, sizes_square_width, sizes_square_height, sizes_square_mime_type, sizes_square_filesize, sizes_square_filename, sizes_small_url, sizes_small_width, sizes_small_height, sizes_small_mime_type, sizes_small_filesize, sizes_small_filename, sizes_medium_url, sizes_medium_width, sizes_medium_height, sizes_medium_mime_type, sizes_medium_filesize, sizes_medium_filename, sizes_large_url, sizes_large_width, sizes_large_height, sizes_large_mime_type, sizes_large_filesize, sizes_large_filename, sizes_xlarge_url, sizes_xlarge_width, sizes_xlarge_height, sizes_xlarge_mime_type, sizes_xlarge_filesize, sizes_xlarge_filename, sizes_og_url, sizes_og_width, sizes_og_height, sizes_og_mime_type, sizes_og_filesize, sizes_og_filename) VALUES (19, 'cropped ccb7 Construction Electric Inc. Logo White Background 1', NULL, NULL, '2026-06-16 16:01:20.288+00', '2026-06-16 16:01:20.288+00', '/api/media/file/cropped-94142c042cb7-911_Construction___Electric_Inc._Logo_White_Background-2.png', NULL, 'cropped-94142c042cb7-911_Construction___Electric_Inc._Logo_White_Background-2.png', 'image/jpeg', 14804, 512, 512, 50, 50, '/api/media/file/cropped-94142c042cb7-911_Construction___Electric_Inc._Logo_White_Background-2-300x300.jpg', 300, 300, 'image/jpeg', 9900, 'cropped-94142c042cb7-911_Construction___Electric_Inc._Logo_White_Background-2-300x300.jpg', '/api/media/file/cropped-94142c042cb7-911_Construction___Electric_Inc._Logo_White_Background-2-500x500.jpg', 500, 500, 'image/jpeg', 19487, 'cropped-94142c042cb7-911_Construction___Electric_Inc._Logo_White_Background-2-500x500.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.media (id, alt, caption, folder_id, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_square_url, sizes_square_width, sizes_square_height, sizes_square_mime_type, sizes_square_filesize, sizes_square_filename, sizes_small_url, sizes_small_width, sizes_small_height, sizes_small_mime_type, sizes_small_filesize, sizes_small_filename, sizes_medium_url, sizes_medium_width, sizes_medium_height, sizes_medium_mime_type, sizes_medium_filesize, sizes_medium_filename, sizes_large_url, sizes_large_width, sizes_large_height, sizes_large_mime_type, sizes_large_filesize, sizes_large_filename, sizes_xlarge_url, sizes_xlarge_width, sizes_xlarge_height, sizes_xlarge_mime_type, sizes_xlarge_filesize, sizes_xlarge_filename, sizes_og_url, sizes_og_width, sizes_og_height, sizes_og_mime_type, sizes_og_filesize, sizes_og_filename) VALUES (20, 'cropped ccb7 Construction Electric Inc. Logo White Background removebg preview', NULL, NULL, '2026-06-16 16:01:20.334+00', '2026-06-16 16:01:20.333+00', '/api/media/file/cropped-94142c042cb7-911_Construction___Electric_Inc._Logo_White_Background-removebg-preview-1.png', NULL, 'cropped-94142c042cb7-911_Construction___Electric_Inc._Logo_White_Background-removebg-preview-1.png', 'image/png', 34825, 512, 512, 50, 50, '/api/media/file/cropped-94142c042cb7-911_Construction___Electric_Inc._Logo_White_Background-removebg-preview-1-300x300.png', 300, 300, 'image/png', 40829, 'cropped-94142c042cb7-911_Construction___Electric_Inc._Logo_White_Background-removebg-preview-1-300x300.png', '/api/media/file/cropped-94142c042cb7-911_Construction___Electric_Inc._Logo_White_Background-removebg-preview-1-500x500.png', 500, 500, 'image/png', 98632, 'cropped-94142c042cb7-911_Construction___Electric_Inc._Logo_White_Background-removebg-preview-1-500x500.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.media (id, alt, caption, folder_id, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_square_url, sizes_square_width, sizes_square_height, sizes_square_mime_type, sizes_square_filesize, sizes_square_filename, sizes_small_url, sizes_small_width, sizes_small_height, sizes_small_mime_type, sizes_small_filesize, sizes_small_filename, sizes_medium_url, sizes_medium_width, sizes_medium_height, sizes_medium_mime_type, sizes_medium_filesize, sizes_medium_filename, sizes_large_url, sizes_large_width, sizes_large_height, sizes_large_mime_type, sizes_large_filesize, sizes_large_filename, sizes_xlarge_url, sizes_xlarge_width, sizes_xlarge_height, sizes_xlarge_mime_type, sizes_xlarge_filesize, sizes_xlarge_filename, sizes_og_url, sizes_og_width, sizes_og_height, sizes_og_mime_type, sizes_og_filesize, sizes_og_filename) VALUES (21, 'cropped ccb7 Construction Electric Inc. Logo White Background', NULL, NULL, '2026-06-16 16:01:20.375+00', '2026-06-16 16:01:20.375+00', '/api/media/file/cropped-94142c042cb7-911_Construction___Electric_Inc._Logo_White_Background-3.png', NULL, 'cropped-94142c042cb7-911_Construction___Electric_Inc._Logo_White_Background-3.png', 'image/jpeg', 15771, 512, 512, 50, 50, '/api/media/file/cropped-94142c042cb7-911_Construction___Electric_Inc._Logo_White_Background-3-300x300.jpg', 300, 300, 'image/jpeg', 10225, 'cropped-94142c042cb7-911_Construction___Electric_Inc._Logo_White_Background-3-300x300.jpg', '/api/media/file/cropped-94142c042cb7-911_Construction___Electric_Inc._Logo_White_Background-3-500x500.jpg', 500, 500, 'image/jpeg', 20342, 'cropped-94142c042cb7-911_Construction___Electric_Inc._Logo_White_Background-3-500x500.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.media (id, alt, caption, folder_id, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_square_url, sizes_square_width, sizes_square_height, sizes_square_mime_type, sizes_square_filesize, sizes_square_filename, sizes_small_url, sizes_small_width, sizes_small_height, sizes_small_mime_type, sizes_small_filesize, sizes_small_filename, sizes_medium_url, sizes_medium_width, sizes_medium_height, sizes_medium_mime_type, sizes_medium_filesize, sizes_medium_filename, sizes_large_url, sizes_large_width, sizes_large_height, sizes_large_mime_type, sizes_large_filesize, sizes_large_filename, sizes_xlarge_url, sizes_xlarge_width, sizes_xlarge_height, sizes_xlarge_mime_type, sizes_xlarge_filesize, sizes_xlarge_filename, sizes_og_url, sizes_og_width, sizes_og_height, sizes_og_mime_type, sizes_og_filesize, sizes_og_filename) VALUES (23, 'Hero Form Logos', NULL, NULL, '2026-06-16 16:01:20.762+00', '2026-06-16 16:01:20.762+00', '/api/media/file/Hero-Form-Logos-2.png', NULL, 'Hero-Form-Logos-2.png', 'image/png', 54591, 1920, 170, 50, 50, '/api/media/file/Hero-Form-Logos-2-300x27.png', 300, 27, 'image/png', 6502, 'Hero-Form-Logos-2-300x27.png', '/api/media/file/Hero-Form-Logos-2-500x500.png', 500, 500, 'image/png', 68344, 'Hero-Form-Logos-2-500x500.png', '/api/media/file/Hero-Form-Logos-2-600x53.png', 600, 53, 'image/png', 16272, 'Hero-Form-Logos-2-600x53.png', '/api/media/file/Hero-Form-Logos-2-900x80.png', 900, 80, 'image/png', 30089, 'Hero-Form-Logos-2-900x80.png', '/api/media/file/Hero-Form-Logos-2-1400x124.png', 1400, 124, 'image/png', 65101, 'Hero-Form-Logos-2-1400x124.png', '/api/media/file/Hero-Form-Logos-2-1920x170.png', 1920, 170, 'image/png', 86105, 'Hero-Form-Logos-2-1920x170.png', '/api/media/file/Hero-Form-Logos-2-1200x630.png', 1200, 630, 'image/png', 193547, 'Hero-Form-Logos-2-1200x630.png');
INSERT INTO public.media (id, alt, caption, folder_id, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_square_url, sizes_square_width, sizes_square_height, sizes_square_mime_type, sizes_square_filesize, sizes_square_filename, sizes_small_url, sizes_small_width, sizes_small_height, sizes_small_mime_type, sizes_small_filesize, sizes_small_filename, sizes_medium_url, sizes_medium_width, sizes_medium_height, sizes_medium_mime_type, sizes_medium_filesize, sizes_medium_filename, sizes_large_url, sizes_large_width, sizes_large_height, sizes_large_mime_type, sizes_large_filesize, sizes_large_filename, sizes_xlarge_url, sizes_xlarge_width, sizes_xlarge_height, sizes_xlarge_mime_type, sizes_xlarge_filesize, sizes_xlarge_filename, sizes_og_url, sizes_og_width, sizes_og_height, sizes_og_mime_type, sizes_og_filesize, sizes_og_filename) VALUES (24, 'IMG', NULL, NULL, '2026-06-16 16:01:20.896+00', '2026-06-16 16:01:20.896+00', '/api/media/file/IMG_2783-2.jpg', NULL, 'IMG_2783-2.jpg', 'image/jpeg', 125220, 1179, 793, 50, 50, '/api/media/file/IMG_2783-2-300x202.jpg', 300, 202, 'image/jpeg', 14347, 'IMG_2783-2-300x202.jpg', '/api/media/file/IMG_2783-2-500x500.jpg', 500, 500, 'image/jpeg', 56311, 'IMG_2783-2-500x500.jpg', '/api/media/file/IMG_2783-2-600x404.jpg', 600, 404, 'image/jpeg', 49243, 'IMG_2783-2-600x404.jpg', '/api/media/file/IMG_2783-2-900x605.jpg', 900, 605, 'image/jpeg', 98875, 'IMG_2783-2-900x605.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/api/media/file/IMG_2783-2-1200x630.jpg', 1200, 630, 'image/jpeg', 133505, 'IMG_2783-2-1200x630.jpg');
INSERT INTO public.media (id, alt, caption, folder_id, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_square_url, sizes_square_width, sizes_square_height, sizes_square_mime_type, sizes_square_filesize, sizes_square_filename, sizes_small_url, sizes_small_width, sizes_small_height, sizes_small_mime_type, sizes_small_filesize, sizes_small_filename, sizes_medium_url, sizes_medium_width, sizes_medium_height, sizes_medium_mime_type, sizes_medium_filesize, sizes_medium_filename, sizes_large_url, sizes_large_width, sizes_large_height, sizes_large_mime_type, sizes_large_filesize, sizes_large_filename, sizes_xlarge_url, sizes_xlarge_width, sizes_xlarge_height, sizes_xlarge_mime_type, sizes_xlarge_filesize, sizes_xlarge_filename, sizes_og_url, sizes_og_width, sizes_og_height, sizes_og_mime_type, sizes_og_filesize, sizes_og_filename) VALUES (25, 'IMG', NULL, NULL, '2026-06-16 16:01:21.044+00', '2026-06-16 16:01:21.044+00', '/api/media/file/IMG_2787-2.jpg', NULL, 'IMG_2787-2.jpg', 'image/jpeg', 85220, 1179, 1137, 50, 50, '/api/media/file/IMG_2787-2-300x289.jpg', 300, 289, 'image/jpeg', 12199, 'IMG_2787-2-300x289.jpg', '/api/media/file/IMG_2787-2-500x500.jpg', 500, 500, 'image/jpeg', 28466, 'IMG_2787-2-500x500.jpg', '/api/media/file/IMG_2787-2-600x579.jpg', 600, 579, 'image/jpeg', 35987, 'IMG_2787-2-600x579.jpg', '/api/media/file/IMG_2787-2-900x868.jpg', 900, 868, 'image/jpeg', 68164, 'IMG_2787-2-900x868.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/api/media/file/IMG_2787-2-1200x630.jpg', 1200, 630, 'image/jpeg', 68817, 'IMG_2787-2-1200x630.jpg');
INSERT INTO public.media (id, alt, caption, folder_id, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_square_url, sizes_square_width, sizes_square_height, sizes_square_mime_type, sizes_square_filesize, sizes_square_filename, sizes_small_url, sizes_small_width, sizes_small_height, sizes_small_mime_type, sizes_small_filesize, sizes_small_filename, sizes_medium_url, sizes_medium_width, sizes_medium_height, sizes_medium_mime_type, sizes_medium_filesize, sizes_medium_filename, sizes_large_url, sizes_large_width, sizes_large_height, sizes_large_mime_type, sizes_large_filesize, sizes_large_filename, sizes_xlarge_url, sizes_xlarge_width, sizes_xlarge_height, sizes_xlarge_mime_type, sizes_xlarge_filesize, sizes_xlarge_filename, sizes_og_url, sizes_og_width, sizes_og_height, sizes_og_mime_type, sizes_og_filesize, sizes_og_filename) VALUES (26, 'bcd 1ff8f7ae98adfdfdmv2', NULL, NULL, '2026-06-16 16:01:30.396+00', '2026-06-16 16:01:30.396+00', '/api/media/file/bcd640_1f5593f8f7a8497e98adfd5091fd4762mv2-2.avif', NULL, 'bcd640_1f5593f8f7a8497e98adfd5091fd4762mv2-2.avif', 'image/avif', 70719, 1360, 496, 50, 50, '/api/media/file/bcd640_1f5593f8f7a8497e98adfd5091fd4762mv2-2-300x109.avif', 300, 109, 'image/avif', 6033, 'bcd640_1f5593f8f7a8497e98adfd5091fd4762mv2-2-300x109.avif', '/api/media/file/bcd640_1f5593f8f7a8497e98adfd5091fd4762mv2-2-500x500.avif', 500, 500, 'image/avif', 21492, 'bcd640_1f5593f8f7a8497e98adfd5091fd4762mv2-2-500x500.avif', '/api/media/file/bcd640_1f5593f8f7a8497e98adfd5091fd4762mv2-2-600x219.avif', 600, 219, 'image/avif', 18620, 'bcd640_1f5593f8f7a8497e98adfd5091fd4762mv2-2-600x219.avif', '/api/media/file/bcd640_1f5593f8f7a8497e98adfd5091fd4762mv2-2-900x328.avif', 900, 328, 'image/avif', 36484, 'bcd640_1f5593f8f7a8497e98adfd5091fd4762mv2-2-900x328.avif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/api/media/file/bcd640_1f5593f8f7a8497e98adfd5091fd4762mv2-2-1200x630.avif', 1200, 630, 'image/avif', 45130, 'bcd640_1f5593f8f7a8497e98adfd5091fd4762mv2-2-1200x630.avif');
INSERT INTO public.media (id, alt, caption, folder_id, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_square_url, sizes_square_width, sizes_square_height, sizes_square_mime_type, sizes_square_filesize, sizes_square_filename, sizes_small_url, sizes_small_width, sizes_small_height, sizes_small_mime_type, sizes_small_filesize, sizes_small_filename, sizes_medium_url, sizes_medium_width, sizes_medium_height, sizes_medium_mime_type, sizes_medium_filesize, sizes_medium_filename, sizes_large_url, sizes_large_width, sizes_large_height, sizes_large_mime_type, sizes_large_filesize, sizes_large_filename, sizes_xlarge_url, sizes_xlarge_width, sizes_xlarge_height, sizes_xlarge_mime_type, sizes_xlarge_filesize, sizes_xlarge_filename, sizes_og_url, sizes_og_width, sizes_og_height, sizes_og_mime_type, sizes_og_filesize, sizes_og_filename) VALUES (27, 'Construction Electric Van', NULL, NULL, '2026-06-16 16:01:30.477+00', '2026-06-16 16:01:30.476+00', '/api/media/file/911-Construction-Electric-Van-1.png', NULL, '911-Construction-Electric-Van-1.png', 'image/jpeg', 104197, 1012, 622, 50, 50, '/api/media/file/911-Construction-Electric-Van-1-300x184.jpg', 300, 184, 'image/jpeg', 14015, '911-Construction-Electric-Van-1-300x184.jpg', '/api/media/file/911-Construction-Electric-Van-1-500x500.jpg', 500, 500, 'image/jpeg', 45939, '911-Construction-Electric-Van-1-500x500.jpg', '/api/media/file/911-Construction-Electric-Van-1-600x369.jpg', 600, 369, 'image/jpeg', 47948, '911-Construction-Electric-Van-1-600x369.jpg', '/api/media/file/911-Construction-Electric-Van-1-900x553.jpg', 900, 553, 'image/jpeg', 98698, '911-Construction-Electric-Van-1-900x553.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.media (id, alt, caption, folder_id, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_square_url, sizes_square_width, sizes_square_height, sizes_square_mime_type, sizes_square_filesize, sizes_square_filename, sizes_small_url, sizes_small_width, sizes_small_height, sizes_small_mime_type, sizes_small_filesize, sizes_small_filename, sizes_medium_url, sizes_medium_width, sizes_medium_height, sizes_medium_mime_type, sizes_medium_filesize, sizes_medium_filename, sizes_large_url, sizes_large_width, sizes_large_height, sizes_large_mime_type, sizes_large_filesize, sizes_large_filename, sizes_xlarge_url, sizes_xlarge_width, sizes_xlarge_height, sizes_xlarge_mime_type, sizes_xlarge_filesize, sizes_xlarge_filename, sizes_og_url, sizes_og_width, sizes_og_height, sizes_og_mime_type, sizes_og_filesize, sizes_og_filename) VALUES (28, 'construction amp electric inc 6a1bfbd31c', NULL, NULL, '2026-06-16 16:01:30.631+00', '2026-06-16 16:01:30.631+00', '/api/media/file/911-construction-amp-electric-inc-6a1bf534bd31c-1.png', NULL, '911-construction-amp-electric-inc-6a1bf534bd31c-1.png', 'image/jpeg', 114915, 1024, 1024, 50, 50, '/api/media/file/911-construction-amp-electric-inc-6a1bf534bd31c-1-300x300.jpg', 300, 300, 'image/jpeg', 19685, '911-construction-amp-electric-inc-6a1bf534bd31c-1-300x300.jpg', '/api/media/file/911-construction-amp-electric-inc-6a1bf534bd31c-1-500x500.jpg', 500, 500, 'image/jpeg', 44363, '911-construction-amp-electric-inc-6a1bf534bd31c-1-500x500.jpg', '/api/media/file/911-construction-amp-electric-inc-6a1bf534bd31c-1-600x600.jpg', 600, 600, 'image/jpeg', 58713, '911-construction-amp-electric-inc-6a1bf534bd31c-1-600x600.jpg', '/api/media/file/911-construction-amp-electric-inc-6a1bf534bd31c-1-900x900.jpg', 900, 900, 'image/jpeg', 109206, '911-construction-amp-electric-inc-6a1bf534bd31c-1-900x900.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/api/media/file/911-construction-amp-electric-inc-6a1bf534bd31c-1-1200x630.jpg', 1200, 630, 'image/jpeg', 94091, '911-construction-amp-electric-inc-6a1bf534bd31c-1-1200x630.jpg');
INSERT INTO public.media (id, alt, caption, folder_id, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_square_url, sizes_square_width, sizes_square_height, sizes_square_mime_type, sizes_square_filesize, sizes_square_filename, sizes_small_url, sizes_small_width, sizes_small_height, sizes_small_mime_type, sizes_small_filesize, sizes_small_filename, sizes_medium_url, sizes_medium_width, sizes_medium_height, sizes_medium_mime_type, sizes_medium_filesize, sizes_medium_filename, sizes_large_url, sizes_large_width, sizes_large_height, sizes_large_mime_type, sizes_large_filesize, sizes_large_filename, sizes_xlarge_url, sizes_xlarge_width, sizes_xlarge_height, sizes_xlarge_mime_type, sizes_xlarge_filesize, sizes_xlarge_filename, sizes_og_url, sizes_og_width, sizes_og_height, sizes_og_mime_type, sizes_og_filesize, sizes_og_filename) VALUES (29, 'construction amp electric inc 6a1bf5eba', NULL, NULL, '2026-06-16 16:01:30.804+00', '2026-06-16 16:01:30.804+00', '/api/media/file/911-construction-amp-electric-inc-6a1bf5eba2673-1.png', NULL, '911-construction-amp-electric-inc-6a1bf5eba2673-1.png', 'image/jpeg', 196752, 1024, 1024, 50, 50, '/api/media/file/911-construction-amp-electric-inc-6a1bf5eba2673-1-300x300.jpg', 300, 300, 'image/jpeg', 26643, '911-construction-amp-electric-inc-6a1bf5eba2673-1-300x300.jpg', '/api/media/file/911-construction-amp-electric-inc-6a1bf5eba2673-1-500x500.jpg', 500, 500, 'image/jpeg', 67591, '911-construction-amp-electric-inc-6a1bf5eba2673-1-500x500.jpg', '/api/media/file/911-construction-amp-electric-inc-6a1bf5eba2673-1-600x600.jpg', 600, 600, 'image/jpeg', 93507, '911-construction-amp-electric-inc-6a1bf5eba2673-1-600x600.jpg', '/api/media/file/911-construction-amp-electric-inc-6a1bf5eba2673-1-900x900.jpg', 900, 900, 'image/jpeg', 185056, '911-construction-amp-electric-inc-6a1bf5eba2673-1-900x900.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/api/media/file/911-construction-amp-electric-inc-6a1bf5eba2673-1-1200x630.jpg', 1200, 630, 'image/jpeg', 146919, '911-construction-amp-electric-inc-6a1bf5eba2673-1-1200x630.jpg');
INSERT INTO public.media (id, alt, caption, folder_id, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_square_url, sizes_square_width, sizes_square_height, sizes_square_mime_type, sizes_square_filesize, sizes_square_filename, sizes_small_url, sizes_small_width, sizes_small_height, sizes_small_mime_type, sizes_small_filesize, sizes_small_filename, sizes_medium_url, sizes_medium_width, sizes_medium_height, sizes_medium_mime_type, sizes_medium_filesize, sizes_medium_filename, sizes_large_url, sizes_large_width, sizes_large_height, sizes_large_mime_type, sizes_large_filesize, sizes_large_filename, sizes_xlarge_url, sizes_xlarge_width, sizes_xlarge_height, sizes_xlarge_mime_type, sizes_xlarge_filesize, sizes_xlarge_filename, sizes_og_url, sizes_og_width, sizes_og_height, sizes_og_mime_type, sizes_og_filesize, sizes_og_filename) VALUES (30, 'construction electric inc electrical panel upgrade los angeles', NULL, NULL, '2026-06-16 16:01:30.848+00', '2026-06-16 16:01:30.848+00', '/api/media/file/911-construction-electric-inc-electrical-panel-upgrade-los-angeles-1.jpg', NULL, '911-construction-electric-inc-electrical-panel-upgrade-los-angeles-1.jpg', 'image/jpeg', 30295, 768, 512, 50, 50, '/api/media/file/911-construction-electric-inc-electrical-panel-upgrade-los-angeles-1-300x200.jpg', 300, 200, 'image/jpeg', 8775, '911-construction-electric-inc-electrical-panel-upgrade-los-angeles-1-300x200.jpg', '/api/media/file/911-construction-electric-inc-electrical-panel-upgrade-los-angeles-1-500x500.jpg', 500, 500, 'image/jpeg', 25434, '911-construction-electric-inc-electrical-panel-upgrade-los-angeles-1-500x500.jpg', '/api/media/file/911-construction-electric-inc-electrical-panel-upgrade-los-angeles-1-600x400.jpg', 600, 400, 'image/jpeg', 24722, '911-construction-electric-inc-electrical-panel-upgrade-los-angeles-1-600x400.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.media (id, alt, caption, folder_id, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_square_url, sizes_square_width, sizes_square_height, sizes_square_mime_type, sizes_square_filesize, sizes_square_filename, sizes_small_url, sizes_small_width, sizes_small_height, sizes_small_mime_type, sizes_small_filesize, sizes_small_filename, sizes_medium_url, sizes_medium_width, sizes_medium_height, sizes_medium_mime_type, sizes_medium_filesize, sizes_medium_filename, sizes_large_url, sizes_large_width, sizes_large_height, sizes_large_mime_type, sizes_large_filesize, sizes_large_filename, sizes_xlarge_url, sizes_xlarge_width, sizes_xlarge_height, sizes_xlarge_mime_type, sizes_xlarge_filesize, sizes_xlarge_filename, sizes_og_url, sizes_og_width, sizes_og_height, sizes_og_mime_type, sizes_og_filesize, sizes_og_filename) VALUES (39, 'electrical inspection los angeles', NULL, NULL, '2026-06-16 16:01:31.895+00', '2026-06-16 16:01:31.895+00', '/api/media/file/electrical-inspection-los-angeles-1.jpg', NULL, 'electrical-inspection-los-angeles-1.jpg', 'image/jpeg', 99049, 1296, 864, 50, 50, '/api/media/file/electrical-inspection-los-angeles-1-300x200.jpg', 300, 200, 'image/jpeg', 12234, 'electrical-inspection-los-angeles-1-300x200.jpg', '/api/media/file/electrical-inspection-los-angeles-1-500x500.jpg', 500, 500, 'image/jpeg', 40538, 'electrical-inspection-los-angeles-1-500x500.jpg', '/api/media/file/electrical-inspection-los-angeles-1-600x400.jpg', 600, 400, 'image/jpeg', 35176, 'electrical-inspection-los-angeles-1-600x400.jpg', '/api/media/file/electrical-inspection-los-angeles-1-900x600.jpg', 900, 600, 'image/jpeg', 65797, 'electrical-inspection-los-angeles-1-900x600.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/api/media/file/electrical-inspection-los-angeles-1-1200x630.jpg', 1200, 630, 'image/jpeg', 89074, 'electrical-inspection-los-angeles-1-1200x630.jpg');
INSERT INTO public.media (id, alt, caption, folder_id, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_square_url, sizes_square_width, sizes_square_height, sizes_square_mime_type, sizes_square_filesize, sizes_square_filename, sizes_small_url, sizes_small_width, sizes_small_height, sizes_small_mime_type, sizes_small_filesize, sizes_small_filename, sizes_medium_url, sizes_medium_width, sizes_medium_height, sizes_medium_mime_type, sizes_medium_filesize, sizes_medium_filename, sizes_large_url, sizes_large_width, sizes_large_height, sizes_large_mime_type, sizes_large_filesize, sizes_large_filename, sizes_xlarge_url, sizes_xlarge_width, sizes_xlarge_height, sizes_xlarge_mime_type, sizes_xlarge_filesize, sizes_xlarge_filename, sizes_og_url, sizes_og_width, sizes_og_height, sizes_og_mime_type, sizes_og_filesize, sizes_og_filename) VALUES (31, 'construction electric inc ev charger permit los angeles b3a2 ea34 4c5b a 1eba41edc26d', NULL, NULL, '2026-06-16 16:01:30.956+00', '2026-06-16 16:01:30.956+00', '/api/media/file/911-construction-electric-inc-ev-charger-permit-los-angeles-7976b3a2-ea34-4c5b-a332-1eba41edc26d-1.png', NULL, '911-construction-electric-inc-ev-charger-permit-los-angeles-7976b3a2-ea34-4c5b-a332-1eba41edc26d-1.png', 'image/jpeg', 134868, 1536, 1024, 50, 50, '/api/media/file/911-construction-electric-inc-ev-charger-permit-los-angeles-7976b3a2-ea34-4c5b-a332-1eba41edc26d-1-300x200.jpg', 300, 200, 'image/jpeg', 12582, '911-construction-electric-inc-ev-charger-permit-los-angeles-7976b3a2-ea34-4c5b-a332-1eba41edc26d-1-300x200.jpg', '/api/media/file/911-construction-electric-inc-ev-charger-permit-los-angeles-7976b3a2-ea34-4c5b-a332-1eba41edc26d-1-500x500.jpg', 500, 500, 'image/jpeg', 38668, '911-construction-electric-inc-ev-charger-permit-los-angeles-7976b3a2-ea34-4c5b-a332-1eba41edc26d-1-500x500.jpg', '/api/media/file/911-construction-electric-inc-ev-charger-permit-los-angeles-7976b3a2-ea34-4c5b-a332-1eba41edc26d-1-600x400.jpg', 600, 400, 'image/jpeg', 37120, '911-construction-electric-inc-ev-charger-permit-los-angeles-7976b3a2-ea34-4c5b-a332-1eba41edc26d-1-600x400.jpg', '/api/media/file/911-construction-electric-inc-ev-charger-permit-los-angeles-7976b3a2-ea34-4c5b-a332-1eba41edc26d-1-900x600.jpg', 900, 600, 'image/jpeg', 70847, '911-construction-electric-inc-ev-charger-permit-los-angeles-7976b3a2-ea34-4c5b-a332-1eba41edc26d-1-900x600.jpg', '/api/media/file/911-construction-electric-inc-ev-charger-permit-los-angeles-7976b3a2-ea34-4c5b-a332-1eba41edc26d-1-1400x933.jpg', 1400, 933, 'image/jpeg', 138432, '911-construction-electric-inc-ev-charger-permit-los-angeles-7976b3a2-ea34-4c5b-a332-1eba41edc26d-1-1400x933.jpg', NULL, NULL, NULL, NULL, NULL, NULL, '/api/media/file/911-construction-electric-inc-ev-charger-permit-los-angeles-7976b3a2-ea34-4c5b-a332-1eba41edc26d-1-1200x630.jpg', 1200, 630, 'image/jpeg', 89327, '911-construction-electric-inc-ev-charger-permit-los-angeles-7976b3a2-ea34-4c5b-a332-1eba41edc26d-1-1200x630.jpg');
INSERT INTO public.media (id, alt, caption, folder_id, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_square_url, sizes_square_width, sizes_square_height, sizes_square_mime_type, sizes_square_filesize, sizes_square_filename, sizes_small_url, sizes_small_width, sizes_small_height, sizes_small_mime_type, sizes_small_filesize, sizes_small_filename, sizes_medium_url, sizes_medium_width, sizes_medium_height, sizes_medium_mime_type, sizes_medium_filesize, sizes_medium_filename, sizes_large_url, sizes_large_width, sizes_large_height, sizes_large_mime_type, sizes_large_filesize, sizes_large_filename, sizes_xlarge_url, sizes_xlarge_width, sizes_xlarge_height, sizes_xlarge_mime_type, sizes_xlarge_filesize, sizes_xlarge_filename, sizes_og_url, sizes_og_width, sizes_og_height, sizes_og_mime_type, sizes_og_filesize, sizes_og_filename) VALUES (32, 'construction electric inc evitp certified ev charger ins cc30e fc2a 4f42 ae2b abda7b6', NULL, NULL, '2026-06-16 16:01:31.07+00', '2026-06-16 16:01:31.07+00', '/api/media/file/911-construction-electric-inc-evitp-certified-ev-charger-ins-169cc30e-fc2a-4f42-ae2b-abd71585a7b6-1.png', NULL, '911-construction-electric-inc-evitp-certified-ev-charger-ins-169cc30e-fc2a-4f42-ae2b-abd71585a7b6-1.png', 'image/jpeg', 130099, 1536, 1024, 50, 50, '/api/media/file/911-construction-electric-inc-evitp-certified-ev-charger-ins-169cc30e-fc2a-4f42-ae2b-abd71585a7b6-1-300x200.jpg', 300, 200, 'image/jpeg', 13522, '911-construction-electric-inc-evitp-certified-ev-charger-ins-169cc30e-fc2a-4f42-ae2b-abd71585a7b6-1-300x200.jpg', '/api/media/file/911-construction-electric-inc-evitp-certified-ev-charger-ins-169cc30e-fc2a-4f42-ae2b-abd71585a7b6-1-500x500.jpg', 500, 500, 'image/jpeg', 36348, '911-construction-electric-inc-evitp-certified-ev-charger-ins-169cc30e-fc2a-4f42-ae2b-abd71585a7b6-1-500x500.jpg', '/api/media/file/911-construction-electric-inc-evitp-certified-ev-charger-ins-169cc30e-fc2a-4f42-ae2b-abd71585a7b6-1-600x400.jpg', 600, 400, 'image/jpeg', 37413, '911-construction-electric-inc-evitp-certified-ev-charger-ins-169cc30e-fc2a-4f42-ae2b-abd71585a7b6-1-600x400.jpg', '/api/media/file/911-construction-electric-inc-evitp-certified-ev-charger-ins-169cc30e-fc2a-4f42-ae2b-abd71585a7b6-1-900x600.jpg', 900, 600, 'image/jpeg', 69379, '911-construction-electric-inc-evitp-certified-ev-charger-ins-169cc30e-fc2a-4f42-ae2b-abd71585a7b6-1-900x600.jpg', '/api/media/file/911-construction-electric-inc-evitp-certified-ev-charger-ins-169cc30e-fc2a-4f42-ae2b-abd71585a7b6-1-1400x933.jpg', 1400, 933, 'image/jpeg', 133186, '911-construction-electric-inc-evitp-certified-ev-charger-ins-169cc30e-fc2a-4f42-ae2b-abd71585a7b6-1-1400x933.jpg', NULL, NULL, NULL, NULL, NULL, NULL, '/api/media/file/911-construction-electric-inc-evitp-certified-ev-charger-ins-169cc30e-fc2a-4f42-ae2b-abd71585a7b6-1-1200x630.jpg', 1200, 630, 'image/jpeg', 89452, '911-construction-electric-inc-evitp-certified-ev-charger-ins-169cc30e-fc2a-4f42-ae2b-abd71585a7b6-1-1200x630.jpg');
INSERT INTO public.media (id, alt, caption, folder_id, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_square_url, sizes_square_width, sizes_square_height, sizes_square_mime_type, sizes_square_filesize, sizes_square_filename, sizes_small_url, sizes_small_width, sizes_small_height, sizes_small_mime_type, sizes_small_filesize, sizes_small_filename, sizes_medium_url, sizes_medium_width, sizes_medium_height, sizes_medium_mime_type, sizes_medium_filesize, sizes_medium_filename, sizes_large_url, sizes_large_width, sizes_large_height, sizes_large_mime_type, sizes_large_filesize, sizes_large_filename, sizes_xlarge_url, sizes_xlarge_width, sizes_xlarge_height, sizes_xlarge_mime_type, sizes_xlarge_filesize, sizes_xlarge_filename, sizes_og_url, sizes_og_width, sizes_og_height, sizes_og_mime_type, sizes_og_filesize, sizes_og_filename) VALUES (33, 'construction electric inc gfci outlet upgrades los angel a8b49 19af f 93c3dd94a', NULL, NULL, '2026-06-16 16:01:31.193+00', '2026-06-16 16:01:31.193+00', '/api/media/file/911-construction-electric-inc-gfci-outlet-upgrades-los-angel-647a8b49-19af-477f-9022-93c3dd94a800-1.png', NULL, '911-construction-electric-inc-gfci-outlet-upgrades-los-angel-647a8b49-19af-477f-9022-93c3dd94a800-1.png', 'image/jpeg', 126000, 1536, 1024, 50, 50, '/api/media/file/911-construction-electric-inc-gfci-outlet-upgrades-los-angel-647a8b49-19af-477f-9022-93c3dd94a800-1-300x200.jpg', 300, 200, 'image/jpeg', 12004, '911-construction-electric-inc-gfci-outlet-upgrades-los-angel-647a8b49-19af-477f-9022-93c3dd94a800-1-300x200.jpg', '/api/media/file/911-construction-electric-inc-gfci-outlet-upgrades-los-angel-647a8b49-19af-477f-9022-93c3dd94a800-1-500x500.jpg', 500, 500, 'image/jpeg', 35141, '911-construction-electric-inc-gfci-outlet-upgrades-los-angel-647a8b49-19af-477f-9022-93c3dd94a800-1-500x500.jpg', '/api/media/file/911-construction-electric-inc-gfci-outlet-upgrades-los-angel-647a8b49-19af-477f-9022-93c3dd94a800-1-600x400.jpg', 600, 400, 'image/jpeg', 34876, '911-construction-electric-inc-gfci-outlet-upgrades-los-angel-647a8b49-19af-477f-9022-93c3dd94a800-1-600x400.jpg', '/api/media/file/911-construction-electric-inc-gfci-outlet-upgrades-los-angel-647a8b49-19af-477f-9022-93c3dd94a800-1-900x600.jpg', 900, 600, 'image/jpeg', 65829, '911-construction-electric-inc-gfci-outlet-upgrades-los-angel-647a8b49-19af-477f-9022-93c3dd94a800-1-900x600.jpg', '/api/media/file/911-construction-electric-inc-gfci-outlet-upgrades-los-angel-647a8b49-19af-477f-9022-93c3dd94a800-1-1400x933.jpg', 1400, 933, 'image/jpeg', 130867, '911-construction-electric-inc-gfci-outlet-upgrades-los-angel-647a8b49-19af-477f-9022-93c3dd94a800-1-1400x933.jpg', NULL, NULL, NULL, NULL, NULL, NULL, '/api/media/file/911-construction-electric-inc-gfci-outlet-upgrades-los-angel-647a8b49-19af-477f-9022-93c3dd94a800-1-1200x630.jpg', 1200, 630, 'image/jpeg', 84962, '911-construction-electric-inc-gfci-outlet-upgrades-los-angel-647a8b49-19af-477f-9022-93c3dd94a800-1-1200x630.jpg');
INSERT INTO public.media (id, alt, caption, folder_id, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_square_url, sizes_square_width, sizes_square_height, sizes_square_mime_type, sizes_square_filesize, sizes_square_filename, sizes_small_url, sizes_small_width, sizes_small_height, sizes_small_mime_type, sizes_small_filesize, sizes_small_filename, sizes_medium_url, sizes_medium_width, sizes_medium_height, sizes_medium_mime_type, sizes_medium_filesize, sizes_medium_filename, sizes_large_url, sizes_large_width, sizes_large_height, sizes_large_mime_type, sizes_large_filesize, sizes_large_filename, sizes_xlarge_url, sizes_xlarge_width, sizes_xlarge_height, sizes_xlarge_mime_type, sizes_xlarge_filesize, sizes_xlarge_filename, sizes_og_url, sizes_og_width, sizes_og_height, sizes_og_mime_type, sizes_og_filesize, sizes_og_filename) VALUES (34, 'construction electric inc home ev charger los angeles', NULL, NULL, '2026-06-16 16:01:31.288+00', '2026-06-16 16:01:31.288+00', '/api/media/file/911-construction-electric-inc-home-ev-charger-los-angeles-1.jpg', NULL, '911-construction-electric-inc-home-ev-charger-los-angeles-1.jpg', 'image/jpeg', 96665, 1280, 800, 50, 50, '/api/media/file/911-construction-electric-inc-home-ev-charger-los-angeles-1-300x188.jpg', 300, 188, 'image/jpeg', 13663, '911-construction-electric-inc-home-ev-charger-los-angeles-1-300x188.jpg', '/api/media/file/911-construction-electric-inc-home-ev-charger-los-angeles-1-500x500.jpg', 500, 500, 'image/jpeg', 38464, '911-construction-electric-inc-home-ev-charger-los-angeles-1-500x500.jpg', '/api/media/file/911-construction-electric-inc-home-ev-charger-los-angeles-1-600x375.jpg', 600, 375, 'image/jpeg', 37409, '911-construction-electric-inc-home-ev-charger-los-angeles-1-600x375.jpg', '/api/media/file/911-construction-electric-inc-home-ev-charger-los-angeles-1-900x563.jpg', 900, 563, 'image/jpeg', 67941, '911-construction-electric-inc-home-ev-charger-los-angeles-1-900x563.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/api/media/file/911-construction-electric-inc-home-ev-charger-los-angeles-1-1200x630.jpg', 1200, 630, 'image/jpeg', 86234, '911-construction-electric-inc-home-ev-charger-los-angeles-1-1200x630.jpg');
INSERT INTO public.media (id, alt, caption, folder_id, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_square_url, sizes_square_width, sizes_square_height, sizes_square_mime_type, sizes_square_filesize, sizes_square_filename, sizes_small_url, sizes_small_width, sizes_small_height, sizes_small_mime_type, sizes_small_filesize, sizes_small_filename, sizes_medium_url, sizes_medium_width, sizes_medium_height, sizes_medium_mime_type, sizes_medium_filesize, sizes_medium_filename, sizes_large_url, sizes_large_width, sizes_large_height, sizes_large_mime_type, sizes_large_filesize, sizes_large_filename, sizes_xlarge_url, sizes_xlarge_width, sizes_xlarge_height, sizes_xlarge_mime_type, sizes_xlarge_filesize, sizes_xlarge_filename, sizes_og_url, sizes_og_width, sizes_og_height, sizes_og_mime_type, sizes_og_filesize, sizes_og_filename) VALUES (55, 'Electrician installing a light switch in a residential wall', NULL, NULL, '2026-06-16 16:02:38.35+00', '2026-06-16 16:02:38.35+00', '/api/media/file/light-switch-installation.jpg', NULL, 'light-switch-installation.jpg', 'image/jpeg', 106964, 977, 726, 50, 50, '/api/media/file/light-switch-installation-300x223.jpg', 300, 223, 'image/jpeg', 11630, 'light-switch-installation-300x223.jpg', '/api/media/file/light-switch-installation-500x500.jpg', 500, 500, 'image/jpeg', 31519, 'light-switch-installation-500x500.jpg', '/api/media/file/light-switch-installation-600x446.jpg', 600, 446, 'image/jpeg', 33070, 'light-switch-installation-600x446.jpg', '/api/media/file/light-switch-installation-900x669.jpg', 900, 669, 'image/jpeg', 61476, 'light-switch-installation-900x669.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/api/media/file/light-switch-installation-1200x630.jpg', 1200, 630, 'image/jpeg', 68462, 'light-switch-installation-1200x630.jpg');
INSERT INTO public.media (id, alt, caption, folder_id, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_square_url, sizes_square_width, sizes_square_height, sizes_square_mime_type, sizes_square_filesize, sizes_square_filename, sizes_small_url, sizes_small_width, sizes_small_height, sizes_small_mime_type, sizes_small_filesize, sizes_small_filename, sizes_medium_url, sizes_medium_width, sizes_medium_height, sizes_medium_mime_type, sizes_medium_filesize, sizes_medium_filename, sizes_large_url, sizes_large_width, sizes_large_height, sizes_large_mime_type, sizes_large_filesize, sizes_large_filename, sizes_xlarge_url, sizes_xlarge_width, sizes_xlarge_height, sizes_xlarge_mime_type, sizes_xlarge_filesize, sizes_xlarge_filename, sizes_og_url, sizes_og_width, sizes_og_height, sizes_og_mime_type, sizes_og_filesize, sizes_og_filename) VALUES (35, 'construction electric inc panel upgrade for ev charger l 8b1a8e27 a9e3 74d60eee', NULL, NULL, '2026-06-16 16:01:31.396+00', '2026-06-16 16:01:31.396+00', '/api/media/file/911-construction-electric-inc-panel-upgrade-for-ev-charger-l-8b1a8e27-a9e3-4781-8730-74d60eee1858-1.png', NULL, '911-construction-electric-inc-panel-upgrade-for-ev-charger-l-8b1a8e27-a9e3-4781-8730-74d60eee1858-1.png', 'image/jpeg', 127555, 1536, 1024, 50, 50, '/api/media/file/911-construction-electric-inc-panel-upgrade-for-ev-charger-l-8b1a8e27-a9e3-4781-8730-74d60eee1858-1-300x200.jpg', 300, 200, 'image/jpeg', 12844, '911-construction-electric-inc-panel-upgrade-for-ev-charger-l-8b1a8e27-a9e3-4781-8730-74d60eee1858-1-300x200.jpg', '/api/media/file/911-construction-electric-inc-panel-upgrade-for-ev-charger-l-8b1a8e27-a9e3-4781-8730-74d60eee1858-1-500x500.jpg', 500, 500, 'image/jpeg', 37991, '911-construction-electric-inc-panel-upgrade-for-ev-charger-l-8b1a8e27-a9e3-4781-8730-74d60eee1858-1-500x500.jpg', '/api/media/file/911-construction-electric-inc-panel-upgrade-for-ev-charger-l-8b1a8e27-a9e3-4781-8730-74d60eee1858-1-600x400.jpg', 600, 400, 'image/jpeg', 36596, '911-construction-electric-inc-panel-upgrade-for-ev-charger-l-8b1a8e27-a9e3-4781-8730-74d60eee1858-1-600x400.jpg', '/api/media/file/911-construction-electric-inc-panel-upgrade-for-ev-charger-l-8b1a8e27-a9e3-4781-8730-74d60eee1858-1-900x600.jpg', 900, 600, 'image/jpeg', 67856, '911-construction-electric-inc-panel-upgrade-for-ev-charger-l-8b1a8e27-a9e3-4781-8730-74d60eee1858-1-900x600.jpg', '/api/media/file/911-construction-electric-inc-panel-upgrade-for-ev-charger-l-8b1a8e27-a9e3-4781-8730-74d60eee1858-1-1400x933.jpg', 1400, 933, 'image/jpeg', 129805, '911-construction-electric-inc-panel-upgrade-for-ev-charger-l-8b1a8e27-a9e3-4781-8730-74d60eee1858-1-1400x933.jpg', NULL, NULL, NULL, NULL, NULL, NULL, '/api/media/file/911-construction-electric-inc-panel-upgrade-for-ev-charger-l-8b1a8e27-a9e3-4781-8730-74d60eee1858-1-1200x630.jpg', 1200, 630, 'image/jpeg', 83721, '911-construction-electric-inc-panel-upgrade-for-ev-charger-l-8b1a8e27-a9e3-4781-8730-74d60eee1858-1-1200x630.jpg');
INSERT INTO public.media (id, alt, caption, folder_id, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_square_url, sizes_square_width, sizes_square_height, sizes_square_mime_type, sizes_square_filesize, sizes_square_filename, sizes_small_url, sizes_small_width, sizes_small_height, sizes_small_mime_type, sizes_small_filesize, sizes_small_filename, sizes_medium_url, sizes_medium_width, sizes_medium_height, sizes_medium_mime_type, sizes_medium_filesize, sizes_medium_filename, sizes_large_url, sizes_large_width, sizes_large_height, sizes_large_mime_type, sizes_large_filesize, sizes_large_filename, sizes_xlarge_url, sizes_xlarge_width, sizes_xlarge_height, sizes_xlarge_mime_type, sizes_xlarge_filesize, sizes_xlarge_filename, sizes_og_url, sizes_og_width, sizes_og_height, sizes_og_mime_type, sizes_og_filesize, sizes_og_filename) VALUES (36, 'construction electric inc pasadena ev charger rebate', NULL, NULL, '2026-06-16 16:01:31.541+00', '2026-06-16 16:01:31.541+00', '/api/media/file/911-construction-electric-inc-pasadena-ev-charger-rebate-1.png', NULL, '911-construction-electric-inc-pasadena-ev-charger-rebate-1.png', 'image/jpeg', 150157, 1920, 1080, 50, 50, '/api/media/file/911-construction-electric-inc-pasadena-ev-charger-rebate-1-300x169.jpg', 300, 169, 'image/jpeg', 10844, '911-construction-electric-inc-pasadena-ev-charger-rebate-1-300x169.jpg', '/api/media/file/911-construction-electric-inc-pasadena-ev-charger-rebate-1-500x500.jpg', 500, 500, 'image/jpeg', 33698, '911-construction-electric-inc-pasadena-ev-charger-rebate-1-500x500.jpg', '/api/media/file/911-construction-electric-inc-pasadena-ev-charger-rebate-1-600x338.jpg', 600, 338, 'image/jpeg', 30649, '911-construction-electric-inc-pasadena-ev-charger-rebate-1-600x338.jpg', '/api/media/file/911-construction-electric-inc-pasadena-ev-charger-rebate-1-900x506.jpg', 900, 506, 'image/jpeg', 55870, '911-construction-electric-inc-pasadena-ev-charger-rebate-1-900x506.jpg', '/api/media/file/911-construction-electric-inc-pasadena-ev-charger-rebate-1-1400x788.jpg', 1400, 788, 'image/jpeg', 110320, '911-construction-electric-inc-pasadena-ev-charger-rebate-1-1400x788.jpg', '/api/media/file/911-construction-electric-inc-pasadena-ev-charger-rebate-1-1920x1080.jpg', 1920, 1080, 'image/jpeg', 156893, '911-construction-electric-inc-pasadena-ev-charger-rebate-1-1920x1080.jpg', '/api/media/file/911-construction-electric-inc-pasadena-ev-charger-rebate-1-1200x630.jpg', 1200, 630, 'image/jpeg', 81597, '911-construction-electric-inc-pasadena-ev-charger-rebate-1-1200x630.jpg');
INSERT INTO public.media (id, alt, caption, folder_id, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_square_url, sizes_square_width, sizes_square_height, sizes_square_mime_type, sizes_square_filesize, sizes_square_filename, sizes_small_url, sizes_small_width, sizes_small_height, sizes_small_mime_type, sizes_small_filesize, sizes_small_filename, sizes_medium_url, sizes_medium_width, sizes_medium_height, sizes_medium_mime_type, sizes_medium_filesize, sizes_medium_filename, sizes_large_url, sizes_large_width, sizes_large_height, sizes_large_mime_type, sizes_large_filesize, sizes_large_filename, sizes_xlarge_url, sizes_xlarge_width, sizes_xlarge_height, sizes_xlarge_mime_type, sizes_xlarge_filesize, sizes_xlarge_filename, sizes_og_url, sizes_og_width, sizes_og_height, sizes_og_mime_type, sizes_og_filesize, sizes_og_filename) VALUES (37, 'construction electric inc replace your ride ev charger l 4ccd 3d42 4c69 8e7a bb1d', NULL, NULL, '2026-06-16 16:01:31.7+00', '2026-06-16 16:01:31.7+00', '/api/media/file/911-construction-electric-inc-replace-your-ride-ev-charger-l-4ccd7140-3d42-4c69-8e7a-b43646b1d396-1.png', NULL, '911-construction-electric-inc-replace-your-ride-ev-charger-l-4ccd7140-3d42-4c69-8e7a-b43646b1d396-1.png', 'image/jpeg', 114943, 1536, 1024, 50, 50, '/api/media/file/911-construction-electric-inc-replace-your-ride-ev-charger-l-4ccd7140-3d42-4c69-8e7a-b43646b1d396-1-300x200.jpg', 300, 200, 'image/jpeg', 12076, '911-construction-electric-inc-replace-your-ride-ev-charger-l-4ccd7140-3d42-4c69-8e7a-b43646b1d396-1-300x200.jpg', '/api/media/file/911-construction-electric-inc-replace-your-ride-ev-charger-l-4ccd7140-3d42-4c69-8e7a-b43646b1d396-1-500x500.jpg', 500, 500, 'image/jpeg', 32426, '911-construction-electric-inc-replace-your-ride-ev-charger-l-4ccd7140-3d42-4c69-8e7a-b43646b1d396-1-500x500.jpg', '/api/media/file/911-construction-electric-inc-replace-your-ride-ev-charger-l-4ccd7140-3d42-4c69-8e7a-b43646b1d396-1-600x400.jpg', 600, 400, 'image/jpeg', 33166, '911-construction-electric-inc-replace-your-ride-ev-charger-l-4ccd7140-3d42-4c69-8e7a-b43646b1d396-1-600x400.jpg', '/api/media/file/911-construction-electric-inc-replace-your-ride-ev-charger-l-4ccd7140-3d42-4c69-8e7a-b43646b1d396-1-900x600.jpg', 900, 600, 'image/jpeg', 61013, '911-construction-electric-inc-replace-your-ride-ev-charger-l-4ccd7140-3d42-4c69-8e7a-b43646b1d396-1-900x600.jpg', '/api/media/file/911-construction-electric-inc-replace-your-ride-ev-charger-l-4ccd7140-3d42-4c69-8e7a-b43646b1d396-1-1400x933.jpg', 1400, 933, 'image/jpeg', 117955, '911-construction-electric-inc-replace-your-ride-ev-charger-l-4ccd7140-3d42-4c69-8e7a-b43646b1d396-1-1400x933.jpg', NULL, NULL, NULL, NULL, NULL, NULL, '/api/media/file/911-construction-electric-inc-replace-your-ride-ev-charger-l-4ccd7140-3d42-4c69-8e7a-b43646b1d396-1-1200x630.jpg', 1200, 630, 'image/jpeg', 80404, '911-construction-electric-inc-replace-your-ride-ev-charger-l-4ccd7140-3d42-4c69-8e7a-b43646b1d396-1-1200x630.jpg');
INSERT INTO public.media (id, alt, caption, folder_id, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_square_url, sizes_square_width, sizes_square_height, sizes_square_mime_type, sizes_square_filesize, sizes_square_filename, sizes_small_url, sizes_small_width, sizes_small_height, sizes_small_mime_type, sizes_small_filesize, sizes_small_filename, sizes_medium_url, sizes_medium_width, sizes_medium_height, sizes_medium_mime_type, sizes_medium_filesize, sizes_medium_filename, sizes_large_url, sizes_large_width, sizes_large_height, sizes_large_mime_type, sizes_large_filesize, sizes_large_filename, sizes_xlarge_url, sizes_xlarge_width, sizes_xlarge_height, sizes_xlarge_mime_type, sizes_xlarge_filesize, sizes_xlarge_filename, sizes_og_url, sizes_og_width, sizes_og_height, sizes_og_mime_type, sizes_og_filesize, sizes_og_filename) VALUES (38, 'construction electric inc whole house surge protection l da 49ae 97d1 fecd', NULL, NULL, '2026-06-16 16:01:31.818+00', '2026-06-16 16:01:31.818+00', '/api/media/file/911-construction-electric-inc-whole-house-surge-protection-l-da611485-4095-49ae-97d1-fe92354318cd-1.png', NULL, '911-construction-electric-inc-whole-house-surge-protection-l-da611485-4095-49ae-97d1-fe92354318cd-1.png', 'image/jpeg', 126802, 1536, 1024, 50, 50, '/api/media/file/911-construction-electric-inc-whole-house-surge-protection-l-da611485-4095-49ae-97d1-fe92354318cd-1-300x200.jpg', 300, 200, 'image/jpeg', 11778, '911-construction-electric-inc-whole-house-surge-protection-l-da611485-4095-49ae-97d1-fe92354318cd-1-300x200.jpg', '/api/media/file/911-construction-electric-inc-whole-house-surge-protection-l-da611485-4095-49ae-97d1-fe92354318cd-1-500x500.jpg', 500, 500, 'image/jpeg', 37762, '911-construction-electric-inc-whole-house-surge-protection-l-da611485-4095-49ae-97d1-fe92354318cd-1-500x500.jpg', '/api/media/file/911-construction-electric-inc-whole-house-surge-protection-l-da611485-4095-49ae-97d1-fe92354318cd-1-600x400.jpg', 600, 400, 'image/jpeg', 34309, '911-construction-electric-inc-whole-house-surge-protection-l-da611485-4095-49ae-97d1-fe92354318cd-1-600x400.jpg', '/api/media/file/911-construction-electric-inc-whole-house-surge-protection-l-da611485-4095-49ae-97d1-fe92354318cd-1-900x600.jpg', 900, 600, 'image/jpeg', 65219, '911-construction-electric-inc-whole-house-surge-protection-l-da611485-4095-49ae-97d1-fe92354318cd-1-900x600.jpg', '/api/media/file/911-construction-electric-inc-whole-house-surge-protection-l-da611485-4095-49ae-97d1-fe92354318cd-1-1400x933.jpg', 1400, 933, 'image/jpeg', 129782, '911-construction-electric-inc-whole-house-surge-protection-l-da611485-4095-49ae-97d1-fe92354318cd-1-1400x933.jpg', NULL, NULL, NULL, NULL, NULL, NULL, '/api/media/file/911-construction-electric-inc-whole-house-surge-protection-l-da611485-4095-49ae-97d1-fe92354318cd-1-1200x630.jpg', 1200, 630, 'image/jpeg', 85137, '911-construction-electric-inc-whole-house-surge-protection-l-da611485-4095-49ae-97d1-fe92354318cd-1-1200x630.jpg');
INSERT INTO public.media (id, alt, caption, folder_id, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_square_url, sizes_square_width, sizes_square_height, sizes_square_mime_type, sizes_square_filesize, sizes_square_filename, sizes_small_url, sizes_small_width, sizes_small_height, sizes_small_mime_type, sizes_small_filesize, sizes_small_filename, sizes_medium_url, sizes_medium_width, sizes_medium_height, sizes_medium_mime_type, sizes_medium_filesize, sizes_medium_filename, sizes_large_url, sizes_large_width, sizes_large_height, sizes_large_mime_type, sizes_large_filesize, sizes_large_filename, sizes_xlarge_url, sizes_xlarge_width, sizes_xlarge_height, sizes_xlarge_mime_type, sizes_xlarge_filesize, sizes_xlarge_filename, sizes_og_url, sizes_og_width, sizes_og_height, sizes_og_mime_type, sizes_og_filesize, sizes_og_filename) VALUES (40, 'evitp certified construction electric', NULL, NULL, '2026-06-16 16:01:31.999+00', '2026-06-16 16:01:31.999+00', '/api/media/file/evitp-certified-911-construction-electric-1.jpg', NULL, 'evitp-certified-911-construction-electric-1.jpg', 'image/jpeg', 144610, 1280, 837, 50, 50, '/api/media/file/evitp-certified-911-construction-electric-1-300x196.jpg', 300, 196, 'image/jpeg', 17004, 'evitp-certified-911-construction-electric-1-300x196.jpg', '/api/media/file/evitp-certified-911-construction-electric-1-500x500.jpg', 500, 500, 'image/jpeg', 57352, 'evitp-certified-911-construction-electric-1-500x500.jpg', '/api/media/file/evitp-certified-911-construction-electric-1-600x392.jpg', 600, 392, 'image/jpeg', 53027, 'evitp-certified-911-construction-electric-1-600x392.jpg', '/api/media/file/evitp-certified-911-construction-electric-1-900x589.jpg', 900, 589, 'image/jpeg', 101866, 'evitp-certified-911-construction-electric-1-900x589.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/api/media/file/evitp-certified-911-construction-electric-1-1200x630.jpg', 1200, 630, 'image/jpeg', 134030, 'evitp-certified-911-construction-electric-1-1200x630.jpg');
INSERT INTO public.media (id, alt, caption, folder_id, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_square_url, sizes_square_width, sizes_square_height, sizes_square_mime_type, sizes_square_filesize, sizes_square_filename, sizes_small_url, sizes_small_width, sizes_small_height, sizes_small_mime_type, sizes_small_filesize, sizes_small_filename, sizes_medium_url, sizes_medium_width, sizes_medium_height, sizes_medium_mime_type, sizes_medium_filesize, sizes_medium_filename, sizes_large_url, sizes_large_width, sizes_large_height, sizes_large_mime_type, sizes_large_filesize, sizes_large_filename, sizes_xlarge_url, sizes_xlarge_width, sizes_xlarge_height, sizes_xlarge_mime_type, sizes_xlarge_filesize, sizes_xlarge_filename, sizes_og_url, sizes_og_width, sizes_og_height, sizes_og_mime_type, sizes_og_filesize, sizes_og_filename) VALUES (41, 'image 1 1db5b66d f6b1 a3db 48fdbb', NULL, NULL, '2026-06-16 16:01:32.095+00', '2026-06-16 16:01:32.095+00', '/api/media/file/image-1-1db5b66d-f6b1-4011-a3db-48fd139b590b-1.jpg', NULL, 'image-1-1db5b66d-f6b1-4011-a3db-48fd139b590b-1.jpg', 'image/jpeg', 147741, 1296, 864, 50, 50, '/api/media/file/image-1-1db5b66d-f6b1-4011-a3db-48fd139b590b-1-300x200.jpg', 300, 200, 'image/jpeg', 15090, 'image-1-1db5b66d-f6b1-4011-a3db-48fd139b590b-1-300x200.jpg', '/api/media/file/image-1-1db5b66d-f6b1-4011-a3db-48fd139b590b-1-500x500.jpg', 500, 500, 'image/jpeg', 49337, 'image-1-1db5b66d-f6b1-4011-a3db-48fd139b590b-1-500x500.jpg', '/api/media/file/image-1-1db5b66d-f6b1-4011-a3db-48fd139b590b-1-600x400.jpg', 600, 400, 'image/jpeg', 47939, 'image-1-1db5b66d-f6b1-4011-a3db-48fd139b590b-1-600x400.jpg', '/api/media/file/image-1-1db5b66d-f6b1-4011-a3db-48fd139b590b-1-900x600.jpg', 900, 600, 'image/jpeg', 95309, 'image-1-1db5b66d-f6b1-4011-a3db-48fd139b590b-1-900x600.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/api/media/file/image-1-1db5b66d-f6b1-4011-a3db-48fd139b590b-1-1200x630.jpg', 1200, 630, 'image/jpeg', 115728, 'image-1-1db5b66d-f6b1-4011-a3db-48fd139b590b-1-1200x630.jpg');
INSERT INTO public.media (id, alt, caption, folder_id, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_square_url, sizes_square_width, sizes_square_height, sizes_square_mime_type, sizes_square_filesize, sizes_square_filename, sizes_small_url, sizes_small_width, sizes_small_height, sizes_small_mime_type, sizes_small_filesize, sizes_small_filename, sizes_medium_url, sizes_medium_width, sizes_medium_height, sizes_medium_mime_type, sizes_medium_filesize, sizes_medium_filename, sizes_large_url, sizes_large_width, sizes_large_height, sizes_large_mime_type, sizes_large_filesize, sizes_large_filename, sizes_xlarge_url, sizes_xlarge_width, sizes_xlarge_height, sizes_xlarge_mime_type, sizes_xlarge_filesize, sizes_xlarge_filename, sizes_og_url, sizes_og_width, sizes_og_height, sizes_og_mime_type, sizes_og_filesize, sizes_og_filename) VALUES (42, 'bd 6fff 49f3 ac12', NULL, NULL, '2026-06-16 16:01:32.766+00', '2026-06-16 16:01:32.766+00', '/api/media/file/123889bd-6fff-49f3-ac12-778223977309.webp', NULL, '123889bd-6fff-49f3-ac12-778223977309.webp', 'image/webp', 224304, 1365, 1024, 50, 50, '/api/media/file/123889bd-6fff-49f3-ac12-778223977309-300x225.webp', 300, 225, 'image/webp', 15970, '123889bd-6fff-49f3-ac12-778223977309-300x225.webp', '/api/media/file/123889bd-6fff-49f3-ac12-778223977309-500x500.webp', 500, 500, 'image/webp', 46514, '123889bd-6fff-49f3-ac12-778223977309-500x500.webp', '/api/media/file/123889bd-6fff-49f3-ac12-778223977309-600x450.webp', 600, 450, 'image/webp', 50332, '123889bd-6fff-49f3-ac12-778223977309-600x450.webp', '/api/media/file/123889bd-6fff-49f3-ac12-778223977309-900x675.webp', 900, 675, 'image/webp', 100936, '123889bd-6fff-49f3-ac12-778223977309-900x675.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/api/media/file/123889bd-6fff-49f3-ac12-778223977309-1200x630.webp', 1200, 630, 'image/webp', 118030, '123889bd-6fff-49f3-ac12-778223977309-1200x630.webp');
INSERT INTO public.media (id, alt, caption, folder_id, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_square_url, sizes_square_width, sizes_square_height, sizes_square_mime_type, sizes_square_filesize, sizes_square_filename, sizes_small_url, sizes_small_width, sizes_small_height, sizes_small_mime_type, sizes_small_filesize, sizes_small_filename, sizes_medium_url, sizes_medium_width, sizes_medium_height, sizes_medium_mime_type, sizes_medium_filesize, sizes_medium_filename, sizes_large_url, sizes_large_width, sizes_large_height, sizes_large_mime_type, sizes_large_filesize, sizes_large_filename, sizes_xlarge_url, sizes_xlarge_width, sizes_xlarge_height, sizes_xlarge_mime_type, sizes_xlarge_filesize, sizes_xlarge_filename, sizes_og_url, sizes_og_width, sizes_og_height, sizes_og_mime_type, sizes_og_filesize, sizes_og_filename) VALUES (43, '911 Construction & Electric technician shaking hands with a homeowner beside the company van', NULL, NULL, '2026-06-16 16:02:36.639+00', '2026-06-16 16:02:36.637+00', '/api/media/file/911-construction-electric-technician-handshake.jpg', NULL, '911-construction-electric-technician-handshake.jpg', 'image/jpeg', 216428, 1184, 883, 50, 50, '/api/media/file/911-construction-electric-technician-handshake-300x224.jpg', 300, 224, 'image/jpeg', 17977, '911-construction-electric-technician-handshake-300x224.jpg', '/api/media/file/911-construction-electric-technician-handshake-500x500.jpg', 500, 500, 'image/jpeg', 50351, '911-construction-electric-technician-handshake-500x500.jpg', '/api/media/file/911-construction-electric-technician-handshake-600x447.jpg', 600, 447, 'image/jpeg', 53750, '911-construction-electric-technician-handshake-600x447.jpg', '/api/media/file/911-construction-electric-technician-handshake-900x671.jpg', 900, 671, 'image/jpeg', 99029, '911-construction-electric-technician-handshake-900x671.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/api/media/file/911-construction-electric-technician-handshake-1200x630.jpg', 1200, 630, 'image/jpeg', 104747, '911-construction-electric-technician-handshake-1200x630.jpg');
INSERT INTO public.media (id, alt, caption, folder_id, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_square_url, sizes_square_width, sizes_square_height, sizes_square_mime_type, sizes_square_filesize, sizes_square_filename, sizes_small_url, sizes_small_width, sizes_small_height, sizes_small_mime_type, sizes_small_filesize, sizes_small_filename, sizes_medium_url, sizes_medium_width, sizes_medium_height, sizes_medium_mime_type, sizes_medium_filesize, sizes_medium_filename, sizes_large_url, sizes_large_width, sizes_large_height, sizes_large_mime_type, sizes_large_filesize, sizes_large_filename, sizes_xlarge_url, sizes_xlarge_width, sizes_xlarge_height, sizes_xlarge_mime_type, sizes_xlarge_filesize, sizes_xlarge_filename, sizes_og_url, sizes_og_width, sizes_og_height, sizes_og_mime_type, sizes_og_filesize, sizes_og_filename) VALUES (44, 'Electrician troubleshooting a wall outlet with a multimeter', NULL, NULL, '2026-06-16 16:02:36.786+00', '2026-06-16 16:02:36.786+00', '/api/media/file/electrical-outlet-troubleshooting-multimeter.jpg', NULL, 'electrical-outlet-troubleshooting-multimeter.jpg', 'image/jpeg', 150267, 1184, 833, 50, 50, '/api/media/file/electrical-outlet-troubleshooting-multimeter-300x211.jpg', 300, 211, 'image/jpeg', 11210, 'electrical-outlet-troubleshooting-multimeter-300x211.jpg', '/api/media/file/electrical-outlet-troubleshooting-multimeter-500x500.jpg', 500, 500, 'image/jpeg', 36578, 'electrical-outlet-troubleshooting-multimeter-500x500.jpg', '/api/media/file/electrical-outlet-troubleshooting-multimeter-600x422.jpg', 600, 422, 'image/jpeg', 33467, 'electrical-outlet-troubleshooting-multimeter-600x422.jpg', '/api/media/file/electrical-outlet-troubleshooting-multimeter-900x633.jpg', 900, 633, 'image/jpeg', 63096, 'electrical-outlet-troubleshooting-multimeter-900x633.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/api/media/file/electrical-outlet-troubleshooting-multimeter-1200x630.jpg', 1200, 630, 'image/jpeg', 78347, 'electrical-outlet-troubleshooting-multimeter-1200x630.jpg');
INSERT INTO public.media (id, alt, caption, folder_id, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_square_url, sizes_square_width, sizes_square_height, sizes_square_mime_type, sizes_square_filesize, sizes_square_filename, sizes_small_url, sizes_small_width, sizes_small_height, sizes_small_mime_type, sizes_small_filesize, sizes_small_filename, sizes_medium_url, sizes_medium_width, sizes_medium_height, sizes_medium_mime_type, sizes_medium_filesize, sizes_medium_filename, sizes_large_url, sizes_large_width, sizes_large_height, sizes_large_mime_type, sizes_large_filesize, sizes_large_filename, sizes_xlarge_url, sizes_xlarge_width, sizes_xlarge_height, sizes_xlarge_mime_type, sizes_xlarge_filesize, sizes_xlarge_filename, sizes_og_url, sizes_og_width, sizes_og_height, sizes_og_mime_type, sizes_og_filesize, sizes_og_filename) VALUES (45, 'Electrician inspecting an electrical panel against the wiring schematic with a flashlight', NULL, NULL, '2026-06-16 16:02:36.914+00', '2026-06-16 16:02:36.914+00', '/api/media/file/electrical-panel-inspection-flashlight.jpg', NULL, 'electrical-panel-inspection-flashlight.jpg', 'image/jpeg', 166000, 1080, 798, 50, 50, '/api/media/file/electrical-panel-inspection-flashlight-300x222.jpg', 300, 222, 'image/jpeg', 14363, 'electrical-panel-inspection-flashlight-300x222.jpg', '/api/media/file/electrical-panel-inspection-flashlight-500x500.jpg', 500, 500, 'image/jpeg', 43332, 'electrical-panel-inspection-flashlight-500x500.jpg', '/api/media/file/electrical-panel-inspection-flashlight-600x443.jpg', 600, 443, 'image/jpeg', 44411, 'electrical-panel-inspection-flashlight-600x443.jpg', '/api/media/file/electrical-panel-inspection-flashlight-900x665.jpg', 900, 665, 'image/jpeg', 83551, 'electrical-panel-inspection-flashlight-900x665.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/api/media/file/electrical-panel-inspection-flashlight-1200x630.jpg', 1200, 630, 'image/jpeg', 100052, 'electrical-panel-inspection-flashlight-1200x630.jpg');
INSERT INTO public.media (id, alt, caption, folder_id, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_square_url, sizes_square_width, sizes_square_height, sizes_square_mime_type, sizes_square_filesize, sizes_square_filename, sizes_small_url, sizes_small_width, sizes_small_height, sizes_small_mime_type, sizes_small_filesize, sizes_small_filename, sizes_medium_url, sizes_medium_width, sizes_medium_height, sizes_medium_mime_type, sizes_medium_filesize, sizes_medium_filename, sizes_large_url, sizes_large_width, sizes_large_height, sizes_large_mime_type, sizes_large_filesize, sizes_large_filename, sizes_xlarge_url, sizes_xlarge_width, sizes_xlarge_height, sizes_xlarge_mime_type, sizes_xlarge_filesize, sizes_xlarge_filename, sizes_og_url, sizes_og_width, sizes_og_height, sizes_og_mime_type, sizes_og_filesize, sizes_og_filename) VALUES (46, 'Electrician checking rough-in wiring with a non-contact voltage tester', NULL, NULL, '2026-06-16 16:02:37.042+00', '2026-06-16 16:02:37.042+00', '/api/media/file/electrical-wiring-rough-in-voltage-tester.jpg', NULL, 'electrical-wiring-rough-in-voltage-tester.jpg', 'image/jpeg', 130897, 1078, 807, 50, 50, '/api/media/file/electrical-wiring-rough-in-voltage-tester-300x225.jpg', 300, 225, 'image/jpeg', 10545, 'electrical-wiring-rough-in-voltage-tester-300x225.jpg', '/api/media/file/electrical-wiring-rough-in-voltage-tester-500x500.jpg', 500, 500, 'image/jpeg', 31354, 'electrical-wiring-rough-in-voltage-tester-500x500.jpg', '/api/media/file/electrical-wiring-rough-in-voltage-tester-600x449.jpg', 600, 449, 'image/jpeg', 31097, 'electrical-wiring-rough-in-voltage-tester-600x449.jpg', '/api/media/file/electrical-wiring-rough-in-voltage-tester-900x674.jpg', 900, 674, 'image/jpeg', 60925, 'electrical-wiring-rough-in-voltage-tester-900x674.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/api/media/file/electrical-wiring-rough-in-voltage-tester-1200x630.jpg', 1200, 630, 'image/jpeg', 75894, 'electrical-wiring-rough-in-voltage-tester-1200x630.jpg');
INSERT INTO public.media (id, alt, caption, folder_id, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_square_url, sizes_square_width, sizes_square_height, sizes_square_mime_type, sizes_square_filesize, sizes_square_filename, sizes_small_url, sizes_small_width, sizes_small_height, sizes_small_mime_type, sizes_small_filesize, sizes_small_filename, sizes_medium_url, sizes_medium_width, sizes_medium_height, sizes_medium_mime_type, sizes_medium_filesize, sizes_medium_filename, sizes_large_url, sizes_large_width, sizes_large_height, sizes_large_mime_type, sizes_large_filesize, sizes_large_filename, sizes_xlarge_url, sizes_xlarge_width, sizes_xlarge_height, sizes_xlarge_mime_type, sizes_xlarge_filesize, sizes_xlarge_filename, sizes_og_url, sizes_og_width, sizes_og_height, sizes_og_mime_type, sizes_og_filesize, sizes_og_filename) VALUES (47, '911 Construction & Electric electrician walking a client through a commercial building', NULL, NULL, '2026-06-16 16:02:37.19+00', '2026-06-16 16:02:37.19+00', '/api/media/file/commercial-electrical-consultation-walkthrough.jpg', NULL, 'commercial-electrical-consultation-walkthrough.jpg', 'image/jpeg', 112440, 1078, 804, 50, 50, '/api/media/file/commercial-electrical-consultation-walkthrough-300x224.jpg', 300, 224, 'image/jpeg', 10330, 'commercial-electrical-consultation-walkthrough-300x224.jpg', '/api/media/file/commercial-electrical-consultation-walkthrough-500x500.jpg', 500, 500, 'image/jpeg', 32373, 'commercial-electrical-consultation-walkthrough-500x500.jpg', '/api/media/file/commercial-electrical-consultation-walkthrough-600x447.jpg', 600, 447, 'image/jpeg', 29422, 'commercial-electrical-consultation-walkthrough-600x447.jpg', '/api/media/file/commercial-electrical-consultation-walkthrough-900x671.jpg', 900, 671, 'image/jpeg', 53317, 'commercial-electrical-consultation-walkthrough-900x671.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/api/media/file/commercial-electrical-consultation-walkthrough-1200x630.jpg', 1200, 630, 'image/jpeg', 59682, 'commercial-electrical-consultation-walkthrough-1200x630.jpg');
INSERT INTO public.media (id, alt, caption, folder_id, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_square_url, sizes_square_width, sizes_square_height, sizes_square_mime_type, sizes_square_filesize, sizes_square_filename, sizes_small_url, sizes_small_width, sizes_small_height, sizes_small_mime_type, sizes_small_filesize, sizes_small_filename, sizes_medium_url, sizes_medium_width, sizes_medium_height, sizes_medium_mime_type, sizes_medium_filesize, sizes_medium_filename, sizes_large_url, sizes_large_width, sizes_large_height, sizes_large_mime_type, sizes_large_filesize, sizes_large_filename, sizes_xlarge_url, sizes_xlarge_width, sizes_xlarge_height, sizes_xlarge_mime_type, sizes_xlarge_filesize, sizes_xlarge_filename, sizes_og_url, sizes_og_width, sizes_og_height, sizes_og_mime_type, sizes_og_filesize, sizes_og_filename) VALUES (48, 'Electrician repairing breaker panel wiring with strippers and a wire connector', NULL, NULL, '2026-06-16 16:02:37.323+00', '2026-06-16 16:02:37.323+00', '/api/media/file/electrical-panel-wiring-repair.jpg', NULL, 'electrical-panel-wiring-repair.jpg', 'image/jpeg', 160049, 1080, 805, 50, 50, '/api/media/file/electrical-panel-wiring-repair-300x224.jpg', 300, 224, 'image/jpeg', 15961, 'electrical-panel-wiring-repair-300x224.jpg', '/api/media/file/electrical-panel-wiring-repair-500x500.jpg', 500, 500, 'image/jpeg', 43616, 'electrical-panel-wiring-repair-500x500.jpg', '/api/media/file/electrical-panel-wiring-repair-600x447.jpg', 600, 447, 'image/jpeg', 45524, 'electrical-panel-wiring-repair-600x447.jpg', '/api/media/file/electrical-panel-wiring-repair-900x671.jpg', 900, 671, 'image/jpeg', 82567, 'electrical-panel-wiring-repair-900x671.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/api/media/file/electrical-panel-wiring-repair-1200x630.jpg', 1200, 630, 'image/jpeg', 91478, 'electrical-panel-wiring-repair-1200x630.jpg');
INSERT INTO public.media (id, alt, caption, folder_id, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_square_url, sizes_square_width, sizes_square_height, sizes_square_mime_type, sizes_square_filesize, sizes_square_filename, sizes_small_url, sizes_small_width, sizes_small_height, sizes_small_mime_type, sizes_small_filesize, sizes_small_filename, sizes_medium_url, sizes_medium_width, sizes_medium_height, sizes_medium_mime_type, sizes_medium_filesize, sizes_medium_filename, sizes_large_url, sizes_large_width, sizes_large_height, sizes_large_mime_type, sizes_large_filesize, sizes_large_filename, sizes_xlarge_url, sizes_xlarge_width, sizes_xlarge_height, sizes_xlarge_mime_type, sizes_xlarge_filesize, sizes_xlarge_filename, sizes_og_url, sizes_og_width, sizes_og_height, sizes_og_mime_type, sizes_og_filesize, sizes_og_filename) VALUES (49, 'Emergency electrician servicing an electrical panel by flashlight', NULL, NULL, '2026-06-16 16:02:37.474+00', '2026-06-16 16:02:37.474+00', '/api/media/file/emergency-electrical-panel-service.jpg', NULL, 'emergency-electrical-panel-service.jpg', 'image/jpeg', 157902, 975, 724, 50, 50, '/api/media/file/emergency-electrical-panel-service-300x223.jpg', 300, 223, 'image/jpeg', 16735, 'emergency-electrical-panel-service-300x223.jpg', '/api/media/file/emergency-electrical-panel-service-500x500.jpg', 500, 500, 'image/jpeg', 50211, 'emergency-electrical-panel-service-500x500.jpg', '/api/media/file/emergency-electrical-panel-service-600x446.jpg', 600, 446, 'image/jpeg', 50983, 'emergency-electrical-panel-service-600x446.jpg', '/api/media/file/emergency-electrical-panel-service-900x668.jpg', 900, 668, 'image/jpeg', 94267, 'emergency-electrical-panel-service-900x668.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/api/media/file/emergency-electrical-panel-service-1200x630.jpg', 1200, 630, 'image/jpeg', 107770, 'emergency-electrical-panel-service-1200x630.jpg');
INSERT INTO public.media (id, alt, caption, folder_id, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_square_url, sizes_square_width, sizes_square_height, sizes_square_mime_type, sizes_square_filesize, sizes_square_filename, sizes_small_url, sizes_small_width, sizes_small_height, sizes_small_mime_type, sizes_small_filesize, sizes_small_filename, sizes_medium_url, sizes_medium_width, sizes_medium_height, sizes_medium_mime_type, sizes_medium_filesize, sizes_medium_filename, sizes_large_url, sizes_large_width, sizes_large_height, sizes_large_mime_type, sizes_large_filesize, sizes_large_filename, sizes_xlarge_url, sizes_xlarge_width, sizes_xlarge_height, sizes_xlarge_mime_type, sizes_xlarge_filesize, sizes_xlarge_filename, sizes_og_url, sizes_og_width, sizes_og_height, sizes_og_mime_type, sizes_og_filesize, sizes_og_filename) VALUES (50, '911 Construction & Electric electrician running conduit through metal framing on a new build', NULL, NULL, '2026-06-16 16:02:37.628+00', '2026-06-16 16:02:37.628+00', '/api/media/file/new-construction-electrical-framing.jpg', NULL, 'new-construction-electrical-framing.jpg', 'image/jpeg', 134628, 975, 727, 50, 50, '/api/media/file/new-construction-electrical-framing-300x224.jpg', 300, 224, 'image/jpeg', 14190, 'new-construction-electrical-framing-300x224.jpg', '/api/media/file/new-construction-electrical-framing-500x500.jpg', 500, 500, 'image/jpeg', 39747, 'new-construction-electrical-framing-500x500.jpg', '/api/media/file/new-construction-electrical-framing-600x447.jpg', 600, 447, 'image/jpeg', 42342, 'new-construction-electrical-framing-600x447.jpg', '/api/media/file/new-construction-electrical-framing-900x671.jpg', 900, 671, 'image/jpeg', 79675, 'new-construction-electrical-framing-900x671.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/api/media/file/new-construction-electrical-framing-1200x630.jpg', 1200, 630, 'image/jpeg', 91579, 'new-construction-electrical-framing-1200x630.jpg');
INSERT INTO public.media (id, alt, caption, folder_id, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_square_url, sizes_square_width, sizes_square_height, sizes_square_mime_type, sizes_square_filesize, sizes_square_filename, sizes_small_url, sizes_small_width, sizes_small_height, sizes_small_mime_type, sizes_small_filesize, sizes_small_filename, sizes_medium_url, sizes_medium_width, sizes_medium_height, sizes_medium_mime_type, sizes_medium_filesize, sizes_medium_filename, sizes_large_url, sizes_large_width, sizes_large_height, sizes_large_mime_type, sizes_large_filesize, sizes_large_filename, sizes_xlarge_url, sizes_xlarge_width, sizes_xlarge_height, sizes_xlarge_mime_type, sizes_xlarge_filesize, sizes_xlarge_filename, sizes_og_url, sizes_og_width, sizes_og_height, sizes_og_mime_type, sizes_og_filesize, sizes_og_filename) VALUES (51, 'Commercial office electrical build-out with recessed lighting and cabling', NULL, NULL, '2026-06-16 16:02:37.784+00', '2026-06-16 16:02:37.784+00', '/api/media/file/commercial-office-electrical-buildout.jpg', NULL, 'commercial-office-electrical-buildout.jpg', 'image/jpeg', 121108, 929, 724, 50, 50, '/api/media/file/commercial-office-electrical-buildout-300x234.jpg', 300, 234, 'image/jpeg', 13419, 'commercial-office-electrical-buildout-300x234.jpg', '/api/media/file/commercial-office-electrical-buildout-500x500.jpg', 500, 500, 'image/jpeg', 36067, 'commercial-office-electrical-buildout-500x500.jpg', '/api/media/file/commercial-office-electrical-buildout-600x468.jpg', 600, 468, 'image/jpeg', 41138, 'commercial-office-electrical-buildout-600x468.jpg', '/api/media/file/commercial-office-electrical-buildout-900x701.jpg', 900, 701, 'image/jpeg', 75957, 'commercial-office-electrical-buildout-900x701.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/api/media/file/commercial-office-electrical-buildout-1200x630.jpg', 1200, 630, 'image/jpeg', 83472, 'commercial-office-electrical-buildout-1200x630.jpg');
INSERT INTO public.media (id, alt, caption, folder_id, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_square_url, sizes_square_width, sizes_square_height, sizes_square_mime_type, sizes_square_filesize, sizes_square_filename, sizes_small_url, sizes_small_width, sizes_small_height, sizes_small_mime_type, sizes_small_filesize, sizes_small_filename, sizes_medium_url, sizes_medium_width, sizes_medium_height, sizes_medium_mime_type, sizes_medium_filesize, sizes_medium_filename, sizes_large_url, sizes_large_width, sizes_large_height, sizes_large_mime_type, sizes_large_filesize, sizes_large_filename, sizes_xlarge_url, sizes_xlarge_width, sizes_xlarge_height, sizes_xlarge_mime_type, sizes_xlarge_filesize, sizes_xlarge_filename, sizes_og_url, sizes_og_width, sizes_og_height, sizes_og_mime_type, sizes_og_filesize, sizes_og_filename) VALUES (52, 'Electrician installing a recessed ceiling light from a scaffold', NULL, NULL, '2026-06-16 16:02:37.944+00', '2026-06-16 16:02:37.944+00', '/api/media/file/recessed-lighting-installation.jpg', NULL, 'recessed-lighting-installation.jpg', 'image/jpeg', 108229, 927, 727, 50, 50, '/api/media/file/recessed-lighting-installation-300x235.jpg', 300, 235, 'image/jpeg', 13095, 'recessed-lighting-installation-300x235.jpg', '/api/media/file/recessed-lighting-installation-500x500.jpg', 500, 500, 'image/jpeg', 34416, 'recessed-lighting-installation-500x500.jpg', '/api/media/file/recessed-lighting-installation-600x471.jpg', 600, 471, 'image/jpeg', 37570, 'recessed-lighting-installation-600x471.jpg', '/api/media/file/recessed-lighting-installation-900x706.jpg', 900, 706, 'image/jpeg', 68784, 'recessed-lighting-installation-900x706.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/api/media/file/recessed-lighting-installation-1200x630.jpg', 1200, 630, 'image/jpeg', 60991, 'recessed-lighting-installation-1200x630.jpg');
INSERT INTO public.media (id, alt, caption, folder_id, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_square_url, sizes_square_width, sizes_square_height, sizes_square_mime_type, sizes_square_filesize, sizes_square_filename, sizes_small_url, sizes_small_width, sizes_small_height, sizes_small_mime_type, sizes_small_filesize, sizes_small_filename, sizes_medium_url, sizes_medium_width, sizes_medium_height, sizes_medium_mime_type, sizes_medium_filesize, sizes_medium_filename, sizes_large_url, sizes_large_width, sizes_large_height, sizes_large_mime_type, sizes_large_filesize, sizes_large_filename, sizes_xlarge_url, sizes_xlarge_width, sizes_xlarge_height, sizes_xlarge_mime_type, sizes_xlarge_filesize, sizes_xlarge_filename, sizes_og_url, sizes_og_width, sizes_og_height, sizes_og_mime_type, sizes_og_filesize, sizes_og_filename) VALUES (53, 'Electrician replacing a ceiling light fixture using a headlamp and meter', NULL, NULL, '2026-06-16 16:02:38.095+00', '2026-06-16 16:02:38.095+00', '/api/media/file/electrician-replacing-ceiling-light-fixture.jpg', NULL, 'electrician-replacing-ceiling-light-fixture.jpg', 'image/jpeg', 154713, 1186, 863, 50, 50, '/api/media/file/electrician-replacing-ceiling-light-fixture-300x218.jpg', 300, 218, 'image/jpeg', 10437, 'electrician-replacing-ceiling-light-fixture-300x218.jpg', '/api/media/file/electrician-replacing-ceiling-light-fixture-500x500.jpg', 500, 500, 'image/jpeg', 32618, 'electrician-replacing-ceiling-light-fixture-500x500.jpg', '/api/media/file/electrician-replacing-ceiling-light-fixture-600x437.jpg', 600, 437, 'image/jpeg', 32724, 'electrician-replacing-ceiling-light-fixture-600x437.jpg', '/api/media/file/electrician-replacing-ceiling-light-fixture-900x655.jpg', 900, 655, 'image/jpeg', 62814, 'electrician-replacing-ceiling-light-fixture-900x655.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/api/media/file/electrician-replacing-ceiling-light-fixture-1200x630.jpg', 1200, 630, 'image/jpeg', 62531, 'electrician-replacing-ceiling-light-fixture-1200x630.jpg');
INSERT INTO public.media (id, alt, caption, folder_id, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_square_url, sizes_square_width, sizes_square_height, sizes_square_mime_type, sizes_square_filesize, sizes_square_filename, sizes_small_url, sizes_small_width, sizes_small_height, sizes_small_mime_type, sizes_small_filesize, sizes_small_filename, sizes_medium_url, sizes_medium_width, sizes_medium_height, sizes_medium_mime_type, sizes_medium_filesize, sizes_medium_filename, sizes_large_url, sizes_large_width, sizes_large_height, sizes_large_mime_type, sizes_large_filesize, sizes_large_filename, sizes_xlarge_url, sizes_xlarge_width, sizes_xlarge_height, sizes_xlarge_mime_type, sizes_xlarge_filesize, sizes_xlarge_filename, sizes_og_url, sizes_og_width, sizes_og_height, sizes_og_mime_type, sizes_og_filesize, sizes_og_filename) VALUES (54, 'Electrician wiring a smart thermostat on a wall', NULL, NULL, '2026-06-16 16:02:38.216+00', '2026-06-16 16:02:38.216+00', '/api/media/file/smart-thermostat-installation.jpg', NULL, 'smart-thermostat-installation.jpg', 'image/jpeg', 85607, 977, 724, 50, 50, '/api/media/file/smart-thermostat-installation-300x222.jpg', 300, 222, 'image/jpeg', 7925, 'smart-thermostat-installation-300x222.jpg', '/api/media/file/smart-thermostat-installation-500x500.jpg', 500, 500, 'image/jpeg', 20784, 'smart-thermostat-installation-500x500.jpg', '/api/media/file/smart-thermostat-installation-600x445.jpg', 600, 445, 'image/jpeg', 22562, 'smart-thermostat-installation-600x445.jpg', '/api/media/file/smart-thermostat-installation-900x667.jpg', 900, 667, 'image/jpeg', 44799, 'smart-thermostat-installation-900x667.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/api/media/file/smart-thermostat-installation-1200x630.jpg', 1200, 630, 'image/jpeg', 52535, 'smart-thermostat-installation-1200x630.jpg');


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cities (id, city_name, region, title, hero_heading_override, intro_override, local_notes, meta_title, meta_image_id, meta_description, path_override, generate_slug, slug, updated_at, created_at, _status) VALUES (1, 'Altadena', NULL, 'Electrician in Altadena, CA', NULL, NULL, NULL, 'Electrician Altadena CA: Expert Electrical Services - 911 Construction & Electric Inc.', NULL, 'For reliable electrical services in Altadena, CA, trust 911 Construction & Electric Inc. for all your needs.', NULL, false, 'electrician-altadena-ca', '2026-06-16 16:01:34.812+00', '2026-06-16 16:01:34.812+00', 'published');
INSERT INTO public.cities (id, city_name, region, title, hero_heading_override, intro_override, local_notes, meta_title, meta_image_id, meta_description, path_override, generate_slug, slug, updated_at, created_at, _status) VALUES (2, 'Arleta', NULL, 'Electrician in Arleta, CA', NULL, NULL, NULL, 'Electrician Arleta CA: Expert Electrical Services - 911 Construction & Electric Inc.', NULL, 'Find expert electrical services in Arleta, CA. Our electrician Arleta CA team handles installations, repairs, and more.', NULL, false, 'electrician-arleta-ca', '2026-06-16 16:01:34.838+00', '2026-06-16 16:01:34.838+00', 'published');
INSERT INTO public.cities (id, city_name, region, title, hero_heading_override, intro_override, local_notes, meta_title, meta_image_id, meta_description, path_override, generate_slug, slug, updated_at, created_at, _status) VALUES (3, 'Beverly Hills', NULL, 'Electrician in Beverly Hills, CA', NULL, NULL, NULL, 'Electrician Beverly Hills CA: Quality Services Near You - 911 Construction & Electric Inc.', NULL, 'Looking for an electrician in Beverly Hills, CA? We offer expert electrical installations and repairs for all properties.', NULL, false, 'electrician-beverly-hills-ca', '2026-06-16 16:01:34.862+00', '2026-06-16 16:01:34.862+00', 'published');
INSERT INTO public.cities (id, city_name, region, title, hero_heading_override, intro_override, local_notes, meta_title, meta_image_id, meta_description, path_override, generate_slug, slug, updated_at, created_at, _status) VALUES (4, 'Burbank', NULL, 'Electrician in Burbank, CA', NULL, NULL, NULL, 'Electrician Burbank CA: Trusted Electrical Services - 911 Construction & Electric Inc.', NULL, 'Get reliable electrical services in Burbank, CA. Our expert electricians are ready to assist with all your electrical needs.', NULL, false, 'electrician-burbank-ca', '2026-06-16 16:01:34.895+00', '2026-06-16 16:01:34.895+00', 'published');
INSERT INTO public.cities (id, city_name, region, title, hero_heading_override, intro_override, local_notes, meta_title, meta_image_id, meta_description, path_override, generate_slug, slug, updated_at, created_at, _status) VALUES (5, 'Calabasas', NULL, 'Electrician in Calabasas, CA', NULL, NULL, NULL, 'Electrician Calabasas CA: Expert Services Offered - 911 Construction & Electric Inc.', NULL, 'Expert electrician Calabasas CA services for installations and repairs. Trust us for reliable electrical solutions and construction.', NULL, false, 'electrician-calabasas-ca', '2026-06-16 16:01:34.915+00', '2026-06-16 16:01:34.915+00', 'published');
INSERT INTO public.cities (id, city_name, region, title, hero_heading_override, intro_override, local_notes, meta_title, meta_image_id, meta_description, path_override, generate_slug, slug, updated_at, created_at, _status) VALUES (6, 'Canoga Park', NULL, 'Electrician in Canoga Park, CA', NULL, NULL, NULL, 'Electrician Canoga Park CA: Expert Services Overview - 911 Construction & Electric Inc.', NULL, 'Find expert electrician services in Canoga Park, CA. We provide installations, repairs, and construction solutions for your needs.', NULL, false, 'electrician-canoga-park-ca', '2026-06-16 16:01:34.938+00', '2026-06-16 16:01:34.938+00', 'published');
INSERT INTO public.cities (id, city_name, region, title, hero_heading_override, intro_override, local_notes, meta_title, meta_image_id, meta_description, path_override, generate_slug, slug, updated_at, created_at, _status) VALUES (7, 'Chatsworth', NULL, 'Electrician in Chatsworth, CA', NULL, NULL, NULL, 'Chatsworth, CA - 911 Construction & Electric Inc.', NULL, 'Find a reliable electrician Chatsworth ca for all your electrical needs. Quality service is just a call away.', NULL, false, 'electrician-chatsworth-ca', '2026-06-16 16:01:34.962+00', '2026-06-16 16:01:34.962+00', 'published');
INSERT INTO public.cities (id, city_name, region, title, hero_heading_override, intro_override, local_notes, meta_title, meta_image_id, meta_description, path_override, generate_slug, slug, updated_at, created_at, _status) VALUES (8, 'Eagle Rock', NULL, 'Electrician in Eagle Rock, CA', NULL, NULL, NULL, 'Electrician Eagle Rock CA: Expert Electrical Services - 911 Construction & Electric Inc.', NULL, 'Top electrician in Eagle Rock, CA. We provide expert electrical installations, repairs, and construction solutions for you.', NULL, false, 'electrician-eagle-rock-ca', '2026-06-16 16:01:34.982+00', '2026-06-16 16:01:34.982+00', 'published');
INSERT INTO public.cities (id, city_name, region, title, hero_heading_override, intro_override, local_notes, meta_title, meta_image_id, meta_description, path_override, generate_slug, slug, updated_at, created_at, _status) VALUES (9, 'Encino', NULL, 'Electrician in Encino, CA', NULL, NULL, NULL, 'Electrician Encino CA: Reliable Services Offered - 911 Construction & Electric Inc.', NULL, 'Find reliable electrician Encino CA for all your electrical needs and enjoy top-notch services at competitive rates.', NULL, false, 'electrician-encino-ca', '2026-06-16 16:01:35.003+00', '2026-06-16 16:01:35.003+00', 'published');
INSERT INTO public.cities (id, city_name, region, title, hero_heading_override, intro_override, local_notes, meta_title, meta_image_id, meta_description, path_override, generate_slug, slug, updated_at, created_at, _status) VALUES (10, 'Glendale', NULL, 'Electrician in Glendale, CA', NULL, NULL, NULL, 'Electrician Glendale CA: Professional Services Offered - 911 Construction & Electric Inc.', NULL, 'Professional electrician in Glendale, CA offering reliable electrical services for homes and businesses. Get a free quote now.', NULL, false, 'electrician-glendale-ca', '2026-06-16 16:01:35.023+00', '2026-06-16 16:01:35.023+00', 'published');
INSERT INTO public.cities (id, city_name, region, title, hero_heading_override, intro_override, local_notes, meta_title, meta_image_id, meta_description, path_override, generate_slug, slug, updated_at, created_at, _status) VALUES (11, 'Granada Hills', NULL, 'Electrician in Granada Hills, CA', NULL, NULL, NULL, 'Electrician Granada Hills CA: Expert Services Offered - 911 Construction & Electric Inc.', NULL, 'Trust 911 Construction & Electric Inc. for top-notch electrician services in Granada Hills, CA. Get your free quote today!', NULL, false, 'electrician-granada-hills-ca', '2026-06-16 16:01:35.043+00', '2026-06-16 16:01:35.043+00', 'published');
INSERT INTO public.cities (id, city_name, region, title, hero_heading_override, intro_override, local_notes, meta_title, meta_image_id, meta_description, path_override, generate_slug, slug, updated_at, created_at, _status) VALUES (12, 'Hancock Park', NULL, 'Electrician in Hancock Park, CA', NULL, NULL, NULL, 'Electrician Hancock Park CA: Reliable Services - 911 Construction & Electric Inc.', NULL, 'Find top-notch electrician services in Hancock Park, CA. We provide expert installations and reliable construction solutions.', NULL, false, 'electrician-hancock-park-ca', '2026-06-16 16:01:35.063+00', '2026-06-16 16:01:35.063+00', 'published');
INSERT INTO public.cities (id, city_name, region, title, hero_heading_override, intro_override, local_notes, meta_title, meta_image_id, meta_description, path_override, generate_slug, slug, updated_at, created_at, _status) VALUES (13, 'Hollywood', NULL, 'Electrician in Hollywood, CA', NULL, NULL, NULL, 'Electrician Hollywood CA: Reliable Services Available - 911 Construction & Electric Inc.', NULL, 'Trust the experts for all your electrical needs in Hollywood, CA. We provide quality electrician services for homes and businesses.', NULL, false, 'electrician-hollywood-ca', '2026-06-16 16:01:35.082+00', '2026-06-16 16:01:35.082+00', 'published');
INSERT INTO public.cities (id, city_name, region, title, hero_heading_override, intro_override, local_notes, meta_title, meta_image_id, meta_description, path_override, generate_slug, slug, updated_at, created_at, _status) VALUES (14, 'La Canada', NULL, 'Electrician in La Canada, CA', NULL, NULL, NULL, 'Electrician La Canada CA: Your Trusted Experts - 911 Construction & Electric Inc.', NULL, 'For expert electrical installations and repairs, contact the best electrician in La Cañada, CA for reliable services.', NULL, false, 'electrician-la-canada-ca', '2026-06-16 16:01:35.103+00', '2026-06-16 16:01:35.102+00', 'published');
INSERT INTO public.cities (id, city_name, region, title, hero_heading_override, intro_override, local_notes, meta_title, meta_image_id, meta_description, path_override, generate_slug, slug, updated_at, created_at, _status) VALUES (15, 'La Crescenta', NULL, 'Electrician in La Crescenta, CA', NULL, NULL, NULL, 'Electrician La Crescenta CA: Quality Services Provided - 911 Construction & Electric Inc.', NULL, 'Find the best electrician in La Crescenta, CA for all your electrical needs. Quality service is just a call away.', NULL, false, 'electrician-la-crescenta-ca', '2026-06-16 16:01:35.122+00', '2026-06-16 16:01:35.122+00', 'published');
INSERT INTO public.cities (id, city_name, region, title, hero_heading_override, intro_override, local_notes, meta_title, meta_image_id, meta_description, path_override, generate_slug, slug, updated_at, created_at, _status) VALUES (16, 'Long Beach', NULL, 'Electrician in Long Beach, CA', NULL, NULL, NULL, 'Electrician Long Beach CA: Reliable Services You Need - 911 Construction & Electric Inc.', NULL, 'Get expert electrical services from licensed electrician Long Beach ca. We handle installations, repairs, and more.', NULL, false, 'electrician-long-beach-ca', '2026-06-16 16:01:35.142+00', '2026-06-16 16:01:35.142+00', 'published');
INSERT INTO public.cities (id, city_name, region, title, hero_heading_override, intro_override, local_notes, meta_title, meta_image_id, meta_description, path_override, generate_slug, slug, updated_at, created_at, _status) VALUES (17, 'Los Feliz', NULL, 'Electrician in Los Feliz, CA', NULL, NULL, NULL, 'Electrician Los Feliz CA: Quality Services Offered - 911 Construction & Electric Inc.', NULL, 'For top-notch electrical services, trust the expert electrician Los Feliz CA for installations and repairs that ensure safety.', NULL, false, 'electrician-los-feliz-ca', '2026-06-16 16:01:35.162+00', '2026-06-16 16:01:35.162+00', 'published');
INSERT INTO public.cities (id, city_name, region, title, hero_heading_override, intro_override, local_notes, meta_title, meta_image_id, meta_description, path_override, generate_slug, slug, updated_at, created_at, _status) VALUES (18, 'Melrose', NULL, 'Electrician in Melrose, CA', NULL, NULL, NULL, 'Electrician Melrose CA for Expert Services - 911 Construction & Electric Inc.', NULL, 'Find expert electrician services in Melrose, CA for installations and repairs. Your trusted partner for all electrical needs.', NULL, false, 'electrician-melrose-ca', '2026-06-16 16:01:35.181+00', '2026-06-16 16:01:35.181+00', 'published');
INSERT INTO public.cities (id, city_name, region, title, hero_heading_override, intro_override, local_notes, meta_title, meta_image_id, meta_description, path_override, generate_slug, slug, updated_at, created_at, _status) VALUES (19, 'Mission Hills', NULL, 'Electrician in Mission Hills, CA', NULL, NULL, NULL, 'Electrician Mission Hills CA: Expert Services Offered - 911 Construction & Electric Inc.', NULL, 'Choose 911 Construction & Electric Inc. for expert electrician services in Mission Hills, CA. Get reliable installations and repairs today.', NULL, false, 'electrician-mission-hills-ca', '2026-06-16 16:01:35.202+00', '2026-06-16 16:01:35.202+00', 'published');
INSERT INTO public.cities (id, city_name, region, title, hero_heading_override, intro_override, local_notes, meta_title, meta_image_id, meta_description, path_override, generate_slug, slug, updated_at, created_at, _status) VALUES (20, 'Montrose', NULL, 'Electrician in Montrose, CA', NULL, NULL, NULL, 'Electrician Montrose CA for Reliable Services - 911 Construction & Electric Inc.', NULL, 'For reliable electrical services in Montrose, CA, trust 911 Construction & Electric Inc. for installations and repairs.', NULL, false, 'electrician-montrose-ca', '2026-06-16 16:01:35.221+00', '2026-06-16 16:01:35.221+00', 'published');
INSERT INTO public.cities (id, city_name, region, title, hero_heading_override, intro_override, local_notes, meta_title, meta_image_id, meta_description, path_override, generate_slug, slug, updated_at, created_at, _status) VALUES (21, 'North Hills', NULL, 'Electrician in North Hills, CA', NULL, NULL, NULL, 'Electrician North Hills CA: Trusted Services - 911 Construction & Electric Inc.', NULL, 'Looking for a reliable electrician in North Hills, CA? Discover top-notch services for all your electrical needs.', NULL, false, 'electrician-north-hills-ca', '2026-06-16 16:01:35.239+00', '2026-06-16 16:01:35.239+00', 'published');
INSERT INTO public.cities (id, city_name, region, title, hero_heading_override, intro_override, local_notes, meta_title, meta_image_id, meta_description, path_override, generate_slug, slug, updated_at, created_at, _status) VALUES (22, 'North Hollywood', NULL, 'Electrician in North Hollywood, CA', NULL, NULL, NULL, 'Electrician North Hollywood CA: Expert Services - 911 Construction & Electric Inc.', NULL, 'Find the best electrician in North Hollywood, CA for all your electrical needs and repairs. Professional and reliable service is here.', NULL, false, 'electrician-north-hollywood-ca', '2026-06-16 16:01:35.259+00', '2026-06-16 16:01:35.259+00', 'published');
INSERT INTO public.cities (id, city_name, region, title, hero_heading_override, intro_override, local_notes, meta_title, meta_image_id, meta_description, path_override, generate_slug, slug, updated_at, created_at, _status) VALUES (23, 'Northridge', NULL, 'Electrician in Northridge, CA', NULL, NULL, NULL, 'Electrician Northridge CA: Expert Electrical Services - 911 Construction & Electric Inc.', NULL, 'Need an electrician in Northridge, CA? 911 Construction & Electric Inc. provides expert electrical installations and repairs.', NULL, false, 'electrician-northridge-ca', '2026-06-16 16:01:35.287+00', '2026-06-16 16:01:35.287+00', 'published');
INSERT INTO public.cities (id, city_name, region, title, hero_heading_override, intro_override, local_notes, meta_title, meta_image_id, meta_description, path_override, generate_slug, slug, updated_at, created_at, _status) VALUES (24, 'Oxnard', NULL, 'Electrician in Oxnard, CA', NULL, NULL, NULL, 'Electrician Oxnard CA: Expert Services Available - 911 Construction & Electric Inc.', NULL, 'For expert electrician services in Oxnard, CA, trust 911 Construction & Electric Inc. for installations and repairs.', NULL, false, 'electrician-oxnard-ca', '2026-06-16 16:01:35.309+00', '2026-06-16 16:01:35.309+00', 'published');
INSERT INTO public.cities (id, city_name, region, title, hero_heading_override, intro_override, local_notes, meta_title, meta_image_id, meta_description, path_override, generate_slug, slug, updated_at, created_at, _status) VALUES (25, 'Pasadena', NULL, 'Electrician in Pasadena, CA', NULL, NULL, NULL, 'Electrician | Pasadena, CA | 911 Construction & Electric Inc.', NULL, 'Electrical services in Pasadena, CA. Licensed electricians offering repairs, installations & 24/7 emergency service. Call now for a free quote!', NULL, false, 'electrician-pasadena-ca', '2026-06-16 16:01:35.327+00', '2026-06-16 16:01:35.327+00', 'published');
INSERT INTO public.cities (id, city_name, region, title, hero_heading_override, intro_override, local_notes, meta_title, meta_image_id, meta_description, path_override, generate_slug, slug, updated_at, created_at, _status) VALUES (26, 'Porter Ranch', NULL, 'Electrician in Porter Ranch, CA', NULL, NULL, NULL, 'Electrician Porter Ranch CA for Your Projects - 911 Construction & Electric Inc.', NULL, 'Find expert electrician services in Porter Ranch, CA. Reliable installations and repairs for residential and commercial needs.', NULL, false, 'electrician-porter-ranch-ca', '2026-06-16 16:01:35.346+00', '2026-06-16 16:01:35.346+00', 'published');
INSERT INTO public.cities (id, city_name, region, title, hero_heading_override, intro_override, local_notes, meta_title, meta_image_id, meta_description, path_override, generate_slug, slug, updated_at, created_at, _status) VALUES (27, 'Reseda', NULL, 'Electrician in Reseda, CA', NULL, NULL, NULL, 'Electrician Reseda CA: Your Local Expert Guide - 911 Construction & Electric Inc.', NULL, 'Find the best electrician Reseda CA for your electrical needs. Quality service and expertise at your fingertips.', NULL, false, 'electrician-reseda-ca', '2026-06-16 16:01:35.364+00', '2026-06-16 16:01:35.364+00', 'published');
INSERT INTO public.cities (id, city_name, region, title, hero_heading_override, intro_override, local_notes, meta_title, meta_image_id, meta_description, path_override, generate_slug, slug, updated_at, created_at, _status) VALUES (28, 'San Fernando', NULL, 'Electrician in San Fernando, CA', NULL, NULL, NULL, 'Electrician San Fernando CA for Expert Solutions - 911 Construction & Electric Inc.', NULL, 'Trust 911 Construction & Electric Inc. for top-notch electrician services in San Fernando, CA. Get your free quote today!', NULL, false, 'electrician-san-fernando-ca', '2026-06-16 16:01:35.382+00', '2026-06-16 16:01:35.382+00', 'published');
INSERT INTO public.cities (id, city_name, region, title, hero_heading_override, intro_override, local_notes, meta_title, meta_image_id, meta_description, path_override, generate_slug, slug, updated_at, created_at, _status) VALUES (29, 'San Fernando Valley', NULL, 'Electrician in San Fernando Valley, CA', NULL, NULL, NULL, 'Electrician San Fernando Valley CA: Expert Services - 911 Construction & Electric Inc.', NULL, 'Discover top electrician services in San Fernando Valley, CA. Expert installations and reliable repairs for your needs.', NULL, false, 'electrician-san-fernando-valley-ca', '2026-06-16 16:01:35.402+00', '2026-06-16 16:01:35.402+00', 'published');
INSERT INTO public.cities (id, city_name, region, title, hero_heading_override, intro_override, local_notes, meta_title, meta_image_id, meta_description, path_override, generate_slug, slug, updated_at, created_at, _status) VALUES (30, 'Santa Monica', NULL, 'Electrician in Santa Monica, CA', NULL, NULL, NULL, 'Electrician Santa Monica CA: Your Trusted Expert - 911 Construction & Electric Inc.', NULL, 'Get reliable electrical services with an experienced electrician in Santa Monica, CA. We ensure safe and code-compliant work.', NULL, false, 'electrician-santa-monica-ca', '2026-06-16 16:01:35.421+00', '2026-06-16 16:01:35.421+00', 'published');
INSERT INTO public.cities (id, city_name, region, title, hero_heading_override, intro_override, local_notes, meta_title, meta_image_id, meta_description, path_override, generate_slug, slug, updated_at, created_at, _status) VALUES (31, 'Sherman Oaks', NULL, 'Electrician in Sherman Oaks, CA', NULL, NULL, NULL, 'Electrician Sherman Oaks CA: Quality Services Offered - 911 Construction & Electric Inc.', NULL, 'Looking for a reliable electrician Sherman Oaks CA? Our experts provide top-notch electrical services for your needs.', NULL, false, 'electrician-sherman-oaks-ca', '2026-06-16 16:01:35.438+00', '2026-06-16 16:01:35.438+00', 'published');
INSERT INTO public.cities (id, city_name, region, title, hero_heading_override, intro_override, local_notes, meta_title, meta_image_id, meta_description, path_override, generate_slug, slug, updated_at, created_at, _status) VALUES (32, 'Studio City', NULL, 'Electrician in Studio City, CA', NULL, NULL, NULL, 'Electrician Studio City CA: Quality Services Offered - 911 Construction & Electric Inc.', NULL, 'Find the best electrician in Studio City, CA for your electrical needs and ensure your home is safe and efficient.', NULL, false, 'electrician-studio-city-ca', '2026-06-16 16:01:35.457+00', '2026-06-16 16:01:35.457+00', 'published');
INSERT INTO public.cities (id, city_name, region, title, hero_heading_override, intro_override, local_notes, meta_title, meta_image_id, meta_description, path_override, generate_slug, slug, updated_at, created_at, _status) VALUES (33, 'Sun Valley', NULL, 'Electrician in Sun Valley, CA', NULL, NULL, NULL, 'Electrician Sun Valley CA: Expert Electrical Services - 911 Construction & Electric Inc.', NULL, 'Looking for an electrician in Sun Valley, CA? Our expert team offers reliable electrical installations and repairs.', NULL, false, 'electrician-sun-valley-ca', '2026-06-16 16:01:35.477+00', '2026-06-16 16:01:35.477+00', 'published');
INSERT INTO public.cities (id, city_name, region, title, hero_heading_override, intro_override, local_notes, meta_title, meta_image_id, meta_description, path_override, generate_slug, slug, updated_at, created_at, _status) VALUES (34, 'Sunland', NULL, 'Electrician in Sunland, CA', NULL, NULL, NULL, 'Electrician Sunland CA: Reliable Electrical Services - 911 Construction & Electric Inc.', NULL, 'Find the best electrician in Sunland, CA for expert installations and reliable repairs for your home or business.', NULL, false, 'electrician-sunland-ca', '2026-06-16 16:01:35.497+00', '2026-06-16 16:01:35.497+00', 'published');
INSERT INTO public.cities (id, city_name, region, title, hero_heading_override, intro_override, local_notes, meta_title, meta_image_id, meta_description, path_override, generate_slug, slug, updated_at, created_at, _status) VALUES (35, 'Sylmar', NULL, 'Electrician in Sylmar, CA', NULL, NULL, NULL, 'Electrician Sylmar CA: Expert Services Explained - 911 Construction & Electric Inc.', NULL, 'Get reliable electrical services in Sylmar, CA. Trust our expert electrician Sylmar CA for installations and repairs.', NULL, false, 'electrician-sylmar-ca', '2026-06-16 16:01:35.517+00', '2026-06-16 16:01:35.516+00', 'published');
INSERT INTO public.cities (id, city_name, region, title, hero_heading_override, intro_override, local_notes, meta_title, meta_image_id, meta_description, path_override, generate_slug, slug, updated_at, created_at, _status) VALUES (36, 'Tarzana', NULL, 'Electrician in Tarzana, CA', NULL, NULL, NULL, 'Electrician Tarzana CA: Reliable Services Offered - 911 Construction & Electric Inc.', NULL, 'Find expert electrician services in Tarzana, CA. We provide reliable installations and repairs for your electrical needs.', NULL, false, 'electrician-tarzana-ca', '2026-06-16 16:01:35.535+00', '2026-06-16 16:01:35.535+00', 'published');
INSERT INTO public.cities (id, city_name, region, title, hero_heading_override, intro_override, local_notes, meta_title, meta_image_id, meta_description, path_override, generate_slug, slug, updated_at, created_at, _status) VALUES (37, 'Thousand Oaks', NULL, 'Electrician in Thousand Oaks, CA', NULL, NULL, NULL, 'Electrician Thousand Oaks CA: Expert Services - 911 Construction & Electric Inc.', NULL, 'Expert electrician services in Thousand Oaks, CA for all your electrical installation and repair needs. Get a free quote today!', NULL, false, 'electrician-thousand-oaks-ca', '2026-06-16 16:01:35.553+00', '2026-06-16 16:01:35.553+00', 'published');
INSERT INTO public.cities (id, city_name, region, title, hero_heading_override, intro_override, local_notes, meta_title, meta_image_id, meta_description, path_override, generate_slug, slug, updated_at, created_at, _status) VALUES (38, 'Toluca Lake', NULL, 'Electrician in Toluca Lake, CA', NULL, NULL, NULL, 'Electrician Toluca Lake CA for Expert Services - 911 Construction & Electric Inc.', NULL, 'Looking for an electrician in Toluca Lake CA? We provide expert electrical installations and reliable construction services.', NULL, false, 'electrician-toluca-lake-ca', '2026-06-16 16:01:35.574+00', '2026-06-16 16:01:35.574+00', 'published');
INSERT INTO public.cities (id, city_name, region, title, hero_heading_override, intro_override, local_notes, meta_title, meta_image_id, meta_description, path_override, generate_slug, slug, updated_at, created_at, _status) VALUES (39, 'Tujunga', NULL, 'Electrician in Tujunga, CA', NULL, NULL, NULL, 'Electrician Tujunga CA: Reliable Service You Can Trust - 911 Construction & Electric Inc.', NULL, 'For expert electrical installations and repairs, trust the best electrician Tujunga CA has to offer. Get your free quote today.', NULL, false, 'electrician-tujunga-ca', '2026-06-16 16:01:35.594+00', '2026-06-16 16:01:35.594+00', 'published');
INSERT INTO public.cities (id, city_name, region, title, hero_heading_override, intro_override, local_notes, meta_title, meta_image_id, meta_description, path_override, generate_slug, slug, updated_at, created_at, _status) VALUES (40, 'Van Nuys', NULL, 'Electrician in Van Nuys, CA', NULL, NULL, NULL, 'Electrician Van Nuys CA for All Your Needs - 911 Construction & Electric Inc.', NULL, 'Get expert electrical services in Van Nuys, CA. Our experienced team delivers reliable solutions for all your needs.', NULL, false, 'electrician-van-nuys-ca', '2026-06-16 16:01:35.616+00', '2026-06-16 16:01:35.616+00', 'published');
INSERT INTO public.cities (id, city_name, region, title, hero_heading_override, intro_override, local_notes, meta_title, meta_image_id, meta_description, path_override, generate_slug, slug, updated_at, created_at, _status) VALUES (41, 'West Hills', NULL, 'Electrician in West Hills, CA', NULL, NULL, NULL, 'Electrician West Hills CA: Expert Electrical Services - 911 Construction & Electric Inc.', NULL, 'For expert electrical services, choose our electrician in West Hills, CA for reliable installations and repairs.', NULL, false, 'electrician-west-hills-ca', '2026-06-16 16:01:35.635+00', '2026-06-16 16:01:35.635+00', 'published');
INSERT INTO public.cities (id, city_name, region, title, hero_heading_override, intro_override, local_notes, meta_title, meta_image_id, meta_description, path_override, generate_slug, slug, updated_at, created_at, _status) VALUES (42, 'Woodland Hills', NULL, 'Electrician in Woodland Hills, CA', NULL, NULL, NULL, 'Electrician Woodland Hills CA for Your Needs - 911 Construction & Electric Inc.', NULL, 'Expert electrician in Woodland Hills, CA, offering reliable electrical installations and repairs. Get your free quote today.', NULL, false, 'electrician-woodland-hills-ca', '2026-06-16 16:01:35.654+00', '2026-06-16 16:01:35.654+00', 'published');
INSERT INTO public.cities (id, city_name, region, title, hero_heading_override, intro_override, local_notes, meta_title, meta_image_id, meta_description, path_override, generate_slug, slug, updated_at, created_at, _status) VALUES (43, 'Los Angeles', NULL, 'Electrician in Los Angeles, CA', NULL, NULL, NULL, 'Electrician Los Angeles CA: Expert Solutions Available - 911 Construction & Electric Inc.', NULL, 'Looking for an electrician in Los Angeles, CA? We offer expert installations, repairs, and construction solutions.', '/services/los-angeles-ca/', false, 'electrician-los-angeles-hub', '2026-06-16 16:01:35.672+00', '2026-06-16 16:01:35.672+00', 'published');


--
-- Data for Name: cities_faqs_override; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cities_neighborhoods; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: testimonials; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cities_rels; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cities_zip_codes; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: city_page_template; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.city_page_template (id, hero_heading, hero_subheading, hero_image_id, intro, process_heading, services_heading, services_intro, about_heading, about_body, cta_heading, cta_body, updated_at, created_at) VALUES (1, 'Electrician in {{city}}, CA for Repairs, Panel Upgrades & EV Chargers', '911 Construction & Electric Inc. provides professional electrical services in {{city}}, CA for homeowners, businesses, and property managers. From electrical repairs and panel upgrades to EV charger installation and emergency calls, our team delivers safe, code-compliant work with dependable communication and fast response.', 4, NULL, 'From Consultation to Completion in 3 Easy Steps', 'Electrical & Construction Services Made Simple in {{city}}, CA', 'We’ve streamlined our process to get your project completed quickly, safely, and efficiently in {{city}}, without unnecessary delays or stress.', '', '{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}', 'Need an Electrician in {{city}}? Call Us 24/7', 'Fast response across {{city}} and surrounding communities — licensed, insured, and available around the clock.', '2026-06-16 16:01:33.611+00', '2026-06-16 16:01:33.611+00');


--
-- Data for Name: city_page_template_differentiators; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.city_page_template_differentiators (_order, _parent_id, id, title, text) VALUES (1, 1, '6a31735d9da013198bf6a41a', 'Licensed & Experienced Technicians', 'Skilled professionals trained in residential, commercial, and industrial electrical systems.');
INSERT INTO public.city_page_template_differentiators (_order, _parent_id, id, title, text) VALUES (2, 1, '6a31735d9da013198bf6a41b', 'Safety & Compliance', 'All work meets local codes and safety regulations for long-term reliability.');
INSERT INTO public.city_page_template_differentiators (_order, _parent_id, id, title, text) VALUES (3, 1, '6a31735d9da013198bf6a41c', 'Full-Service Solutions', 'From minor repairs to complete construction projects, we handle it all.');
INSERT INTO public.city_page_template_differentiators (_order, _parent_id, id, title, text) VALUES (4, 1, '6a31735d9da013198bf6a41d', 'Transparent Pricing', 'Honest estimates, clear communication, and no hidden costs.');


--
-- Data for Name: city_page_template_faqs; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.city_page_template_faqs (_order, _parent_id, id, question, answer) VALUES (1, 1, '6a31735d9da013198bf6a41e', 'What areas do you serve?', '{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "911 Construction & Electric proudly provides electrical services to residential and commercial clients throughout Los Angeles and surrounding communities, including:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Altadena, Arleta, Beverly Hills, {{city}}, Calabasas, Canoga Park, Chatsworth, Eagle Rock, Encino, {{city}}, Granada Hills, Hancock Park, Hollywood, La Cañada, La Crescenta, Los Angeles, Los Feliz, Melrose, Mission Hills, Montrose, North Hills, North Hollywood, Northridge, Oxnard, {{city}}, Porter Ranch, Reseda, San Fernando, San Fernando Valley, Santa Monica, Sherman Oaks, Studio City, Sunland, Tarzana, Tujunga, Sun Valley, Sylmar, Thousand Oaks, Toluca Lake, Van Nuys, West Hills, and Woodland Hills.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "If you’re located nearby but don’t see your area listed, feel free to contact us, we’re happy to help whenever possible.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}');
INSERT INTO public.city_page_template_faqs (_order, _parent_id, id, question, answer) VALUES (2, 1, '6a31735d9da013198bf6a41f', 'Are you licensed and insured?', '{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Yes, 911 Construction & Electric is fully licensed and insured. We follow all local electrical codes and safety regulations to ensure every project is completed safely, legally, and to the highest professional standards. Your property and safety are always our top priority.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}');
INSERT INTO public.city_page_template_faqs (_order, _parent_id, id, question, answer) VALUES (3, 1, '6a31735d9da013198bf6a420', 'How quickly can you respond to emergencies?', '{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We offer ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "24/7 emergency electrical services", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " and strive to respond as quickly as possible, often within the same day depending on your location and the urgency of the issue. Whether it’s a power outage, electrical hazard, or urgent repair, our team is ready to act fast and restore safety to your property.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}');
INSERT INTO public.city_page_template_faqs (_order, _parent_id, id, question, answer) VALUES (4, 1, '6a31735d9da013198bf6a421', 'Do you provide written estimates?', '{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Absolutely. We provide ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "clear, detailed written estimates", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " before any work begins. Our pricing is transparent, with no hidden fees, so you know exactly what to expect from start to finish.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}');
INSERT INTO public.city_page_template_faqs (_order, _parent_id, id, question, answer) VALUES (5, 1, '6a31735d9da013198bf6a422', 'Do you handle both residential and commercial projects?', '{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Yes, we specialize in both ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "residential and commercial electrical services", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ". From small home repairs and upgrades to large-scale commercial installations and construction projects, our team has the experience and equipment to handle jobs of all sizes.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}');


--
-- Data for Name: city_page_template_process_steps; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: homepage; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.homepage (id, hero_heading, hero_subheading, hero_image_id, process_heading, services_heading, services_intro, about_heading, about_body, about_image_id, reviews_heading, contact_heading, contact_body, meta_title, meta_image_id, meta_description, updated_at, created_at) VALUES (1, 'Licensed Electricians in Los Angeles, CA for Repairs, Panel Upgrades & EV Chargers', '911 Construction & Electric Inc. provides electrical services in Los Angeles, CA for homeowners, businesses, and property managers who need dependable work done safely and correctly. From emergency electrical repairs and panel upgrades to EV charger installation, lighting, and new construction electrical, our team delivers responsive service, code-compliant workmanship, and clear communication from start to finish.', 43, 'Electrical Services in Los Angeles, CA Made Simple', 'Professional Electrical Services in Los Angeles, CA', 'From minor electrical repairs to major system upgrades and construction support, 911 Construction & Electric delivers dependable electrical services throughout Los Angeles. We help residential and commercial clients with safe, code-compliant solutions built for long-term performance.', 'Trusted Los Angeles Electricians for Residential and Commercial Projects', '{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "911 Construction & Electric Inc. serves homeowners, property managers, builders, and businesses throughout Los Angeles with reliable electrical repairs, panel upgrades, EV charger installation, emergency service, lighting, and construction-related electrical work. We focus on safe workmanship, honest estimates, and dependable results that protect your property and keep your project moving.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}', 47, 'What Clients Say About 911 Construction & Electric', 'Get Your Free Quote Today', NULL, '911 Construction & Electric Inc. | Electrician Los Angeles CA', NULL, 'Need electrician in Los Angeles CA? 911 Construction & Electric offers 24/7 emergency service, repairs, panel upgrades & installations.', '2026-06-16 16:02:38.38+00', '2026-06-16 16:01:33.283+00');


--
-- Data for Name: homepage_differentiators; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.homepage_differentiators (_order, _parent_id, id, title, text) VALUES (1, 1, '6a31735d9da013198bf6a411', 'Licensed & Experienced Team', 'Skilled professionals serving residential and commercial properties across Los Angeles.');
INSERT INTO public.homepage_differentiators (_order, _parent_id, id, title, text) VALUES (2, 1, '6a31735d9da013198bf6a412', 'Code-Compliant Work', 'Every project is completed with safety, compliance, and long-term reliability in mind.');
INSERT INTO public.homepage_differentiators (_order, _parent_id, id, title, text) VALUES (3, 1, '6a31735d9da013198bf6a413', 'Full-Service Support', 'From repairs and upgrades to new construction electrical work, we handle projects of every size.');
INSERT INTO public.homepage_differentiators (_order, _parent_id, id, title, text) VALUES (4, 1, '6a31735d9da013198bf6a414', 'Clear Estimates', 'Honest pricing, straightforward communication, and no unnecessary surprises.');


--
-- Data for Name: homepage_faqs; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.homepage_faqs (_order, _parent_id, id, question, answer) VALUES (1, 1, '6a31735d9da013198bf6a415', 'What areas do you serve?', '{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "911 Construction & Electric proudly serves residential and commercial clients across Los Angeles and surrounding areas, including:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Altadena, Arleta, Beverly Hills, Burbank, Calabasas, Canoga Park, Chatsworth, Eagle Rock, Encino, Glendale, Granada Hills, Hancock Park, Hollywood, La Cañada, La Crescenta, Los Angeles, Los Feliz, Melrose, Mission Hills, Montrose, North Hills, North Hollywood, Northridge, Oxnard, Pasadena, Porter Ranch, Reseda, San Fernando, San Fernando Valley, Santa Monica, Sherman Oaks, Studio City, Sunland, Tarzana, Tujunga, Sun Valley, Sylmar, Thousand Oaks, Toluca Lake, Van Nuys, West Hills, and Woodland Hills.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "If you’re located nearby but don’t see your area listed, feel free to contact us, we’re happy to help whenever possible.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}');
INSERT INTO public.homepage_faqs (_order, _parent_id, id, question, answer) VALUES (2, 1, '6a31735d9da013198bf6a416', 'Are you licensed and insured?', '{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Yes, 911 Construction & Electric is fully licensed and insured. We follow all local electrical codes and safety regulations to ensure every project is completed safely, legally, and to the highest professional standards. Your property and safety are always our top priority.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}');
INSERT INTO public.homepage_faqs (_order, _parent_id, id, question, answer) VALUES (3, 1, '6a31735d9da013198bf6a417', 'How quickly can you respond to emergencies?', '{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We offer ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "24/7 emergency electrical services", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " and strive to respond as quickly as possible, often within the same day depending on your location and the urgency of the issue. Whether it’s a power outage, electrical hazard, or urgent repair, our team is ready to act fast and restore safety to your property.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}');
INSERT INTO public.homepage_faqs (_order, _parent_id, id, question, answer) VALUES (4, 1, '6a31735d9da013198bf6a418', 'Do you provide written estimates?', '{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Absolutely. We provide ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "clear, detailed written estimates", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " before any work begins. Our pricing is transparent, with no hidden fees, so you know exactly what to expect from start to finish.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}');
INSERT INTO public.homepage_faqs (_order, _parent_id, id, question, answer) VALUES (5, 1, '6a31735d9da013198bf6a419', 'Do you handle both residential and commercial projects?', '{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Yes, we specialize in both ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "residential and commercial electrical services", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ". From small home repairs and upgrades to large-scale commercial installations and construction projects, our team has the experience and equipment to handle jobs of all sizes.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}');


--
-- Data for Name: homepage_process_steps; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: pages_blocks_archive; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: pages_blocks_content; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: pages_blocks_content_columns; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: pages_blocks_cta; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: pages_blocks_cta_links; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: pages_blocks_media_block; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: pages_hero_links; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.posts (id, title, hero_image_id, content, meta_title, meta_image_id, meta_description, published_at, generate_slug, slug, updated_at, created_at, _status) VALUES (1, 'SCE Offering Up to $4,200 Rebate for Electrical Panel Upgrades and EV Charger Installation', 42, '{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "If you’re a Southern California Edison (SCE) customer in Los Angeles looking to install a Level 2 EV charger at home, there’s good news. SCE’s Charge Ready Home program can help cover the cost of upgrading your electrical panel — with rebates up to ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "$4,200", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "At 911 Construction & Electric, we’re proud to be a ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "certified SCE installer", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " for this program. We help homeowners take full advantage of these incentives while ensuring the work is done safely and up to code.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "What Is the SCE Charge Ready Home Program?", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "SCE’s Charge Ready Home program provides rebates to single-family homeowners who need to upgrade their electrical panel to support a Level 2 EV charger. Many older homes in Los Angeles still have 100-amp or 125-amp panels, which aren’t sufficient for modern EV charging.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Eligible customers can receive:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Up to $4,200", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " if you qualify as income-qualified (low-income household)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Up to $2,100", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " if you live in a disadvantaged community", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This rebate is designed to make switching to an electric vehicle more affordable by removing one of the biggest barriers: the cost of a panel upgrade.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Why Panel Upgrades Are Often Necessary", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Most homes built before 1990 weren’t designed with EV charging in mind. Installing a Level 2 charger typically requires a 200-amp panel. Without the upgrade, you risk:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Tripped breakers", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Overloaded circuits", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Potential safety hazards", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Upgrading your panel not only allows for EV charging, but also increases your home’s capacity for future appliances, air conditioning, or home additions. It can even improve your property value.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "911 Construction & Electric Is an SCE Certified Installer", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Working with a certified installer is important. Only approved contractors can complete the prequalification and documentation process required by SCE.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "As a licensed and insured electrical contractor in Los Angeles (License #1027421), 911 Construction & Electric has been approved to participate in the Charge Ready Home program. When you choose us, we handle:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The full application process with SCE", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "All required documentation and photos", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Coordination with SCE inspectors", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Professional panel upgrade and EV charger installation", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "You won’t have to navigate the paperwork alone.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "How the SCE Rebate Process Works", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Here’s what to expect when working with our team:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "ol", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Initial Consultation", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " – We assess your current panel and determine if you qualify for the rebate.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Application Submission", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " – We submit the prequalification using your SCE information.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Panel Upgrade & Charger Installation", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " – Our team completes the work safely and efficiently.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Rebate Processing", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " – Once SCE approves the project, the rebate is issued (either to you or applied toward the cost).", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "number", "direction": null}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Is Your Home Eligible?", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "You may qualify if:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "You are an SCE residential customer", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "You live in a single-family home", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Your current panel is under 200 amps", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "You meet income guidelines or live in a disadvantaged community", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Even if you don’t qualify for the full $4,200, many homeowners still save significantly by taking advantage of the program.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Ready to Get Started?", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Installing an EV charger is one of the best upgrades you can make for convenience and long-term savings. With SCE’s rebate and a certified installer like 911 Construction & Electric, the process is simpler and more affordable than ever.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Contact us today for a free consultation. We’ll check your eligibility for the Charge Ready Home program and give you a clear quote for your panel upgrade and EV charger installation.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Call or text:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " 747-255-8595", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "Service Areas:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " Los Angeles, Pasadena, Burbank, Glendale, and surrounding areas", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Let 911 Construction & Electric help you take advantage of SCE’s $4,200 rebate before the program changes.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}', 'Pre-Purchase Electrical Inspection Los Angeles Tips - 911 Construction & Electric Inc.', 42, 'Buying a home in Los Angeles? Schedule a pre-purchase electrical inspection to identify outdated wiring, overloaded panels, safety hazards, and costly electrical issues before closing.', '2026-06-03 06:11:35+00', false, 'sce-4200-rebate-panel-upgrade-ev-charger-installation-los-angeles', '2026-06-16 16:01:35.753+00', '2026-06-16 16:01:35.753+00', 'published');
INSERT INTO public.posts (id, title, hero_image_id, content, meta_title, meta_image_id, meta_description, published_at, generate_slug, slug, updated_at, created_at, _status) VALUES (2, 'Why a Pre-Purchase Electrical Inspection Is Essential When Buying a Home in Los Angeles', 39, '{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "When you’re buying a house in Los Angeles, pre-purchase electrical inspection Los Angeles is neccesary, it’s easy to focus on location, price, square footage, and how the kitchen looks. But one of the smartest moves you can make before closing is getting a professional pre-purchase electrical inspection. Electrical problems are some of the most expensive and dangerous issues a new homeowner can face, and many of them are completely hidden behind walls and ceilings. See what ladbs says or the code, ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"id": "6a31735f9da013198bf6a462", "type": "link", "fields": {"url": "https://www.ladbs.org/", "newTab": true, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "Los Angeles Department of Building and Safety (LADBS) & ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"id": "6a31735f9da013198bf6a463", "type": "link", "fields": {"url": "https://www.esfi.org/", "newTab": true, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "Electrical Safety Foundation International. ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "A proper electrical inspection gives you a clear picture of the home’s wiring, panel condition, and overall electrical safety before you commit. It protects both your investment and your family’s safety from day one. A licensed Los Angeles electrician will check the condition and capacity of your main electrical panel, the type and age of wiring, proper grounding throughout the home, and GFCI and AFCI protection in required areas.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "They will also inspect outlets, switches, light fixtures, ceiling fans, and look for evidence of previous DIY electrical work or code violations. Many homes across Los Angeles, especially in older neighborhoods like Silver Lake, Echo Park, Highland Park, Pasadena, and South LA, still have outdated or unsafe electrical systems. Common issues include undersized panels, knob-and-tube or aluminum wiring, missing grounding, and overloaded circuits from years of additions. Here some details info you can find.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"id": "6a31735f9da013198bf6a464", "type": "link", "fields": {"url": "/panel-upgrade-for-ev-charger-installation-los-angeles/", "newTab": true, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "Panel Upgrade for EV Charger Installation in Los Angeles", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"id": "6a31735f9da013198bf6a465", "type": "link", "fields": {"url": "/do-los-angeles-homes-need-gfci-outlet-upgrades/", "newTab": true, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "Do Los Angeles Homes Need GFCI Outlet Upgrades?", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"id": "6a31735f9da013198bf6a466", "type": "link", "fields": {"url": "/outdated-home-wiring-loose-connections-electrical-safety/", "newTab": true, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "Outdated Home Wiring & Loose Connections", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "direction": null}], "listType": "bullet", "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Buying a home with unknown electrical problems often leads to expensive and stressful surprises after you move in. Many buyers end up spending between $5,000 and $15,000 fixing electrical issues that a simple inspection would have caught before closing. A professional electrical inspection in Los Angeles typically costs between $150 and $350 depending on the size and age of the home.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "At 911 Construction & Electric, we provide detailed pre-purchase electrical inspection Los Angeles for homebuyers throughout Los Angeles. Our licensed electricians deliver a clear, honest, and comprehensive report so you know exactly what you’re buying before you sign on the dotted line. Contact us today to schedule your inspection.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}', 'Pre-Purchase Electrical Inspection Los Angeles Tips - 911 Construction & Electric Inc.', 39, 'Buying a home in Los Angeles? Schedule a pre-purchase electrical inspection los angeles to identify electrical issues before closing.', '2026-05-31 19:48:44+00', false, 'pre-purchase-electrical-inspection-los-angeles', '2026-06-16 16:01:35.797+00', '2026-06-16 16:01:35.796+00', 'published');
INSERT INTO public.posts (id, title, hero_image_id, content, meta_title, meta_image_id, meta_description, published_at, generate_slug, slug, updated_at, created_at, _status) VALUES (3, 'What Is EVITP Certification and Why It Matters for Your EV Charger Installation in Los Angeles', 40, '{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "EVITP Electrician in Los Angeles: Why Certification Matters", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "When you need a home EV charger installed in Los Angeles, hiring a regular electrician is not enough. You should choose an ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "EVITP electrician", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " — a professional who holds specialized Electric Vehicle Infrastructure Training Program certification.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "EVITP certification ensures your installer understands the unique requirements of EV charging systems. This training helps you avoid safety issues, pass inspections the first time, and qualify for valuable rebates.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "What Makes an EVITP Electrician Different?", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "EVITP is a rigorous national certification program designed specifically for electric vehicle supply equipment (EVSE). Certified electricians receive advanced training on:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Proper high-voltage wiring for EV chargers", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "National Electrical Code (NEC) Article 625 requirements", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Load calculations and panel capacity assessments", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Smart charger integration and safety protocols", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 5, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Grounding, bonding, and GFCI protection standards", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This specialized knowledge goes far beyond a standard electrical license.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Why You Should Hire an EVITP Electrician in Los Angeles", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Rebate Qualification", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " — LADWP, Pasadena Water & Power, and many California incentives require EVITP certification to approve rebates up to $1,500.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Safety First", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " — EV chargers involve high power. Proper installation prevents overheating, fire hazards, and electrical faults.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Faster Approvals", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " — Certified installers know local permitting rules, so your project moves quickly through inspections.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Future-Proof Results", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " — You get a reliable system that supports today’s and tomorrow’s electric vehicles.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 5, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Warranty Protection", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " — Many charger manufacturers require certified installers to keep your warranty valid.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Our EVITP Certified Electricians in Los Angeles", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "At ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "911 Construction & Electric", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " (California License #1027421), our electricians are fully EVITP certified. We provide expert EV charger installation services across Los Angeles, Burbank, Pasadena, Glendale, Hollywood, and surrounding cities.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We handle the complete process:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Free site evaluation and electrical load assessment", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Panel upgrades when needed", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Professional Level 2 charger installation (hardwired or plug-in)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Smart Wi-Fi enabled chargers with app control", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 5, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Full permitting and inspections", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 6, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Rebate paperwork assistance", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 7, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Same-day and next-day scheduling", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 8, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "24/7 emergency electrical support", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Ready for Professional EV Charger Installation?", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Don’t risk your safety or rebate eligibility with a non-certified installer. Hire experienced EVITP electricians who specialize in this work.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Contact us today", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " for a free quote on EV charger installation in Los Angeles.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Call Now:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " 747-255-8595", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}], "direction": null}}', 'EVITP Electrician Los Angeles | 911 Construction & Electric', 40, 'Hire an EVITP electrician in Los Angeles for safe, code-compliant EV charger installation. 911 Construction & Electric — CSLB #1027421.', '2026-05-31 09:21:04+00', false, 'evitp-electrician-los-angeles', '2026-06-16 16:01:35.844+00', '2026-06-16 16:01:35.844+00', 'published');
INSERT INTO public.posts (id, title, hero_image_id, content, meta_title, meta_image_id, meta_description, published_at, generate_slug, slug, updated_at, created_at, _status) VALUES (4, '7 Warning Signs Your Los Angeles Home Needs Rewiring', 29, '{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "“If you’re concerned about home rewiring in Los Angeles, you’re not alone. Many homes across Los Angeles — especially those built before the 1980s in areas like Burbank, Glendale, and Pasadena — are still running on outdated electrical wiring. While the lights may work just fine, aging wiring can create hidden hazards behind your walls that pose a serious fire and safety risk.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "At 911 Construction & Electric Inc. (CSLB #1027421), we’ve inspected hundreds of homes across Los Angeles County and consistently find the same warning signs that homeowners overlook. Here’s what to watch for — and when it’s time to call a professional.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Why Rewiring Matters in Los Angeles", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "California’s electrical code has been updated significantly over the decades. Homes built before 1980 may have aluminum wiring, knob-and-tube systems, or undersized panels that weren’t designed for today’s electrical demands — think multiple TVs, EV chargers, air conditioning units, and home offices running simultaneously.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "According to the U.S. Fire Administration, electrical fires account for an estimated 51,000 home fires each year. Outdated wiring is one of the top contributing factors — and many of these fires are entirely preventable.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "1. Flickering or Dimming Lights", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "If your lights dim or flicker when you turn on a large appliance — like your air conditioner, washer, or microwave — it’s a sign that your electrical circuits are struggling to handle the load. In Los Angeles, where summers push AC units hard, this is a very common complaint we hear from homeowners in Burbank and Pasadena.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "While a single flickering bulb might just be a loose fitting, lights dimming throughout the house point to a deeper wiring or panel issue that requires professional inspection.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "2. Breakers That Trip Frequently", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Circuit breakers are designed to trip as a safety mechanism — but if yours are tripping regularly, that’s not normal operation. It means the circuit is consistently overloaded, which can degrade wiring over time and create a fire hazard.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "If a breaker trips once after heavy use, reset it. If it keeps tripping or won’t reset at all, call a licensed electrician. Never replace a breaker with a higher-rated one yourself — this removes the safety protection entirely.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "3. Burning Smells or Scorch Marks Near Outlets", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This is the most urgent warning sign on this list. A burning smell — even faint — near an outlet, switch, or panel could mean wiring is overheating behind your walls. Scorch marks or discoloration around outlet faceplates confirm heat damage has already occurred.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "If you smell burning near any outlet or panel, stop using that circuit and call an electrician right away. This is not a situation to monitor — it is a potential fire hazard that needs immediate attention.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "4. Sparks When Plugging In Devices", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "A very brief, tiny spark when plugging in a device can be normal — it’s just electricity making contact. But large, frequent, or long-lasting sparks are abnormal and indicate a loose connection, short circuit, or moisture issue inside the outlet. Any sparking that concerns you should be inspected by a licensed electrician.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "5. Outlets or Switch Plates That Are Warm to the Touch", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Outlets and switches should always be at room temperature. If they feel warm — or if you hear buzzing or crackling sounds coming from the wall — wiring inside may be arcing or overheating. This is a code violation and a fire risk that should be addressed immediately.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "6. Your Home Was Built Before 1980", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Many Los Angeles neighborhoods — including parts of Glendale, Burbank, and the San Fernando Valley — have large stocks of homes built in the 1950s through 1970s. These homes may have:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Aluminum wiring", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " — expands and contracts differently than copper and can loosen over time, creating arcing hazards", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Knob-and-tube wiring", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " — lacks a ground wire and wasn’t designed for modern electrical loads", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "60-amp panels", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " — drastically undersized for today’s homes; most modern households need 200 amps minimum", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "No GFCI or AFCI protection", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " — now required in kitchens, bathrooms, garages, and outdoor areas under California code", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "If your home falls into this category, a professional electrical inspection is strongly recommended even if you haven’t noticed any obvious problems.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "7. Two-Prong (Ungrounded) Outlets Throughout the Home", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "If most or all of your outlets have only two slots (no round grounding hole), your wiring predates modern safety standards. Ungrounded outlets can damage sensitive electronics and pose a shock risk. Upgrading to grounded three-prong outlets requires proper grounding — not just swapping the faceplate.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "What Does Home Rewiring Cost in Los Angeles?", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The cost varies depending on the size of the home, the type of existing wiring, and the scope of work. A typical Los Angeles home rewire ranges from a targeted circuit upgrade to a full panel replacement and whole-home rewire.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Rewiring a home in Los Angeles doesn’t always mean tearing out every wall. Our team at 911 Construction & Electric uses low-impact techniques to run new wiring with minimal disruption — and we handle all permits and inspections required by Los Angeles County.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We always provide a detailed written quote before any work begins — no surprises.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Frequently Asked Questions", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "How do I know if my home has aluminum wiring?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "The easiest way is to have a licensed electrician inspect your panel and outlets. You may also see “AL” stamped on the wire jacket in your panel or attic. Aluminum wiring is silver-colored rather than copper-colored.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Do I need a permit to rewire my home in Los Angeles?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "Yes. Any significant electrical work in Los Angeles County requires a permit from the Department of Building and Safety (LADBS). At 911 Construction & Electric Inc., we handle all permitting and inspections as part of every project.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "How long does a home rewire take?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "A full rewire of an average-sized Los Angeles home typically takes 3 to 7 days depending on the size and complexity. We work efficiently to minimize disruption and keep your home livable throughout the process where possible.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Will my homeowner’s insurance cover rewiring?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "In most cases, no — insurance covers damage from electrical failures, not the rewiring itself. However, some insurers offer discounts after a certified rewire, and some may require updated wiring to maintain coverage on older homes. Check with your provider.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Can I stay in my home while it’s being rewired?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "In many cases, yes. We plan the work in phases to keep most of your home powered during the project. Our team will walk you through what to expect before work begins.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Concerned About Your Home’s Wiring? Contact Us Today", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "911 Construction & Electric Inc. serves Los Angeles, Burbank, Glendale, Pasadena, Altadena, and all surrounding areas. Our licensed electricians provide free written quotes with no obligation.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "License #1027421 | Available 24/7 | (747) 255-8595", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"id": "6a31735f9da013198bf6a467", "type": "link", "fields": {"url": "/contact/", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "Contact us today", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}', '7 Warning Signs Your Los Angeles Home Needs Rewiring - 911 Construction & Electric Inc.', 29, 'Concerned about home rewiring in Los Angeles? 911 Construction & Electric shares 7 warning signs of outdated wiring and when to call a licensed electrician.', '2026-05-31 08:49:42+00', false, '7-warning-signs-your-los-angeles-home-needs-rewiring', '2026-06-16 16:01:35.888+00', '2026-06-16 16:01:35.888+00', 'published');
INSERT INTO public.posts (id, title, hero_image_id, content, meta_title, meta_image_id, meta_description, published_at, generate_slug, slug, updated_at, created_at, _status) VALUES (5, 'How to Choose a Licensed Electrician: The Complete Guide for Homeowners and Businesses', 28, '{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Hiring the wrong electrician can cost you thousands — or worse, put your property at serious risk. Whether you need residential electrical work or a full commercial installation, choosing a licensed electrician in Los Angeles is the most important decision you’ll make for your project.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "At 911 Construction & Electric Inc. (CSLB #1027421), we believe every customer deserves to make an informed choice. Here’s exactly what to look for before you hire.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Always Verify Their Licence", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The very first thing you should ask any electrician is for their licence number. A legitimate licensed electrician will provide this without hesitation. In California, electrical licences are issued by the Contractors State License Board (CSLB) and can be verified online at their official website.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Unlicensed electrical work is illegal in California. It voids your home insurance, fails building inspections, and creates serious liability if something goes wrong. Always verify before work begins.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Check for Insurance and Public Liability Cover", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Licensing and insurance are two separate things. A licensed electrician should also carry public liability insurance and, if they employ others, workers’ compensation coverage. Without these, you could be held liable for any damage or injuries that occur on your property during the job.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Always ask for a copy of their Certificate of Currency — a one-page document from their insurer confirming active coverage. A reputable electrician will have it on hand.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Residential vs. Commercial: Know the Difference", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Not all electricians work across both sectors. Residential electrical work involves household wiring, safety switches, lighting, and appliance circuits. Commercial electrical work involves three-phase power, high-load switchboards, industrial equipment, and compliance with different safety standards.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "If you’re a business owner or property developer in Los Angeles, confirm that the electrician has specific commercial experience and can provide examples of similar projects. Don’t assume residential experience translates directly to commercial work.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Get Multiple Written Quotes", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Verbal estimates are worth little. Always request a written quote that breaks down labour, materials, and any call-out fees. Getting at least two or three quotes gives you a realistic price range and helps you spot any outliers — whether suspiciously cheap or unexpectedly expensive.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "If an electrician refuses to provide a written quote or pressures you to sign on the spot, walk away. Reputable tradespeople don’t operate that way.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Read Reviews and Ask for References", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Online reviews on Google offer a genuine window into how a business operates. Look for patterns across multiple reviews rather than focusing on a single rating. Consistently positive mentions of punctuality, cleanliness, and communication are strong signals of a trustworthy contractor.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "For larger commercial jobs, don’t hesitate to ask the electrician directly for references you can call. A company that has completed successful projects will be proud to share them.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Confirm They Provide a Certificate of Compliance", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "After any significant electrical work, a licensed electrician is required to issue a Certificate of Electrical Compliance. This document confirms the work meets the required safety standards and has been tested. You’ll need it for insurance purposes and when selling your property.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "If an electrician does not mention a certificate of compliance, ask for it directly before signing off on any job. It is your legal right to receive one in California.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Red Flags to Watch For", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Before hiring any electrician in Los Angeles, watch out for these warning signs:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "No licence number or reluctance to share it", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Quotes that are dramatically lower than competitors", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "No written contract or quote provided", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "No proof of insurance", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 5, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Pressure to pay entirely in cash with no receipt", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 6, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Unable to provide a certificate of compliance after the job", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Frequently Asked Questions", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Do I need a licensed electrician for small jobs?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "Yes. In California, any electrical work beyond changing a light bulb must be done by a licensed electrician. Even small work like adding a power point or replacing a switchboard component requires proper licensing and a certificate of compliance.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "How much does a licensed electrician cost in Los Angeles?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "Costs vary depending on the job, your location, and the complexity of the work. Most electricians charge an hourly rate plus materials, with a call-out fee for smaller jobs. At 911 Construction & Electric, we always provide a free written quote before any work begins.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "What’s the difference between a licensed electrician and an apprentice?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "A licensed electrician has completed their full trade qualification and is legally permitted to work independently. Apprentices can assist on-site but must be supervised by a licensed electrician at all times. All work must be signed off by the licensed professional.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Can I do my own electrical work in California?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "In almost all cases, no. DIY electrical work is illegal in California and can void your insurance, fail inspections, and create serious safety hazards. Always hire a licensed professional.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Need a Licensed Electrician in Los Angeles?", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "911 Construction & Electric Inc. serves Los Angeles, Burbank, Glendale, Pasadena, and all surrounding areas. Our licensed electricians handle residential and commercial electrical work — from safety inspections to full fit-outs. We handle all permits and inspections required by Los Angeles County.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "License #1027421 | Available 24/7 | (747) 255-8595", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"id": "6a31735f9da013198bf6a468", "type": "link", "fields": {"url": "/contact/", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "Contact us today", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}', 'How to Choose a Licensed Electrician: The Complete Guide for Homeowners and Businesses - 911 Construction & Electric Inc.', 28, 'Not sure how to hire a licensed electrician in Los Angeles? 911 Construction & Electric Inc. shares exactly what to check — license, insurance, red flags, and more.', '2026-05-31 08:40:15+00', false, 'how-to-choose-a-licensed-electrician-the-complete-guide-for-homeowners-and-businesses', '2026-06-16 16:01:35.929+00', '2026-06-16 16:01:35.929+00', 'published');
INSERT INTO public.posts (id, title, hero_image_id, content, meta_title, meta_image_id, meta_description, published_at, generate_slug, slug, updated_at, created_at, _status) VALUES (6, 'Outdated Home Wiring &#038; Loose Connections: Why Southern California Homeowners Should Check Now', 41, '{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Outdated Home Wiring & Loose Electrical Connections in Los Angeles: Warning Signs Homeowners Shouldn’t Ignore", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Older homes across Los Angeles, Pasadena, Glendale, Burbank, and the San Fernando Valley often have hidden electrical issues that homeowners never notice until a serious problem appears. Outdated wiring and loose electrical connections can increase the risk of electrical fires, damaged appliances, flickering lights, overloaded circuits, and power failures.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Many Southern California homes were built decades ago. Electrical systems in older properties may no longer meet today’s power demands. Modern homes use more appliances, electronics, EV chargers, air conditioning systems, and smart devices than older electrical systems were designed to handle.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "If your home shows signs of electrical problems, scheduling a professional electrical inspection can help identify safety hazards before they become expensive repairs.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Signs Your Home May Have Outdated Wiring", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Older electrical systems often show warning signs before major failures happen. Homeowners should pay attention to these common issues:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Flickering or dimming lights", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Frequently tripped breakers", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Warm outlets or switches", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Buzzing sounds from outlets or panels", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 5, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Burning smells near electrical components", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 6, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Two-prong outlets", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 7, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Discolored outlets or switch plates", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 8, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Power fluctuations when appliances turn on", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 9, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Extension cords used throughout the home", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "These symptoms may indicate loose electrical connections, overloaded circuits, deteriorating wiring, or outdated electrical panels.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Why Loose Electrical Connections Are Dangerous", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Loose electrical connections create heat. Over time, heat damages wires, outlets, switches, and breakers. In severe cases, loose wiring can start electrical fires inside walls where homeowners cannot see the danger.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Connections may loosen because of:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Aging electrical components", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Improper installations", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Vibration from daily electrical use", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Corrosion", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 5, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Poor maintenance", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 6, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Overloaded circuits", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Even small connection problems can become major safety hazards if they are ignored.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Common Electrical Problems in Older Southern California Homes", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Homes built several decades ago often contain outdated electrical materials or systems that no longer meet current safety standards.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Common issues include:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Aluminum Wiring", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Some older homes contain aluminum wiring, which expands and contracts more than copper wiring. This movement can loosen electrical connections and increase fire risks.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Outdated Electrical Panels", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Older electrical panels may struggle to handle modern energy usage. Homes with upgraded appliances or EV chargers often need panel upgrades to safely support higher electrical loads.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Ungrounded Outlets", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Many older homes still have two-prong outlets without proper grounding protection. Ungrounded outlets increase the risk of shocks and equipment damage.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Worn or Damaged Wiring", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Electrical wiring naturally deteriorates over time. Heat, rodents, moisture, and aging insulation can all damage wiring behind walls.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Electrical Fires Often Start Behind Walls", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "One of the biggest dangers of outdated wiring is that problems remain hidden until significant damage occurs. Loose connections and damaged wiring frequently develop inside walls, attics, crawl spaces, or electrical panels.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Homeowners may not notice issues until they experience:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Partial power loss", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Burning odors", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Smoke", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Sparking outlets", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 5, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Dead outlets", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 6, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Circuit breaker failures", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Professional electrical inspections help identify hidden problems early.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Why Older Homes Need Electrical Inspections", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "A licensed electrician can inspect your electrical system and identify safety concerns before they become emergencies.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "An electrical safety inspection may include:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Checking electrical panels", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Inspecting wiring conditions", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Testing outlets and breakers", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Identifying overloaded circuits", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 5, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Examining grounding systems", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 6, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Finding loose electrical connections", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 7, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Evaluating fire hazards", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Inspections are especially important before purchasing an older home, remodeling, installing new appliances, or adding an EV charger.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "When to Consider Rewiring Your Home", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Complete rewiring is not always necessary, but some homes benefit from partial or full electrical upgrades.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "You may need rewiring if your home has:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Frequent breaker trips", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Old cloth wiring", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Aluminum wiring", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Unsafe electrical panels", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 5, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Extensive extension cord use", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 6, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Burning smells or sparks", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 7, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Aging electrical infrastructure", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Upgrading your electrical system improves safety, reliability, and home value.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Protect Your Home With Professional Electrical Service", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Electrical issues should never be ignored. Small wiring problems can quickly become serious safety hazards.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Whether you need an electrical inspection, wiring repair, panel upgrade, or troubleshooting service, working with a licensed electrician helps protect your home and family.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "911 Electrics provides electrical inspections, wiring repairs, panel upgrades, EV charger installations, and electrical safety services throughout Los Angeles, Pasadena, Glendale, Burbank, and surrounding Southern California communities.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "FAQ About Outdated Home Wiring", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "How do I know if my home has outdated wiring?", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Common warning signs include flickering lights, warm outlets, frequent breaker trips, buzzing sounds, and older two-prong outlets.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": " ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "direction": null}}', 'Outdated Home Wiring Electrical Safety Risks Revealed', 41, 'Ensure your safety by understanding outdated home wiring electrical safety. Identify hidden issues before they escalate.', '2026-05-29 17:16:01+00', false, 'outdated-home-wiring-loose-connections-electrical-safety', '2026-06-16 16:01:35.972+00', '2026-06-16 16:01:35.972+00', 'published');
INSERT INTO public.posts (id, title, hero_image_id, content, meta_title, meta_image_id, meta_description, published_at, generate_slug, slug, updated_at, created_at, _status) VALUES (7, 'Why a Panel Upgrade Can Save Money in Pasadena and Nearby Los Angeles Areas', 35, '{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "If you’re planning to install an EV charger in Pasadena or nearby Los Angeles areas, you may have heard that a panel upgrade is often required. Many older homes still have 100-amp electrical panels that can’t safely handle the added load of a Level 2 charger. Upgrading your panel not only makes the installation possible, but it can also save you money in the long run through rebates, incentives, and avoided repairs. A proper panel upgrade is one of the smartest investments you can make when adding EV charging to your home.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Why Most Homes Need a Panel Upgrade for EV Chargers", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Most homes built before 2000 have 100-amp panels. These panels were never designed to support modern electrical demands like central air conditioning, electric water heaters, and now EV chargers. Adding a Level 2 charger without upgrading can lead to frequent breaker trips, overheating, and serious safety risks. A panel upgrade to 200 amps provides the capacity and safety needed for EV charging and future electrical needs. Without this upgrade, your electrical system may struggle to keep up with the increased demand and could create dangerous situations over time.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "How Panel Upgrades Help You Qualify for Rebates", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Many rebate and incentive programs in Pasadena and Los Angeles require a properly upgraded electrical panel. Without the upgrade, you may not qualify for thousands of dollars in available rebates. A panel upgrade can also make your home eligible for additional energy efficiency programs that further reduce your overall costs. These programs are designed to encourage EV adoption and reward homeowners who make their homes more energy efficient and environmentally friendly.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Long-Term Savings and Home Value", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Beyond rebates, a panel upgrade helps you avoid expensive emergency repairs and electrical issues down the road. It also increases your home’s value and appeal to future buyers who want an EV-ready property. Homes with upgraded electrical systems and EV charging capability often sell faster and for higher prices in the current market. Buyers are increasingly looking for homes that are already prepared for electric vehicles and modern electrical needs.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Additional Benefits of Upgrading Your Panel", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Improved safety and reduced risk of electrical fires", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Better support for future appliances and technology", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Higher energy efficiency and lower utility bills", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Easier qualification for solar and battery storage systems", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 5, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Increased peace of mind knowing your electrical system is up to code", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Let 911 Construction & Electric Help You Save Money", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "At 911 Construction & Electric, we help homeowners in Pasadena and surrounding Los Angeles areas upgrade their electrical panels for EV charger installations. Our licensed electricians will assess your current panel, explain your options, and help you take advantage of available rebates and incentives. We handle everything from permits to final inspection so you can enjoy the benefits of EV charging without the stress.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Contact us today to schedule a panel assessment and learn how much you can save on your EV charger installation in Pasadena and nearby areas. Our team is ready to help you make the right decision for your home and budget.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}', 'Panel Upgrade Pasadena | Rebates & Electrical Upgrades', 35, 'Need a panel upgrade in Pasadena? 911 Construction & Electric upgrades 100-amp panels to 200-amp, qualifies you for PWP rebates, and handles all permits.', '2026-05-27 06:00:54+00', false, 'panel-upgrade-rebates-pasadena-los-angeles', '2026-06-16 16:01:36.013+00', '2026-06-16 16:01:36.012+00', 'published');
INSERT INTO public.posts (id, title, hero_image_id, content, meta_title, meta_image_id, meta_description, published_at, generate_slug, slug, updated_at, created_at, _status) VALUES (8, 'Do You Need a Permit for EV Charger Installation in Los Angeles?', 31, '{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Do You Need a Permit for EV Charger Installation in Los Angeles?", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Most residential EV charger installations in Los Angeles require a permit from the Los Angeles Department of Building and Safety (LADBS). Skipping this step can result in fines, insurance problems, and unsafe work that puts your home and family at risk.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Many homeowners are surprised to learn that permits are not optional for this type of work. Getting the proper permits protects you and ensures the installation meets all safety codes.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "What the EV Charger Permit Process Involves", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The permit process for EV charger installation in Los Angeles typically includes several steps:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Submitting a permit application to LADBS", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Providing electrical plans and load calculations for review", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Scheduling and passing a final inspection after installation", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Ensuring the work meets California Electrical Code requirements", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 5, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Documenting the installation for insurance and future home sales", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Working with a licensed, EVITP-certified electrician ensures the entire process goes smoothly and meets all code requirements on the first try.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Why EV Charger Permits Matter in Los Angeles", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Getting the proper permit for your EV charger installation is important for several reasons:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Avoid fines and stop-work orders from the city", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Protect your homeowners insurance coverage", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Ensure the installation is safe and up to code", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Make future home sales easier with proper documentation", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 5, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Qualify for available rebates and incentives", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Skipping the permit process can create serious problems down the road, especially if you ever need to sell your home or file an insurance claim.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We Handle the Entire Permitting Process", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "911 Construction & Electric manages the complete permitting process for our customers. Our EVITP-certified electricians ensure every installation meets code, qualifies for available incentives, and passes inspection on the first try.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We handle all the paperwork so you can focus on getting your charger installed quickly and safely without the hassle.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Need an EV Charger Installed in Los Angeles?", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Contact us today for a permit-ready, code-compliant EV charger installation. We serve homeowners throughout Los Angeles with fast, professional service and full permitting support.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Ready to install your EV charger the right way?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " Reach out to us and we’ll handle everything from start to finish.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}], "direction": null}}', 'Do You Need a Permit for EV Charger Installation in Los Angeles? - 911 Construction & Electric Inc.', 31, 'Learn the EV charger permit requirements in Los Angeles, including LADBS permits, inspections, code compliance, rebates, and installation steps for Level 2 home chargers.', '2026-05-21 17:53:44+00', false, 'ev-charger-installation-permit-los-angeles', '2026-06-16 16:01:36.049+00', '2026-06-16 16:01:36.049+00', 'published');
INSERT INTO public.posts (id, title, hero_image_id, content, meta_title, meta_image_id, meta_description, published_at, generate_slug, slug, updated_at, created_at, _status) VALUES (9, 'Do You Need a Panel Upgrade for EV Charger Installation in Los Angeles?', 35, '{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Panel Upgrade for EV Charger Installation in Los Angeles: What You Need to Know", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Many homes in Los Angeles need a ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "panel upgrade for EV charger installation", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ". Older 100-amp electrical panels simply cannot handle the power demands of a modern Level 2 EV charger along with your other household appliances.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Without the right upgrade, you risk breaker trips, overheating, and potential safety hazards. A professional ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "electrical panel upgrade", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " ensures your home safely supports fast EV charging.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Why Most LA Homes Need a Panel Upgrade for EV Chargers", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Homes built before 2000 often have outdated panels. Adding a Level 2 EV charger (which pulls 30–50 amps) can overload the system. Here are the common warning signs:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Frequent breaker trips", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Flickering or dimming lights", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Warm or hot electrical panel", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Inability to add new circuits", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 5, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Old 100-amp panel (especially 30+ years old)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "If you see these signs, you will likely need a panel upgrade before installing your EV charger.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Benefits of a Panel Upgrade for EV Charger Installation", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Safe and reliable Level 2 charging (up to 7x faster than a regular outlet)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Support for future electrical needs like smart home devices and appliances", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Reduced fire risk and better overall electrical safety", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Higher home resale value in Los Angeles", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 5, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Full compliance with current California Electrical Code", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Our Professional EV Charger Panel Upgrade Service", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "At ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "911 Construction & Electric", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " (License #1027421), our ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "EVITP certified electricians", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " specialize in panel upgrades for EV charger installation throughout Los Angeles, including Burbank, Pasadena, Glendale, Hollywood, and surrounding areas. 911 Construction & Electric Inc. (EVITP certified electrician)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We handle:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Free electrical load assessment and panel evaluation", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Professional 100 to 200-amp panel upgrades", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "EV charger-ready wiring and installation", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Smart panel and sub-panel options", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 5, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Full permitting and city inspections", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 6, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Complete LADWP rebate and incentive assistance", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 7, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Same-day and next-day scheduling", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 8, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "24/7 emergency electrical support", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Frequently Asked Questions", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "How much does a panel upgrade for EV charger installation cost in Los Angeles?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " Costs typically range from $1,500 to $3,500 depending on your home’s needs. We provide a clear quote after a free assessment.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Do I need a permit for a panel upgrade?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " Yes. We handle all permitting and inspections to ensure full code compliance.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Can I still get LADWP rebates if I upgrade my panel?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " Yes. We help you maximize rebates when combining a panel upgrade with your EV charger installation.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Ready to safely install your EV charger?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " Contact us today for a ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "free assessment", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " on your panel upgrade for EV charger installation in Los Angeles.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Call Now:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " 911 Construction & Electric Inc. (EVITP certified electrician) 747-255-8595", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}], "direction": null}}', 'EVITP Certified Electrician for EV Charger Rebates in Los Angeles', 35, 'Planning a Level 2 EV charger installation in Los Angeles? Many homes need a 200-amp electrical panel upgrade first. Safe, code-compliant.', '2026-05-21 07:26:44+00', false, 'panel-upgrade-for-ev-charger-installation-los-angeles', '2026-06-16 16:01:36.091+00', '2026-06-16 16:01:36.091+00', 'published');
INSERT INTO public.posts (id, title, hero_image_id, content, meta_title, meta_image_id, meta_description, published_at, generate_slug, slug, updated_at, created_at, _status) VALUES (10, 'Why EVITP Certification Matters for EV Charger Incentives in Los Angeles', 32, '{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Electrical Panel Upgrade in Los Angeles: Signs Your Home May Need One", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Older electrical panels can create serious safety and performance issues for homeowners throughout Los Angeles and Southern California. As modern homes use more electricity for EV chargers, air conditioning systems, appliances, and smart technology, many older panels struggle to keep up with today’s power demands.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "911 Construction & Electric Inc. provides professional electrical panel upgrade services throughout Los Angeles, Pasadena, Glendale, Burbank, and the San Fernando Valley. Our licensed electricians help homeowners improve electrical safety, increase power capacity, and prepare homes for modern electrical needs.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "If your home experiences flickering lights, tripped breakers, or overloaded circuits, your electrical panel may no longer safely support your household’s electrical usage.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "What Does an Electrical Panel Do?", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Your electrical panel distributes electricity throughout your home. It controls power flow to outlets, lighting, appliances, and dedicated circuits.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The panel also protects your home by shutting off power during electrical overloads or short circuits.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "As homes add more electrical devices and appliances over time, older panels may become outdated or unsafe.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Signs You May Need an Electrical Panel Upgrade", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Many homeowners do not realize their panel is outdated until electrical problems become more noticeable.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Common signs include:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Frequent breaker trips", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Flickering or dimming lights", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Burning smells near the panel", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Buzzing sounds from breakers", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 5, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Warm electrical panel surfaces", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 6, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Limited available breaker space", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 7, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Older fuse box systems", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 8, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Appliances causing power fluctuations", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 9, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "EV charger installation requirements", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 10, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Home renovations or additions", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "These issues may indicate overloaded circuits or insufficient electrical capacity.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Why Older Homes Often Need Panel Upgrades", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Many homes in Los Angeles, Pasadena, Glendale, and nearby Southern California communities were built decades ago. Older electrical systems were not designed to support modern energy demands.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Today’s homes commonly use:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "EV chargers", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Central air conditioning", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "High-powered kitchen appliances", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Home office equipment", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 5, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Smart home systems", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 6, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Electric water heaters", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 7, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Large entertainment systems", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Without adequate electrical capacity, older panels may become overloaded and unsafe.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Is an Outdated Electrical Panel Dangerous?", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Yes. Outdated or damaged electrical panels can increase the risk of:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Electrical fires", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Overheating", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Damaged appliances", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Power failures", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 5, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Electrical shocks", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 6, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Melted wiring", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 7, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Circuit overloads", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Some older electrical panel brands are also known for safety concerns and reliability issues.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Professional inspections help homeowners identify potential hazards before major problems occur.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Benefits of Upgrading Your Electrical Panel", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "An electrical panel upgrade improves both safety and performance.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Benefits may include:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Improved Electrical Safety", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Modern panels provide better protection against overloads and electrical faults.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Increased Power Capacity", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Panel upgrades allow homes to safely support modern appliances and EV chargers.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Better Reliability", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Upgraded panels reduce breaker trips, power fluctuations, and electrical interruptions.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Support for EV Charger Installation", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Many Level 2 EV chargers require additional electrical capacity or dedicated circuits.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Easier Home Renovations", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Panel upgrades help support room additions, remodels, and future electrical improvements.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Electrical Panel Upgrades for EV Chargers", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "As electric vehicle ownership increases across Southern California, many homeowners need panel upgrades before installing Level 2 EV chargers.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "EV chargers place significant demand on residential electrical systems. A licensed electrician can determine whether your current panel can safely support EV charging equipment.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "911 Construction & Electric Inc. provides:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "EV charger installation", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Dedicated EV circuits", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Panel capacity evaluations", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Electrical inspections", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 5, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Panel replacements", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 6, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Permit assistance", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Common Types of Electrical Panels", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Different homes use different electrical systems depending on age and previous upgrades.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Common panel types include:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Main breaker panels", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Subpanels", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Fuse boxes", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Split-bus panels", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 5, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Older legacy electrical panels", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Some outdated systems may require complete replacement to meet current electrical codes.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Do Electrical Panel Upgrades Require Permits?", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Most electrical panel upgrades in Los Angeles require permits and inspections.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Permits help ensure:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Code compliance", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Safe installation practices", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Proper grounding", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Correct breaker sizing", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 5, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Utility coordination", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Working with a licensed electrician helps homeowners avoid failed inspections and safety risks.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Why Homeowners Choose 911 Construction & Electric Inc.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Homeowners throughout Los Angeles trust 911 Construction & Electric Inc. for professional electrical services and reliable workmanship.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We focus on:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Safe installations", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Code-compliant electrical work", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Clean job sites", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Honest recommendations", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 5, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Fast scheduling", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 6, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Long-term electrical safety", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Our electricians provide electrical panel upgrades, wiring repairs, EV charger installations, electrical troubleshooting, and safety inspections throughout Southern California.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Areas We Serve", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "911 Construction & Electric Inc. proudly serves homeowners throughout:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Los Angeles", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Pasadena", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Glendale", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Burbank", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 5, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "San Fernando Valley", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 6, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Nearby Southern California communities", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Schedule an Electrical Panel Inspection", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "If your home shows signs of electrical problems or you are planning an EV charger installation, a professional electrical inspection can help determine whether your panel needs upgrading.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "911 Construction & Electric Inc. provides electrical panel upgrades, EV charger installation, and residential electrical services throughout Los Angeles and surrounding areas.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Contact our team today to schedule an electrical panel inspection or consultation.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "FAQ About Electrical Panel Upgrades", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "How do I know if my electrical panel is outdated?", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Frequent breaker trips, flickering lights, buzzing sounds, and limited breaker space may indicate an outdated panel.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Can an old electrical panel cause fires?", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Yes. Overloaded or damaged electrical panels can create fire hazards if problems are not corrected.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Do I need a panel upgrade for an EV charger?", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Some homes require panel upgrades before installing Level 2 EV chargers depending on available electrical capacity.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "How long does an electrical panel upgrade take?", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Many residential panel upgrades can be completed within one day, depending on the project scope.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Do electrical panel upgrades increase home value?", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Electrical upgrades may improve home safety, reliability, and buyer appeal, especially for older homes.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}', 'EVITP Certified Electrician for EV Charger Rebates in Los Angeles', 32, 'Find an EVITP certified electrician Los Angeles for quality installation of electric vehicle chargers and maximize rebates.', '2026-05-21 07:24:09+00', false, 'why-evitp-certification-matters-for-ev-charger-incentives-los-angeles', '2026-06-16 16:01:36.143+00', '2026-06-16 16:01:36.143+00', 'published');
INSERT INTO public.posts (id, title, hero_image_id, content, meta_title, meta_image_id, meta_description, published_at, generate_slug, slug, updated_at, created_at, _status) VALUES (11, 'Top 5 Benefits of Upgrading Your Electrical Panel for EV Charging', 37, '{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Upgrading your electrical panel is one of the most important steps you can take when installing an EV charger at home. Many older homes in Los Angeles still have 100-amp panels that were never designed to handle the extra load of a Level 2 charger. Without an upgrade, you risk frequent breaker trips, overheating, and even serious safety hazards. A modern panel gives you the capacity and protection you need to charge safely and efficiently.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Beyond safety, a panel upgrade also improves how your home uses electricity. Your EV charger will run at full speed without competing with other appliances, which means faster charging and less strain on your entire electrical system. This upgrade also prepares your home for future technology like home batteries, solar panels, and additional electric vehicles down the road.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Another major benefit is access to rebates and incentives. Many programs in Los Angeles require a properly upgraded panel before you can qualify for thousands of dollars in savings. Skipping the upgrade could mean missing out on money that would have made the installation much more affordable.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Finally, an upgraded panel increases your home’s value and appeal. Buyers are actively looking for homes that are EV-ready. When it comes time to sell, having a modern electrical system with EV charging capability can make your property stand out and sell faster. If you’re planning to install an EV charger, a panel upgrade is one of the smartest investments you can make for both safety and long-term value.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}', 'Top 5 Benefits of Upgrading Your Electrical Panel for EV Charging', 37, 'The benefits of upgrading electrical panel EV charging for safer and more efficient home charging solutions. EV Installation Los Angeles', '2026-05-21 07:07:13+00', false, 'top-5-benefits-panel-upgrade-ev-charger-los-angeles', '2026-06-16 16:01:36.179+00', '2026-06-16 16:01:36.179+00', 'published');
INSERT INTO public.posts (id, title, hero_image_id, content, meta_title, meta_image_id, meta_description, published_at, generate_slug, slug, updated_at, created_at, _status) VALUES (12, 'The Complete Guide to Electric Vehicle Charger Installation in Los Angeles', 38, '{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "EV charger installation in Los Angeles has become one of the most requested electrical upgrades for homeowners across Southern California. As more drivers switch to Tesla, Rivian, Ford, BMW, Mercedes-Benz, and other electric vehicles, reliable home charging systems are becoming essential.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "911 Construction & Electric Inc. provides professional EV charger installation services throughout Los Angeles, Pasadena, Glendale, Burbank, and the San Fernando Valley. Our licensed electricians help homeowners safely install Level 2 EV chargers, upgrade electrical panels, and prepare homes for long-term EV charging needs.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Whether you recently purchased an electric vehicle or want faster charging at home, understanding the EV charger installation process can help you avoid electrical issues and costly mistakes.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Why EV Charger Installation in Los Angeles Is Growing", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Electric vehicle ownership continues to increase throughout Los Angeles and Southern California. Many homeowners prefer charging at home instead of relying on public charging stations.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Home EV charging offers several advantages:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Faster charging times", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Greater convenience", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Lower charging costs", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Overnight charging", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 5, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Increased property value", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 6, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Better long-term reliability", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Most homeowners choose Level 2 charging systems because they charge vehicles significantly faster than standard wall outlets.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "What Is a Level 2 EV Charger?", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "A Level 2 EV charger uses a dedicated 240-volt electrical circuit to provide faster charging speeds for electric vehicles.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Compared to standard Level 1 charging, Level 2 chargers can dramatically reduce charging time.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Level 2 EV charger installation in Los Angeles often requires:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Dedicated 240V circuits", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Electrical panel evaluations", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Permit approval", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Proper breaker sizing", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 5, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Professional wiring installation", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "A licensed electrician can determine whether your home’s electrical system can safely support EV charging equipment.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "EV Charger Installation Los Angeles Requirements", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Every home has different electrical requirements. Some installations are simple, while others may require electrical upgrades.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Common EV charger installation requirements include:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Dedicated EV Charging Circuit", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Most Level 2 chargers require a dedicated circuit to safely support charging loads.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Electrical Panel Capacity", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Older homes may need electrical panel upgrades before installing EV chargers.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Permits and Inspections", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Many Los Angeles EV charger installations require permits and inspections to meet electrical code requirements.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Proper Charger Placement", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Choosing the right charger location improves convenience while minimizing installation costs.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Older Los Angeles Homes May Need Electrical Upgrades", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Many homes across Los Angeles, Glendale, Pasadena, and Burbank were built before EV charging became common. Older electrical systems may not safely support modern charging demands.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "During EV charger installation, electricians often identify:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Outdated electrical panels", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Insufficient breaker capacity", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Loose electrical connections", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Aging wiring", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 5, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Improper grounding", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 6, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Overloaded circuits", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Electrical inspections help identify hidden issues before installation begins.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Electrical Panel Upgrades for EV Chargers", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Some homes require panel upgrades before EV charger installation.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "An electrical panel upgrade may be necessary if:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The panel lacks available breaker space", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Existing service capacity is too small", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Older panels cannot safely support additional loads", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The home uses outdated electrical equipment", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Panel upgrades help improve safety while supporting future electrical needs.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Benefits of Professional EV Charger Installation", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Professional EV charger installation in Los Angeles helps homeowners avoid safety issues and failed inspections.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Licensed electricians help ensure:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Proper wire sizing", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Safe breaker installation", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Correct grounding", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Code compliance", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 5, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Reliable charging performance", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 6, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Permit approval", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Improper EV charger installation can create electrical hazards or damage expensive charging equipment.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "EV Charger Rebates and Incentives", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Some homeowners may qualify for EV charger rebates or tax incentives depending on utility programs and current regulations.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The Los Angeles Department of Water and Power (LADWP) provides information regarding EV charger rebates and incentive programs for qualifying customers. (", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"id": "6a3173609da013198bf6a469", "type": "link", "fields": {"url": "https://www.ladwp.com/residential-services/programs-and-rebates-residential/electric-vehicles?utm_source=chatgpt.com", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "ladwp.com", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"mode": "normal", "text": ")", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Homeowners should verify current eligibility requirements before installation.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "EV Charger Installation for Tesla and Other EV Brands", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "911 Construction & Electric Inc. installs charging equipment for many electric vehicle brands, including:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Tesla", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Rivian", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Ford", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Chevrolet", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 5, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "BMW", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 6, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Mercedes-Benz", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 7, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Hyundai", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 8, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Kia", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 9, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Lucid", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Different vehicles and chargers may require different electrical configurations depending on charging speed and equipment specifications.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Why Homeowners Choose 911 Construction & Electric Inc.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Homeowners throughout Los Angeles trust 911 Construction & Electric Inc. for professional electrical services and safe EV charger installations.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We focus on:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Code-compliant electrical work", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Safe installations", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Clean workmanship", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Honest recommendations", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 5, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Fast scheduling", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 6, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Long-term electrical safety", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Our electricians provide EV charger installation, electrical panel upgrades, surge protection, wiring repairs, and residential electrical services throughout Southern California.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Areas We Serve", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "911 Construction & Electric Inc. proudly serves homeowners throughout:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Los Angeles", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Pasadena", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Glendale", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Burbank", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 5, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "San Fernando Valley", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 6, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Nearby Southern California communities", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Schedule EV Charger Installation in Los Angeles", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "If you are planning to install a home EV charger, working with an experienced electrician helps ensure a safe and reliable installation process.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "911 Construction & Electric Inc. provides EV charger installation, panel upgrades, electrical inspections, and residential electrical services throughout Los Angeles and surrounding Southern California areas.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Contact our team today to schedule an EV charger installation consultation.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "FAQ About EV Charger Installation Los Angeles", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "How much does EV charger installation cost in Los Angeles?", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Installation costs vary depending on panel capacity, wiring distance, permit requirements, and charger type.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Do I need a permit for EV charger installation in Los Angeles?", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Many EV charger installations require permits and inspections for code compliance.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Can older homes support EV chargers?", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Many older homes can support EV chargers, but some require panel upgrades or electrical improvements.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "How long does EV charger installation take?", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Some installations can be completed in a few hours, while more complex projects may require additional electrical upgrades.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Should I install a Level 2 EV charger?", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Most homeowners prefer Level 2 chargers because they provide significantly faster charging compared to standard outlets.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}', 'EV Charger Installation LA | 911 Construction & Electric', 38, '911 Construction & Electric Inc. provides EV charger installation in Los Angeles, Pasadena, Glendale, and surrounding Southern California communities.', '2026-05-21 06:54:41+00', false, 'complete-guide-ev-charger-installation-los-angeles', '2026-06-16 16:01:36.238+00', '2026-06-16 16:01:36.238+00', 'published');
INSERT INTO public.posts (id, title, hero_image_id, content, meta_title, meta_image_id, meta_description, published_at, generate_slug, slug, updated_at, created_at, _status) VALUES (13, 'Do Los Angeles Homes Need GFCI Outlet Upgrades?', 33, '{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Why Los Angeles Homes Need GFCI Outlet Upgrades", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Living in Los Angeles means dealing with older homes in many neighborhoods — from Burbank to Hollywood, Glendale, Pasadena, and beyond. If your house was built before the 1990s, chances are your electrical outlets in wet areas still use standard receptacles instead of modern ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "GFCI (Ground Fault Circuit Interrupter)", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " protection.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "GFCI outlets", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " are life-saving devices that instantly cut power if they detect a ground fault — such as when electricity comes in contact with water — preventing severe shocks and reducing the risk of electrical fires.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Where Are GFCI Outlets Required in California?", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "According to the California Electrical Code, GFCI protection is mandatory in:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Bathrooms (all outlets, especially near sinks)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Kitchens (countertops and within 6 feet of sinks)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Garages and basements", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Laundry rooms and utility areas", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 5, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Outdoor outlets (patios, gardens, pool areas)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 6, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Wet bars or any location near water", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Many older LA homes are not up to current standards. Upgrading isn’t just smart — it’s often required during home sales, insurance reviews, or renovations.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Benefits of Upgrading to GFCI Outlets", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Enhanced Family Safety — Critical protection for children, elderly family members, and daily use", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Code Compliance — Avoid failed inspections and potential fines", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Fire Prevention — Significantly lowers electrical fire risks", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Increased Home Value — Makes your property more attractive to buyers", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 5, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Peace of Mind — Especially important in earthquake-prone Southern California", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "GFCI upgrades are one of the most affordable and impactful electrical improvements you can make.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Professional GFCI Outlet Installation in Los Angeles", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "At ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "911 Construction & Electric", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ", our licensed electricians (License #1027421) specialize in safe, code-compliant GFCI upgrades across the Los Angeles area. We:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Perform a thorough inspection of your existing outlets", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Install high-quality tamper-resistant GFCI receptacles", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Properly wire and protect downstream outlets", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Offer same-day or next-day service on most jobs", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 5, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Provide 24/7 emergency electrical support", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Whether you need just a few outlets upgraded or a full-home safety audit, we’ve got you covered.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Ready to upgrade your outlets?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " Contact us today for a ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "free quote", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " on GFCI outlet installation in Los Angeles.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Call Now:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " 747-255-8595", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}], "direction": null}}', 'Do Los Angeles Homes Need GFCI Outlet Upgrades? - 911 Construction & Electric Inc.', 33, 'Upgrade your home with GFCI outlet installation in Los Angeles. Protect your property from electrical shock, code-compliant electricians. Los Angeles GFCI outlet upgrades', '2026-05-21 06:41:46+00', false, 'do-los-angeles-homes-need-gfci-outlet-upgrades', '2026-06-16 16:01:36.283+00', '2026-06-16 16:01:36.283+00', 'published');
INSERT INTO public.posts (id, title, hero_image_id, content, meta_title, meta_image_id, meta_description, published_at, generate_slug, slug, updated_at, created_at, _status) VALUES (14, 'Pasadena EV Charger Rebate: What Homeowners Should Know', 36, '{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Pasadena EV Charger Rebate: What Homeowners Should Know in 2026", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Pasadena homeowners can significantly reduce the cost of going electric with generous rebates from ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "Pasadena Water and Power (PWP)", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ". Installing a home EV charger not only makes charging your electric vehicle convenient and affordable — it also qualifies you for valuable local incentives.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Current Pasadena EV Charger Rebates (2026)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "$600 Rebate", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " — For a qualifying Wi-Fi enabled or Internet-connected Level 2 EV charger", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "$200 Rebate", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " — For a standard (non-Wi-Fi) Level 2 charger", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "These rebates are available to PWP residential electric customers. Additional incentives may be available for income-qualified households. Note: The federal residential EV charger tax credit (30% up to $1,000) is scheduled to end for projects after June 30, 2026 — so now is a great time to act.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Why Install a Level 2 EV Charger in Pasadena?", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Charge your EV up to 7x faster than a standard outlet", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Convenient overnight charging at home", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Lower long-term fuel and maintenance costs", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Increase your home’s resale value", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 5, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Support cleaner air in the Pasadena area", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Most modern EVs (Tesla, Ford, GM, Hyundai, etc.) work great with Level 2 chargers.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Benefits of Working with 911 Construction & Electric", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "At ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "911 Construction & Electric", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " (License #1027421), we specialize in professional EV charger installations throughout Pasadena and surrounding areas. Our licensed electricians provide:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Free site evaluation and load assessment", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Panel upgrade recommendations if needed", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "High-quality Level 2 charger installation (hardwired or plug-in)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Full permit acquisition and code compliance", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 5, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Complete rebate paperwork assistance", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 6, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Same-day and next-day scheduling options", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 7, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "24/7 emergency electrical support", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We handle everything from start to finish so you can focus on enjoying your new EV charger and claiming your rebate.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Ready to save money and go electric?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " Contact us today for a ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "free quote", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " on EV charger installation and rebate assistance in Pasadena.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Call Now:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " 747-255-8595", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}], "direction": null}}', 'Pasadena EV Charger Rebate: What Homeowners Should Know - 911 Construction & Electric Inc.', 36, 'Pasadena EV Charger Rebate 2026: Up to $600 from PWP | Free Installation Quote, Pasadena EV charger rebate', '2026-05-21 05:33:37+00', false, 'pasadena-ev-charger-rebate-homeowners', '2026-06-16 16:01:36.324+00', '2026-06-16 16:01:36.324+00', 'published');
INSERT INTO public.posts (id, title, hero_image_id, content, meta_title, meta_image_id, meta_description, published_at, generate_slug, slug, updated_at, created_at, _status) VALUES (15, 'Why Los Angeles Homeowners Are Installing EV Chargers at Home', 34, '{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Why Install a Home EV Charger in Los Angeles?", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "With more Angelenos switching to electric vehicles every day, having a reliable home charging station is no longer a luxury — it’s a necessity. A ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "Level 2 EV charger", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " lets you charge your vehicle up to 7 times faster than a standard outlet, typically adding 25-60 miles of range per hour.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "At ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "911 Construction & Electric", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ", we provide professional, code-compliant home EV charger installations across Los Angeles, including Burbank, Hollywood, Glendale, Pasadena, and surrounding areas.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "LADWP EV Charger Rebates & Incentives (2026)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Los Angeles Department of Water and Power (LADWP) customers can save significantly:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Up to $1,000", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " rebate on qualifying Level 2 EV chargers", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Up to $1,500", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " total for customers in Lifeline or EZ-SAVE programs", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "$250", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " additional rebate for installing a dedicated EV meter", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Federal Tax Credit", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " (30C) up to $1,000 for chargers installed by June 30, 2026", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We help you maximize these savings by handling the entire process — from charger selection to rebate paperwork.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Benefits of a Professional Level 2 EV Charger Installation", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Faster charging (full charge in 4-8 hours vs. 24+ on a regular outlet)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Increased home value and buyer appeal", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Lower long-term energy costs with Time-of-Use rates", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Safe, reliable, and future-proof installation", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 5, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Support for all major EV brands (Tesla, Ford, GM, Hyundai, Rivian, etc.)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Our Home EV Charger Installation Services in Los Angeles", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Our licensed electricians (License #1027421) handle every step:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Free home evaluation and electrical load assessment", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Panel upgrade recommendations (if needed)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Hardwired or plug-in Level 2 charger installation", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Smart Wi-Fi enabled chargers for app control and scheduling", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 5, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Full city permitting and inspections", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 6, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Complete rebate and tax credit assistance", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 7, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Same-day and next-day scheduling available", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 8, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "24/7 emergency electrical support", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Whether you have a single-family home, townhouse, or condo, we deliver safe and efficient installations tailored to your needs.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Ready to charge smarter at home?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " Contact us today for a ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "free quote", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " on professional EV charger installation in Los Angeles.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Call Now:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " 747-255-8595", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}], "direction": null}}', 'Why Los Angeles Homeowners Are Installing EV Chargers at Home - 911 Construction & Electric Inc.', 34, 'Professional home EV charger installation in Los Angeles. Licensed electricians for safe Level 2 EV chargers, panel upgrades & full permit handling.', '2026-05-19 22:51:58+00', false, 'los-angeles-home-ev-charger-installation', '2026-06-16 16:01:36.362+00', '2026-06-16 16:01:36.362+00', 'published');
INSERT INTO public.posts (id, title, hero_image_id, content, meta_title, meta_image_id, meta_description, published_at, generate_slug, slug, updated_at, created_at, _status) VALUES (16, 'Why Hiring an EVITP Certified Installer Matters in Los Angeles', 40, '{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Why EVITP Certification Matters for EV Charger Installation in Los Angeles", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "When installing a home or business EV charger in Los Angeles, not all electricians are equal. ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "EVITP certification", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " (Electric Vehicle Infrastructure Training Program) is the gold standard for professionals who install Electric Vehicle Supply Equipment (EVSE).", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "EVITP is a specialized training and certification program that goes far beyond standard electrical licensing. It equips electricians with in-depth knowledge of EV charger installation best practices, safety protocols, National Electrical Code (NEC) requirements specific to EVs, and proper load management.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Key Reasons to Choose an EVITP Certified Installer", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Rebate & Incentive Eligibility", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " Many Los Angeles programs (LADWP, Pasadena Water & Power, and California statewide incentives) require EVITP certification to qualify for rebates up to $1,500 or more. Non-certified installations may be denied.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Safety & Code Compliance", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " EV chargers involve high-voltage circuits, proper grounding, GFCI protection, and sophisticated communication with vehicles. EVITP-certified electricians are trained to prevent hazards like overheating, fire risks, or electrical faults.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Faster Approvals & Inspections", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " Certified installers understand local permitting requirements, helping your project pass inspection the first time and avoid delays.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Future-Proof Installation", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " Proper training ensures your charger supports today’s and tomorrow’s EVs, including smart features, Wi-Fi connectivity, and higher power levels.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 5, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Protection for Your Home & Investment", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " Avoid costly mistakes that could damage your electrical panel, void warranties, or create safety issues down the road.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "What EVITP Certification Involves", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "EVITP is a rigorous 20+ hour program plus exam for licensed electricians. Topics include:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "EV charging fundamentals", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "NEC Article 625 requirements", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Site assessment and load calculations", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Safety and grounding standards", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 5, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Troubleshooting and maintenance", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "At ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "911 Construction & Electric", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " (License #1027421), our electricians are EVITP certified, ensuring every installation meets the highest industry standards.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Professional EV Charger Installation You Can Trust", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We provide full-service EV charger solutions across Los Angeles, Burbank, Pasadena, Glendale, Hollywood, and surrounding areas:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Free site evaluation and electrical assessment", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Panel upgrades when needed", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Smart Level 2 charger installation (hardwired or plug-in)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Permit handling and rebate paperwork assistance", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 5, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Same-day and next-day availability", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 6, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "24/7 emergency electrical support", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Don’t risk your rebate or safety with a non-certified installer.", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " Hire professionals who are specifically trained for EV charger work.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Ready for a safe, certified installation?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " Contact us today for a ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "free quote", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Call Now:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " 747-255-8595", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}], "direction": null}}', 'Why Hiring an EVITP Certified Installer Matters in Los Angeles', 40, 'Hiring an EVITP certified installer in Los Angeles ensures your EV charger installation is safe, code-compliant, rebate-eligible, and built to California standards.', '2026-05-03 20:32:22+00', false, 'why-hiring-an-evitp-certified-installer-matters-in-los-angeles', '2026-06-16 16:01:36.409+00', '2026-06-16 16:01:36.409+00', 'published');
INSERT INTO public.posts (id, title, hero_image_id, content, meta_title, meta_image_id, meta_description, published_at, generate_slug, slug, updated_at, created_at, _status) VALUES (17, 'Signs You Need an Electrical Panel Upgrade in Los Angeles', 30, '{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Signs You Need an Electrical Panel Upgrade in Los Angeles", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Many older homes in Los Angeles — from Burbank and Glendale to Hollywood and Pasadena — still use outdated electrical panels. These panels often cannot handle modern power demands from EVs, home offices, smart appliances, and air conditioning.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Watch for these ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "7 warning signs", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ". They show it’s time to upgrade your electrical panel.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "7 Warning Signs Your Electrical Panel Needs Upgrading", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "ol", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Frequent Breaker Trips", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " Breakers that trip often when you run multiple appliances or an EV charger mean your panel is overloaded.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Flickering or Dimming Lights", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " Lights that flicker or dim when you turn on high-power devices signal voltage problems from an old panel.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Warm or Hot Electrical Panel", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " A warm panel is dangerous. It warns of overloaded circuits and raises fire risk.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Outdated or Old Panel", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " If your panel is 30+ years old — especially Federal Pacific, Zinsco, or Pushmatic brands — replace it immediately.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 5, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Burning Smell or Discoloration", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " A burning smell, buzzing sounds, or scorch marks near the panel require urgent professional help.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 6, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Cannot Add New Circuits", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " If an electrician cannot add a new EV charger, sub-panel, or AC unit, your main panel lacks enough capacity.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 7, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Heavy Use of Extension Cords", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " Relying on extension cords and power strips throughout your home often means your panel is overloaded.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "number", "direction": null}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Why Upgrade Your Electrical Panel Now?", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "You improve home safety and reduce fire risk", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "You support modern appliances and EV chargers", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "You increase your home’s resale value", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "You meet current California Electrical Code requirements", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Professional Electrical Panel Upgrades in Los Angeles", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "At ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "911 Construction & Electric", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " (California License #1027421), our licensed electricians specialize in safe panel upgrades across Los Angeles.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We offer:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Free electrical panel assessment", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "100–200 amp panel upgrades", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Smart panel and sub-panel installations", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "EV charger-ready upgrades", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 5, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Full permitting and inspection handling", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 6, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Same-day and next-day service", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 7, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "24/7 emergency support", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Don’t wait for a serious problem.", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " Schedule your free panel assessment today.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Call Now:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " 747-255-8595", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}], "direction": null}}', 'Signs You Need an Electrical Panel Upgrade in Los Angeles |', 30, 'Experiencing frequent breaker trips, flickering lights, or hot panels in your LA home? These are clear signs you need an electrical upgrade.', '2026-05-01 06:27:43+00', false, 'signs-you-need-an-electrical-panel-upgrade-in-los-angeles', '2026-06-16 16:01:36.446+00', '2026-06-16 16:01:36.446+00', 'published');


--
-- Data for Name: pages_rels; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: payload_folders_folder_type; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: payload_jobs; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: payload_jobs_log; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: payload_kv; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: payload_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.payload_migrations (id, name, batch, updated_at, created_at) VALUES (1, 'dev', -1, '2026-06-16 16:03:08.895+00', '2026-06-16 16:00:22.668+00');


--
-- Data for Name: posts_populated_authors; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: posts_rels; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.posts_rels (id, "order", parent_id, path, posts_id, categories_id, users_id) VALUES (1, 1, 1, 'categories', NULL, 1, NULL);
INSERT INTO public.posts_rels (id, "order", parent_id, path, posts_id, categories_id, users_id) VALUES (2, 1, 4, 'categories', NULL, 1, NULL);
INSERT INTO public.posts_rels (id, "order", parent_id, path, posts_id, categories_id, users_id) VALUES (3, 1, 6, 'categories', NULL, 1, NULL);
INSERT INTO public.posts_rels (id, "order", parent_id, path, posts_id, categories_id, users_id) VALUES (4, 1, 7, 'categories', NULL, 1, NULL);
INSERT INTO public.posts_rels (id, "order", parent_id, path, posts_id, categories_id, users_id) VALUES (5, 1, 8, 'categories', NULL, 1, NULL);
INSERT INTO public.posts_rels (id, "order", parent_id, path, posts_id, categories_id, users_id) VALUES (6, 1, 9, 'categories', NULL, 1, NULL);
INSERT INTO public.posts_rels (id, "order", parent_id, path, posts_id, categories_id, users_id) VALUES (7, 1, 10, 'categories', NULL, 1, NULL);
INSERT INTO public.posts_rels (id, "order", parent_id, path, posts_id, categories_id, users_id) VALUES (8, 1, 11, 'categories', NULL, 1, NULL);
INSERT INTO public.posts_rels (id, "order", parent_id, path, posts_id, categories_id, users_id) VALUES (9, 1, 12, 'categories', NULL, 1, NULL);
INSERT INTO public.posts_rels (id, "order", parent_id, path, posts_id, categories_id, users_id) VALUES (10, 1, 13, 'categories', NULL, 1, NULL);
INSERT INTO public.posts_rels (id, "order", parent_id, path, posts_id, categories_id, users_id) VALUES (11, 1, 14, 'categories', NULL, 1, NULL);
INSERT INTO public.posts_rels (id, "order", parent_id, path, posts_id, categories_id, users_id) VALUES (12, 1, 15, 'categories', NULL, 1, NULL);
INSERT INTO public.posts_rels (id, "order", parent_id, path, posts_id, categories_id, users_id) VALUES (13, 1, 16, 'categories', NULL, 1, NULL);
INSERT INTO public.posts_rels (id, "order", parent_id, path, posts_id, categories_id, users_id) VALUES (14, 1, 17, 'categories', NULL, 1, NULL);


--
-- Data for Name: redirects; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.services (id, title, nav_label, hero_subheading, hero_image_id, show_rating_badge, short_description, card_image_id, intro, meta_title, meta_image_id, meta_description, display_order, generate_slug, slug, updated_at, created_at, _status) VALUES (1, 'Professional Electrical Repairs & Troubleshooting in Los Angeles, CA', 'Electrical Repairs & Troubleshooting', '911 Construction & Electric Inc. provides electrical repair and troubleshooting services in Los Angeles, CA for homes, businesses, and property managers. From flickering lights and dead outlets to breaker problems, wiring issues, and urgent electrical hazards, our team delivers safe, code-compliant repairs with clear communication and dependable response.', 44, true, 'Fast diagnosis and repair of outlets, breakers, wiring, lighting, and other electrical issues to restore safety, power, and performance.', 55, NULL, 'Electrical Repairs | Los Angeles, CA | 911 Construction & Electric Inc.', 4, 'Electrical repairs in Los Angeles, CA. Fast troubleshooting, licensed experts & safe solutions for homes and businesses. Call now for a free quote!', 0, false, 'electrical-repairs-los-angeles-ca', '2026-06-16 16:02:38.43+00', '2026-06-16 16:01:33.938+00', 'published');
INSERT INTO public.services (id, title, nav_label, hero_subheading, hero_image_id, show_rating_badge, short_description, card_image_id, intro, meta_title, meta_image_id, meta_description, display_order, generate_slug, slug, updated_at, created_at, _status) VALUES (2, 'Professional Electrical Panel Upgrades in Los Angeles, CA', 'Electrical Panel Upgrades', '911 Construction & Electric Inc. provides electrical panel upgrade services in Los Angeles, CA to improve safety, increase capacity, and support modern electrical demands. Whether you are dealing with an outdated panel, frequent breaker trips, renovation plans, or new equipment like EV chargers and HVAC systems, our team delivers safe, code-compliant panel upgrade solutions.', 45, true, 'Upgrade outdated or overloaded panels to safely support modern electrical demands and improve reliability.', 48, NULL, 'Electrical Panel Upgrades | Los Angeles, CA | 911 Construction & Electric Inc.', 4, 'Electrical Panel upgrades in Los Angeles, CA. Improve safety & power capacity with licensed electricians. Reliable service for homes & businesses. Get a free quote!', 1, false, 'electrical-panel-upgrades-los-angeles-ca', '2026-06-16 16:02:38.5+00', '2026-06-16 16:01:34.117+00', 'published');
INSERT INTO public.services (id, title, nav_label, hero_subheading, hero_image_id, show_rating_badge, short_description, card_image_id, intro, meta_title, meta_image_id, meta_description, display_order, generate_slug, slug, updated_at, created_at, _status) VALUES (3, 'Professional EV Charger Installation in Los Angeles, CA', 'EV Charger Installation', '911 Construction & Electric Inc. provides EV charger installation in Los Angeles, CA for homeowners and businesses that need safe, reliable daily charging. From Level 2 home charger setups to commercial charging solutions, our team evaluates your panel capacity, wiring, and charger requirements to deliver code-compliant installation built for long-term performance.', 46, true, 'Professional EV charger installation for homes and commercial properties with safe, code-compliant setup.', 54, NULL, 'EV Charger Installation | Los Angeles, CA | 911 Construction & Electric Inc.', 4, 'EV charger installation in Los Angeles, CA. Fast, safe setup for homes & businesses by licensed electricians. Call today for a free quote!', 2, false, 'ev-charger-installation-los-angeles-ca', '2026-06-16 16:02:38.55+00', '2026-06-16 16:01:34.306+00', 'published');
INSERT INTO public.services (id, title, nav_label, hero_subheading, hero_image_id, show_rating_badge, short_description, card_image_id, intro, meta_title, meta_image_id, meta_description, display_order, generate_slug, slug, updated_at, created_at, _status) VALUES (4, 'Professional New Construction Electrical in Los Angeles, CA', 'New Construction Electrical', '911 Construction & Electric Inc. provides new construction electrical services in Los Angeles, CA for residential and commercial projects. From planning and rough-in work to panels, wiring, lighting, and final electrical completion, our team helps builders, owners, and contractors keep projects organized, code-compliant, and ready for long-term performance.', 50, true, 'Complete electrical planning, wiring, and installation for new residential and commercial construction projects.', 51, NULL, 'New Construction Electrical | Los Angeles, CA | 911 Construction & Electric Inc', 4, 'New construction electrical in Los Angeles, CA. Expert wiring, installations & code-compliant systems. Reliable service. Get a free quote today!', 3, false, 'new-construction-electrical-los-angeles-ca', '2026-06-16 16:02:38.596+00', '2026-06-16 16:01:34.454+00', 'published');
INSERT INTO public.services (id, title, nav_label, hero_subheading, hero_image_id, show_rating_badge, short_description, card_image_id, intro, meta_title, meta_image_id, meta_description, display_order, generate_slug, slug, updated_at, created_at, _status) VALUES (5, 'Professional Lighting Installation & Upgrades in Los Angeles, CA', 'Lighting Installation & Upgrades', '911 Construction & Electric Inc. provides lighting installation and lighting upgrade services in Los Angeles, CA for homeowners, businesses, and property managers. From indoor lighting and recessed fixtures to outdoor, security, landscape, and energy-efficient lighting upgrades, our team delivers safe, code-compliant electrical work designed for visibility, function, and appearance.', 52, true, 'Improve safety, visibility, and appearance with modern indoor, outdoor, security, and energy-efficient lighting solutions.', 53, NULL, 'Lighting Installation Upgrades for Energy Savings - 911 Construction & Electric Inc.', 20, 'Explore the advantages of Lighting Installation Upgrades for your home and business. Illuminate your space with style.', 4, false, 'lighting-installation-upgrades-los-angeles-ca', '2026-06-16 16:02:38.672+00', '2026-06-16 16:01:34.599+00', 'published');
INSERT INTO public.services (id, title, nav_label, hero_subheading, hero_image_id, show_rating_badge, short_description, card_image_id, intro, meta_title, meta_image_id, meta_description, display_order, generate_slug, slug, updated_at, created_at, _status) VALUES (6, 'Professional Emergency Electrical Services (24/7) in Los Angeles, CA', 'Emergency Electrical Services (24/7)', '911 Construction & Electric Inc. provides 24/7 emergency electrical service in Los Angeles, CA for urgent issues that cannot wait. From power outages and burning smells to sparking outlets, exposed wiring, smoking panels, and dangerous electrical failures, our team responds quickly to help protect your property and restore safety.', 49, true, 'Immediate response for urgent electrical problems, outages, hazards, and safety concerns when fast service matters most.', 49, NULL, 'Emergency Electrician | Los Angeles, CA | 911 Construction & Electric Inc.', 4, 'Emergency electrician in Los Angeles, CA. 24/7 fast response for outages, hazards & urgent repairs. Licensed experts. Call now for immediate help!', 5, false, 'emergency-electrician-los-angeles-ca', '2026-06-16 16:02:38.726+00', '2026-06-16 16:01:34.762+00', 'published');


--
-- Data for Name: redirects_rels; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: services_benefits; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.services_benefits (_order, _parent_id, id, title, text) VALUES (1, 1, '6a31735d9da013198bf6a428', 'Prevents Electrical Hazards', 'Faulty wiring and overloaded circuits can lead to serious risks like electrical fires or shocks. Professional repairs ensure your system operates safely and meets all safety standards.');
INSERT INTO public.services_benefits (_order, _parent_id, id, title, text) VALUES (2, 1, '6a31735d9da013198bf6a429', 'Restores Reliable Power', 'Electrical issues can disrupt your daily life or business operations. Our troubleshooting services quickly restore consistent power so you can get back to normal without delays.');
INSERT INTO public.services_benefits (_order, _parent_id, id, title, text) VALUES (3, 1, '6a31735d9da013198bf6a42a', 'Avoids Costly Future Repairs', 'Ignoring small electrical problems can lead to bigger, more expensive issues. Early diagnosis and repair help extend the life of your electrical system and save money long-term.');
INSERT INTO public.services_benefits (_order, _parent_id, id, title, text) VALUES (1, 2, '6a31735e9da013198bf6a434', 'Prevents Overloads & Electrical Hazards', 'Outdated panels can struggle with modern electrical loads, increasing the risk of overheating or fire hazards. Upgrading your panel ensures safe power distribution throughout your property.');
INSERT INTO public.services_benefits (_order, _parent_id, id, title, text) VALUES (2, 2, '6a31735e9da013198bf6a435', 'Supports Modern Electrical Needs', 'From smart home systems to EV chargers, today’s homes and businesses require more power. A panel upgrade allows your system to handle increased demand without issues.');
INSERT INTO public.services_benefits (_order, _parent_id, id, title, text) VALUES (3, 2, '6a31735e9da013198bf6a436', 'Improves Property Value & Efficiency', 'A new electrical panel enhances your property’s value and ensures a more efficient, reliable electrical system for years to come.');
INSERT INTO public.services_benefits (_order, _parent_id, id, title, text) VALUES (1, 3, '6a31735e9da013198bf6a441', 'Ensures Safe and Reliable Charging', 'Improper installation can overload circuits, damage equipment, or create safety hazards. Professional EV charger installation ensures your charging station operates safely and consistently every time you plug in.');
INSERT INTO public.services_benefits (_order, _parent_id, id, title, text) VALUES (2, 3, '6a31735e9da013198bf6a442', 'Adds Property Value and Modern Appeal', 'EV charger installation can make your home or commercial property more attractive to buyers, tenants, and customers. In a growing market like Los Angeles, it’s a valuable upgrade that improves both convenience and long-term property appeal.');
INSERT INTO public.services_benefits (_order, _parent_id, id, title, text) VALUES (3, 3, '6a31735e9da013198bf6a443', 'Supports Faster, More Efficient Charging', 'A professionally installed charger delivers better performance than a standard wall outlet, helping you charge your vehicle faster and more efficiently. With the right setup, you can enjoy reliable charging that fits your daily routine.');
INSERT INTO public.services_benefits (_order, _parent_id, id, title, text) VALUES (1, 4, '6a31735e9da013198bf6a44a', 'Supports Safe & Reliable Power Distribution', 'A properly installed electrical system is essential for the safety and performance of your new property. We ensure circuits, panels, and wiring are correctly designed and installed to provide dependable power where you need it most.');
INSERT INTO public.services_benefits (_order, _parent_id, id, title, text) VALUES (2, 4, '6a31735e9da013198bf6a44b', 'Helps Avoid Costly Delays & Corrections', 'Electrical mistakes during construction can lead to failed inspections, project delays, and expensive rework. Our experienced team ensures your installation is completed correctly and on schedule from the start.');
INSERT INTO public.services_benefits (_order, _parent_id, id, title, text) VALUES (3, 4, '6a31735e9da013198bf6a44c', 'Adds Functionality & Future Value', 'Thoughtful electrical planning improves convenience, energy efficiency, and the long-term value of your property. From modern lighting layouts to dedicated appliance circuits and future-ready upgrades, we help prepare your build for today and tomorrow.');
INSERT INTO public.services_benefits (_order, _parent_id, id, title, text) VALUES (1, 5, '6a31735e9da013198bf6a453', 'Prevents Overloads & Electrical Hazards', 'Outdated panels can struggle with modern electrical loads, increasing the risk of overheating or fire hazards. Upgrading your panel ensures safe power distribution throughout your property.');
INSERT INTO public.services_benefits (_order, _parent_id, id, title, text) VALUES (2, 5, '6a31735e9da013198bf6a454', 'Supports Modern Electrical Needs', 'From smart home systems to EV chargers, today’s homes and businesses require more power. A panel upgrade allows your system to handle increased demand without issues.');
INSERT INTO public.services_benefits (_order, _parent_id, id, title, text) VALUES (3, 5, '6a31735e9da013198bf6a455', 'Improves Property Value & Efficiency', 'A new electrical panel enhances your property’s value and ensures a more efficient, reliable electrical system for years to come.');
INSERT INTO public.services_benefits (_order, _parent_id, id, title, text) VALUES (1, 6, '6a31735e9da013198bf6a45c', 'Protects Your Property from Serious Hazards', 'Electrical emergencies can quickly lead to fire risks, electrical shocks, or costly equipment damage. Fast professional service helps contain the problem before it becomes more dangerous.');
INSERT INTO public.services_benefits (_order, _parent_id, id, title, text) VALUES (2, 6, '6a31735e9da013198bf6a45d', 'Restores Power & Normal Operations Quickly', 'Unexpected electrical issues can disrupt your home, business, or daily routine. Our emergency electrical services help restore power quickly so you can get back to normal with minimal interruption.');
INSERT INTO public.services_benefits (_order, _parent_id, id, title, text) VALUES (3, 6, '6a31735e9da013198bf6a45e', 'Prevents Costly Long-Term Damage', 'Waiting too long to address an emergency electrical issue can make repairs more expensive. Immediate troubleshooting and repairs help reduce long-term damage and protect your electrical system');


--
-- Data for Name: services_faqs; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.services_faqs (_order, _parent_id, id, question, answer) VALUES (1, 1, '6a31735d9da013198bf6a42b', 'How quickly can you fix electrical issues?', '{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Most common electrical repairs can be completed the same day, depending on the complexity of the issue. We provide a clear timeline after diagnosing the problem.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}');
INSERT INTO public.services_faqs (_order, _parent_id, id, question, answer) VALUES (2, 1, '6a31735d9da013198bf6a42c', 'Do you handle emergency electrical repairs?', '{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Yes, we provide 24/7 emergency electrical repair services in ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"id": "6a31735d9da013198bf6a423", "type": "link", "fields": {"url": "https://en.wikipedia.org/wiki/Los_Angeles", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "Los Angeles, CA.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"mode": "normal", "text": " Whether you’re dealing with a sudden power outage, exposed wiring, burning smells, or any electrical hazard, our team responds quickly to restore safety and power to your home or business.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}');
INSERT INTO public.services_faqs (_order, _parent_id, id, question, answer) VALUES (3, 1, '6a31735d9da013198bf6a42d', 'What are common signs I need electrical repairs?', '{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Common signs include flickering or dimming lights, frequent circuit breaker trips, burning smells, buzzing sounds, warm outlets, or sudden power loss. If those issues point to an overloaded service, we may also recommend an ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"id": "6a31735d9da013198bf6a424", "type": "link", "fields": {"url": "/electrical-panel-upgrades-los-angeles-ca/", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "electrical panel upgrade", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"mode": "normal", "text": ". If you notice any of these issues in your Los Angeles property, it’s important to contact a professional electrician immediately to prevent safety risks and further damage.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}');
INSERT INTO public.services_faqs (_order, _parent_id, id, question, answer) VALUES (1, 2, '6a31735e9da013198bf6a437', 'How do I know if I need a panel upgrade?', '{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Signs you may need an upgrade include frequent breaker trips, flickering lights, burning smells, or an outdated fuse box. If your property in ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"id": "6a31735e9da013198bf6a42e", "type": "link", "fields": {"url": "http://en.wikipedia.org/wiki/Los_Angeles", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "Los Angeles", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"mode": "normal", "text": " still uses an older panel, upgrading is essential for safety and performance.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}');
INSERT INTO public.services_faqs (_order, _parent_id, id, question, answer) VALUES (2, 2, '6a31735e9da013198bf6a438', 'How long does a panel upgrade take?', '{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Most electrical panel upgrades can be completed within one day, depending on the complexity of the system. We provide a clear timeline after evaluating your current setup.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}');
INSERT INTO public.services_faqs (_order, _parent_id, id, question, answer) VALUES (3, 2, '6a31735e9da013198bf6a439', 'Will upgrading my panel increase my home’s value?', '{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Yes, upgrading your electrical panel can improve your property’s value by making it safer and more capable of handling modern electrical demands. It’s a smart investment, especially if you are preparing for ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"id": "6a31735e9da013198bf6a42f", "type": "link", "fields": {"url": "/ev-charger-installation-los-angeles-ca/", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "EV charger installation", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"mode": "normal", "text": " or have seen the ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"id": "6a31735e9da013198bf6a430", "type": "link", "fields": {"url": "/signs-you-need-an-electrical-panel-upgrade-in-los-angeles/", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "warning signs of an outdated panel", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"mode": "normal", "text": " for both homeowners and businesses.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}');
INSERT INTO public.services_faqs (_order, _parent_id, id, question, answer) VALUES (1, 3, '6a31735e9da013198bf6a444', 'How long does EV charger installation take?', '{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Most EV charger installations can be completed in one day, depending on your electrical setup and whether panel upgrades are needed. After an initial assessment, we provide a clear timeline and installation plan.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}');
INSERT INTO public.services_faqs (_order, _parent_id, id, question, answer) VALUES (2, 3, '6a31735e9da013198bf6a445', 'Do I need an electrical panel upgrade for an EV charger?', '{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Not every property needs a panel upgrade, but some older electrical systems may need additional capacity to support a new charger safely. You can also read our articles about ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"id": "6a31735e9da013198bf6a43a", "type": "link", "fields": {"url": "/los-angeles-home-ev-charger-installation/", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "home EV charger installation in Los Angeles", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"mode": "normal", "text": " and ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"id": "6a31735e9da013198bf6a43b", "type": "link", "fields": {"url": "/why-hiring-an-evitp-certified-installer-matters-in-los-angeles/", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "why hiring an EVITP certified installer matters", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"mode": "normal", "text": ". You can also read our articles about ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"id": "6a31735e9da013198bf6a43c", "type": "link", "fields": {"url": "/los-angeles-home-ev-charger-installation/", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "home EV charger installation in Los Angeles", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"mode": "normal", "text": " and ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"id": "6a31735e9da013198bf6a43d", "type": "link", "fields": {"url": "/why-hiring-an-evitp-certified-installer-matters-in-los-angeles/", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "why hiring an EVITP certified installer matters", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"mode": "normal", "text": ". Our team will inspect your panel and let you know if any upgrades are recommended before installation.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}');
INSERT INTO public.services_faqs (_order, _parent_id, id, question, answer) VALUES (3, 3, '6a31735e9da013198bf6a446', 'Can you install EV chargers for commercial properties?', '{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Yes, we install EV charging stations for both residential and commercial properties in Los Angeles, CA. Whether you need a single charger for your home or multiple units for a business, apartment complex, or commercial site, we can help.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}');
INSERT INTO public.services_faqs (_order, _parent_id, id, question, answer) VALUES (1, 4, '6a31735e9da013198bf6a44d', 'What does new construction electrical include?', '{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "New construction electrical typically includes complete system planning and installation, such as rough wiring, electrical panels, outlets, switches, lighting, dedicated circuits, and final fixture connections. We handle every phase needed to power your new residential or commercial property safely and efficiently.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}');
INSERT INTO public.services_faqs (_order, _parent_id, id, question, answer) VALUES (2, 4, '6a31735e9da013198bf6a44e', 'Do you work with builders and general contractors?', '{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Yes, we regularly work with homeowners, builders, developers, and general contractors throughout Los Angeles, CA. We coordinate closely with your construction team to keep the project on schedule and ensure all electrical work aligns with the overall build plan.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}');
INSERT INTO public.services_faqs (_order, _parent_id, id, question, answer) VALUES (3, 4, '6a31735e9da013198bf6a44f', 'Will the electrical work meet local code requirements?', '{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Absolutely. All of our new construction electrical work is completed to meet current local codes and safety standards. We make sure your system is installed properly, prepared for inspection, and built for long-term reliability.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}');
INSERT INTO public.services_faqs (_order, _parent_id, id, question, answer) VALUES (1, 5, '6a31735e9da013198bf6a456', 'How do I know if I need a panel upgrade?', '{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We install and upgrade many types of lighting, including recessed lights, ceiling fixtures, outdoor lighting, security lighting, landscape lighting, and other interior or exterior lighting systems. We help homeowners and businesses choose practical lighting solutions based on the property and the intended use.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}');
INSERT INTO public.services_faqs (_order, _parent_id, id, question, answer) VALUES (2, 5, '6a31735e9da013198bf6a457', 'How long does a panel upgrade take?', '{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Yes. Lighting upgrades can improve safety, visibility, appearance, and energy efficiency. Many property owners in Los Angeles update older fixtures to improve function, reduce maintenance issues, and get better performance from key areas inside and outside the property.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}');
INSERT INTO public.services_faqs (_order, _parent_id, id, question, answer) VALUES (3, 5, '6a31735e9da013198bf6a458', 'Will upgrading my panel increase my home’s value?', '{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Some lighting projects can be completed in a single visit, while larger upgrades may take longer depending on the scope of work, wiring conditions, fixture types, and access. We provide a clear recommendation and timeline before work begins.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}');
INSERT INTO public.services_faqs (_order, _parent_id, id, question, answer) VALUES (1, 6, '6a31735e9da013198bf6a45f', 'What qualifies as an electrical emergency?', '{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Electrical emergencies include power outages, burning smells, sparking outlets, exposed wires, smoking electrical panels, repeated breaker trips, or any situation that poses an immediate safety risk. If you notice any of these issues, contact our team right away for emergency service.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}');
INSERT INTO public.services_faqs (_order, _parent_id, id, question, answer) VALUES (2, 6, '6a31735e9da013198bf6a460', 'How quickly can you respond to emergency electrical calls?', '{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We offer 24/7 emergency electrical services in Los Angeles, CA and strive to respond as quickly as possible based on your location and the severity of the issue. Our goal is to restore safety and power fast.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}');
INSERT INTO public.services_faqs (_order, _parent_id, id, question, answer) VALUES (3, 6, '6a31735e9da013198bf6a461', 'Should I turn off power before calling for emergency electrical repairs?', '{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "If it is safe to do so, shutting off power to the affected area can help reduce risk before our electricians arrive. However, if you are unsure or the situation appears dangerous, keep a safe distance and call us immediately for guidance.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}');


--
-- Data for Name: services_features; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.services_features (_order, _parent_id, id, title, text) VALUES (1, 1, '6a31735d9da013198bf6a425', 'Accurate Diagnosis for Every Issue', 'Electrical problems can be complex and dangerous if not handled properly. Whether you''re dealing with flickering lights, circuit breaker issues, or power outages in Los Angeles, our team performs detailed inspections to quickly identify the root cause and provide effective solutions.');
INSERT INTO public.services_features (_order, _parent_id, id, title, text) VALUES (2, 1, '6a31735d9da013198bf6a426', 'Advanced Tools & Safe Repairs', 'We use professional-grade tools and proven repair techniques to handle everything from minor electrical faults to major system failures. Our electricians follow strict safety standards and local codes to ensure every repair is completed safely and correctly.');
INSERT INTO public.services_features (_order, _parent_id, id, title, text) VALUES (3, 1, '6a31735d9da013198bf6a427', 'Local Expertise You Can Trust', 'As a trusted electrical contractor serving Los Angeles, CA, we understand common electrical issues in both older and modern properties. Our experience allows us to deliver reliable repairs that improve performance and prevent future problems.');
INSERT INTO public.services_features (_order, _parent_id, id, title, text) VALUES (1, 2, '6a31735e9da013198bf6a431', 'Customized Panel Solutions for Every Property', 'Every property has unique electrical demands. Whether you''re upgrading an older home or expanding a commercial space in Los Angeles, we assess your current system and recommend the right panel upgrade to support your energy needs safely and efficiently.');
INSERT INTO public.services_features (_order, _parent_id, id, title, text) VALUES (2, 2, '6a31735e9da013198bf6a432', 'Modern Equipment & Code-Compliant Installations', 'We install high-quality electrical panels designed to handle today’s power usage, including appliances, HVAC systems, and EV chargers. Our electricians follow all Los Angeles codes and safety standards to ensure long-term reliability and compliance');
INSERT INTO public.services_features (_order, _parent_id, id, title, text) VALUES (3, 2, '6a31735e9da013198bf6a433', 'Local Expertise You Can Trust', 'With extensive experience in Los Angeles, CA, we understand the electrical challenges of older systems and growing energy demands. Our team delivers panel upgrades that improve performance, safety, and overall system longevity.');
INSERT INTO public.services_features (_order, _parent_id, id, title, text) VALUES (1, 3, '6a31735e9da013198bf6a43e', 'Customized Charging Solutions for Your Property', 'Every property has different electrical demands and charging needs. Whether you need a Level 2 home charger in Los Angeles or multiple commercial charging stations for your business, we create tailored installation plans based on your electrical panel capacity, charger type, and property layout. Our team ensures safe wiring, proper placement, and dependable performance for long-term convenience.');
INSERT INTO public.services_features (_order, _parent_id, id, title, text) VALUES (2, 3, '6a31735e9da013198bf6a43f', 'Safe Installation & Code-Compliant Work', 'Installing an EV charger requires more than simply mounting equipment. Our licensed electricians evaluate your electrical system, make any necessary upgrades, and complete the installation according to local codes and manufacturer standards. We use professional tools and proven methods to ensure safe operation and efficient charging.');
INSERT INTO public.services_features (_order, _parent_id, id, title, text) VALUES (3, 3, '6a31735e9da013198bf6a440', 'Local Expertise You Can Count On', 'As a trusted electrical contractor serving Los Angeles, CA, we understand the growing demand for electric vehicle charging solutions in homes, apartment buildings, and commercial spaces. Our experience allows us to install chargers that match your property’s needs while helping you prepare for the future of transportation.');
INSERT INTO public.services_features (_order, _parent_id, id, title, text) VALUES (1, 4, '6a31735e9da013198bf6a447', 'Custom Electrical Solutions for Every New Build', 'Every construction project has unique electrical demands. Whether you’re building a custom home, commercial property, tenant improvement, or multi-unit development in Los Angeles, CA, we create tailored electrical plans based on your layout, usage needs, and project scope. Our team handles rough wiring, panel installation, circuit layout, outlets, switches, lighting, and final electrical setup with attention to detail and long-term performance in mind.');
INSERT INTO public.services_features (_order, _parent_id, id, title, text) VALUES (2, 4, '6a31735e9da013198bf6a448', 'Professional Installation & Code-Compliant Work', 'Our licensed electricians use high-quality materials, modern tools, and proven installation methods to complete every phase of your electrical system safely and efficiently. We follow all local electrical codes and construction requirements to ensure your new build passes inspection and is ready for occupancy without delays.');
INSERT INTO public.services_features (_order, _parent_id, id, title, text) VALUES (3, 4, '6a31735e9da013198bf6a449', 'Local Expertise That Powers Strong Foundations', ': As a trusted electrical contractor serving Los Angeles, CA, we understand the demands of local construction projects, permitting requirements, and property layouts. Our hands-on experience helps ensure your electrical system is built right the first time, supporting safety, functionality, and long-term reliability.');
INSERT INTO public.services_features (_order, _parent_id, id, title, text) VALUES (1, 5, '6a31735e9da013198bf6a450', 'Customized Panel Solutions for Every Property', 'Every property has unique electrical demands. Whether you''re upgrading an older home or expanding a commercial space in Los Angeles, we assess your current system and recommend the right panel upgrade to support your energy needs safely and efficiently.');
INSERT INTO public.services_features (_order, _parent_id, id, title, text) VALUES (2, 5, '6a31735e9da013198bf6a451', 'Modern Equipment & Code-Compliant Installations', 'We install high-quality electrical panels designed to handle today’s power usage, including appliances, HVAC systems, and EV chargers. Our electricians follow all Los Angeles codes and safety standards to ensure long-term reliability and compliance');
INSERT INTO public.services_features (_order, _parent_id, id, title, text) VALUES (3, 5, '6a31735e9da013198bf6a452', 'Local Expertise You Can Trust', 'With extensive experience in Los Angeles, CA, we understand the electrical challenges of older systems and growing energy demands. Our team delivers panel upgrades that improve performance, safety, and overall system longevity.');
INSERT INTO public.services_features (_order, _parent_id, id, title, text) VALUES (1, 6, '6a31735e9da013198bf6a459', 'Immediate Help When You Need It Most', 'Electrical emergencies can happen without warning and put your property at serious risk. Whether you’re facing a sudden power outage, sparking outlets, exposed wiring, or a burning smell in Los Angeles, our team is available 24/7 to respond quickly and restore safety.');
INSERT INTO public.services_features (_order, _parent_id, id, title, text) VALUES (2, 6, '6a31735e9da013198bf6a45a', 'Expert Troubleshooting & Emergency Repairs', 'Our licensed electricians use professional diagnostic tools and proven repair methods to identify urgent electrical problems fast. From breaker failures to damaged wiring, we perform emergency repairs safely and efficiently to minimize downtime and prevent further damage');
INSERT INTO public.services_features (_order, _parent_id, id, title, text) VALUES (3, 6, '6a31735e9da013198bf6a45b', 'Local Emergency Electricians You Can Trust', 'As a trusted electrical contractor serving Los Angeles, CA, we understand the urgency of emergency service calls. Our team arrives prepared to assess the issue, explain the problem clearly, and deliver dependable repairs that protect your home or business.');


--
-- Data for Name: services_gallery; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: services_rels; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: site_settings; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.site_settings (id, business_name, license_number, phone, email, address_street, address_city, address_state, address_zip, geo_lat, geo_lng, hours_label, aggregate_rating_value, aggregate_rating_count, logo_id, default_o_g_image_id, updated_at, created_at) VALUES (1, '911 Construction & Electric Inc.', '1027421', '747-255-8595', 'info@911electrics.com', '1308 East Colorado Blvd Ste 141', 'Pasadena', 'CA', '91106', 34.1453, -118.1182, '24/7 Emergency Service', 5, 0, 23, 21, '2026-06-16 16:03:09.127+00', '2026-06-16 16:01:32.782+00');


--
-- Data for Name: site_settings_socials; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.site_settings_socials (_order, _parent_id, id, platform, url) VALUES (1, 1, '6a31735c9da013198bf6a40c', 'facebook', 'https://www.facebook.com/911Electrics');
INSERT INTO public.site_settings_socials (_order, _parent_id, id, platform, url) VALUES (2, 1, '6a31735c9da013198bf6a40d', 'instagram', 'https://www.instagram.com/911construction_electric');
INSERT INTO public.site_settings_socials (_order, _parent_id, id, platform, url) VALUES (3, 1, '6a31735c9da013198bf6a40e', 'x', 'https://twitter.com/911Electric');
INSERT INTO public.site_settings_socials (_order, _parent_id, id, platform, url) VALUES (4, 1, '6a31735c9da013198bf6a40f', 'pinterest', 'https://www.pinterest.com/911electricinc/');
INSERT INTO public.site_settings_socials (_order, _parent_id, id, platform, url) VALUES (5, 1, '6a31735c9da013198bf6a410', 'google', 'https://share.google/LPz2HwoGDHNgF9UCk');


--
-- Data for Name: testimonials_rels; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.categories_id_seq', 2, true);


--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cities_id_seq', 43, true);


--
-- Name: cities_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cities_rels_id_seq', 1, false);


--
-- Name: city_page_template_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.city_page_template_id_seq', 1, true);


--
-- Name: homepage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.homepage_id_seq', 1, true);


--
-- Name: leads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.leads_id_seq', 1, false);


--
-- Name: media_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.media_id_seq', 55, true);


--
-- Name: pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pages_id_seq', 1, false);


--
-- Name: pages_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pages_rels_id_seq', 1, false);


--
-- Name: payload_folders_folder_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.payload_folders_folder_type_id_seq', 1, false);


--
-- Name: payload_folders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.payload_folders_id_seq', 1, false);


--
-- Name: payload_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.payload_jobs_id_seq', 1, false);


--
-- Name: payload_kv_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.payload_kv_id_seq', 1, false);


--
-- Name: payload_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.payload_migrations_id_seq', 1, true);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.posts_id_seq', 17, true);


--
-- Name: posts_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.posts_rels_id_seq', 14, true);


--
-- Name: redirects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.redirects_id_seq', 1, false);


--
-- Name: redirects_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.redirects_rels_id_seq', 1, false);


--
-- Name: services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.services_id_seq', 6, true);


--
-- Name: services_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.services_rels_id_seq', 1, false);


--
-- Name: site_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.site_settings_id_seq', 1, true);


--
-- Name: testimonials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.testimonials_id_seq', 1, false);


--
-- Name: testimonials_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.testimonials_rels_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--


