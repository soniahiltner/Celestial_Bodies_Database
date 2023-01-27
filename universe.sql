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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    type character varying(50) NOT NULL,
    millions_light_years_from_earth numeric(5,2),
    visible_to_the_naked_eye boolean,
    constellation character varying(50)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    diameter_km numeric(5,1) NOT NULL,
    solar_year numeric(5,2),
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    dimension numeric(8,5) NOT NULL,
    millions_km_from_sun numeric(6,1),
    closets_from_the_sun integer,
    small_to_large_not_dwarf_planets integer,
    has_moon boolean,
    star_id integer,
    type_of_planet_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    magnitud numeric(3,2) NOT NULL,
    millions_light_years_from_earth numeric(11,7),
    color character varying(150),
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: type_of_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.type_of_planet (
    type_of_planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    composition text NOT NULL
);


ALTER TABLE public.type_of_planet OWNER TO freecodecamp;

--
-- Name: type_of_planet_type_of_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.type_of_planet_type_of_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.type_of_planet_type_of_planet_id_seq OWNER TO freecodecamp;

--
-- Name: type_of_planet_type_of_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.type_of_planet_type_of_planet_id_seq OWNED BY public.type_of_planet.type_of_planet_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: type_of_planet type_of_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.type_of_planet ALTER COLUMN type_of_planet_id SET DEFAULT nextval('public.type_of_planet_type_of_planet_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 0.00, true, 'Sagitarius');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2.50, true, 'Andromeda');
INSERT INTO public.galaxy VALUES (3, 'Little Sombrero', 'Spiral', 40.00, false, 'Little Sombrero');
INSERT INTO public.galaxy VALUES (4, 'Cigar', 'Spiral', 12.00, false, 'Ursa Major');
INSERT INTO public.galaxy VALUES (5, 'Black Eye', 'Spiral', 17.00, false, 'Coma Berenices');
INSERT INTO public.galaxy VALUES (6, 'Condor', 'Spiral', 212.00, false, 'Pavo');
INSERT INTO public.galaxy VALUES (7, 'Circinus', 'Spiral', 13.00, false, 'Circinus');
INSERT INTO public.galaxy VALUES (8, 'Eye of Sauron', 'Spiral', 15.80, false, 'Canes Venatici');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Io', 3643.2, 12.00, 5);
INSERT INTO public.moon VALUES (2, 'Europa', 3121.6, 12.00, 5);
INSERT INTO public.moon VALUES (3, 'Ganymede', 5268.0, 12.00, 5);
INSERT INTO public.moon VALUES (4, 'Callisto', 4820.6, 12.00, 5);
INSERT INTO public.moon VALUES (5, 'Deimos', 12.4, 1.88, 4);
INSERT INTO public.moon VALUES (6, 'Phobos', 22.5, 1.88, 4);
INSERT INTO public.moon VALUES (7, 'Titan', 5152.0, 29.45, 6);
INSERT INTO public.moon VALUES (8, 'Enceladus', 504.2, 29.45, 6);
INSERT INTO public.moon VALUES (9, 'Dione', 1122.8, 29.45, 6);
INSERT INTO public.moon VALUES (10, 'Oberon', 1522.8, 84.00, 7);
INSERT INTO public.moon VALUES (11, 'Titania', 1576.8, 84.00, 7);
INSERT INTO public.moon VALUES (12, 'Ariel', 1157.8, 84.00, 7);
INSERT INTO public.moon VALUES (13, 'Umbriel', 1169.4, 84.00, 7);
INSERT INTO public.moon VALUES (14, 'Miranda', 471.6, 84.00, 7);
INSERT INTO public.moon VALUES (15, 'Desdemona', 64.0, 84.00, 7);
INSERT INTO public.moon VALUES (16, 'Ophelia', 42.8, 84.00, 7);
INSERT INTO public.moon VALUES (17, 'Puck', 162.0, 84.00, 7);
INSERT INTO public.moon VALUES (18, 'Triton', 2706.0, 165.00, 9);
INSERT INTO public.moon VALUES (19, 'Nereid', 357.0, 165.00, 9);
INSERT INTO public.moon VALUES (20, 'Proteus', 420.0, 165.00, 9);
INSERT INTO public.moon VALUES (21, 'Charon', 1212.0, 248.00, 8);
INSERT INTO public.moon VALUES (22, 'Kerberos', 12.6, 248.00, 8);
INSERT INTO public.moon VALUES (23, 'Styx', 11.0, 248.00, 8);
INSERT INTO public.moon VALUES (24, 'Nix', 45.0, 248.00, 8);
INSERT INTO public.moon VALUES (25, 'Hydra', 55.0, 165.00, 9);
INSERT INTO public.moon VALUES (26, 'Earth Moon', 3474.0, 1.00, 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0.05500, 45.9, 1, 1, false, 1, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 0.81500, 108.0, 2, 3, false, 1, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 1.00000, 147.1, 3, 4, true, 1, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 0.10700, 206.7, 4, 2, true, 1, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 318.00000, 740.7, 6, 8, true, 1, 2);
INSERT INTO public.planet VALUES (6, 'Saturn', 95.00000, 843.6, 7, 7, true, 1, 2);
INSERT INTO public.planet VALUES (7, 'Uranus', 14.00000, 1698.0, 8, 6, true, 1, 3);
INSERT INTO public.planet VALUES (8, 'Pluto', 0.00220, 5800.0, 10, NULL, true, 1, 4);
INSERT INTO public.planet VALUES (9, 'Neptune', 17.00000, 2778.0, 9, 5, true, 1, 3);
INSERT INTO public.planet VALUES (10, 'Ceres', 0.00016, 414.0, 5, NULL, false, 1, 4);
INSERT INTO public.planet VALUES (11, 'Makemake', 0.00067, 7850.0, 11, NULL, true, 1, 4);
INSERT INTO public.planet VALUES (12, 'Eris', 0.00500, 17400.0, 12, NULL, true, 1, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'The Sun', 1.00, 0.0000158, 'White to Yellow', 1);
INSERT INTO public.star VALUES (2, 'Sirius', -1.47, 8.6000000, 'Blue', 1);
INSERT INTO public.star VALUES (3, 'Canopus', -0.72, 310.0000000, 'Blue to White', 1);
INSERT INTO public.star VALUES (4, 'Rigil Kentaurus', -0.01, 4.4000000, 'White to Yellow', 1);
INSERT INTO public.star VALUES (5, 'Arcturus', 0.04, 37.0000000, 'Orange', 1);
INSERT INTO public.star VALUES (6, 'Vega', 0.03, 25.0000000, 'Blue', 1);
INSERT INTO public.star VALUES (7, 'Capella', 0.71, 43.0000000, 'White to Yellow', 1);
INSERT INTO public.star VALUES (8, 'Rigel', 0.12, 860.0000000, 'Blue', 1);
INSERT INTO public.star VALUES (9, 'Procyon', 0.34, 11.0000000, 'Blue to White', 1);
INSERT INTO public.star VALUES (10, 'Achernar', 0.50, 139.0000000, 'Blue', 1);
INSERT INTO public.star VALUES (11, 'Antares', 1.09, 600.0000000, 'Red', 1);


--
-- Data for Name: type_of_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.type_of_planet VALUES (1, 'Terrestrial', 'Planets composed mainly of silicates and metals');
INSERT INTO public.type_of_planet VALUES (2, 'Gas Giants', 'Planets composed mainly of gases hydrogen and helium');
INSERT INTO public.type_of_planet VALUES (3, 'Ice Giants', 'Planets compose primarily of ices');
INSERT INTO public.type_of_planet VALUES (4, 'Dwarf', 'Small, quasi-planets');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 26, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 11, true);


--
-- Name: type_of_planet_type_of_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.type_of_planet_type_of_planet_id_seq', 4, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: type_of_planet type_of_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.type_of_planet
    ADD CONSTRAINT type_of_planet_name_key UNIQUE (name);


--
-- Name: type_of_planet type_of_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.type_of_planet
    ADD CONSTRAINT type_of_planet_pkey PRIMARY KEY (type_of_planet_id);


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
-- Name: planet planet_type_of_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_type_of_planet_id_fkey FOREIGN KEY (type_of_planet_id) REFERENCES public.type_of_planet(type_of_planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

