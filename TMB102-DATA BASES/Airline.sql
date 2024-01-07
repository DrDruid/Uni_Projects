
SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE Airline;
--
-- Name: Airline; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE Airline;


\connect Airline

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: Airline; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA Airline;


--
-- Name: SCHEMA Airline; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA Airline IS 'Airlines  database schema';


--
-- Name: now(); Type: FUNCTION; SCHEMA: Airline; Owner: -
--

CREATE FUNCTION now() RETURNS timestamp with time zone
    LANGUAGE sql IMMUTABLE
    AS $$SELECT '2017-08-15 18:00:00'::TIMESTAMP AT TIME ZONE 'Europe/Moscow';$$;


--
-- Name: FUNCTION now(); Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON FUNCTION now() IS 'Point in time according to which the data are generated';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: aircrafts_data; Type: TABLE; SCHEMA: Airline; Owner: -
--

CREATE TABLE aircrafts_data (
    aircraft_code character(3) NOT NULL,
    model character varying(64) NOT NULL,
    range integer NOT NULL,
    CONSTRAINT aircrafts_range_check CHECK ((range > 0))
);


--
-- Name: TABLE aircrafts_data; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON TABLE aircrafts_data IS 'Aircrafts (internal data)';


--
-- Name: COLUMN aircrafts_data.aircraft_code; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN aircrafts_data.aircraft_code IS 'Aircraft code, IATA';


--
-- Name: COLUMN aircrafts_data.model; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN aircrafts_data.model IS 'Aircraft model';


--
-- Name: COLUMN aircrafts_data.range; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN aircrafts_data.range IS 'Maximal flying distance, km';


--
-- Name: aircrafts; Type: VIEW; SCHEMA: Airline; Owner: -
--

CREATE VIEW aircrafts AS
 SELECT dairc.aircraft_code,
    dairc.model,
    dairc.range
   FROM aircrafts_data dairc;


--
-- Name: VIEW aircrafts; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON VIEW aircrafts IS 'Aircrafts';


--
-- Name: COLUMN aircrafts.aircraft_code; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN aircrafts.aircraft_code IS 'Aircraft code, IATA';


--
-- Name: COLUMN aircrafts.model; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN aircrafts.model IS 'Aircraft model';


--
-- Name: COLUMN aircrafts.range; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN aircrafts.range IS 'Maximal flying distance, km';


--
-- Name: airports_data; Type: TABLE; SCHEMA: Airline; Owner: -
--

CREATE TABLE airports_data (
    airport_code character(3) NOT NULL,
    airport_name character varying(64) NOT NULL,
    city character varying(32) NOT NULL,
    coordinates point NOT NULL,
    timezone text NOT NULL
);


--
-- Name: TABLE airports_data; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON TABLE airports_data IS 'Airports (internal data)';


--
-- Name: COLUMN airports_data.airport_code; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN airports_data.airport_code IS 'Airport code';


--
-- Name: COLUMN airports_data.airport_name; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN airports_data.airport_name IS 'Airport name';


--
-- Name: COLUMN airports_data.city; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN airports_data.city IS 'City';


--
-- Name: COLUMN airports_data.coordinates; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN airports_data.coordinates IS 'Airport coordinates (longitude and latitude)';


--
-- Name: COLUMN airports_data.timezone; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN airports_data.timezone IS 'Airport time zone';


--
-- Name: airports; Type: VIEW; SCHEMA: Airline; Owner: -
--

CREATE VIEW airports AS
 SELECT dairp.airport_code,
    dairp.airport_name ,
    dairp.city,
    dairp.coordinates,
    dairp.timezone
   FROM airports_data dairp;


--
-- Name: VIEW airports; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON VIEW airports IS 'Airports';


--
-- Name: COLUMN airports.airport_code; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN airports.airport_code IS 'Airport code';


--
-- Name: COLUMN airports.airport_name; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN airports.airport_name IS 'Airport name';


--
-- Name: COLUMN airports.city; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN airports.city IS 'City';


--
-- Name: COLUMN airports.coordinates; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN airports.coordinates IS 'Airport coordinates (longitude and latitude)';


--
-- Name: COLUMN airports.timezone; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN airports.timezone IS 'Airport time zone';


--
-- Name: boarding_passes; Type: TABLE; SCHEMA: Airline; Owner: -
--

CREATE TABLE boarding_passes (
    ticket_no character(13) NOT NULL,
    flight_id integer NOT NULL,
    boarding_no integer NOT NULL,
    seat_no character varying(4) NOT NULL
);


--
-- Name: TABLE boarding_passes; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON TABLE boarding_passes IS 'Boarding passes';


--
-- Name: COLUMN boarding_passes.ticket_no; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN boarding_passes.ticket_no IS 'Ticket number';


--
-- Name: COLUMN boarding_passes.flight_id; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN boarding_passes.flight_id IS 'Flight ID';


--
-- Name: COLUMN boarding_passes.boarding_no; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN boarding_passes.boarding_no IS 'Boarding pass number';


--
-- Name: COLUMN boarding_passes.seat_no; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN boarding_passes.seat_no IS 'Seat number';


--
-- Name: bookings; Type: TABLE; SCHEMA: Airline; Owner: -
--

CREATE TABLE bookings (
    book_ref character(6) NOT NULL,
    book_date timestamp with time zone NOT NULL,
    total_amount numeric(10,2) NOT NULL
);


--
-- Name: TABLE bookings; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON TABLE bookings IS 'Bookings';


--
-- Name: COLUMN bookings.book_ref; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN bookings.book_ref IS 'Booking number';


--
-- Name: COLUMN bookings.book_date; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN bookings.book_date IS 'Booking date';


--
-- Name: COLUMN bookings.total_amount; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN bookings.total_amount IS 'Total booking cost';


--
-- Name: flights; Type: TABLE; SCHEMA: Airline; Owner: -
--

CREATE TABLE flights (
    flight_id integer NOT NULL,
    flight_no character(6) NOT NULL,
    scheduled_departure timestamp with time zone NOT NULL,
    scheduled_arrival timestamp with time zone NOT NULL,
    departure_airport character(3) NOT NULL,
    arrival_airport character(3) NOT NULL,
    status character varying(20) NOT NULL,
    aircraft_code character(3) NOT NULL,
    actual_departure timestamp with time zone,
    actual_arrival timestamp with time zone,
    CONSTRAINT flights_check CHECK ((scheduled_arrival > scheduled_departure)),
    CONSTRAINT flights_check1 CHECK (((actual_arrival IS NULL) OR ((actual_departure IS NOT NULL) AND (actual_arrival IS NOT NULL) AND (actual_arrival > actual_departure)))),
    CONSTRAINT flights_status_check CHECK (((status)::text = ANY (ARRAY[('On Time'::character varying)::text, ('Delayed'::character varying)::text, ('Departed'::character varying)::text, ('Arrived'::character varying)::text, ('Scheduled'::character varying)::text, ('Cancelled'::character varying)::text])))
);


--
-- Name: TABLE flights; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON TABLE flights IS 'Flights';


--
-- Name: COLUMN flights.flight_id; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN flights.flight_id IS 'Flight ID';


--
-- Name: COLUMN flights.flight_no; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN flights.flight_no IS 'Flight number';


--
-- Name: COLUMN flights.scheduled_departure; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN flights.scheduled_departure IS 'Scheduled departure time';


--
-- Name: COLUMN flights.scheduled_arrival; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN flights.scheduled_arrival IS 'Scheduled arrival time';


--
-- Name: COLUMN flights.departure_airport; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN flights.departure_airport IS 'Airport of departure';


--
-- Name: COLUMN flights.arrival_airport; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN flights.arrival_airport IS 'Airport of arrival';


--
-- Name: COLUMN flights.status; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN flights.status IS 'Flight status';


--
-- Name: COLUMN flights.aircraft_code; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN flights.aircraft_code IS 'Aircraft code, IATA';


--
-- Name: COLUMN flights.actual_departure; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN flights.actual_departure IS 'Actual departure time';


--
-- Name: COLUMN flights.actual_arrival; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN flights.actual_arrival IS 'Actual arrival time';


--
-- Name: flights_flight_id_seq; Type: SEQUENCE; SCHEMA: Airline; Owner: -
--

CREATE SEQUENCE flights_flight_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flights_flight_id_seq; Type: SEQUENCE OWNED BY; SCHEMA: Airline; Owner: -
--

ALTER SEQUENCE flights_flight_id_seq OWNED BY flights.flight_id;


--
-- Name: flights_v; Type: VIEW; SCHEMA: Airline; Owner: -
--

CREATE VIEW flights_view AS
 SELECT f.flight_id,
    f.flight_no,
    f.scheduled_departure,
    timezone(dep.timezone, f.scheduled_departure) AS scheduled_departure_local,
    f.scheduled_arrival,
    timezone(arr.timezone, f.scheduled_arrival) AS scheduled_arrival_local,
    (f.scheduled_arrival - f.scheduled_departure) AS scheduled_duration,
    f.departure_airport,
    dep.airport_name AS departure_airport_name,
    dep.city AS departure_city,
    f.arrival_airport,
    arr.airport_name AS arrival_airport_name,
    arr.city AS arrival_city,
    f.status,
    f.aircraft_code,
    f.actual_departure,
    timezone(dep.timezone, f.actual_departure) AS actual_departure_local,
    f.actual_arrival,
    timezone(arr.timezone, f.actual_arrival) AS actual_arrival_local,
    (f.actual_arrival - f.actual_departure) AS actual_duration
   FROM flights f,
    airports dep,
    airports arr
  WHERE ((f.departure_airport = dep.airport_code) AND (f.arrival_airport = arr.airport_code));


