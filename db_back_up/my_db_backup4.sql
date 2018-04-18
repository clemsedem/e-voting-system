--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.6
-- Dumped by pg_dump version 9.6.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: add_voter_reasons; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE add_voter_reasons (
    id integer NOT NULL,
    reason character varying,
    user_id character varying,
    voter_id character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE add_voter_reasons OWNER TO clemence;

--
-- Name: add_voter_reasons_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE add_voter_reasons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE add_voter_reasons_id_seq OWNER TO clemence;

--
-- Name: add_voter_reasons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE add_voter_reasons_id_seq OWNED BY add_voter_reasons.id;


--
-- Name: candidate_masters; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE candidate_masters (
    id integer NOT NULL,
    candidate_id character varying,
    portfolio_id character varying,
    user_id integer,
    active_status boolean,
    del_status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    slot_id integer,
    image_file_name character varying,
    image_content_type character varying,
    image_file_size integer,
    image_updated_at timestamp without time zone
);


ALTER TABLE candidate_masters OWNER TO clemence;

--
-- Name: candidate_masters_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE candidate_masters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE candidate_masters_id_seq OWNER TO clemence;

--
-- Name: candidate_masters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE candidate_masters_id_seq OWNED BY candidate_masters.id;


--
-- Name: department_masters; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE department_masters (
    id integer NOT NULL,
    department_name character varying,
    faculty_id integer,
    user_id integer,
    active_status boolean,
    del_status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE department_masters OWNER TO clemence;

--
-- Name: department_masters_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE department_masters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE department_masters_id_seq OWNER TO clemence;

--
-- Name: department_masters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE department_masters_id_seq OWNED BY department_masters.id;


--
-- Name: faculty_masters; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE faculty_masters (
    id integer NOT NULL,
    faculty_name character varying,
    user_id integer,
    active_status boolean,
    del_status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE faculty_masters OWNER TO clemence;

--
-- Name: faculty_masters_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE faculty_masters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE faculty_masters_id_seq OWNER TO clemence;

--
-- Name: faculty_masters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE faculty_masters_id_seq OWNED BY faculty_masters.id;


--
-- Name: gender_masters; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE gender_masters (
    id integer NOT NULL,
    gender character varying,
    user_id integer,
    active_status boolean,
    del_status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE gender_masters OWNER TO clemence;

--
-- Name: gender_masters_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE gender_masters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE gender_masters_id_seq OWNER TO clemence;

--
-- Name: gender_masters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE gender_masters_id_seq OWNED BY gender_masters.id;


--
-- Name: level_masters; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE level_masters (
    id integer NOT NULL,
    level integer,
    user_id integer,
    active_status boolean,
    del_status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE level_masters OWNER TO clemence;

--
-- Name: level_masters_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE level_masters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE level_masters_id_seq OWNER TO clemence;

--
-- Name: level_masters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE level_masters_id_seq OWNED BY level_masters.id;


--
-- Name: models; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE models (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    "user" character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE models OWNER TO clemence;

--
-- Name: models_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE models_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE models_id_seq OWNER TO clemence;

--
-- Name: models_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE models_id_seq OWNED BY models.id;


--
-- Name: portfolio_masters; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE portfolio_masters (
    id integer NOT NULL,
    ref_id character varying,
    portfolio character varying,
    user_id integer,
    active_status boolean,
    del_status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE portfolio_masters OWNER TO clemence;

--
-- Name: portfolio_masters_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE portfolio_masters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE portfolio_masters_id_seq OWNER TO clemence;

--
-- Name: portfolio_masters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE portfolio_masters_id_seq OWNED BY portfolio_masters.id;


--
-- Name: program_masters; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE program_masters (
    id integer NOT NULL,
    program_name character varying,
    department_id integer,
    user_id integer,
    active_status boolean,
    del_status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE program_masters OWNER TO clemence;

--
-- Name: program_masters_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE program_masters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE program_masters_id_seq OWNER TO clemence;

--
-- Name: program_masters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE program_masters_id_seq OWNED BY program_masters.id;


--
-- Name: registered_voters; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE registered_voters (
    id integer NOT NULL,
    voter_id character varying,
    surname character varying,
    other_names character varying,
    level_id integer,
    session_id integer,
    program_id integer,
    gender character varying,
    vote_status boolean,
    user_id integer,
    active_status boolean,
    del_status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE registered_voters OWNER TO clemence;

--
-- Name: registered_voters_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE registered_voters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE registered_voters_id_seq OWNER TO clemence;

--
-- Name: registered_voters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE registered_voters_id_seq OWNED BY registered_voters.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE roles (
    id integer NOT NULL,
    name character varying,
    active_status boolean,
    del_status boolean,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE roles OWNER TO clemence;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE roles_id_seq OWNER TO clemence;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO clemence;

--
-- Name: session_masters; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE session_masters (
    id integer NOT NULL,
    session character varying,
    user_id integer,
    active_status boolean,
    del_status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE session_masters OWNER TO clemence;

--
-- Name: session_masters_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE session_masters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE session_masters_id_seq OWNER TO clemence;

--
-- Name: session_masters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE session_masters_id_seq OWNED BY session_masters.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    surname character varying,
    other_names character varying,
    username character varying,
    active_status boolean,
    del_status boolean,
    role_id integer
);


ALTER TABLE users OWNER TO clemence;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO clemence;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: vote_results; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE vote_results (
    id integer NOT NULL,
    portfolio_id character varying,
    voter_id character varying,
    candidate_id character varying,
    user_id integer,
    active_status boolean,
    del_status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    slot integer
);


ALTER TABLE vote_results OWNER TO clemence;

--
-- Name: vote_results_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE vote_results_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vote_results_id_seq OWNER TO clemence;

--
-- Name: vote_results_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE vote_results_id_seq OWNED BY vote_results.id;


--
-- Name: voter_tokens; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE voter_tokens (
    id integer NOT NULL,
    voter_id character varying,
    token character varying,
    user_id integer,
    active_status boolean,
    del_status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE voter_tokens OWNER TO clemence;

--
-- Name: voter_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: clemence
--

CREATE SEQUENCE voter_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE voter_tokens_id_seq OWNER TO clemence;

--
-- Name: voter_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clemence
--

ALTER SEQUENCE voter_tokens_id_seq OWNED BY voter_tokens.id;


--
-- Name: add_voter_reasons id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY add_voter_reasons ALTER COLUMN id SET DEFAULT nextval('add_voter_reasons_id_seq'::regclass);


--
-- Name: candidate_masters id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY candidate_masters ALTER COLUMN id SET DEFAULT nextval('candidate_masters_id_seq'::regclass);


--
-- Name: department_masters id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY department_masters ALTER COLUMN id SET DEFAULT nextval('department_masters_id_seq'::regclass);


--
-- Name: faculty_masters id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY faculty_masters ALTER COLUMN id SET DEFAULT nextval('faculty_masters_id_seq'::regclass);


--
-- Name: gender_masters id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY gender_masters ALTER COLUMN id SET DEFAULT nextval('gender_masters_id_seq'::regclass);


--
-- Name: level_masters id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY level_masters ALTER COLUMN id SET DEFAULT nextval('level_masters_id_seq'::regclass);


--
-- Name: models id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY models ALTER COLUMN id SET DEFAULT nextval('models_id_seq'::regclass);


--
-- Name: portfolio_masters id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY portfolio_masters ALTER COLUMN id SET DEFAULT nextval('portfolio_masters_id_seq'::regclass);


--
-- Name: program_masters id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY program_masters ALTER COLUMN id SET DEFAULT nextval('program_masters_id_seq'::regclass);


--
-- Name: registered_voters id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY registered_voters ALTER COLUMN id SET DEFAULT nextval('registered_voters_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- Name: session_masters id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY session_masters ALTER COLUMN id SET DEFAULT nextval('session_masters_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: vote_results id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY vote_results ALTER COLUMN id SET DEFAULT nextval('vote_results_id_seq'::regclass);


--
-- Name: voter_tokens id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY voter_tokens ALTER COLUMN id SET DEFAULT nextval('voter_tokens_id_seq'::regclass);


--
-- Data for Name: add_voter_reasons; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY add_voter_reasons (id, reason, user_id, voter_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: add_voter_reasons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('add_voter_reasons_id_seq', 1, false);


--
-- Data for Name: candidate_masters; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY candidate_masters (id, candidate_id, portfolio_id, user_id, active_status, del_status, created_at, updated_at, slot_id, image_file_name, image_content_type, image_file_size, image_updated_at) FROM stdin;
10	10024390	FS	\N	t	f	2018-04-17 10:33:01.242335	2018-04-17 10:52:47.020459	1	\N	\N	\N	\N
11	10023133	WC	\N	t	f	2018-04-17 11:07:25.743847	2018-04-17 11:07:25.743847	1	\N	\N	\N	\N
5	10012432	S	\N	t	f	2018-04-05 23:36:17.758407	2018-04-15 18:51:25.978784	2	\N	\N	\N	\N
2	10012451	P	\N	t	f	2018-03-03 21:42:47.351663	2018-04-15 11:40:07.42192	2	\N	\N	\N	\N
6	10034689	TR	\N	t	f	2018-04-06 00:39:15.063392	2018-04-17 09:33:41.766795	1	\N	\N	\N	\N
4	10092789	S	\N	t	f	2018-04-05 23:35:52.969816	2018-04-17 10:03:57.196497	1	\N	\N	\N	\N
3	10034809	P	\N	t	f	2018-03-04 00:51:54.08539	2018-04-17 10:08:20.014057	3	\N	\N	\N	\N
1	10012565	P	\N	t	f	2018-03-03 20:52:22.932892	2018-04-15 18:48:11.419531	1	image11.jpg	image/jpeg	6181	2018-04-12 08:25:36.68419
\.


--
-- Name: candidate_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('candidate_masters_id_seq', 11, true);


--
-- Data for Name: department_masters; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY department_masters (id, department_name, faculty_id, user_id, active_status, del_status, created_at, updated_at) FROM stdin;
1	Accounting	3	\N	t	f	2018-02-21 23:49:06.27207	2018-02-21 23:59:34.508731
2	Banking And Finance	3	\N	t	f	2018-02-27 10:18:03.595342	2018-02-27 10:18:03.595342
\.


--
-- Name: department_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('department_masters_id_seq', 2, true);


--
-- Data for Name: faculty_masters; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY faculty_masters (id, faculty_name, user_id, active_status, del_status, created_at, updated_at) FROM stdin;
1	Law	\N	t	f	2018-02-19 10:58:59.921056	2018-02-21 23:57:46.528236
3	Accounting And Finance	\N	t	f	2018-02-21 22:54:37.549036	2018-02-21 23:57:57.42889
2	Forest Resources Technology	\N	t	f	2018-02-19 21:51:40.830255	2018-02-21 23:58:15.716981
\.


--
-- Name: faculty_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('faculty_masters_id_seq', 3, true);


--
-- Data for Name: gender_masters; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY gender_masters (id, gender, user_id, active_status, del_status, created_at, updated_at) FROM stdin;
\.


--
-- Name: gender_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('gender_masters_id_seq', 1, false);


--
-- Data for Name: level_masters; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY level_masters (id, level, user_id, active_status, del_status, created_at, updated_at) FROM stdin;
2	200	\N	t	f	2018-03-03 15:56:03.761166	2018-03-03 15:56:03.761166
3	300	\N	t	f	2018-03-03 15:57:16.493461	2018-03-03 15:57:16.493461
4	400	\N	t	f	2018-03-03 15:57:26.742395	2018-03-03 16:34:18.847193
1	100	\N	t	f	2018-03-03 15:49:26.752095	2018-03-03 16:34:27.759674
\.


--
-- Name: level_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('level_masters_id_seq', 4, true);


--
-- Data for Name: models; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY models (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, "user", created_at, updated_at) FROM stdin;
\.


--
-- Name: models_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('models_id_seq', 1, false);


--
-- Data for Name: portfolio_masters; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY portfolio_masters (id, ref_id, portfolio, user_id, active_status, del_status, created_at, updated_at) FROM stdin;
2	S	Secretary	\N	t	f	2018-02-28 19:23:13.232969	2018-02-28 19:23:13.232969
3	FS	Financial Secretary	\N	t	f	2018-02-28 19:23:30.933384	2018-02-28 19:23:30.933384
1	P	President	\N	t	f	2018-02-28 19:22:50.351417	2018-02-28 19:29:59.866787
4	WC	Women Commissioner	\N	t	f	2018-03-30 17:40:46.463617	2018-03-30 17:40:46.463617
5	TR	Treasurer	\N	t	f	2018-04-05 23:18:00.441901	2018-04-05 23:18:00.441901
\.


--
-- Name: portfolio_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('portfolio_masters_id_seq', 5, true);


--
-- Data for Name: program_masters; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY program_masters (id, program_name, department_id, user_id, active_status, del_status, created_at, updated_at) FROM stdin;
1	Bsc. Accounting	1	\N	t	f	2018-02-27 19:27:01.398383	2018-02-27 19:35:01.230018
2	Bsc. Banking And Finance	2	\N	t	f	2018-03-03 18:56:14.310678	2018-03-03 18:56:14.310678
\.


--
-- Name: program_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('program_masters_id_seq', 2, true);


--
-- Data for Name: registered_voters; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY registered_voters (id, voter_id, surname, other_names, level_id, session_id, program_id, gender, vote_status, user_id, active_status, del_status, created_at, updated_at) FROM stdin;
7	10024390	Mensah	John	4	1	1	Male	f	\N	t	f	2018-04-17 10:28:54.460935	2018-04-17 10:28:54.460935
8	10090822	Suraj	Suley	4	1	2	Male	f	\N	t	f	2018-04-17 10:29:40.237441	2018-04-17 10:29:40.237441
9	10023133	Boateng	Nadia	4	2	1	Female	f	\N	t	f	2018-04-17 11:07:02.10507	2018-04-17 11:07:02.10507
1	10012565	Agozi	Clemence	4	1	1	Male	t	\N	t	f	2018-03-03 18:20:13.568319	2018-04-17 14:15:01.924873
2	10012451	Nana-Osafo	Bosompem	3	4	2	Male	t	\N	t	f	2018-03-03 18:55:30.895078	2018-04-17 14:16:12.387373
3	10034809	Adae	Freda	2	2	1	Female	t	\N	t	f	2018-03-04 00:51:34.566302	2018-04-17 14:16:46.007881
6	10092789	Quaye	Clara	3	2	1	Female	t	\N	t	f	2018-04-05 23:35:24.770756	2018-04-17 14:17:19.798045
5	10012432	Nartey	Francis	4	4	2	Male	t	\N	t	f	2018-04-05 23:34:54.569732	2018-04-17 14:17:58.722567
4	10034689	Dadson	Samson Kwesi	4	1	1	Male	t	\N	t	f	2018-03-12 19:34:16.160699	2018-04-17 14:18:36.542105
10	10009890	Asante	Mercy	2	2	2	Female	f	\N	t	f	2018-04-17 15:39:40.512544	2018-04-17 15:39:40.512544
\.


--
-- Name: registered_voters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('registered_voters_id_seq', 10, true);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY roles (id, name, active_status, del_status, user_id, created_at, updated_at) FROM stdin;
1	Super Admin	t	f	2	2018-03-11 12:16:39.487555	2018-03-11 13:38:36.644596
2	Verification Officer	t	f	2	2018-03-11 13:13:26.115069	2018-03-12 07:47:40.732297
4	App Admin	t	f	2	2018-03-16 14:38:06.601734	2018-03-16 14:38:06.601734
\.


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('roles_id_seq', 4, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY schema_migrations (version) FROM stdin;
20180215183949
20180215184133
20180215184652
20180215184935
20180215185100
20180215185718
20180215185901
20180215190712
20180215191033
20180215191509
20180215192133
20180215192326
20180228182547
20180303162321
20180303162830
20180304001325
20180304221353
20180304222457
20180305193940
20180306130239
20180306130758
20180309171348
20180310190450
20180311130706
20180315082036
20180409203957
20180410180124
20180417120437
\.


--
-- Data for Name: session_masters; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY session_masters (id, session, user_id, active_status, del_status, created_at, updated_at) FROM stdin;
3	Distance Learning	\N	t	f	2018-03-03 15:56:30.298346	2018-03-03 15:56:30.298346
4	Weekend	\N	t	f	2018-03-03 15:56:42.68718	2018-03-03 15:56:42.68718
2	Evening	\N	t	f	2018-03-03 15:56:17.167693	2018-03-09 17:53:48.521255
1	Morning	\N	t	f	2018-03-01 17:31:35.353935	2018-03-11 12:25:04.673665
\.


--
-- Name: session_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('session_masters_id_seq', 4, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, surname, other_names, username, active_status, del_status, role_id) FROM stdin;
9		$2a$11$piXdqgCr81H2ogk3GXsW9uJ1VpH6bBD/zzOdQwNlsNuUidBh6Yvzi	\N	\N	\N	33	2018-04-17 11:40:51.866239	2018-04-07 14:02:50.698478	154.160.19.76	41.66.255.72	2018-03-07 08:21:29.919628	2018-04-17 11:40:51.872659	Asamoah	David	david	t	f	2
2		$2a$11$GZPBypydZab2k17ooj9PqOBybB0m5WNbp7n0bzc4/gXsJCQlvnIWK	\N	\N	\N	51	2018-04-17 14:19:22.08603	2018-04-14 20:34:26.556496	154.160.19.76	41.66.255.206	2018-03-06 11:58:57.768349	2018-04-17 14:19:22.08821	Agozi	Clemence	clem	t	f	1
10		$2a$11$LOVj4TStGQ5Av.LDnwGPFO.B.AM67rEqiIz9vWiPGLoV4IVe6fZsy	\N	\N	\N	4	2018-04-02 12:32:53.250339	2018-03-21 13:11:27.838935	41.66.255.134	41.66.255.168	2018-03-19 10:58:28.49719	2018-04-02 12:32:53.252397	Awuah	Kojo	kojo	t	f	1
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('users_id_seq', 10, true);


--
-- Data for Name: vote_results; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY vote_results (id, portfolio_id, voter_id, candidate_id, user_id, active_status, del_status, created_at, updated_at, slot) FROM stdin;
1	P	10012565	10012565	\N	t	f	2018-04-17 14:14:48.461907	2018-04-17 14:14:48.461907	1
2	SEC_NONE	10012565	NONE	\N	t	f	2018-04-17 14:14:52.42954	2018-04-17 14:14:52.42954	0
3	TR	10012565	10034689	\N	t	f	2018-04-17 14:14:55.931092	2018-04-17 14:14:55.931092	1
4	FS_NONE	10012565	NONE	\N	t	f	2018-04-17 14:14:58.947009	2018-04-17 14:14:58.947009	0
5	WC_NONE	10012565	NONE	\N	t	f	2018-04-17 14:15:01.920591	2018-04-17 14:15:01.920591	0
6	P_NONE	10012451	NONE	\N	t	f	2018-04-17 14:15:59.983073	2018-04-17 14:15:59.983073	0
7	S	10012451	10092789	\N	t	f	2018-04-17 14:16:03.563772	2018-04-17 14:16:03.563772	1
8	TR	10012451	10034689	\N	t	f	2018-04-17 14:16:06.443995	2018-04-17 14:16:06.443995	1
9	FS_NONE	10012451	NONE	\N	t	f	2018-04-17 14:16:09.753878	2018-04-17 14:16:09.753878	0
10	WC	10012451	10023133	\N	t	f	2018-04-17 14:16:12.382963	2018-04-17 14:16:12.382963	1
11	P	10034809	10012451	\N	t	f	2018-04-17 14:16:33.053484	2018-04-17 14:16:33.053484	2
12	S	10034809	10012432	\N	t	f	2018-04-17 14:16:36.056633	2018-04-17 14:16:36.056633	2
13	TR	10034809	10034689	\N	t	f	2018-04-17 14:16:39.083336	2018-04-17 14:16:39.083336	1
14	FS	10034809	10024390	\N	t	f	2018-04-17 14:16:41.833966	2018-04-17 14:16:41.833966	1
15	WC	10034809	10023133	\N	t	f	2018-04-17 14:16:46.003389	2018-04-17 14:16:46.003389	1
16	P	10092789	10012565	\N	t	f	2018-04-17 14:17:06.903946	2018-04-17 14:17:06.903946	1
17	S	10092789	10012432	\N	t	f	2018-04-17 14:17:10.574095	2018-04-17 14:17:10.574095	2
18	TR	10092789	10034689	\N	t	f	2018-04-17 14:17:13.652748	2018-04-17 14:17:13.652748	1
19	FS	10092789	10024390	\N	t	f	2018-04-17 14:17:16.655025	2018-04-17 14:17:16.655025	1
20	WC	10092789	10023133	\N	t	f	2018-04-17 14:17:19.793675	2018-04-17 14:17:19.793675	1
21	P	10012432	10012565	\N	t	f	2018-04-17 14:17:44.121019	2018-04-17 14:17:44.121019	1
22	S	10012432	10092789	\N	t	f	2018-04-17 14:17:49.099298	2018-04-17 14:17:49.099298	1
23	TR	10012432	10034689	\N	t	f	2018-04-17 14:17:52.889591	2018-04-17 14:17:52.889591	1
24	FS_NONE	10012432	NONE	\N	t	f	2018-04-17 14:17:56.018084	2018-04-17 14:17:56.018084	0
25	WC	10012432	10023133	\N	t	f	2018-04-17 14:17:58.718096	2018-04-17 14:17:58.718096	1
26	P	10034689	10012451	\N	t	f	2018-04-17 14:18:23.252125	2018-04-17 14:18:23.252125	2
27	SEC_NONE	10034689	NONE	\N	t	f	2018-04-17 14:18:27.579979	2018-04-17 14:18:27.579979	0
28	TR_NONE	10034689	NONE	\N	t	f	2018-04-17 14:18:31.062706	2018-04-17 14:18:31.062706	0
29	FS	10034689	10024390	\N	t	f	2018-04-17 14:18:33.741687	2018-04-17 14:18:33.741687	1
30	WC	10034689	10023133	\N	t	f	2018-04-17 14:18:36.537719	2018-04-17 14:18:36.537719	1
\.


--
-- Name: vote_results_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('vote_results_id_seq', 30, true);


--
-- Data for Name: voter_tokens; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY voter_tokens (id, voter_id, token, user_id, active_status, del_status, created_at, updated_at) FROM stdin;
1	10012565	4f971d6b20f41460d992b042731a9c6e547fa8288ec12274d9dc59e89456a88f	\N	t	f	2018-04-17 11:41:55.407772	2018-04-17 11:41:55.407772
2	10012451	d999dae6a9d90b61f4f8373ea271c8308dbad05c33509f80ee57bdb314da6d07	\N	t	f	2018-04-17 11:42:14.919308	2018-04-17 11:42:14.919308
3	10034809	98c4ffc9a81922db4381e29a8f2977a63b834c9e680ebac6ac85b6fbc5a70737	\N	t	f	2018-04-17 11:42:37.068292	2018-04-17 11:42:37.068292
4	10092789	8031676ade45000b7476e62fa1296cdf6fd0ff89a81800f2e1ce2308be095876	\N	t	f	2018-04-17 11:43:38.500823	2018-04-17 11:43:38.500823
5	10012432	e889a55c5a9e7c0e55ff0e2d0da70cc89f23016a272f9be5740e850953e1d490	\N	t	f	2018-04-17 11:47:54.779232	2018-04-17 11:47:54.779232
6	10034689	223e123471a703914a6f6c79904d18d380bc6cf4831fd6b5df79985d0e95f70b	\N	t	f	2018-04-17 11:48:15.437313	2018-04-17 11:48:15.437313
\.


--
-- Name: voter_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('voter_tokens_id_seq', 6, true);


--
-- Name: add_voter_reasons add_voter_reasons_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY add_voter_reasons
    ADD CONSTRAINT add_voter_reasons_pkey PRIMARY KEY (id);


--
-- Name: candidate_masters candidate_masters_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY candidate_masters
    ADD CONSTRAINT candidate_masters_pkey PRIMARY KEY (id);


--
-- Name: department_masters department_masters_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY department_masters
    ADD CONSTRAINT department_masters_pkey PRIMARY KEY (id);


--
-- Name: faculty_masters faculty_masters_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY faculty_masters
    ADD CONSTRAINT faculty_masters_pkey PRIMARY KEY (id);


--
-- Name: gender_masters gender_masters_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY gender_masters
    ADD CONSTRAINT gender_masters_pkey PRIMARY KEY (id);


--
-- Name: level_masters level_masters_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY level_masters
    ADD CONSTRAINT level_masters_pkey PRIMARY KEY (id);


--
-- Name: models models_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY models
    ADD CONSTRAINT models_pkey PRIMARY KEY (id);


--
-- Name: portfolio_masters portfolio_masters_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY portfolio_masters
    ADD CONSTRAINT portfolio_masters_pkey PRIMARY KEY (id);


--
-- Name: program_masters program_masters_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY program_masters
    ADD CONSTRAINT program_masters_pkey PRIMARY KEY (id);


--
-- Name: registered_voters registered_voters_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY registered_voters
    ADD CONSTRAINT registered_voters_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: session_masters session_masters_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY session_masters
    ADD CONSTRAINT session_masters_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: vote_results vote_results_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY vote_results
    ADD CONSTRAINT vote_results_pkey PRIMARY KEY (id);


--
-- Name: voter_tokens voter_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY voter_tokens
    ADD CONSTRAINT voter_tokens_pkey PRIMARY KEY (id);


--
-- Name: index_models_on_email; Type: INDEX; Schema: public; Owner: clemence
--

CREATE UNIQUE INDEX index_models_on_email ON models USING btree (email);


--
-- Name: index_models_on_reset_password_token; Type: INDEX; Schema: public; Owner: clemence
--

CREATE UNIQUE INDEX index_models_on_reset_password_token ON models USING btree (reset_password_token);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: clemence
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: clemence
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

