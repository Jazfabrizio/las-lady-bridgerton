--
-- PostgreSQL database dump
--

-- Dumped from database version 14.12 (Ubuntu 14.12-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.12 (Ubuntu 14.12-0ubuntu0.22.04.1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: chismes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chismes (
    id integer NOT NULL,
    description character varying(255) NOT NULL,
    temp_id integer
);


ALTER TABLE public.chismes OWNER TO postgres;

--
-- Name: chismes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chismes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chismes_id_seq OWNER TO postgres;

--
-- Name: chismes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chismes_id_seq OWNED BY public.chismes.id;


--
-- Name: participantes_chisme; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.participantes_chisme (
    id integer NOT NULL,
    id_personaje integer,
    id_chisme integer,
    id_rol integer
);


ALTER TABLE public.participantes_chisme OWNER TO postgres;

--
-- Name: participantes_chisme_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.participantes_chisme_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.participantes_chisme_id_seq OWNER TO postgres;

--
-- Name: participantes_chisme_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.participantes_chisme_id_seq OWNED BY public.participantes_chisme.id;


--
-- Name: personajes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personajes (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    temp_id integer,
    title character varying(255),
    partners integer,
    img character varying(255)
);


ALTER TABLE public.personajes OWNER TO postgres;

--
-- Name: personajes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personajes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personajes_id_seq OWNER TO postgres;

--
-- Name: personajes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personajes_id_seq OWNED BY public.personajes.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    description character varying(255) NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: temporadas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.temporadas (
    id integer NOT NULL,
    description character varying(255) NOT NULL,
    cant_chapters integer NOT NULL,
    gossip character varying(255),
    deaths integer,
    img character varying(255)
);


ALTER TABLE public.temporadas OWNER TO postgres;

--
-- Name: temporadas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.temporadas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.temporadas_id_seq OWNER TO postgres;

--
-- Name: temporadas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.temporadas_id_seq OWNED BY public.temporadas.id;


--
-- Name: chismes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chismes ALTER COLUMN id SET DEFAULT nextval('public.chismes_id_seq'::regclass);


--
-- Name: participantes_chisme id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.participantes_chisme ALTER COLUMN id SET DEFAULT nextval('public.participantes_chisme_id_seq'::regclass);


--
-- Name: personajes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personajes ALTER COLUMN id SET DEFAULT nextval('public.personajes_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: temporadas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temporadas ALTER COLUMN id SET DEFAULT nextval('public.temporadas_id_seq'::regclass);


--
-- Data for Name: chismes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chismes (id, description, temp_id) FROM stdin;
26	Se dice que Daphne Bridgerton tiene un romance secreto con un noble desconocido. Varios encuentros a escondidas y rumores de que el caballero es un rival en busca de su favor. ¡Qué misterio en los salones de Londres!	2
\.


--
-- Data for Name: participantes_chisme; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.participantes_chisme (id, id_personaje, id_chisme, id_rol) FROM stdin;
31	15	26	1
32	15	26	3
33	4	26	2
\.


--
-- Data for Name: personajes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personajes (id, name, description, temp_id, title, partners, img) FROM stdin;
5	Eloise Bridgerton	La segunda hija de la familia Bridgerton, muestra un espíritu rebelde y una mente inquisitiva. A diferencia de sus hermanas, no está interesada en casarse pronto y busca independencia y aventura en lugar de conformarse con las expectativas sociales.	1	\N	\N	https://i.pinimg.com/736x/a7/05/ed/a705ed865b238671007e20768e7a26f0.jpg
13	Reina Charlotte	Conocida por su elegancia y astucia, la reina es una observadora perspicaz de los asuntos de la corte y las intrigas sociales. Mientras maneja el equilibrio delicado entre el deber real y su propia curiosidad por los secretos de la alta sociedad.	1	Reina consorte de Gran Bretaña e Irlanda	\N	https://i.pinimg.com/564x/c5/47/73/c547734a88e1924a324433a7316631b3.jpg
14	John Starling	Conde de Kilmartin, es un noble encantador y respetado, conocido por su amabilidad y carisma. Su matrimonio con Francesca Bridgerton es una unión notable, llena de amor y comprensión.	2	Conde de Kilmartin	1	https://i.pinimg.com/736x/b2/7a/68/b27a680ec9ccf084e50937a81674ab5a.jpg
6	Francesca Bridgerton	La sexta hija, Francesca, es más reservada en comparación con sus hermanos mayores. Su historia se explora más en las novelas posteriores de la serie, donde enfrenta desafíos personales y encuentra el amor.	1	Duquesa de Kilmartin	\N	https://i.pinimg.com/736x/ae/ab/c9/aeabc9a78b763054e571b723d0d8b7b8.jpg
7	Lady Violet Bridgerton	Matriarca amable y devota, se esfuerza por asegurar buenos matrimonios para sus ocho hijos en la alta sociedad londinense.	1	Vizcondesa viuda Bridgerton	\N	https://i.pinimg.com/736x/eb/f4/1b/ebf41b4af9e7b7a4a160b0d208b1d53b.jpg
15	Lady Danbury	Es una figura prominente en la sociedad londinense, reconocida por su lengua afilada y su sabiduría. Actúa como mentora para varios personajes. Su carácter fuerte y su humor mordaz la hacen inolvidable en la alta sociedad.	1	Dama de compañía de la reina	\N	https://i.pinimg.com/564x/bb/cf/62/bbcf620137581e7c334c96304737e63c.jpg
8	Gregory Bridgerton	Es el séptimo hijo de la familia Bridgerton, conocido por su naturaleza alegre y optimista.	1	\N	\N	https://i.pinimg.com/564x/27/c4/a6/27c4a62ab260c45e76d233d9feb83b22.jpg
1	Anthony Bridgerton	Es el cabeza de familia, conocido por su sentido del deber y protege a sus hermanos menores. A lo largo de la serie, lucha con sus propios deseos y responsabilidades familiares, especialmente cuando se enfrenta al amor y a las expectativas sociales.	1	Vizconde de Bridgerton	\N	https://i.pinimg.com/564x/20/1d/6b/201d6b09aaa1010efe233530bd0ecb3d.jpg
2	Benedict Bridgerton	El segundo hermano de la familia, conocido por su talento artístico y búsqueda de un propósito más allá de las expectativas sociales. A través de su arte explora su identidad y deseos, alejándose de las normas tradicionales.	1	\N	\N	https://i.pinimg.com/736x/a2/c9/22/a2c922aa1a557c451f6d1b63895865c5.jpg
3	Colin Bridgerton	 Como el tercer hijo es aventurero y tiene una pasión por viajar y descubrir el mundo. A medida que madura, se enfrenta a decisiones sobre su carrera y el amor, influenciado por sus experiencias en el extranjero y sus relaciones en Londres.	1	\N	\N	https://i.pinimg.com/736x/55/0e/45/550e452653cfb398c5cf250f7b154aa7.jpg
4	Daphne Bridgerton	La hija mayor de la familia Bridgerton. Conocida por su belleza y elegancia, se convierte en la debutante más deseada de la temporada. Su vida cambia cuando inicia un romance fingido con el duque de Hastings, que pronto se convierte en algo más real.	1	Duquesa de Hastings	\N	https://i.pinimg.com/736x/7a/57/20/7a57200977eff756260db4fcd6011da9.jpg
9	Hyacinth Bridgerton	La hija menor de la familia Bridgerton, conocida por su inteligencia y espíritu vivaz.	1	\N	\N	https://i.pinimg.com/564x/a1/fe/12/a1fe1266714a3ed91bbe494c5fb9595b.jpg
10	Penelope Featherington	Amiga cercana de las Bridgerton y miembro de los Featherington. Aunque inicialmente discreta, es inteligente y perspicaz, navegando por la sociedad londinense mientras lidia con secretos familiares y emociones no correspondidas.	1	Lady Whistledown	\N	https://i.pinimg.com/736x/6e/23/68/6e23683569022dcd3fba8db6ea9800f1.jpg
11	Simon Basset	Es un noble con una reputación de soltero impenitente y un fuerte sentido de independencia. Decide fingir un compromiso con Daphne para evitar las presiones sociales y pronto desarrolla sentimientos genuinos por ella.	1	Duque de Hastings	\N	https://i.pinimg.com/564x/ae/8e/24/ae8e24106fdee0f221947e2e600ee20b.jpg
12	Kate Sharma	Kate Sharma es una nueva en la sociedad londinense, conocida por su ingenio afilado y espíritu independiente. Se une a los Bridgerton enfrentando desafíos y capturando la atención de Anthony Bridgerton.	2	Vizcondesa de Bridgerton	\N	https://i.pinimg.com/564x/51/a8/00/51a800009ad174f81a9cc34e50bb0bb0.jpg
25	Penelope Bridgerton		3	\N	\N	
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, description) FROM stdin;
1	Chismoso
2	Involucrado
3	Vocero
\.


--
-- Data for Name: temporadas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temporadas (id, description, cant_chapters, gossip, deaths, img) FROM stdin;
1	Daphne Bridgerton entra en la sociedad londinense de la Regencia bajo la guía del misterioso Lord Hastings. Su relación ficticia con el duque se convierte en un torbellino de romance y escándalo mientras navegan las intrigas de la alta sociedad.	8	El rumor de que la reina Charlotte cometió adulterio junto a plebeyo recorre el pueblo.	3	https://i.pinimg.com/564x/da/75/1f/da751f75b7f5bc754301e82bebf70591.jpg
2	Anthony Bridgerton busca una esposa adecuada mientras enfrenta su propio conflicto interno entre el deber y el deseo. Su encuentro con la decidida y poco convencional Edwina Sharma complica aún más sus decisiones en la competitiva alta sociedad.	8	Se corre la vos de que el hermano mayor de los Bridgerton, el cual se encuentra comprometido, estaría enamorado de la hermana de su prometida.	5	https://i0.wp.com/marvelousgeeksmedia.com/wp-content/uploads/2022/03/BridertonSeason2Cast.jpg?fit=1000%2C568&ssl=1
3	La tercera temporada de Bridgerton sigue los acontecimientos tras la inesperada revelación de Lady Whistledown. Los secretos de Penelope Featherington se vuelven más peligrosos mientras busca su propia felicidad en medio de la sociedad de la Regencia.	8	La señorita Penelope Featherington abandona su boda en medio de la seremonia, se dice que esta huyó debido a que se encontraba verdaderamente enamorada de un bridgerton	7	https://www.bu.edu/files/2024/06/bridgerton-crop-feat.jpg
\.


--
-- Name: chismes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chismes_id_seq', 28, true);


--
-- Name: participantes_chisme_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.participantes_chisme_id_seq', 39, true);


--
-- Name: personajes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personajes_id_seq', 25, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 3, true);


--
-- Name: temporadas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temporadas_id_seq', 1, false);


--
-- Name: chismes chismes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chismes
    ADD CONSTRAINT chismes_pkey PRIMARY KEY (id);


--
-- Name: participantes_chisme participantes_chisme_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.participantes_chisme
    ADD CONSTRAINT participantes_chisme_pkey PRIMARY KEY (id);


--
-- Name: personajes personajes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personajes
    ADD CONSTRAINT personajes_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: temporadas temporadas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temporadas
    ADD CONSTRAINT temporadas_pkey PRIMARY KEY (id);


--
-- Name: chismes chismes_temp_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chismes
    ADD CONSTRAINT chismes_temp_id_fkey FOREIGN KEY (temp_id) REFERENCES public.temporadas(id);


--
-- Name: participantes_chisme participantes_chisme_id_chisme_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.participantes_chisme
    ADD CONSTRAINT participantes_chisme_id_chisme_fkey FOREIGN KEY (id_chisme) REFERENCES public.chismes(id);


--
-- Name: participantes_chisme participantes_chisme_id_personaje_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.participantes_chisme
    ADD CONSTRAINT participantes_chisme_id_personaje_fkey FOREIGN KEY (id_personaje) REFERENCES public.personajes(id);


--
-- Name: participantes_chisme participantes_chisme_id_rol_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.participantes_chisme
    ADD CONSTRAINT participantes_chisme_id_rol_fkey FOREIGN KEY (id_rol) REFERENCES public.roles(id);


--
-- Name: personajes personajes_temp_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personajes
    ADD CONSTRAINT personajes_temp_id_fkey FOREIGN KEY (temp_id) REFERENCES public.temporadas(id);


--
-- PostgreSQL database dump complete
--