--
-- Name: VIEW flights_v; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON VIEW flights_v IS 'Flights (extended)';


--
-- Name: COLUMN flights_v.flight_id; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN flights_v.flight_id IS 'Flight ID';


--
-- Name: COLUMN flights_v.flight_no; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN flights_v.flight_no IS 'Flight number';


--
-- Name: COLUMN flights_v.scheduled_departure; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN flights_v.scheduled_departure IS 'Scheduled departure time';


--
-- Name: COLUMN flights_v.scheduled_departure_local; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN flights_v.scheduled_departure_local IS 'Scheduled departure time, local time at the point of departure';


--
-- Name: COLUMN flights_v.scheduled_arrival; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN flights_v.scheduled_arrival IS 'Scheduled arrival time';


--
-- Name: COLUMN flights_v.scheduled_arrival_local; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN flights_v.scheduled_arrival_local IS 'Scheduled arrival time, local time at the point of destination';


--
-- Name: COLUMN flights_v.scheduled_duration; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN flights_v.scheduled_duration IS 'Scheduled flight duration';


--
-- Name: COLUMN flights_v.departure_airport; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN flights_v.departure_airport IS 'Deprature airport code';


--
-- Name: COLUMN flights_v.departure_airport_name; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN flights_v.departure_airport_name IS 'Departure airport name';


--
-- Name: COLUMN flights_v.departure_city; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN flights_v.departure_city IS 'City of departure';


--
-- Name: COLUMN flights_v.arrival_airport; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN flights_v.arrival_airport IS 'Arrival airport code';


--
-- Name: COLUMN flights_v.arrival_airport_name; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN flights_v.arrival_airport_name IS 'Arrival airport name';


--
-- Name: COLUMN flights_v.arrival_city; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN flights_v.arrival_city IS 'City of arrival';


--
-- Name: COLUMN flights_v.status; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN flights_v.status IS 'Flight status';


--
-- Name: COLUMN flights_v.aircraft_code; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN flights_v.aircraft_code IS 'Aircraft code, IATA';


--
-- Name: COLUMN flights_v.actual_departure; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN flights_v.actual_departure IS 'Actual departure time';


--
-- Name: COLUMN flights_v.actual_departure_local; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN flights_v.actual_departure_local IS 'Actual departure time, local time at the point of departure';


--
-- Name: COLUMN flights_v.actual_arrival; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN flights_v.actual_arrival IS 'Actual arrival time';


--
-- Name: COLUMN flights_v.actual_arrival_local; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN flights_v.actual_arrival_local IS 'Actual arrival time, local time at the point of destination';


--
-- Name: COLUMN flights_v.actual_duration; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN flights_v.actual_duration IS 'Actual flight duration';


--
-- Name: routes; Type: VIEW; SCHEMA: Airline; Owner: -
--

CREATE VIEW routes_view AS
 WITH f3 AS (
         SELECT f2.flight_no,
            f2.departure_airport,
            f2.arrival_airport,
            f2.aircraft_code,
            f2.duration,
            array_agg(f2.days_of_week) AS days_of_week
           FROM ( SELECT f1.flight_no,
                    f1.departure_airport,
                    f1.arrival_airport,
                    f1.aircraft_code,
                    f1.duration,
                    f1.days_of_week
                   FROM ( SELECT flights.flight_no,
                            flights.departure_airport,
                            flights.arrival_airport,
                            flights.aircraft_code,
                            (flights.scheduled_arrival - flights.scheduled_departure) AS duration,
                            (to_char(flights.scheduled_departure, 'ID'::text))::integer AS days_of_week
                           FROM flights) f1
                  GROUP BY f1.flight_no, f1.departure_airport, f1.arrival_airport, f1.aircraft_code, f1.duration, f1.days_of_week
                  ORDER BY f1.flight_no, f1.departure_airport, f1.arrival_airport, f1.aircraft_code, f1.duration, f1.days_of_week) f2
          GROUP BY f2.flight_no, f2.departure_airport, f2.arrival_airport, f2.aircraft_code, f2.duration
        )
 SELECT f3.flight_no,
    f3.departure_airport,
    dep.airport_name AS departure_airport_name,
    dep.city AS departure_city,
    f3.arrival_airport,
    arr.airport_name AS arrival_airport_name,
    arr.city AS arrival_city,
    f3.aircraft_code,
    f3.duration,
    f3.days_of_week
   FROM f3,
    airports dep,
    airports arr
  WHERE ((f3.departure_airport = dep.airport_code) AND (f3.arrival_airport = arr.airport_code));


--
-- Name: VIEW routes; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON VIEW routes IS 'Routes';


--
-- Name: COLUMN routes.flight_no; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN routes.flight_no IS 'Flight number';


--
-- Name: COLUMN routes.departure_airport; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN routes.departure_airport IS 'Code of airport of departure';


--
-- Name: COLUMN routes.departure_airport_name; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN routes.departure_airport_name IS 'Name of airport of departure';


--
-- Name: COLUMN routes.departure_city; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN routes.departure_city IS 'City of departure';


--
-- Name: COLUMN routes.arrival_airport; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN routes.arrival_airport IS 'Code of airport of arrival';


--
-- Name: COLUMN routes.arrival_airport_name; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN routes.arrival_airport_name IS 'Name of airport of arrival';


--
-- Name: COLUMN routes.arrival_city; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN routes.arrival_city IS 'City of arrival';


--
-- Name: COLUMN routes.aircraft_code; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN routes.aircraft_code IS 'Aircraft code, IATA';


--
-- Name: COLUMN routes.duration; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN routes.duration IS 'Scheduled duration of flight';


--
-- Name: COLUMN routes.days_of_week; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN routes.days_of_week IS 'Days of week on which flights are scheduled';


--
-- Name: seats; Type: TABLE; SCHEMA: Airline; Owner: -
--

CREATE TABLE seats (
    aircraft_code character(3) NOT NULL,
    seat_no character varying(4) NOT NULL,
    fare_conditions character varying(10) NOT NULL,
    CONSTRAINT seats_fare_conditions_check CHECK (((fare_conditions)::text = ANY (ARRAY[('Economy'::character varying)::text, ('First'::character varying)::text, ('Business'::character varying)::text])))
);




--
-- Name: TABLE seats; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON TABLE seats IS 'Seats';


--
-- Name: COLUMN seats.aircraft_code; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN seats.aircraft_code IS 'Aircraft code, IATA';


--
-- Name: COLUMN seats.seat_no; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN seats.seat_no IS 'Seat number';


--
-- Name: COLUMN seats.fare_conditions; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN seats.fare_conditions IS 'Travel class';


--
-- Name: ticket_flights; Type: TABLE; SCHEMA: Airline; Owner: -
--

CREATE TABLE ticket_flights (
    ticket_no character(13) NOT NULL,
    flight_id integer NOT NULL,
    fare_conditions character varying(10) NOT NULL,
    amount numeric(10,2) NOT NULL,
    CONSTRAINT ticket_flights_amount_check CHECK ((amount >= (0)::numeric)),
    CONSTRAINT ticket_flights_fare_conditions_check CHECK (((fare_conditions)::text = ANY (ARRAY[('Economy'::character varying)::text, ('First'::character varying)::text, ('Business'::character varying)::text])))
);


--
-- Name: TABLE ticket_flights; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON TABLE ticket_flights IS 'Flight segment';


--
-- Name: COLUMN ticket_flights.ticket_no; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN ticket_flights.ticket_no IS 'Ticket number';


--
-- Name: COLUMN ticket_flights.flight_id; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN ticket_flights.flight_id IS 'Flight ID';


--
-- Name: COLUMN ticket_flights.fare_conditions; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN ticket_flights.fare_conditions IS 'Travel class';


--
-- Name: COLUMN ticket_flights.amount; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN ticket_flights.amount IS 'Travel cost';


--
-- Name: tickets; Type: TABLE; SCHEMA: Airline; Owner: -
--

CREATE TABLE tickets (
    ticket_no character(13) NOT NULL,
    book_ref character(6) NOT NULL,
    passenger_id character varying(20) NOT NULL,
    passenger_name text NOT NULL,
    contact_data jsonb
);


--
-- Name: TABLE tickets; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON TABLE tickets IS 'Tickets';


--
-- Name: COLUMN tickets.ticket_no; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN tickets.ticket_no IS 'Ticket number';


--
-- Name: COLUMN tickets.book_ref; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN tickets.book_ref IS 'Booking number';


--
-- Name: COLUMN tickets.passenger_id; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN tickets.passenger_id IS 'Passenger ID';


--
-- Name: COLUMN tickets.passenger_name; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN tickets.passenger_name IS 'Passenger name';


--
-- Name: COLUMN tickets.contact_data; Type: COMMENT; SCHEMA: Airline; Owner: -
--

COMMENT ON COLUMN tickets.contact_data IS 'Passenger contact information';


--
-- Name: flights flight_id; Type: DEFAULT; SCHEMA: Airline; Owner: -
--

ALTER TABLE ONLY flights ALTER COLUMN flight_id SET DEFAULT nextval('flights_flight_id_seq'::regclass);


--
-- Data for Name: aircrafts_data; Type: TABLE DATA; SCHEMA: Airline; Owner: -
--

COPY aircrafts_data (aircraft_code, model, range) FROM stdin;
32N	,'A320neo' ,6300
32C	,'A320ceo' ,	6200
736 ,'Boeing 737-600',5650
7M7 ,'Boeing 737 MAX 7', 7130
MC2 ,'Irkut MC-21', 5000

