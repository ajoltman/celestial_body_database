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
    name character varying NOT NULL,
    description text,
    galaxy_type character varying(100),
    distance_from_earth_in_mly integer NOT NULL,
    is_spherical boolean DEFAULT false NOT NULL
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
    name character varying NOT NULL,
    description text,
    parent character varying(100),
    year_discovered integer NOT NULL,
    is_spherical boolean DEFAULT false NOT NULL,
    size_in_km numeric,
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
    name character varying NOT NULL,
    eponym text,
    planet_type character varying(100),
    distance_from_earth integer NOT NULL,
    is_spherical boolean DEFAULT false NOT NULL,
    size_in_km numeric,
    star_id integer
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
-- Name: solar_system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.solar_system (
    solar_system_id integer NOT NULL,
    name character varying(25) NOT NULL,
    planet_id integer NOT NULL,
    moon_id integer NOT NULL,
    star_id integer NOT NULL
);


ALTER TABLE public.solar_system OWNER TO freecodecamp;

--
-- Name: solar_system_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.solar_system_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solar_system_system_id_seq OWNER TO freecodecamp;

--
-- Name: solar_system_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.solar_system_system_id_seq OWNED BY public.solar_system.solar_system_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    star_type character varying(100),
    distance_from_earth_in_ly integer NOT NULL,
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
-- Name: solar_system solar_system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system ALTER COLUMN solar_system_id SET DEFAULT nextval('public.solar_system_system_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda Galaxy', 'Situated in the Andromeda Constellation.', 'Spiral', 2500000, false);
INSERT INTO public.galaxy VALUES (2, 'Sculptor Galaxy', 'NGC 253 has been observed with the naked eye by Timo Karhula.', 'Intermediate Spiral Galaxy', 12000000, false);
INSERT INTO public.galaxy VALUES (3, 'Bode''s Galaxy', 'Highly expereinced amateur astronomers may be able to see Messier 81 under exceptional observing conditions.', 'Spiral', 12000000, false);
INSERT INTO public.galaxy VALUES (4, 'Milky Way', 'This is the galaxy containing the Sun and its Solar System.', 'Spiral', 0, false);
INSERT INTO public.galaxy VALUES (5, 'Triangulum Galaxy', 'Being a diffuse object, its visibility is strongly affected by even small amounts of light pollution.', 'Spiral', 2900000, false);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 'Centaurus A has been spoted with the naked eye by Stephen James O''Meara.', 'Elliptical', 13700000, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (4, 'io', 'Discovered by Galileo', 'Jupiter', 1610, false, 1821, 7);
INSERT INTO public.moon VALUES (5, 'Europa', 'Disocovered by Galileo', 'Jupiter', 1610, false, 1560, 7);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Discovered by Galileo', 'Jupiter', 1610, false, 2634, 7);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Discovered by Galileo', 'Jupiter', 1610, false, 2410, 7);
INSERT INTO public.moon VALUES (8, 'Amalthea', 'Discovered by Barnard', 'Jupiter', 1892, false, 84, 7);
INSERT INTO public.moon VALUES (9, 'Himalia', 'Discovered by Perrine', 'Jupiter', 1904, false, 70, 7);
INSERT INTO public.moon VALUES (10, 'Elara', 'Discovered by Perrine', 'Jupiter', 1905, false, 43, 7);
INSERT INTO public.moon VALUES (11, 'Pasiphae', 'Discovered by Melotted', 'Jupiter', 1908, false, 30, 7);
INSERT INTO public.moon VALUES (21, 'Charon', 'Discovered by Christy', 'Pluto', 1978, false, 606, 11);
INSERT INTO public.moon VALUES (22, 'Nix', 'Discovered by Weaver, Stern, Buie, et al.', 'Pluto', 2005, false, 22, 11);
INSERT INTO public.moon VALUES (23, 'Hydra', 'Discovered by Weaver, Stern, Buie, et al.', 'Pluto', 2005, false, 28, 11);
INSERT INTO public.moon VALUES (24, 'Kerberos', 'Discovered by Showalter', 'Pluto', 2011, false, 7, 11);
INSERT INTO public.moon VALUES (18, 'Triton', 'Discovered by Lassell', 'Neptune', 1846, false, 1353, 10);
INSERT INTO public.moon VALUES (19, 'Nereid', 'Discovered by Kuiper', 'Neptune', 1949, false, 170, 10);
INSERT INTO public.moon VALUES (20, 'Naiad', 'Discovered by Terrile', 'Neptune', 1989, false, 33, 10);
INSERT INTO public.moon VALUES (12, 'Mimas', 'Discovered by Herschel', 'Saturn', 1789, false, 198, 8);
INSERT INTO public.moon VALUES (13, 'Enceladus', 'Discovered by Herschel', 'Saturn', 1789, false, 252, 8);
INSERT INTO public.moon VALUES (14, 'Tethys', 'Discovred by Cassini', 'Saturn', 1684, false, 533, 8);
INSERT INTO public.moon VALUES (15, 'Ariel', 'Discovered by Lassell', 'Uranus', 1851, false, 579, 9);
INSERT INTO public.moon VALUES (17, 'Titania', 'Disocovered by Herschel', 'Uranus', 1787, false, 789, 9);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Discovred by Hall', 'Mars', 1877, false, 11, 6);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Discovered by Hall', 'Mars', 1877, false, 6, 6);
INSERT INTO public.moon VALUES (1, 'Moon', 'Discovered by a person', 'Earth', 0, false, 1738, 5);
INSERT INTO public.moon VALUES (16, 'Umbriel', 'Discovered by Lassell', 'Uranus', 1851, false, 585, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (12, 'Eris', 'Ancient Gek 1446', '23y', 551, true, 513, 6);
INSERT INTO public.planet VALUES (11, 'Pluto', 'Ancient Greek 1446', '516 23y', 1211, true, 1113, 6);
INSERT INTO public.planet VALUES (10, 'Neptune', 'Ancient Greek 4446', '56 23y', 121, true, 1233, 6);
INSERT INTO public.planet VALUES (9, 'Uranus', 'Ancient Greek 134446', '56 De4l43y', 42341, true, 745343, 5);
INSERT INTO public.planet VALUES (8, 'Saturn', 'Ancient Greek 13446', '56 De4l3y', 4231, true, 7453, 5);
INSERT INTO public.planet VALUES (7, 'Jupiter', 'Ancient Greek 1446', '56 De4ly', 421, true, 745, 4);
INSERT INTO public.planet VALUES (6, 'Mars', 'Ancient Greek 16', '56 Dely', 21, true, 761, 4);
INSERT INTO public.planet VALUES (5, 'Earth', 'Ancient Greek 13', '16 Delty', 28, true, 521, 3);
INSERT INTO public.planet VALUES (4, 'Venus', 'Ancient Greek 12', '18 Delty', 38, true, 511, 3);
INSERT INTO public.planet VALUES (3, 'Mercury', 'Ancient Greek 1', '18 Del', 38, true, 560, 3);
INSERT INTO public.planet VALUES (2, 'Arion', 'Ancient Greek poet', '18 Delphini', 238, true, 10, 2);
INSERT INTO public.planet VALUES (1, 'Spe', 'Hope', '14 Andromedae', 249, true, 5, 1);


--
-- Data for Name: solar_system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.solar_system VALUES (2, 'HOME', 3, 1, 3);
INSERT INTO public.solar_system VALUES (3, 'HOME', 4, 1, 3);
INSERT INTO public.solar_system VALUES (4, 'HOME', 5, 1, 3);
INSERT INTO public.solar_system VALUES (5, 'HOME', 6, 1, 3);
INSERT INTO public.solar_system VALUES (6, 'HOME', 7, 1, 3);
INSERT INTO public.solar_system VALUES (7, 'HOME', 8, 1, 3);
INSERT INTO public.solar_system VALUES (8, 'HOME', 9, 1, 3);
INSERT INTO public.solar_system VALUES (9, 'HOME', 10, 1, 3);
INSERT INTO public.solar_system VALUES (10, 'HOME', 11, 1, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Gliese 1061', 'Has three known planets.', 'Red Dwarf', 11, 6);
INSERT INTO public.star VALUES (2, 'YZ Ceti', 'Three planets, one suspected planet.', 'Flare Star', 12, 5);
INSERT INTO public.star VALUES (4, 'Teegarden''s Star', 'Tentative radial velocity variation, has two known planets.', 'M-type Red Dwarf', 13, 3);
INSERT INTO public.star VALUES (3, 'Luyten''s Star', 'Two planets, and two suspected planets.', 'Red Dwarf', 12, 2);
INSERT INTO public.star VALUES (5, 'Kapteyn''s Star', 'Two disputed planets.', 'M1 Sub-red Dwarf', 13, 2);
INSERT INTO public.star VALUES (6, 'Lacaille 8760', 'Brightest M dwarf in night sky, flare star.', 'M-type Red Dwarf', 13, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: solar_system_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.solar_system_system_id_seq', 10, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


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
-- Name: solar_system solar_system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_pkey PRIMARY KEY (solar_system_id);


--
-- Name: solar_system solar_system_system_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_system_id_key UNIQUE (solar_system_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


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
-- Name: solar_system solar_system_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: solar_system solar_system_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: solar_system solar_system_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

