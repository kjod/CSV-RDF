--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.13
-- Dumped by pg_dump version 9.5.13

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
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


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- Name: country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.country (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE public.country OWNER TO postgres;

--
-- Name: country_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.country_id_seq OWNER TO postgres;

--
-- Name: country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.country_id_seq OWNED BY public.country.id;


--
-- Name: grape; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grape (
    id integer NOT NULL,
    colour character varying,
    name character varying
);


ALTER TABLE public.grape OWNER TO postgres;

--
-- Name: grape_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.grape_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.grape_id_seq OWNER TO postgres;

--
-- Name: grape_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.grape_id_seq OWNED BY public.grape.id;


--
-- Name: ingredients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ingredients (
    id integer NOT NULL,
    grape_id integer,
    wine_id integer
);


ALTER TABLE public.ingredients OWNER TO postgres;

--
-- Name: ingredients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ingredients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ingredients_id_seq OWNER TO postgres;

--
-- Name: ingredients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ingredients_id_seq OWNED BY public.ingredients.id;


--
-- Name: region; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.region (
    id integer NOT NULL,
    country_id integer,
    name character varying
);


ALTER TABLE public.region OWNER TO postgres;

--
-- Name: region_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.region_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.region_id_seq OWNER TO postgres;

--
-- Name: region_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.region_id_seq OWNED BY public.region.id;


--
-- Name: tasting_note; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tasting_note (
    id integer NOT NULL,
    wine_id integer,
    note character varying
);


ALTER TABLE public.tasting_note OWNER TO postgres;

--
-- Name: tasting_note_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tasting_note_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tasting_note_id_seq OWNER TO postgres;

--
-- Name: tasting_note_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tasting_note_id_seq OWNED BY public.tasting_note.id;


--
-- Name: wine; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wine (
    id integer NOT NULL,
    region_id integer,
    body character varying,
    sweetness character varying,
    name character varying,
    wine_type character varying
);


ALTER TABLE public.wine OWNER TO postgres;

--
-- Name: wine_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wine_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wine_id_seq OWNER TO postgres;

--
-- Name: wine_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wine_id_seq OWNED BY public.wine.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country ALTER COLUMN id SET DEFAULT nextval('public.country_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grape ALTER COLUMN id SET DEFAULT nextval('public.grape_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredients ALTER COLUMN id SET DEFAULT nextval('public.ingredients_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.region ALTER COLUMN id SET DEFAULT nextval('public.region_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasting_note ALTER COLUMN id SET DEFAULT nextval('public.tasting_note_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wine ALTER COLUMN id SET DEFAULT nextval('public.wine_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alembic_version (version_num) FROM stdin;
f2bc01a44e22
\.


--
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.country (id, name) FROM stdin;
1	France
2	USA
3	South Africa
4	Australia
5	New Zealand
6	Chile
7	Argentina
8	Germany
9	Italy
10	Greece
11	Morocco
\.


--
-- Name: country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.country_id_seq', 11, true);


--
-- Data for Name: grape; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.grape (id, colour, name) FROM stdin;
1	Red	Cabernet Sauvignon
2	Red	Pinot Noir
3	White	Pinot Grigio
4	White	Riesling
5	White	Chardonnay
6	White	Sauvignon Blanc
7	Red	Nebbiolo
8	Red	Shiraz
9	Red	Syrah
10	Red	Tempranillo
11	White	Semillon
12	Red	Pinotage
13	White	Ortega
14	White	Greco
15	Red	Primitivo
16	Red	Zinfandel
17	White	Grenache Blanc
18	Noir	Grenache
\.


--
-- Name: grape_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.grape_id_seq', 18, true);


--
-- Data for Name: ingredients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ingredients (id, grape_id, wine_id) FROM stdin;
1	17	1
2	17	2
3	17	3
4	14	4
5	14	5
6	6	6
7	6	7
8	6	8
9	5	9
10	2	9
11	5	10
12	2	10
13	11	11
14	11	12
15	9	13
16	9	14
17	9	15
18	16	16
19	10	17
20	8	17
21	15	18
\.


--
-- Name: ingredients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ingredients_id_seq', 21, true);


--
-- Data for Name: region; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.region (id, country_id, name) FROM stdin;
1	11	Atlas Mountains
2	3	Durbanville
3	3	Constantia
4	3	Stellenbosch
5	3	Swartland
6	7	La Rioja
7	7	Mendoza
8	7	Rio Negro
9	6	Maipo Valley
10	6	Casablanca Valley
11	6	Choapa Valley
12	2	California
13	2	Michigan
14	2	New Mexico
15	1	Bordeaux
16	1	Burgundy
17	1	Champagne
18	1	Jura
19	1	Rhone
20	8	Baden
21	8	Rheinhesson
22	8	Saxony
23	10	Macedonia
24	10	Aegean Islands
25	10	Ionian Islands
26	9	Lombardy
27	9	Piedmont
28	9	Tuscany
29	9	Sardinia
30	5	Malborough
\.


--
-- Name: region_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.region_id_seq', 30, true);


--
-- Data for Name: tasting_note; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tasting_note (id, wine_id, note) FROM stdin;
1	1	tropical
2	3	tropical
3	4	tropical
4	5	floral
5	5	orange blossom
6	5	tropical
7	6	gooseberry
8	6	melon
9	7	gooseberry
10	7	nectarine
11	7	passionfruit
12	7	floral
13	8	citrus
14	8	herbal
15	9	nutty
16	10	citrus
17	10	grapefruit
18	10	honey
19	11	lime 
20	11	floral
21	11	tropical
22	14	fruity
23	14	chocolate
24	15	berry
25	16	berry
\.


--
-- Name: tasting_note_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tasting_note_id_seq', 25, true);


--
-- Data for Name: wine; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wine (id, region_id, body, sweetness, name, wine_type) FROM stdin;
1	30	Balanced	Medium	Chateau des Tours	White
2	1	Balanced	Sweet	Villeneuve Rivesaltes Ambre	White
3	1	Balanced	Medium	Papillon Blanc	White
4	9	Balanced	Medium	Feudi di San Gregorio	White
5	9	Balanced	Medium	Mastroberardino	White
6	5	Balanced	off-dry	Cloudy Bay Sauvignon Blanc	White
7	26	Full	off-dry	Pavillan blanc de chateaux margaux	White
8	1	Balanced	off-dry	Sancere les baronnes	White
9	28	Full	Dry	Dom Perignon Brut	White
10	28	Full	Dry	Bollinger R.D Extra Brut	White
11	4	Balanced	Medium	Mount Pleasant Elizabeth Semillon	White
12	16	Light	Sweet	Die Ouwingerdreeks Kokerboom	White
13	2	Balanced	NaN	Bionic Frog	Red
14	3	Full	NaN	Boekenhoutskloof The Chocolate Block	Red
15	23	Light	Medium	Shafer Vineyards Relentless	Red
16	23	Light	Sweet	Ridge Vineyards Geyserville	Red
17	23	Full	Medium	Matchbook Tinto Rey	Red
18	9	Full	NaN	Sessantanni Old Vines Primitivo di Manduria	Red
\.


--
-- Name: wine_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wine_id_seq', 18, true);


--
-- Name: alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: country_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (id);


--
-- Name: grape_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grape
    ADD CONSTRAINT grape_pkey PRIMARY KEY (id);


--
-- Name: ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT ingredients_pkey PRIMARY KEY (id);


--
-- Name: region_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.region
    ADD CONSTRAINT region_pkey PRIMARY KEY (id);


--
-- Name: tasting_note_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasting_note
    ADD CONSTRAINT tasting_note_pkey PRIMARY KEY (id);


--
-- Name: wine_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wine
    ADD CONSTRAINT wine_pkey PRIMARY KEY (id);


--
-- Name: ingredients_grape_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT ingredients_grape_id_fkey FOREIGN KEY (grape_id) REFERENCES public.grape(id);


--
-- Name: ingredients_wine_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT ingredients_wine_id_fkey FOREIGN KEY (wine_id) REFERENCES public.wine(id);


--
-- Name: region_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.region
    ADD CONSTRAINT region_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.country(id);


--
-- Name: tasting_note_wine_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasting_note
    ADD CONSTRAINT tasting_note_wine_id_fkey FOREIGN KEY (wine_id) REFERENCES public.wine(id);


--
-- Name: wine_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wine
    ADD CONSTRAINT wine_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.region(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