--
-- Data for Name: airports_data; Type: TABLE DATA; SCHEMA: Airline; Owner: -
--

COPY airports_data (airport_code, airport_name, city, coordinates, timezone) FROM stdin;1

(LHR ,'Heathrow Airport', 'London',	(51.4775, -0.461389), Europe/London),
(CDG ,'Paris Charles de Gaulle Airport', 'Paris'	,(49.009722, 2.547778) ,Europe/Paris),
(FRA ,'Frankfurt Airport' 'Frankfurt'	(50.033333, 8.570556) Europe/Berlin),
(MAD ,'Adolfo Suárez Madrid Barajas Airport', 'Madrid',	(40.472222, -3.560833) ,Europe/Madrid),
(ATH ,'Athens International Airport Eleftherios Venizelos'	,'Athens'	,(37.936389, 23.947222) ,Europe/Athens),
(FCO ,'Leonardo da Vinci Fiumicino Airport'	, 'Rome',	(41.800278, 12.238889) ,Europe/Rome);
\.


--
-- Data for Name: boarding_passes; Type: TABLE DATA; SCHEMA: Airline; Owner: -
--

COPY boarding_passes (ticket_no, flight_id, boarding_no, seat_no) FROM stdin;



\.


--
-- Data for Name: bookings; Type: TABLE DATA; SCHEMA: Airline; Owner: -
--
COPY bookings (book_ref, book_date, total_amount) FROM stdin;
('06B046',	'2022-01-06 15:09:00+03',	200),
('E170C3',	'2022-01-06 16:51:00+03',	400),
('F313DD',	'2022-01-06 16:59:00+03',	600),
('CCC5CB',	'2022-01-06 21:02:00+03',	400),
('1FB1E4',	'2022-01-06 12:02:00+03',	200),
('DE3EA6',	'2022-01-06 11:14:00+03',	200),
('4B75D1',	'2022-01-06 22:14:00+03',	200),
('9E60AA',	'2022-01-06 9:44:00+03	',  200),
('69DAD1',	'2022-01-06 0:40:00+03	',  600),
('08A2A5',	'2022-01-06 9:02:00+03	',  400),
('C2CAB7',	'2022-01-06 10:34:00+03',	200),
('C6DA66',	'2022-01-06 14:17:00+03',	400),
('3EFFCA',	'2022-01-06 13:23:00+03',	200),
('7E0F14',	'2022-01-06 5:49:00+03	',  200),
('63126E',	'2022-01-06 23:08:00+03',  	200),
('285BC5',	'2022-01-06 15:45:00+03',  	200),
('232788',	'2022-01-06 16:02:00+03',  	200),
('EE82FC',	'2022-01-06 15:04:00+03',  	200),
('C3B60B',	'2022-01-06 17:05:00+03',  	400),
('7DC7C4',	'2022-01-06 19:10:00+03',  	400),
('36AA7A',	'2022-01-06 2:53:00+03	',  200),
('F11350',	'2022-01-06 2:30:00+03	',  200),
('82DB02',	'2022-01-06 10:47:00+03',  	400),
('572A29',	'2022-01-06 16:25:00+03',  	600),
('31F31A',	'2022-01-06 21:50:00+03',  	200),
('F5F784',	'2022-01-06 3:26:00+03	',  400),
('598886',	'2022-01-06 4:10:00+03	',  400),
('18C1D5',	'2022-01-06 13:11:00+03',  	200),
('EA4481',	'2022-01-06 3:30:00+03	',  400),
('94A438',	'2022-01-06 17:22:00+03',  	200),
('0C3F23',	'2022-01-06 23:22:00+03',  	400),
('F1AF5B',	'2022-01-06 10:29:00+03',  	200),
('2EAC25',	'2022-01-06 21:24:00+03',  	200),
('7C4EB0',	'2022-01-06 7:29:00+03	',  200),
('47F326',	'2022-01-06 19:45:00+03',  	400),
('750FC5',	'2022-01-06 12:31:00+03',  	400),
('4109DE',	'2022-01-06 7:08:00+03	',  200),
('D067BC',	'2022-01-06 9:00:00+03	',  400),
('FE0198',	'2022-01-06 12:55:00+03',  	400),
('EA9B0F',	'2022-01-06 8:54:00+03	',  200),
('6D004A',	'2022-01-06 15:55:00+03',  	400),
('8E6BB3',	'2022-01-06 5:55:00+03	',  400),
('D8094E',	'2022-01-06 4:39:00+03	',  200),
('7E76A9',	'2022-01-06 1:30:00+03	',  200),
('4A1A3A',	'2022-01-06 19:16:00+03',  	200),
('90FF45',	'2022-01-06 11:25:00+03',  	200),
('FDE044',	'2022-01-06 7:59:00+03	',  400),
('88411C',	'2022-01-06 21:24:00+03',  	200),
('D0B9CE',	'2022-01-06 2:03:00+03	',  600),
('ACCA92',	'2022-01-06 22:35:00+03',	200),
('4FAEB6',	'2022-01-06 14:13:00+03',	200),
('EC1E8B',	'2022-01-06 17:14:00+03',	400),
('717CED',	'2022-01-06 9:09:00+03	',  400),
('5C9140',	'2022-01-06 11:30:00+03',	200),
('AA2140',	'2022-01-06 1:38:00+03	',  200),
('4DC130',	'2022-01-06 20:46:00+03',  	200),
('378E90',	'2022-01-06 0:04:00+03	',  200),
('7B4620',	'2022-01-06 10:50:00+03',	200),
('7327C3',	'2022-01-06 10:43:00+03',	400),
('B0EEAB',	'2022-01-06 11:21:00+03',	200),
('9C6646',	'2022-01-06 15:52:00+03',	400),
('9C6647',	'2022-05-08 17:56:00+03',	1000),
('12C67A',	'2022-06-02 8:59:00+03	',  1000),
('763A73',	'2022-05-11 0:15:00+03	',  1000),
('460AAE',	'2022-05-26 3:04:00+03	',  1000),
('29182D',	'2022-05-08 0:44:00+03	',  1000),
('E5546D',	'2022-05-30 9:39:00+03	',  1000),
('BE9453',	'2022-05-09 11:39:00+03',	1200),
('1C9C91',	'2022-06-02 18:38:00+03',	600),
('07FA66',	'2022-05-26 23:03:00+03',  	600),
('72B58D',	'2022-05-15 9:10:00+03	',  600),
('0DB5AD',	'2022-05-24 8:59:00+03	',  600),
('997EQO',  '2022-06-01 5:06:00+03	',  600),
('870D94',	'2022-05-23 21:26:00+03',	1200),
('968984',	'2022-05-26 12:52:00+03',	600),
('8C7425',	'2022-05-27 10:31:00+03',	1200),
('51F5DD',	'2022-05-10 13:15:00+03',	600),
('73EA62',	'2022-05-12 20:43:00+03',  	600),
('A5D460',	'2022-05-23 9:25:00+03	',  600),
('0251F7',	'2022-05-20 0:19:00+03	',  600),
('FF22FD',	'2022-06-05 3:35:00+03	',  1200),
('87CD54',	'2022-05-25 9:05:00+03	',  600),
('EB268F',	'2022-05-12 23:58:00+03',	1800),
('0B59DC',	'2022-06-01 20:12:00+03',	600),
('CD57C7',	'2022-05-13 0:39:00+03	',  600),
('B6F102',	'2022-05-26 21:22:00+03',	600),
('E79588',	'2022-05-19 14:29:00+03',	100),
('577432',	'2022-05-27 23:37:00+03',	200),
('4A2634',	'2022-05-22 19:11:00+03',	100),
('0190EA',	'2022-06-01 19:29:00+03',	100),
('66583B',	'2022-05-30 2:33:00+03	',  200),
('7FDD9E',	'2022-05-21 19:09:00+03',	1050),
('591681',	'2022-08-18 22:28:00+03',	750),
('305FED',	'2022-08-24 12:59:00+03',	1500),
('91B552',	'2022-08-23 15:57:00+03',	2250),
('779171',	'2022-08-29 5:32:00+03	',  750),
('E8328C',	'2022-08-02 8:56:00+03	',  750),
('1E49CB',	'2022-08-11 3:34:00+03	',  750),
('71004B',	'2022-08-06 20:38:00+03',	750),
('912031',	'2022-08-15 22:12:00+03',	750),
('4926F5',	'2022-08-08 0:01:00+03	',  750),
('04E1A6',	'2022-08-26 21:25:00+03',	750),
('81E246',	'2022-08-14 18:04:00+03',	750),
('D82597',	'2022-08-01 10:36:00+03',	750),
('D2E575',	'2022-08-07 15:43:00+03',	1500),
('E91FFA',	'2022-08-20 12:16:00+03',	3000),
('EBE02B',	'2022-08-20 14:44:00+03',	750),
('EE9AB7',	'2022-08-22 5:18:00+03	',  300),
('D27AB8',	'2022-08-10 20:25:00+03',	900),
('822D3F',	'2022-08-18 7:35:00+03	',  300),
('C4F765',	'2022-08-08 21:22:00+03',	900),
('01D17B',	'2022-08-08 22:26:00+03',	300),
('A63705',	'2022-08-12 19:27:00+03',	300),
('53EE1F',	'2022-08-17 4:09:00+03	',  300),
('274AC4',	'2022-08-23 11:53:00+03',	300),
('958939',	'2022-08-03 15:43:00+03',	3000),
('6AB291',	'2022-05-15 13:20:00+03',	3000),
('6F5347',	'2022-05-02 15:01:00+03',	400),
('CEBCE8',	'2021-12-05 18:19:00+03',	400),
('DE4DA1',	'2021-12-03 21:47:00+03',	800),
('7B03C1',	'2022-09-16 6:00:00+03	',  800),
('B70F27',	'2022-08-26 6:37:00+03	',  800),
('31FAA5',	'2022-09-11 2:04:00+03	',  2800),
('9E9472',	'2022-05-04 8:12:00+03	',  2000),
('0DBEBD',	'2022-04-15 0:48:00+03	',  700),
('263191',	'2022-08-09 14:33:00+03',	1400),
('F29C09',	'2022-08-05 14:22:00+03',	1400),
('8BA30C',	'2022-08-11 22:24:00+03',	700),
('577969',	'2022-08-01 22:47:00+03',	250),
('6CFEB8',	'2022-08-25 20:41:00+03',	250),
('49DA66',	'2022-08-25 10:27:00+03',	250),
('E2634D',	'2022-08-02 6:14:00+03	',  250),
('41E97D',	'2022-07-31 7:39:00+03	',  250),
('72E9A2',	'2022-08-12 18:52:00+03',	3250),
('568FA3',	'2022-07-08 15:35:00+03',	3500),
('D34ADF',	'2022-06-16 16:29:00+03',	3000),
('1FE8F6',	'2022-07-03 19:35:00+03',	3150),
('CE01AE',	'2022-03-13 9:55:00+03	',  330),
('2539B6',	'2022-03-07 3:20:00+03	',  180),
('F69AAC',	'2022-03-15 3:19:00+03	',  500),
('BC92C6',	'2022-03-24 21:46:00+03',	700),
('B68857',	'2022-03-24 8:11:00+03	',  115),
('B2BF63',	'2022-03-21 13:00:00+03',	1500),
('86B9CF',	'2021-12-17 2:06:00+03	',  3000),
('54EC3C',	'2021-12-25 16:05:00+03',	1300),
('30B129',	'2022-03-07 18:54:00+03',	960),
('91693C',	'2022-03-08 17:53:00+03',	799),
('E8A492',	'2022-03-12 5:34:00+03	',  3900),
('78C8AB',	'2022-06-21 5:24:00+03	',  5000),
('235263',	'2022-06-15 18:25:00+03',	3500),
('FE8DC3',	'2022-06-10 13:53:00+03',	5000),
('D39010',	'2022-06-07 1:07:00+03	',  1500),
('4FCEE6',	'2022-06-11 14:30:00+03',	4000),
('E33E2B',	'2022-06-16 11:38:00+03',	3000),
('610C0E',	'2022-06-07 5:35:00+03	',  3000),
('C7D1C1',	'2022-06-21 18:10:00+03',	8500),
('FBC58C',	'2022-06-28 8:21:00+03	',  5000),
('7CEF60',	'2022-06-08 2:14:00+03	',  1500),
('DA7C29',	'2022-06-12 7:20:00+03	',  4000),
('1AE4B1',	'2022-06-18 3:31:00+03	',  3000),
('C04A44',	'2022-06-03 6:42:00+03	',  1000),
('87B5F4',	'2022-06-10 12:31:00+03',	900),
('975516',	'2022-06-05 23:52:00+03',	950),
('E776F1',	'2022-06-05 21:40:00+03',	980),
('269611',	'2022-06-11 0:04:00+03	',  970),
('269612',	'2022-06-06 20:46:00+03',	975),
('EACE29',	'2022-06-26 7:36:00+03	',  895),
('D6425C',	'2022-06-07 4:57:00+03	',  500),
('FA077C',	'2022-06-06 0:50:00+03	',  680),
('D50E16',	'2022-06-27 7:11:00+03	',  2150),
('8E481B',	'2022-06-19 23:15:00+03',	900),
('353E9D',	'2022-06-05 1:28:00+03	',  879),
('EB3D45',	'2022-06-21 14:23:00+03',	888),
('8524D1',	'2022-06-21 14:24:00+03',	6557),
('7E8647',	'2022-06-02 19:40:00+03',	4900),
('F90E1E',	'2022-06-19 11:26:00+03',	150),
('F59A5C',	'2022-01-18 2:58:00+03	',  200),
('49CD3E',	'2022-02-05 0:50:00+03	',  300),
('E0FF37',	'2022-02-13 18:46:00+03',	400),
('31161	',  '2022-01-31 6:56:00+03	',  920),
('EBD8C7',	'2022-01-29 2:54:00+03	',  500),
('8CDA1D',	'2022-02-14 5:21:00+03	',  380),
('81A197',	'2022-02-06 14:33:00+03',	390),
('EB381C',	'2022-01-21 22:53:00+03',	337),
('FA71D7',	'2022-02-14 11:25:00+03',	350),
('7EB4FD',	'2022-01-20 17:11:00+03',	325),
('1C19A3',	'2022-02-05 12:24:00+03',	600),
('0596DB',	'2022-02-03 3:44:00+03	',  400),
('E14006',	'2022-02-03 22:37:00+03',	200),
('A18EDF',	'2022-01-25 16:27:00+03',	260),
('185997',	'2022-01-19 22:42:00+03',	480),
('A40F55',	'2022-06-11 7:47:00+03	',  260),
('3E57DC',	'2022-06-22 3:03:00+03	',  290),
('B13EDC',	'2022-05-06 3:05:00+03	',  180),
('123B65',	'2022-05-02 14:10:00+03',	350),
('592624',	'2022-04-19 13:53:00+03',	4000),
('F86FE3',	'2022-08-02 19:24:00+03',	8000),
('9C5DAE',	'2022-07-13 23:13:00+03',	3000),
('92DE26',	'2022-07-21 22:07:00+03',	3000),
('AB7433',	'2022-08-04 11:15:00+03',	2900),
('C8331B',	'2022-08-21 12:55:00+03',	4000),
('C69989',	'2022-09-11 12:10:00+03',	5000),
('6A9641',	'2022-08-30 8:52:00+03	',  690),
('5C52C6',	'2022-06-12 13:52:00+03',	700),
('79231	',  '2022-06-11 7:32:00+03	',  800),
('9D26E1',	'2022-06-27 18:08:00+03',	700),
('4A4E63',	'2022-06-21 3:01:00+03	',  300),
('46A0F8',	'2022-05-31 23:26:00+03',	600),
('0E84A1',	'2022-06-03 13:24:00+03',	150),
('2520B2',	'2022-06-19 20:54:00+03',	200),
('991AB1',	'2022-06-20 23:19:00+03',	189),
('A1F275',	'2022-02-10 15:55:00+03',	710),
('B3D774',	'2022-03-02 14:15:00+03',	300),
('9DD60E',	'2022-02-26 20:24:00+03',	120),
('0F783F',	'2022-02-26 22:06:00+03',	150),
('B1ECA9',	'2022-06-11 12:06:00+03',	200),
('0D588D',	'2022-06-21 8:03:00+03	',  350),
('5D1537',	'2022-06-10 9:05:00+03	',  340),
('F73FF6',	'2022-06-26 15:26:00+03',	290),
('BAC192',	'2022-06-05 11:29:00+03',	480),
('CA102A',	'2022-06-16 12:33:00+03',	300),
('DBEF99',	'2022-06-07 17:54:00+03',	100),
('D99BD9',	'2022-06-18 15:28:00+03',	200),
('D99BD8',	'2022-04-06 14:05:00+03',	350),
('8DA993',	'2022-03-19 3:14:00+03	',  300),
('62FD56',	'2022-04-0717:51:00+03	',  3000),
('95292F',	'2022-03-29 11:50:00+03',	3500),
('C6C382',	'2022-02-07 21:49:00+03',	5800),
('B5C4B1',	'2022-02-18 13:10:00+03',	8600),
('8DA987',	'2022-02-04 16:58:00+03',	10600),
('52EP22',	'2022-01-27 14:25:00+03',	5450),
('D5D0E1',	'2022-01-27 0:26:00+03	',  1090),
('E5C6E5',	'2022-02-18 3:11:00+03	',  2170),
('D1FDA3',	'2022-02-15 18:41:00+03',	2290),
('81916B',	'2022-01-23 15:14:00+03',	1180),
('B060FB',	'2022-02-08 12:30:00+03',	1200),
('AFE311',	'2022-02-08 0:57:00+03	',  1300),
('95CF7C',	'2022-02-21 22:03:00+03',	2900),
('3308B9',	'2022-02-20 10:41:00+03',	1200),
('A5DC62',	'2022-01-23 9:01:00+03	',  200),
('76533A',	'2022-02-15 12:59:00+03',	150),
('2CF94D',	'2022-01-26 18:40:00+03',	400),
('59089E',	'2022-01-29 1:07:00+03	',  350),
('E869C6',	'2022-02-01 20:52:00+03',	200),
('D8F43D',	'2022-02-20 22:27:00+03',	100),
('CC3AA1',	'2022-02-20 0:50:00+03	',  120),
('1708F5',	'2022-02-13 12:15:00+03',	130),
('9EF84C',	'2022-02-08 1:38:00+03	',  150),
('F71607',	'2022-02-07 1:51:00+03	',  130),
('B531A2',	'2022-02-09 21:50:00+03',	155),
('BF45E3',	'2022-02-09 0:15:00+03	',  160),
('B1DA60',	'2022-01-28 5:46:00+03	',  170),
('6E8E95',	'2022-02-02 6:28:00+03	',  210),
('69CBA0',	'2022-02-13 20:03:00+03',	130),
('5CFA29',	'2022-01-30 1:40:00+03	',  155),
('D669D8',	'2022-02-20 1:20:00+03	',  510),
('CE6149',	'2022-01-27 23:18:00+03',	130),
('77D011',	'2022-02-07 10:52:00+03',	315),
('FC8D2B',	'2022-01-25 5:39:00+03	',  350),
('78FF32',	'2022-02-21 8:01:00+03	',  130),
('C16D29',	'2022-01-26 3:10:00+03	',  140),
('F41110',	'2022-02-16 11:03:00+03',	900),
('2268C8',	'2022-06-16 14:24:00+03',	890),
('4421F0',	'2022-06-05 11:54:00+03',	1780),
('431213',	'2022-06-08 3:38:00+03	',  200),
('74FF98',	'2022-06-14 18:23:00+03',	100),
('58F8FF',	'2022-06-29 6:55:00+03	',  400),
('96B71C',	'2022-06-12 19:11:00+03',	200),
('E8A60B',	'2022-06-15 13:46:00+03',	200),
('3347A4',	'2022-06-29 4:33:00+03	',  450),
('D90F72',	'2022-06-11 3:04:00+03	',  350),
('A1D2F2',	'2022-06-19 23:08:00+03',	200),
('12B9EA',	'2022-06-15 12:27:00+03',	190),
('8FE2C6',	'2022-06-27 6:44:00+03	',  180),
('1F43A4',	'2022-06-10 12:13:00+03',	170),
('E08552',	'2022-06-10 21:09:00+03',	320),
('9066ED',	'2022-06-29 15:03:00+03',	150),
('E2A3CC',	'2022-06-30 21:51:00+03',	150),
('36299E',	'2022-06-16 14:59:00+03',	140),
('EFA649',	'2022-06-10 3:47:00+03	',  290),
('50C39B',	'2022-06-26 23:12:00+03',	690),
('50B650',	'2022-06-27 1:14:00+03	',  360),
('8FC7FE',	'2022-06-14 1:19:00+03	',  290),
('B47571',	'2022-06-12 5:23:00+03	',  250),
('9A2F6A',	'2022-06-22 17:44:00+03',	439),
('D99543',	'2022-06-17 2:15:00+03	',  290),
('BAAB9B',	'2022-06-04 20:39:00+03',	530),
('6A1F5A',	'2022-06-13 9:49:00+03	',  300),
('4103AD',	'2022-06-18 12:31:00+03',	600),
('8EFEC9',	'2022-06-19 15:08:00+03',	210),
('66950D',	'2022-06-05 1:09:00+03	',  210),
('3E2010',	'2022-06-25 18:43:00+03',	210),
('FAC68D',	'2022-06-28 13:19:00+03',	210),
('983F5C',	'2022-06-25 13:38:00+03',	220),
('FC59C5',	'2022-06-14 2:09:00+03	',  230),
('26EE4F',	'2022-06-10 14:58:00+03',	920),
('D2981D',	'2022-06-20 5:06:00+03	',  5000),
('0483B7',	'2022-01-31 19:14:00+03',	10900),
('A09840',	'2022-01-08 8:29:00+03	',  4000),
('3615CB',	'2022-01-30 15:57:00+03',	1000),
('99DED2',	'2022-01-17 19:32:00+03',	2300),
('0EC9C5',	'2022-01-16 15:42:00+03',	1300),
('BDE23C',	'2022-01-23 13:16:00+03',	2500),
('F98FDE',	'2022-01-23 9:09:00+03	',  1090),
('2451BC',	'2022-02-03 2:08:00+03	',  200),
('D13BC9',	'2022-01-12 18:49:00+03',	300),
('768617',	'2022-01-22 5:17:00+03	',  710),
('71F5D0',	'2022-01-131 3:37:00+03',	376),
('3F399B',	'2022-01-17 8:42:00+03	',  378),
('3C0270',	'2022-02-04 5:37:00+03	',  349),
('FAF5AA',	'2022-01-29 12:19:00+03',	379),
('DDE239',	'2022-01-22 12:08:00+03',	290),
('473900',	'2022-02-03 19:49:00+03',	710),
('0CAC77',	'2022-01-20 12:41:00+03',	300),
('C4981E',	'2022-01-19 18:34:00+03',	539),
('CB31F4',	'2022-01-09 8:56:00+03	',  570),
('49A899',	'2022-01-12 5:22:00+03	',  330),
('7EEC81',	'2022-01-16 2:12:00+03	',  200),
('36572A',	'2022-01-21 3:58:00+03	',  300),
('BD2808',	'2022-01-19 22:11:00+03',	410),
('BAE4F1',	'2022-01-09 0:33:00+03	',  385),
('AF32F5',	'2022-01-19 1:10:00+03	',  196),
('F43B38',	'2022-01-28 16:28:00+03',	190),
('6B5E60',	'2022-01-14 13:54:00+03',	200),
('CF58F6',	'2022-01-25 3:05:00+03	',  280),
('BA9363',	'2022-01-15 6:59:00+03	',  560),
('BA9360',	'2022-08-29 19:04:00+03',	600),
('4B7B0D',	'2022-08-08 6:34:00+03	',  1580),
('119C53',	'2022-08-21 23:37:00+03',	1000),
('357950',	'2022-09-03 23:00:00+03',	990),
('5DE9F1',	'2022-08-17 5:06:00+03	',  970),
('C31F0C',	'2022-08-08 10:08:00+03',	960),
('9CE7C2',	'2022-08-12 22:29:00+03',	950),
('CFFF11',	'2022-08-25 11:27:00+03',	800),
('12728D',	'2022-08-21 6:31:00+03	',  1200),
('28F5D0',	'2022-08-17 20:41:00+03',	800),
('1856F3',	'2022-08-29 11:29:00+03',	960),
('166F96',	'2022-08-29 4:18:00+03	',  950),
('B0F767',	'2022-08-20 11:44:00+03',	940),
('BE6989',	'2022-08-12 4:11:00+03	',  1855),
('36266C',	'2022-08-19 13:27:00+03',	1840),
('FA28F7',	'2022-08-18 9:25:00+03	',  999),
('278654',	'2022-08-28 2:02:00+03	',  120),
('38407C',	'2022-08-09 9:47:00+03	',  109),
('B4988C',	'2022-08-29 6:30:00+03	',  280),
('E40AC7',	'2022-08-19 13:57:00+03',	370),
('31F638',	'2022-08-24 17:06:00+03',	380),
('67219B',	'2022-08-21 15:25:00+03',	250),
('EB6D18',	'2022-08-23 6:22:00+03	',  765),
('F648E2',	'2022-08-21 21:40:00+03',	265),
('9459F5',	'2022-08-27 15:28:00+03',	270),
('B0EB2F',	'2022-08-10 22:29:00+03',	210),
('868C0C',	'2022-08-19 12:32:00+03',	652),
('E48FA1',	'2022-09-03 8:35:00+03	',  190),
('776703',	'2022-08-19 17:13:00+03',	190),
('91E333',	'2022-08-14 23:26:00+03',	290),
('798200',	'2022-08-14 16:11:00+03',	400),
('10A98E',	'2022-08-17 20:30:00+03',	120),
('7189A1',	'2022-09-01 6:20:00+03	',  200),
('FD38D2',	'2021-02-08 14:24:00+03',	440),
('0BE40A',	'2021-01-19 22:27:00+03',	600),
('EA8EE0',	'2021-11-26 15:00:00+03',	200),
('24D29A',	'2022-06-05 22:41:00+03',	300),
('786D90',	'2022-06-14 21:43:00+03',	300),
('C24387',	'2022-06-12 18:07:00+03',	300),
('20D722',	'2022-06-19 22:19:00+03',	900),
('E98D1F',	'2022-06-18 9:24:00+03	',  1000),
('C68CBD',	'2022-01-20 6:39:00+03	',  200),
('9858B1',	'2022-02-09 23:14:00+03',	100),
('09F63E',	'2022-01-18 16:44:00+03',	210),
('534BB3',	'2022-02-01 12:25:00+03',	110),
('C4738C',	'2022-01-24 6:25:00+03	',  220),
('D87A79',	'2022-02-07 12:04:00+03',	110),
('DFC691',	'2022-02-04 5:56:00+03	',  220),
('189430',	'2022-02-02 1:12:00+03	',  110),
('88F1F7',	'2022-01-19 22:15:00+03',	110),
('36E324',	'2022-01-26 10:41:00+03',	110),
('BF5981',	'2022-01-25 11:02:00+03',	110),
('F1C1B3',	'2022-02-10 0:54:00+03	',  110),
('2458C1',	'2022-02-12 4:00:00+03	',  110),
('C53CEB',	'2022-02-10 22:51:00+03',	110),
('037F6A',	'2022-01-21 19:12:00+03',	110),
('AEED84',	'2022-01-29 20:31:00+03',	220),
('502DA3',	'2022-02-03 21:09:00+03',	220),
('FE7180',	'2022-01-30 5:05:00+03	',  440),
('B3FE1D',	'2022-02-05 3:18:00+03	',  110),
('811B51',	'2022-02-04 13:31:00+03',	220),
('1568D5',	'2022-02-03 11:23:00+03',	220),
('BEAA3D',	'2022-01-16 22:02:00+03',	110),
('246445',	'2022-01-22 22:19:00+03',	110),
('25F2CE',	'2022-01-29 15:24:00+03',	110),
('79F44E',	'2022-01-16 0:07:00+03	',  110),
('9BF058',	'2022-01-17 9:30:00+03	',  200),
('D7B0A9',	'2022-02-10 15:15:00+03',	400),
('C6606D',	'2022-02-12 21:22:00+03',	110),
('052C83',	'2022-02-01 11:39:00+03',	110),
('00BBF4',	'2022-02-05 4:58:00+03	',  220),
('79FB19',	'2022-01-23 4:06:00+03	',  110),
('C29EA5',	'2022-02-05 5:48:00+03	',  220),
('256ABE',	'2022-02-05 10:05:00+03',	110),
('074AF6',	'2022-01-16 18:36:00+03',	220),
('4681C8',	'2022-02-10 11:40:00+03',	330),
('3F6C58',	'2022-02-10 23:04:00+03',	110),
('816A8C',	'2022-01-15 3:53:00+03	',  110),
('4E285F',	'2022-02-09 21:49:00+03',	110),
('7BDDD0',	'2022-01-25 12:14:00+03',	110),
('9D80F4',	'2022-01-21 1:01:00+03	',  330),
('62C74A',	'2022-01-20 3:26:00+03	',  140),
('2C1250',	'2022-06-16 11:49:00+03',	150),
('5A8BAE',	'2022-06-12 21:47:00+03',	160),
('2191C6',	'2022-06-09 8:12:00+03	',  540),
('AF7F4D',	'2022-06-04 19:50:00+03',	360),
('53319	',  '2022-06-26 11:42:00+03',	360),
('9F5755',	'2022-06-20 4:34:00+03	',  1000),
('7B3631',	'2022-06-23 19:45:00+03',	1000),
('2EA5C0',	'2022-07-04 6:52:00+03	',  1000),
('4E70B9',	'2022-07-02 8:59:00+03	',  400),
('60D168',	'2022-07-04 19:52:00+03',	600),
('0625F3',	'2022-07-12 16:38:00+03',	200),
('88D454',	'2022-07-08 9:03:00+03	',  200),
('495D86',	'2022-06-20 18:39:00+03',	200),
('7A442E',	'2022-06-21 23:29:00+03',	400),
('017F60',	'2022-07-11 6:24:00+03	',  400),
('F27224',	'2022-07-02 1:18:00+03	',  400),
('23D344',	'2022-06-27 20:13:00+03',	200),
('606B98',	'2022-06-28 15:12:00+03',	200),
('4ED7A7',	'2022-07-08 2:49:00+03	',  400),
('45A0A2',	'2022-06-17 20:18:00+03',	200),
('5AA085',	'2022-06-29 22:21:00+03',	200),
('1A7334',	'2022-06-18 15:45:00+03',	400),
('734731',	'2022-07-13 4:36:00+03	',  200),
('63600D',  '2022-07-11 3:00:00+03	',  400),
('B2A7A5',	'2022-06-22 17:04:00+03',	200),
('7291B5',	'2022-06-25 0:49:00+03	',  200),
('07EFF1',	'2022-06-21 13:01:00+03',	200),
('FADF9C',	'2022-06-28 18:35:00+03',	200),
('E3DCF7',	'2022-06-23 3:47:00+03	',  200),
('6763C5',	'2022-07-01 6:49:00+03	',  1000),
('05FB63',	'2022-07-08 10:32:00+03',	500),
('8A7B69',	'2022-07-27 10:42:00+03',	200),
('9EA7DD',	'2022-07-24 15:52:00+03',	200),
('7148D6',	'2022-07-03 17:21:00+03',	450),
('719579',	'2021-12-30 13:21:00+03',	250),
('B6E1F1',	'2021-12-23 3:04:00+03	',  2000),
('C61348',	'2022-06-29 5:32:00+03	',  6000),
('6BF8A7',	'2022-06-30 13:07:00+03',	3000),
('19EC55',	'2022-06-20 13:13:00+03',	4000),
('F87AC6',	'2022-06-09 6:33:00+03	',  3000),
('547AA8',	'2022-06-26 12:43:00+03',	2000),
('8C1C59',	'2022-06-02 12:17:00+03',	1300),
('0B05D2',	'2022-06-10 10:59:00+03',	3300),
('74C6C2',	'2022-06-20 11:20:00+03',	2500),
('C747E5',	'2022-07-01 15:23:00+03',	2890),
('9DB4C6',	'2022-06-24 11:36:00+03',	9100),
('D5D36E',	'2022-06-08 19:12:00+03',	7000),
('5F6FA7',	'2022-06-23 11:12:00+03',	1000),
('A6CC83',	'2022-06-29 8:39:00+03	',  1000),
('0F9D3E',	'2022-06-29 11:55:00+03',	1200),
('C49879',	'2022-06-23 13:24:00+03',	1400),
('D5E612',	'2022-06-17 18:47:00+03',	2200),
('2F462D',	'2022-06-04 7:16:00+03	',  1000),
('2F462B',	'2022-06-03 6:29:00+03	',  999),
('2F4631',	'2022-06-08 4:17:00+03	',  1000),
('2F46E5',	'2022-06-27 20:38:00+03',	1000),
('2F4712',	'2022-06-21 3:25:00+03	',  1000),
('2F4726',	'2022-06-28 19:49:00+03',	1000),
('2F4737',	'2022-06-26 13:16:00+03',	1000),
('2F4797',	'2022-06-20 4:17:00+03	',  1000),
('2F47D9',	'2022-06-28 21:41:00+03',	1000),
('2F48D0',	'2022-06-17 8:41:00+03	',  1000),
('2F49B8',	'2022-06-25 9:08:00+03	',  1000),
('2F4B91',	'2022-06-15 2:19:00+03	',  1000),
('2F4BB0',	'2022-07-01 23:40:00+03',	1000),
('2F4BE0',	'2022-06-13 5:52:00+03	',  2000),
('2F4BE7',	'2022-06-30 12:57:00+03',   1000),
('2F4BF4',	'2022-06-29 1:21:00+03	',  1000),
('2F4C2B',	'2022-06-10 4:03:00+03	',  1000),
('2F4C2C',	'2022-06-23 0:20:00+03	',  1000),
('2F4C79',	'2022-06-26 21:43:00+03',   1000),
('2F4D36',	'2022-06-21 3:09:00+03	',  1000),
('2F4D96',	'2022-06-23 14:07:00+03',	1000),
('2F4D9C',	'2022-06-13 7:34:00+03	',  1000),
('2F4E17',	'2022-06-06 6:25:00+03	',  1000),
('2F4E94',	'2022-06-03 23:08:00+03',	1000),
('2F4ED1',	'2022-06-13 17:21:00+03',	100),
('2F4F15',	'2022-06-22 12:27:00+03',	200),
('2F4F9F',	'2022-06-26 11:11:00+03',	300),
('2F4FFB',	'2022-06-12 8:44:00+03	',  450),
('2F5012',	'2022-06-23 1:56:00+03	',  340),
('2F503E',	'2022-06-18 17:37:00+03',	200),
('2F50DE',	'2022-06-21 2:03:00+03	',  200),
('2F5147',	'2022-06-04 0:44:00+03	',  340),
('2F5158',	'2022-06-14 5:57:00+03	',  200),
('2F517F',	'2022-06-23 18:10:00+03',	200),
('2F51D6',	'2022-06-12 3:12:00+03	',  200),
('2F5273',	'2022-06-10 23:17:00+03',	200),
('2F52B6',	'2022-06-08 16:03:00+03',	200),
('2F5324',	'2022-06-04 4:11:00+03	',  200),
('2F5331',	'2022-06-26 22:03:00+03',	200),
('2F538E',	'2022-06-08 21:32:00+03',	200),
('2F53D0',	'2022-06-12 13:40:00+03',	200),
('2F540D',	'2022-06-25 7:22:00+03	',  200),
('2F5422',	'2022-06-04 0:30:00+03	',  200),
('2F5430',	'2022-06-23 5:57:00+03	',  200),
('2F5474',	'2022-06-16 15:22:00+03',	200),
('2F548F',	'2022-06-08 3:06:00+03	',  200),
('2F54EB',	'2022-06-26 7:45:00+03	',  200),
('2F5588',	'2022-06-02 10:09:00+03',	200),
('2F572A',	'2022-06-20 2:05:00+03	',  200),
('2F5736',	'2022-06-24 6:27:00+03	',  200),
('2F5755',	'2022-06-12 19:19:00+03',	200),
('2F57E2',	'2022-06-07 5:09:00+03	',  200),
('2F5810',	'2022-06-13 1:44:00+03	',  200),
('2F581A',	'2022-06-17 15:42:00+03',	200),
('2F583B',	'2022-06-06 14:05:00+03',	200),
('2F58ED',	'2022-06-19 4:41:00+03	',  200),
('2F591F',	'2022-06-16 1:57:00+03	',  200),
('2F594E',	'2022-06-21 9:45:00+03	',  200),
('2F5969',	'2022-06-15 8:22:00+03	',  200),
('2F5A24',	'2022-06-28 17:50:00+03',	200),
('2F5A58',	'2022-06-09 16:02:00+03',	200),
('2F5AE3',	'2022-06-07 20:42:00+03',	200),
('2F5B48',	'2022-06-12 18:35:00+03',	200),
('2F5B4E',	'2022-06-08 2:12:00+03	',  200),
('2F5B5A',	'2022-06-21 4:24:00+03	',  200),
('2F5C38',	'2022-06-25 14:08:00+03',	200),
('2F5CA9',	'2022-06-29 9:51:00+03	',  200),
('2F5CD4',	'2022-06-21 4:07:00+03	',  200),
('2F5CE1',	'2022-06-19 2:29:00+03	',  200),
('2F5D18',	'2022-06-14 13:11:00+03',	200),
('2F5D23',	'2022-06-14 4:25:00+03	',  200),
('2F5D63',	'2022-06-27 5:22:00+03	',  200),
('2F5DD6',	'2022-06-03 18:02:00+03',	200),
('2F5DE8',	'2022-06-13 17:07:00+03',	200),
('2F5E47',	'2022-06-15 3:25:00+03	',  200),
('2F5E6E',	'2022-06-09 15:24:00+03',	200),
('2F5E89',	'2022-06-28 11:02:00+03',	200),
('2F5F07',	'2022-06-17 0:50:00+03	',  200),
('2F5F4A',	'2022-06-23 13:47:00+03',	200),
('2F5F96',	'2022-06-15 9:47:00+03	',  200),
('2F6011',	'2022-06-174:20:00+03',     200),
('2F602D',	'2022-06-08 9:33:00+03	',  200),
('2F6032',	'2022-06-27 8:27:00+03	',  200),
('2F606F',	'2022-06-30 21:09:00+03',	200),
('2F60A4',	'2022-06-0615:25:00+03	',  200),
('2F60B1',	'2022-06-06 4:22:00+03	',  200),
('2F6105',	'2022-06-09 23:46:00+03',	200),
('2F6164',	'2022-06-07 5:23:00+03	',  200),
('2F619E',	'2022-06-23 11:52:00+03',	200),
('2F61D6',	'2022-06-12 15:14:00+03',	200),
('2F61DA',	'2022-06-06 16:50:00+03',	200),
('2F61E2',	'2022-06-14 2:08:00+03	',  200),
('2F622D',	'2022-06-17 6:22:00+03	',  200),
('2F6262',	'2022-06-08 11:56:00+03',	200),
('2F62CA',	'2022-06-24 15:20:00+03',	200),
('2F62CC',	'2022-06-22 15:45:00+03',	200),
('2F62D5',	'2022-07-01 20:21:00+03',	200),
('2F62DD',	'2022-06-15 13:11:00+03',	200),
('2F62FD',	'2022-06-05 10:49:00+03',	200),
('2F6320',	'2022-06-02 3:24:00+03	',  200),
('2F6330',	'2022-06-26 15:51:00+03',	200),
('2F6358',	'2022-06-29 14:50:00+03',	200),
('2F63B3',	'2022-06-06 16:09:00+03',	200),
('2F63C9',	'2022-06-22 23:41:00+03',	200),
('2F6502',	'2022-06-25 4:31:00+03	',  200),
('2F6539',	'2022-06-07 19:20:00+03',	200),
('2F656B',	'2022-06-03 0:48:00+03	',  200),
('2F66A1',	'2022-06-26 9:46:00+03	',  200),
('2F66B3',	'2022-06-11 4:17:00+03	',  200),
('2F66D8',	'2022-06-26 11:46:00+03',	200),
('2F673E',	'2022-06-05 21:26:00+03',	200),
('2F675F',	'2022-07-01 3:33:00+03	',  200),
('2F67B3',	'2022-06-27 13:07:00+03',	200),
('2F6833',	'2022-06-04 3:54:00+03	',  200),
('2F6848',	'2022-06-28 18:17:00+03',	200),
('2F6880',	'2022-06-19 23:33:00+03',	200),
('2F6889',	'2022-06-11 12:43:00+03',	200),
('2F689D',	'2022-06-29 7:35:00+03	',  200),
('2F68AD',	'2022-06-16 2:55:00+03	',  200),
('2F68CC',	'2022-06-30 7:37:00+03	',  200),
('2F6934',	'2022-06-22 9:22:00+03	',  200),
('2F696A',	'2022-06-16 7:36:00+03	',  200),
('2F6A7D',	'2022-06-09 18:27:00+03',	200),
('2F6B07',	'2022-06-23 1:37:00+03	',  200),
('2F6B0B',	'2022-06-07 17:28:00+03',	200),
('2F6B36',	'2022-06-28 23:52:00+03',	200),
('2F6BDE',	'2022-06-15 8:47:00+03	',  200),
('2F6BF3',	'2022-07-01 2:29:00+03	',  200),
('2F6C17',	'2022-06-22 22:21:00+03',	200),
('2F6C65',	'2022-06-03 2:38:00+03	',  200),
('2F6C6E',	'2022-06-13 20:05:00+03',	200),
('2F6CC6',	'2022-06-19 11:37:00+03',	200),
('2F6CE1',	'2022-07-01 23:34:00+03',	200),
('2F6D0D',	'2022-06-15 22:01:00+03',	200),
('2F6D1B',	'2022-06-29 21:22:00+03',	200),
('2F6D29',	'2022-06-11 9:21:00+03	',  200),
('2F6D51',	'2022-06-05 20:23:00+03',	200),
('2F6D61',	'2022-06-12 2:27:00+03	',  200),
('2F6D7B',	'2022-06-22 23:42:00+03',	200),
('2F6D97',	'2022-06-29 11:21:00+03',	200),
('2F6DCD',	'2022-06-09 12:40:00+03',	200),
('2F6DDB',	'2022-06-14 23:17:00+03',	200),
('2F6E03',	'2022-06-28 1:42:00+03	',  200),
('2F6E33',	'2022-06-27 16:36:00+03',	200),
('2F6E47',	'2022-06-23 12:48:00+03',	200),
('2F6E95',	'2022-06-11 4:06:00+03	',  200),
('2F6EC4',	'2022-06-26 17:47:00+03',	200),
('2F6ED2',	'2022-06-07 7:34:00+03	',  200),
('2F6F1F',	'2022-07-01 2:41:00+03	',  200),
('2F6F48',	'2022-06-30 0:22:00+03	',  200),
('2F6F59',	'2022-06-11 2:29:00+03	',  200);


