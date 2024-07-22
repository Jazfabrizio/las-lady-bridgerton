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
-- Name: capitulos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.capitulos (
    id integer NOT NULL,
    description character varying(255) NOT NULL,
    temp_id integer,
    name character varying(255) NOT NULL
);


ALTER TABLE public.capitulos OWNER TO postgres;

--
-- Name: capitulos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.capitulos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.capitulos_id_seq OWNER TO postgres;

--
-- Name: capitulos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.capitulos_id_seq OWNED BY public.capitulos.id;


--
-- Name: mensajes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mensajes (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    description character varying(255) NOT NULL
);


ALTER TABLE public.mensajes OWNER TO postgres;

--
-- Name: mensajes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mensajes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mensajes_id_seq OWNER TO postgres;

--
-- Name: mensajes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mensajes_id_seq OWNED BY public.mensajes.id;


--
-- Name: personajes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personajes (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    temp_id integer
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
-- Name: temporadas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.temporadas (
    id integer NOT NULL,
    description character varying(255) NOT NULL,
    cant_chapters integer NOT NULL
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
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    password character varying(255) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: capitulos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.capitulos ALTER COLUMN id SET DEFAULT nextval('public.capitulos_id_seq'::regclass);


--
-- Name: mensajes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mensajes ALTER COLUMN id SET DEFAULT nextval('public.mensajes_id_seq'::regclass);


--
-- Name: personajes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personajes ALTER COLUMN id SET DEFAULT nextval('public.personajes_id_seq'::regclass);


--
-- Name: temporadas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temporadas ALTER COLUMN id SET DEFAULT nextval('public.temporadas_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: capitulos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.capitulos (id, description, temp_id, name) FROM stdin;
1	Diamond of the First Water	1	La temporada de la alta sociedad comienza, y Daphne Bridgerton es presentada a la reina. El duque de Hastings, Simon Basset, llega a Londres y pronto ambos idean un plan para fingir un cortejo que beneficiará a ambos.
2	Shock and Delight	1	Se revela el pasado traumático de Simon y su complicada relación con su difunto padre. Mientras tanto, Lady Featherington descubre un secreto sobre Marina Thompson.
3	Art of the Swoon	1	Daphne y Simon continúan con su farsa mientras el príncipe Friedrich muestra interés en Daphne. Marina recibe malas noticias sobre su amante, George.
4	An Affair of Honor	1	Simon y Daphne se acercan más durante un duelo que pone en riesgo su vida. Daphne se enfrenta a las expectativas de su familia y de la sociedad.
5	The Duke and I	1	Simon y Daphne deben persuadir a la reina para que les conceda una licencia especial de matrimonio. Marina toma medidas drásticas para asegurar su futuro.
6	Swish	1	La luna de miel de Simon y Daphne está marcada por malentendidos y tensiones sobre tener hijos. Eloise continúa su búsqueda para descubrir la identidad de Lady Whistledown.
7	Oceans Apart	1	Daphne descubre la verdad sobre los sentimientos de Simon hacia los hijos. La relación de Colin y Marina se tambalea tras una revelación.
8	After the Rain	1	Simon y Daphne trabajan en su relación mientras se avecina el nacimiento de un nuevo Bridgerton. Eloise descubre la identidad de Lady Whistledown.
10	Capital R Rake	2	Anthony Bridgerton busca una esposa adecuada, encontrando un desafío en Kate Sharma, quien protege a su hermana menor Edwina.
11	Off to the Races	2	Kate y Anthony compiten por demostrar su valía mientras Colin regresa de su viaje. Lady Featherington intenta asegurar el futuro de su familia.
12	A Bee in Your Bonnet	2	Un incidente con una abeja provoca recuerdos dolorosos para Anthony y lo acerca más a Kate.
13	Victory	2	Las tensiones entre Kate y Anthony alcanzan un punto de ruptura durante una competencia de caza.
14	An Unthinkable Fate:	2	Anthony y Kate luchan contra sus sentimientos crecientes mientras la temporada social se intensifica.
15	The Choice	2	Se acerca la boda de Edwina y Anthony, pero los sentimientos de Anthony hacia Kate complican todo.
16	Harmony	2	Anthony y Kate deben enfrentar las consecuencias de sus acciones mientras la verdad sale a la luz.
17	The Viscount Who Loved Me	2	La temporada concluye con decisiones cruciales para los Bridgerton y los Sharma, con Anthony y Kate tomando decisiones sobre su futuro.
18	Bajo la luz de la luna	3	Penelope comienza a tomar lecciones privadas para atraer pretendientes, pero las clases muy pronto se tornan complicadas. Una debutante se roba toda la atención de la reina.
19	Fuerzas de la naturaleza	3	Penelope atrae la atención de lord Debling, un codiciado amante de la naturaleza. Entretanto, Colin proviene un desastre durante un vendaval y se convierte en un verdadero héroe.
20	Amigos desde siempre	3	La llegada de una visita obliga a Penolope a tomar una difícil decisión. Para otros, las oportunidades de reinventarse-y encontrar el amor- abundan.
21	Tic, tac	3	El sorpresivo anuncio de compromiso en la revista de Lady Whistledown hace eco en la alta sociedad. Por su parte, Penelope lidia con la presión de revelar si verdadera identidad.
22	Seduciendo a Mr. Bridgerton	3	Una impostora desesperada se esfuerza por ganarse el favor de la reina. Penelope se apresura por escribir algo que pueda detener un daño, pero quizás sea demasiado tarde.
23	De la mano	3	Tras una impactante publicación de la revista de Lady Whistledown, la reina intensifica su búsqueda. La boda se acerca, y Penelope se cuestiona su futuro como esposa y escritora.
24	A la luz	3	Cuando su riva le exige un elevado precio por guardar su secreto, Penelope toma una difícil decisión al ver que sus relaciones y subsistencia penden de un hilo.
\.


--
-- Data for Name: mensajes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mensajes (id, username, description) FROM stdin;
\.


--
-- Data for Name: personajes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personajes (id, name, description, temp_id) FROM stdin;
1	Anthony Bridgerton	Es el cabeza de familia, conocido por su sentido del deber y protege a sus hermanos menores. A lo largo de la serie, lucha con sus propios deseos y responsabilidades familiares, especialmente cuando se enfrenta al amor y a las expectativas sociales.	1
2	Benedict Bridgerton	El segundo hermano de la familia, conocido por su talento artístico y búsqueda de un propósito más allá de las expectativas sociales. A través de su arte explora su identidad y deseos, alejándose de las normas tradicionales.	1
3	Colin Bridgerton	 Como el tercer hijo es aventurero y tiene una pasión por viajar y descubrir el mundo. A medida que madura, se enfrenta a decisiones sobre su carrera y el amor, influenciado por sus experiencias en el extranjero y sus relaciones en Londres.	1
4	Daphne Bridgerton	La hija mayor de la familia Bridgerton. Conocida por su belleza y elegancia, se convierte en la debutante más deseada de la temporada. Su vida cambia cuando inicia un romance fingido con el duque de Hastings, que pronto se convierte en algo más real.	1
5	Eloise Bridgerton	La segunda hija de la familia Bridgerton, muestra un espíritu rebelde y una mente inquisitiva. A diferencia de sus hermanas, no está interesada en casarse pronto y busca independencia y aventura en lugar de conformarse con las expectativas sociales.	1
6	Francesca Bridgerton	La sexta hija, Francesca, es más reservada en comparación con sus hermanos mayores. Su historia se explora más en las novelas posteriores de la serie, donde enfrenta desafíos personales y encuentra el amor.	1
7	Lady Violet Bridgerton	Matriarca amable y devota, se esfuerza por asegurar buenos matrimonios para sus ocho hijos en la alta sociedad londinense.	1
8	Gregory Bridgerton	Es el séptimo hijo de la familia Bridgerton, conocido por su naturaleza alegre y optimista.	1
9	Hyacinth Bridgerton	La hija menor de la familia Bridgerton, conocida por su inteligencia y espíritu vivaz.	1
10	Penelope Featherington	Amiga cercana de las Bridgerton y miembro de los Featherington. Aunque inicialmente discreta, es inteligente y perspicaz, navegando por la sociedad londinense mientras lidia con secretos familiares y emociones no correspondidas.	1
11	Simon Basset	Es un noble con una reputación de soltero impenitente y un fuerte sentido de independencia. Decide fingir un compromiso con Daphne para evitar las presiones sociales y pronto desarrolla sentimientos genuinos por ella.	1
12	Kate Sharma	Kate Sharma es una nueva en la sociedad londinense, conocida por su ingenio afilado y espíritu independiente. Se une a los Bridgerton enfrentando desafíos y capturando la atención de Anthony Bridgerton.	2
13	Reina Charlotte	Conocida por su elegancia y astucia, la reina es una observadora perspicaz de los asuntos de la corte y las intrigas sociales. Mientras maneja el equilibrio delicado entre el deber real y su propia curiosidad por los secretos de la alta sociedad.	1
14	John Stirling	Conde de Kilmartin, es un noble encantador y respetado, conocido por su amabilidad y carisma. Su matrimonio con Francesca Bridgerton es una unión notable, llena de amor y comprensión.	3
15	Lady Danbury	Es una figura prominente en la sociedad londinense, reconocida por su lengua afilada y su sabiduría. Actúa como mentora para varios personajes. Su carácter fuerte y su humor mordaz la hacen inolvidable en la alta sociedad.	1
\.


--
-- Data for Name: temporadas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temporadas (id, description, cant_chapters) FROM stdin;
1	Daphne Bridgerton entra en la sociedad londinense de la Regencia bajo la guía del misterioso Lord Hastings. Su relación ficticia con el duque se convierte en un torbellino de romance y escándalo mientras navegan las intrigas de la alta sociedad.	8
2	Anthony Bridgerton busca una esposa adecuada mientras enfrenta su propio conflicto interno entre el deber y el deseo. Su encuentro con la decidida y poco convencional Edwina Sharma complica aún más sus decisiones en la competitiva alta sociedad.	8
3	La tercera temporada de Bridgerton sigue los acontecimientos tras la inesperada revelación de Lady Whistledown. Los secretos de Penelope Featherington se vuelven más peligrosos mientras busca su propia felicidad en medio de la sociedad de la Regencia.	8
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, password) FROM stdin;
\.


--
-- Name: capitulos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.capitulos_id_seq', 1, false);


--
-- Name: mensajes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mensajes_id_seq', 1, false);


--
-- Name: personajes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personajes_id_seq', 1, false);


--
-- Name: temporadas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temporadas_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: capitulos capitulos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.capitulos
    ADD CONSTRAINT capitulos_pkey PRIMARY KEY (id);


--
-- Name: mensajes mensajes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mensajes
    ADD CONSTRAINT mensajes_pkey PRIMARY KEY (id);


--
-- Name: personajes personajes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personajes
    ADD CONSTRAINT personajes_pkey PRIMARY KEY (id);


--
-- Name: temporadas temporadas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temporadas
    ADD CONSTRAINT temporadas_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: capitulos capitulos_temp_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.capitulos
    ADD CONSTRAINT capitulos_temp_id_fkey FOREIGN KEY (temp_id) REFERENCES public.temporadas(id);


--
-- Name: mensajes mensajes_username_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mensajes
    ADD CONSTRAINT mensajes_username_fkey FOREIGN KEY (username) REFERENCES public.users(username);


--
-- Name: personajes personajes_temp_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personajes
    ADD CONSTRAINT personajes_temp_id_fkey FOREIGN KEY (temp_id) REFERENCES public.temporadas(id);


--
-- PostgreSQL database dump complete
--

