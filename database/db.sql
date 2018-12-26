--
-- PostgreSQL database dump
--

-- Dumped from database version 11.0
-- Dumped by pg_dump version 11.0

-- Started on 2018-12-26 17:05:57

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 199 (class 1259 OID 25980)
-- Name: books; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.books (
    id integer NOT NULL,
    book_title character varying,
    book_number integer,
    publication_year integer,
    author character varying
);


ALTER TABLE public.books OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 25978)
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.books_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.books_id_seq OWNER TO postgres;

--
-- TOC entry 2829 (class 0 OID 0)
-- Dependencies: 198
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.books_id_seq OWNED BY public.books.id;


--
-- TOC entry 197 (class 1259 OID 25969)
-- Name: borrowing; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.borrowing (
    id integer NOT NULL,
    date_borrowing character varying,
    date_returning character varying,
    borrower_name character varying,
    book_number integer,
    book_title character varying
);


ALTER TABLE public.borrowing OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 25967)
-- Name: borrowing_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.borrowing_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.borrowing_id_seq OWNER TO postgres;

--
-- TOC entry 2830 (class 0 OID 0)
-- Dependencies: 196
-- Name: borrowing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.borrowing_id_seq OWNED BY public.borrowing.id;


--
-- TOC entry 2694 (class 2604 OID 25983)
-- Name: books id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books ALTER COLUMN id SET DEFAULT nextval('public.books_id_seq'::regclass);


--
-- TOC entry 2693 (class 2604 OID 25972)
-- Name: borrowing id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.borrowing ALTER COLUMN id SET DEFAULT nextval('public.borrowing_id_seq'::regclass);


--
-- TOC entry 2823 (class 0 OID 25980)
-- Dependencies: 199
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.books (id, book_title, book_number, publication_year, author) FROM stdin;
1	One Piece	1	1996	Eichiro Oda
2	Dragon Ball	2	1990	Akagami Shanks
3	Detektif Conan	3	1995	Takanome Mihawk
4	Kungfu Boy	4	1992	Sengoku
5	Yu gi Oh	71	1992	Kazuki Takahashi
\.


--
-- TOC entry 2821 (class 0 OID 25969)
-- Dependencies: 197
-- Data for Name: borrowing; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.borrowing (id, date_borrowing, date_returning, borrower_name, book_number, book_title) FROM stdin;
3	2018-12-26	2018-12-28	Azman	1	One Piece
4	2018-12-27	2018-12-27	test	2	Dragon Ball
5	2018-12-27	2018-12-28	Nanda	1	One Piece
\.


--
-- TOC entry 2831 (class 0 OID 0)
-- Dependencies: 198
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.books_id_seq', 5, true);


--
-- TOC entry 2832 (class 0 OID 0)
-- Dependencies: 196
-- Name: borrowing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.borrowing_id_seq', 5, true);


--
-- TOC entry 2698 (class 2606 OID 25988)
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 25977)
-- Name: borrowing borrowing_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.borrowing
    ADD CONSTRAINT borrowing_pkey PRIMARY KEY (id);


-- Completed on 2018-12-26 17:05:59

--
-- PostgreSQL database dump complete
--