COPY flights (flight_id, flight_no, scheduled_departure, scheduled_arrival, departure_airport, arrival_airport, status, aircraft_code, actual_departure, actual_arrival), FROM stdin;




\.


--
-- Name: flights_flight_id_seq; Type: SEQUENCE SET; SCHEMA: Airline; Owner: -
--

SELECT pg_catalog.setval('flights_flight_id_seq', 21332, true);


--
-- Data for Name: seats; Type: TABLE DATA; SCHEMA: Airline; Owner: -
--

COPY seats (aircraft_code, seat_no, fare_conditions) FROM stdin;


\.


--
-- Data for Name: ticket_flights; Type: TABLE DATA; SCHEMA: Airline; Owner: -
--

COPY ticket_flights (ticket_no, flight_id, fare_conditions, amount) FROM stdin;







\.


--
-- Data for Name: tickets; Type: TABLE DATA; SCHEMA: Airline; Owner: -
--

COPY tickets (ticket_no, book_ref, passenger_id, passenger_name, contact_data) FROM stdin;






\.


--
-- Name: aircrafts_data aircrafts_pkey; Type: CONSTRAINT; SCHEMA: Airline; Owner: -
--

ALTER TABLE ONLY aircrafts_data
    ADD CONSTRAINT aircrafts_pkey PRIMARY KEY (aircraft_code);


