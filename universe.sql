--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: description; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.description (
    description_id integer NOT NULL,
    name character varying NOT NULL,
    galaxy boolean NOT NULL,
    planet boolean,
    star boolean,
    moon boolean
);


ALTER TABLE public.description OWNER TO freecodecamp;

--
-- Name: description_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.description_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.description_id_seq OWNER TO freecodecamp;

--
-- Name: description_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.description_id_seq OWNED BY public.description.description_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    galaxy_type character varying(30),
    size_in_lightyears integer NOT NULL,
    age_in_billion_years numeric(3,1)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying,
    is_spherical boolean NOT NULL,
    discovered_year integer NOT NULL,
    planet text,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    star character varying(30) NOT NULL,
    discovered_year character varying(30),
    planet_types character varying(30),
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying,
    system character varying(30) NOT NULL,
    age_in_billion_of_years character varying(30),
    type_of_star character varying(30),
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: description description_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.description ALTER COLUMN description_id SET DEFAULT nextval('public.description_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: description; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.description VALUES (2, 'Sun', false, false, true, false);
INSERT INTO public.description VALUES (3, 'Earth', false, true, false, false);
INSERT INTO public.description VALUES (4, 'Moon', false, false, false, true);
INSERT INTO public.description VALUES (1, 'Milky Way', true, false, false, false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred Spiral Galaxy', 87400, 13.8);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'Barred Spiral Galaxy', 152000, 10.0);
INSERT INTO public.galaxy VALUES (3, 'Hoags Object', 'Ring Galaxy', 100000, 12.7);
INSERT INTO public.galaxy VALUES (4, 'Mayalls Object', 'Interacting', 100000, 12.8);
INSERT INTO public.galaxy VALUES (5, 'Black Eye Galaxy', 'Spiral Galaxy', 26481, 13.2);
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', NULL, 49000, 13.2);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'Europa', true, 1610, 'Jupiter', 1);
INSERT INTO public.moon VALUES (3, 'Ganymede', true, 1610, 'Jupiter', 1);
INSERT INTO public.moon VALUES (5, 'Lo', true, 1610, 'Jupiter', 1);
INSERT INTO public.moon VALUES (7, 'Callisto', true, 1610, 'Jupiter', 1);
INSERT INTO public.moon VALUES (13, 'Amalthea', true, 1892, 'Jupiter', 1);
INSERT INTO public.moon VALUES (15, 'Himalia', true, 1904, 'Jupiter', 1);
INSERT INTO public.moon VALUES (19, 'Herse', false, 2003, 'Jupiter', 1);
INSERT INTO public.moon VALUES (20, 'Cyllene', true, 2003, 'Jupiter', 1);
INSERT INTO public.moon VALUES (9, 'Phobos', false, 1877, 'Mars', 2);
INSERT INTO public.moon VALUES (4, 'Titan', true, 1655, 'Saturn', 4);
INSERT INTO public.moon VALUES (6, 'Enceladus', true, 1789, 'Saturn', 4);
INSERT INTO public.moon VALUES (8, 'Lapetus', true, 1671, 'Saturn', 4);
INSERT INTO public.moon VALUES (10, 'Hyperion', false, 1848, 'Saturn', 4);
INSERT INTO public.moon VALUES (11, 'Mimas', true, 1789, 'Saturn', 4);
INSERT INTO public.moon VALUES (14, 'Daphnis', false, 2005, 'Saturn', 4);
INSERT INTO public.moon VALUES (16, 'Methone', false, 2004, 'Saturn', 4);
INSERT INTO public.moon VALUES (17, 'Dione', true, 1684, 'Saturn', 4);
INSERT INTO public.moon VALUES (18, 'Epimetheus', false, 1966, 'Saturn', 4);
INSERT INTO public.moon VALUES (1, 'Moon', true, 1609, 'Earth', 7);
INSERT INTO public.moon VALUES (12, 'Triton', true, 1846, 'Neptune', 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Jupiter', 'Sun', '1610', 'Gas Giant', 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'Sun', '1610', 'Terrestrial', 1);
INSERT INTO public.planet VALUES (3, 'Neptune', 'Sun', '1846', 'Ice Giant', 1);
INSERT INTO public.planet VALUES (4, 'Saturn', 'Sun', '1610', 'Gas Giant', 1);
INSERT INTO public.planet VALUES (5, 'Mercury', 'Sun', '265 BC', 'Terrestrial', 1);
INSERT INTO public.planet VALUES (6, 'Uranus', 'Sun', '1781', 'Ice Giant', 1);
INSERT INTO public.planet VALUES (7, 'Earth', 'Sun', 'null', 'Terrestrial', 1);
INSERT INTO public.planet VALUES (8, 'Venus', 'Sun', '1610', 'Terrestrial', 1);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri B', 'Proxima Centauri', '2002', 'Exo', 4);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri d', 'Proxima Centauri', '2020', 'Exo', 4);
INSERT INTO public.planet VALUES (11, 'Lalande 21185 B', 'Lalande 21185', '2017', 'Exo', 6);
INSERT INTO public.planet VALUES (12, 'Lalande 21185 C', 'Lalande 21185', '2021', 'Exo', 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Solar System', '4.6', 'G Dwarf', 1);
INSERT INTO public.star VALUES (2, 'Barnards', 'ophiuchus', '10.0', 'red dwarf', 1);
INSERT INTO public.star VALUES (3, 'Barnards Star', 'Ophiuhcus', '10.0', 'Red Dwarf', 1);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 'Alpha Centauri', '4.8', 'Red Dwarf', 1);
INSERT INTO public.star VALUES (5, 'Wolf 359', 'Leo', '1', 'Red Dwarf', 1);
INSERT INTO public.star VALUES (6, 'Lalande', 'Ursa Major', '7.5', 'Red Dwarf', 1);
INSERT INTO public.star VALUES (7, 'HD 33946', 'Orion', '1', 'Giant Star', 1);


--
-- Name: description_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.description_id_seq', 4, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 7, true);


--
-- Name: description description_description_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.description
    ADD CONSTRAINT description_description_id_key UNIQUE (description_id);


--
-- Name: description description_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.description
    ADD CONSTRAINT description_pkey PRIMARY KEY (description_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--
