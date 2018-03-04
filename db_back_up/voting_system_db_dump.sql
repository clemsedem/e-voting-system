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
-- Name: candidate_masters; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE candidate_masters (
    id integer NOT NULL,
    voter_id character varying,
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
-- Name: vote_results; Type: TABLE; Schema: public; Owner: clemence
--

CREATE TABLE vote_results (
    id integer NOT NULL,
    portfolio_id character varying,
    voter_id character varying,
    candidate_id integer,
    user_id integer,
    active_status boolean,
    del_status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
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
-- Name: session_masters id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY session_masters ALTER COLUMN id SET DEFAULT nextval('session_masters_id_seq'::regclass);


--
-- Name: vote_results id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY vote_results ALTER COLUMN id SET DEFAULT nextval('vote_results_id_seq'::regclass);


--
-- Name: voter_tokens id; Type: DEFAULT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY voter_tokens ALTER COLUMN id SET DEFAULT nextval('voter_tokens_id_seq'::regclass);


--
-- Data for Name: candidate_masters; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY candidate_masters (id, voter_id, portfolio_id, user_id, active_status, del_status, created_at, updated_at, slot_id, image_file_name, image_content_type, image_file_size, image_updated_at) FROM stdin;
2	10012451	FS	\N	t	f	2018-03-03 21:42:47.351663	2018-03-03 21:55:03.02035	\N	\N	\N	\N	\N
1	10012565	P	\N	t	f	2018-03-03 20:52:22.932892	2018-03-04 10:01:31.964618	\N	image11.jpg	image/jpeg	6181	2018-03-04 00:31:04.199864
3	10034809	S	\N	t	f	2018-03-04 00:51:54.08539	2018-03-04 11:45:27.45339	\N	\N	\N	\N	\N
\.


--
-- Name: candidate_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('candidate_masters_id_seq', 3, true);


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
-- Data for Name: portfolio_masters; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY portfolio_masters (id, ref_id, portfolio, user_id, active_status, del_status, created_at, updated_at) FROM stdin;
2	S	Secretary	\N	t	f	2018-02-28 19:23:13.232969	2018-02-28 19:23:13.232969
3	FS	Financial Secretary	\N	t	f	2018-02-28 19:23:30.933384	2018-02-28 19:23:30.933384
1	P	President	\N	t	f	2018-02-28 19:22:50.351417	2018-02-28 19:29:59.866787
\.


--
-- Name: portfolio_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('portfolio_masters_id_seq', 3, true);


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
1	10012565	Agozi	Clemence	4	1	1	Male	f	\N	t	f	2018-03-03 18:20:13.568319	2018-03-03 18:34:21.632041
2	10012451	Nana-Osafo	Bosompem	3	4	2	Male	f	\N	t	f	2018-03-03 18:55:30.895078	2018-03-03 19:03:31.820186
3	10034809	Adae	Freda	2	2	1	Female	f	\N	t	f	2018-03-04 00:51:34.566302	2018-03-04 00:51:34.566302
\.


--
-- Name: registered_voters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('registered_voters_id_seq', 3, true);


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
\.


--
-- Data for Name: session_masters; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY session_masters (id, session, user_id, active_status, del_status, created_at, updated_at) FROM stdin;
1	Morning	\N	t	f	2018-03-01 17:31:35.353935	2018-03-01 17:31:56.486753
2	Evening	\N	t	f	2018-03-03 15:56:17.167693	2018-03-03 15:56:17.167693
3	Distance Learning	\N	t	f	2018-03-03 15:56:30.298346	2018-03-03 15:56:30.298346
4	Weekend	\N	t	f	2018-03-03 15:56:42.68718	2018-03-03 15:56:42.68718
\.


--
-- Name: session_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('session_masters_id_seq', 4, true);


--
-- Data for Name: vote_results; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY vote_results (id, portfolio_id, voter_id, candidate_id, user_id, active_status, del_status, created_at, updated_at) FROM stdin;
\.


--
-- Name: vote_results_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('vote_results_id_seq', 1, false);


--
-- Data for Name: voter_tokens; Type: TABLE DATA; Schema: public; Owner: clemence
--

COPY voter_tokens (id, voter_id, token, user_id, active_status, del_status, created_at, updated_at) FROM stdin;
\.


--
-- Name: voter_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clemence
--

SELECT pg_catalog.setval('voter_tokens_id_seq', 1, false);


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
-- Name: session_masters session_masters_pkey; Type: CONSTRAINT; Schema: public; Owner: clemence
--

ALTER TABLE ONLY session_masters
    ADD CONSTRAINT session_masters_pkey PRIMARY KEY (id);


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
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: clemence
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