--
-- Name: airports_data airports_data_pkey; Type: CONSTRAINT; SCHEMA: Airline; Owner: -
--

ALTER TABLE ONLY airports_data
    ADD CONSTRAINT airports_data_pkey PRIMARY KEY (airport_code);


--
-- Name: boarding_passes boarding_passes_flight_id_boarding_no_key; Type: CONSTRAINT; SCHEMA: Airline; Owner: -
--

ALTER TABLE ONLY boarding_passes
    ADD CONSTRAINT boarding_passes_flight_id_boarding_no_key UNIQUE (flight_id, boarding_no);


--
-- Name: boarding_passes boarding_passes_flight_id_seat_no_key; Type: CONSTRAINT; SCHEMA: Airline; Owner: -
--

ALTER TABLE ONLY boarding_passes
    ADD CONSTRAINT boarding_passes_flight_id_seat_no_key UNIQUE (flight_id, seat_no);


--
-- Name: boarding_passes boarding_passes_pkey; Type: CONSTRAINT; SCHEMA: Airline; Owner: -
--

ALTER TABLE ONLY boarding_passes
    ADD CONSTRAINT boarding_passes_pkey PRIMARY KEY (ticket_no, flight_id);


--
-- Name: bookings bookings_pkey; Type: CONSTRAINT; SCHEMA: Airline; Owner: -
--

ALTER TABLE ONLY bookings
    ADD CONSTRAINT bookings_pkey PRIMARY KEY (book_ref);


--
-- Name: flights flights_flight_no_scheduled_departure_key; Type: CONSTRAINT; SCHEMA: Airline; Owner: -
--

ALTER TABLE ONLY flights
    ADD CONSTRAINT flights_flight_no_scheduled_departure_key UNIQUE (flight_no, scheduled_departure);


--
-- Name: flights flights_pkey; Type: CONSTRAINT; SCHEMA: Airline; Owner: -
--

ALTER TABLE ONLY flights
    ADD CONSTRAINT flights_pkey PRIMARY KEY (flight_id);


--
-- Name: seats seats_pkey; Type: CONSTRAINT; SCHEMA: Airline; Owner: -
--

ALTER TABLE ONLY seats
    ADD CONSTRAINT seats_pkey PRIMARY KEY (aircraft_code, seat_no);


--
-- Name: ticket_flights ticket_flights_pkey; Type: CONSTRAINT; SCHEMA: Airline; Owner: -
--

ALTER TABLE ONLY ticket_flights
    ADD CONSTRAINT ticket_flights_pkey PRIMARY KEY (ticket_no, flight_id);


--
-- Name: tickets tickets_pkey; Type: CONSTRAINT; SCHEMA: Airline; Owner: -
--

ALTER TABLE ONLY tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (ticket_no);


--
-- Name: boarding_passes boarding_passes_ticket_no_fkey; Type: FK CONSTRAINT; SCHEMA: Airline; Owner: -
--

ALTER TABLE ONLY boarding_passes
    ADD CONSTRAINT boarding_passes_ticket_no_fkey FOREIGN KEY (ticket_no, flight_id) REFERENCES ticket_flights(ticket_no, flight_id);


--
-- Name: flights flights_aircraft_code_fkey; Type: FK CONSTRAINT; SCHEMA: Airline; Owner: -
--

ALTER TABLE ONLY flights
    ADD CONSTRAINT flights_aircraft_code_fkey FOREIGN KEY (aircraft_code) REFERENCES aircrafts_data(aircraft_code);


--
-- Name: flights flights_arrival_airport_fkey; Type: FK CONSTRAINT; SCHEMA: Airline; Owner: -
--

ALTER TABLE ONLY flights
    ADD CONSTRAINT flights_arrival_airport_fkey FOREIGN KEY (arrival_airport) REFERENCES airports_data(airport_code);


--
-- Name: flights flights_departure_airport_fkey; Type: FK CONSTRAINT; SCHEMA: Airline; Owner: -
--

ALTER TABLE ONLY flights
    ADD CONSTRAINT flights_departure_airport_fkey FOREIGN KEY (departure_airport) REFERENCES airports_data(airport_code);


--
-- Name: seats seats_aircraft_code_fkey; Type: FK CONSTRAINT; SCHEMA: Airline; Owner: -
--

ALTER TABLE ONLY seats
    ADD CONSTRAINT seats_aircraft_code_fkey FOREIGN KEY (aircraft_code) REFERENCES aircrafts_data(aircraft_code) ON DELETE CASCADE;


--
-- Name: ticket_flights ticket_flights_flight_id_fkey; Type: FK CONSTRAINT; SCHEMA: Airline; Owner: -
--

ALTER TABLE ONLY ticket_flights
    ADD CONSTRAINT ticket_flights_flight_id_fkey FOREIGN KEY (flight_id) REFERENCES flights(flight_id);


--
-- Name: ticket_flights ticket_flights_ticket_no_fkey; Type: FK CONSTRAINT; SCHEMA: Airline; Owner: -
--

ALTER TABLE ONLY ticket_flights
    ADD CONSTRAINT ticket_flights_ticket_no_fkey FOREIGN KEY (ticket_no) REFERENCES tickets(ticket_no);


--,
-- Name: tickets tickets_book_ref_fkey; Type,: FK CONSTRAINT; SCHEMA: Airline; Owner: -
--,
,
ALTER TABLE ONLY tickets,    ADD CONSTRAINT tickets_book_ref_fkey FOR,EIGN KEY (book_ref) REFERENCES bookings(book_ref);


(30625  ,'PG0236','2022-02-07 11:35:00+3','2022-02-07 14:35:00+3','ATH','FRA','arrived','MC2','2022-02-07 11:40:00+3	','2022-02-07 14:40:00+3	',1820),
(24836	,'PG0014','2022-06-07 00:50:00+3','2022-06-07 04:20:00+3','ATH','CDG','arrived','32C','2022-06-07 01:30:00+3	','2022-06-07 05:10:00+3	',2100),
(2055	,'PG0019','2022-09-01 14:35:00+3','2022-09-01 18:30:00+3','ATH','LHR','scheduled','32C','\n	','\n	',2390),
(2575	,'PG0029','2022-05-30 6:15:00+3' ,'2022-05-30 10:05:00+3','ATH','MAD','arrived','7M7','2022-05-30 6:15:00+3	','2022-05-30 10:05:00+3	',2380),
(28205	,'PG0032','2022-01-03 6:30:00+3' ,'2022-01-03 8:35:00+3' ,'ATH','FCO','arrived','MC2','2022-01-03 7:00:00+3	','2022-01-03 9:05:00+3	',1085),
(19732	,'PG0035','2022-09-26 16:25:00+3','2022-09-26 19:25:00+3','FRA','ATH','canceled','32C','\n	','\n	',1818),
(19092	,'PG0042','2022-05-11 21:20:00+3','2022-05-11 22:40:00+3','FRA','CDG','scheduled','7M7','\n	','\n	',448),
(6786	,'PG0043','2022-08-27 8:30:00+3' ,'2022-08-27 10:10:00+3','FRA','LHR','scheduled','32N','\n	','\n	',654),
(25029	,'PG0044','2022-07-10 9:50:00+3' ,'2022-07-10 12:30:00+3','FRA','MAD','scheduled','32C','\n	','\n	',1420),
(823	,'PG0045','2022-03-27 21:05:00+3','2022-03-27 22:55:00+3','FRA','FCO','arrived','MC2','2022-03-27 21:15:00+3	','2022-03-27 23:05:00+3	',960),
(16157	,'PG0046','2022-01-16 11:45:00+3','2022-01-16 15:15:00+3','CDG','ATH','canceled','736','\n	','\n	',2100),
(4021	,'PG0049','2022-03-18 16:20:00+3','2022-03-18 17:40:00+3','CDG','FRA','arrived','32N','2022-03-18 16:40:00+3	','2022-03-18 18:00:00+3	',448),
(3660	,'PG0050','2022-07-01 23:55:00+3','2022-07-02 1:25:00+3' ,'CDG','LHR','delayed','7M7','\n	','\n	',348),
(16272	,'PG0051','2022-06-30 23:04:00+3','2022-07-01 1:14:00+3' ,'CDG','MAD','departed','7M7','2022-06-30 23:50:00+3	','\n	',1063),
(3993	,'PG0052','2022-02-17 22:15:00+3','2022-02-18 00:20:00+3','CDG','FCO','arrived','MC2','2022-02-17 22:15:00+3	','2022-02-18 00:20:00+3	',1099),
(22080	,'PG0053','2022-06-30 23:40:00+3','2022-07-01 3:35:00+3' ,'LHR','ATH','on time','MC2','\n	','\n	',2430),
(728	,'PG0055','2022-05-08 3:20:00+3','2022-05-08 5:00:00+3'  ,'LHR','FRA','canceled','MC2','\n	','\n	',654),
(15900	,'PG0056','2022-08-10 9:40:00+3','2022-08-10 11:00:00+3' ,'LHR','CDG','scheduled','7M7','\n	','\n	',348),
(17677	,'PG0061','2022-09-21 12:45:00+3' ,'2022-09-21 15:15:00+3' ,'LHR','MAD','scheduled','7M7','\n	','\n	',1246),
(7862	,'PG0062','2022-06-29 23:55:00+3' ,'2022-06-30 2:30:00+3'  ,'LHR','FCO','departed','32N','2022-06-30 00:35:00+3	','\n	',1450),
(33092	,'PG0063','2022-03-04 18:15:00+3' ,'2022-03-04 22:05:00+3' ,'MAD','ATH','canceled','32C','\n	','\n	',2378),
(7477	,'PG0066','2022-07-01 20:45:00+3' ,'2022-07-01 23:25:00+3' ,'MAD','FRA','on time','736','\n	','\n	',1445),
(29573	,'PG0067','2022-04-15 14:05:00+3' ,'2022-04-15 16:15:00+3' ,'MAD','CDG','arrived','736','2022-04-15 14:25:00+3	','2022-04-15 16:35:00+3	',1063),
(6547	,'PG0089','2022-02-23 19:50:00+3' ,'2022-02-23 22:20:00+3' ,'MAD','LHR','canceled','32C','\n	','\n	',1246),
(1654	,'PG0095','2022-07-02 10:00:00+3' ,'2022-07-02 12:30:00+3' ,'MAD','FCO','scheduled','32N','\n	','\n	',1334),
(21707	,'PG0096','2022-02-08 23:25:00+3' ,'2022-02-09 1:30:00+3'  ,'FCO','ATH','arrived','7M7','2022-02-08 23:30:00+3	','2022-02-09 1:35:00+3	',1090),
(4135	,'PG0106','2022-09-06 22:20:00+3' ,'2022-09-07 00:10:00+3' ,'FCO','FRA','scheduled','32N','\n	','\n	',960),
(21332	,'PG0113','2022-02-04 21:40:00+3' ,'2022-02-04 23:45:00+3' ,'FCO','CDG','arrived','32N','2022-02-04 21:55:00+3	','2022-02-05 00:01:00+3	',1099),
(17856	,'PG0115','2022-06-30 23:00:00+3' ,'2022-07-01 1:35:00+3'  ,'FCO','LHR','delayed','32C','\n	','\n	',1446),
(3108	,'PG0118','2022-02-14 22:30:00+3' ,'2022-02-15 01:00:00+3' ,'FCO','MAD','arrived','MC2','2022-02-14 23:00:00+3	','2022-02-15 01:30:00+3	',1334),
(31103	,'PG0119','2022-07-01 1:35:00+3' ,'2022-07-01 4:35:00+3'  ,'ATH','FRA','on time','MC2','\n	','\n	',1820),
(6223	,'PG0120','2022-07-18 11:15:00+3' ,'2022-07-18 14:15:00+3' ,'FRA','ATH','scheduled','736','\n	','\n	',1818),
(19528	,'PG0121','2022-07-30 22:35:00+3' ,'2022-07-31 1:05:00+3'  ,'LHR','MAD','scheduled','32N','\n	','\n	',1246),
(17534	,'PG0123','2022-01-10 16:50:00+3' ,'2022-01-10 18:55:00+3' ,'FCO','CDG','arrived','MC2','2022-01-10 16:50:00+3	','2022-01-10 18:55:00+3',1099),
(1567	,'PG0124','2022-07-02 20:15:00+3' ,'2022-07-02 22:55:00+3' ,'MAD','FRA','delayed','7M7','\n	','\n	',1445);



