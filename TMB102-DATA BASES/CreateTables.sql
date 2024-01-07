CREATE TABLE IF NOT EXISTS public.aircrafts_data
(
    aircraft_code character(3) COLLATE pg_catalog."default" NOT NULL,
    model character varying(64) COLLATE pg_catalog."default" NOT NULL,
    range integer NOT NULL,
    CONSTRAINT aircrafts_pkey PRIMARY KEY (aircraft_code),
    CONSTRAINT aircrafts_range_check CHECK (range > 0)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.aircrafts_data
    OWNER to postgres;
    

CREATE TABLE IF NOT EXISTS public.airports_data
(
    airport_code character(3) COLLATE pg_catalog."default" NOT NULL,
    airport_name character varying(64) COLLATE pg_catalog."default" NOT NULL,
    city character varying(32) COLLATE pg_catalog."default" NOT NULL,
    coordinates point NOT NULL,
    timezone text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT airports_data_pkey PRIMARY KEY (airport_code)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.airports_data
    OWNER to postgres;
 
 -- Table: public.boarding_passes

-- DROP TABLE IF EXISTS public.boarding_passes;

CREATE TABLE IF NOT EXISTS public.boarding_passes
(
    ticket_no character(15) COLLATE pg_catalog."default" NOT NULL,
    flight_id integer NOT NULL,
    boarding_no integer NOT NULL,
    seat_no character varying(4) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT boarding_passes_pkey PRIMARY KEY (ticket_no, flight_id),
    CONSTRAINT boarding_passes_flight_id_boarding_no_key UNIQUE (flight_id, boarding_no),
    CONSTRAINT boarding_passes_flight_id_seat_no_key UNIQUE (flight_id, seat_no)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.boarding_passes
    OWNER to postgres;
    
    
-- Table: public.seats

-- DROP TABLE IF EXISTS public.seats;

CREATE TABLE IF NOT EXISTS public.seats
(
    aircraft_code character(3) COLLATE pg_catalog."default" NOT NULL,
    seat_no character varying(4) COLLATE pg_catalog."default" NOT NULL,
    fare_conditions character varying(10) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT seats_pkey PRIMARY KEY (aircraft_code, seat_no),
    CONSTRAINT seats_aircraft_code_fkey FOREIGN KEY (aircraft_code)
        REFERENCES public.aircrafts_data (aircraft_code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE,
    CONSTRAINT seats_fare_conditions_check CHECK (fare_conditions::text = ANY (ARRAY['Economy'::character varying::text, 'First'::character varying::text, 'Business'::character varying::text]))
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.seats
    OWNER to postgres
   
   
   
-- Table: public.ticket_flights

-- DROP TABLE IF EXISTS public.ticket_flights;

CREATE TABLE IF NOT EXISTS public.ticket_flights
(
    ticket_no character(15) COLLATE pg_catalog."default" NOT NULL,
    flight_id integer NOT NULL,
    fare_conditions character varying(10) COLLATE pg_catalog."default" NOT NULL,
    amount numeric(10,2) NOT NULL,
    CONSTRAINT ticket_flights_pkey PRIMARY KEY (ticket_no, flight_id),
    CONSTRAINT ticket_flights_flight_id_fkey FOREIGN KEY (flight_id)
        REFERENCES public.flights (flight_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT ticket_flights_amount_check CHECK (amount >= 0::numeric),
    CONSTRAINT ticket_flights_fare_conditions_check CHECK (fare_conditions::text = ANY (ARRAY['Economy'::character varying::text, 'First'::character varying::text, 'Business'::character varying::text]))
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.ticket_flights
    OWNER to postgres;
    
    -- Table: public.tickets

-- DROP TABLE IF EXISTS public.tickets;

CREATE TABLE IF NOT EXISTS public.tickets
(
    ticket_no character(13) COLLATE pg_catalog."default" NOT NULL,
    book_ref character(6) COLLATE pg_catalog."default" NOT NULL,
    passenger_id character varying(20) COLLATE pg_catalog."default" NOT NULL,
    passenger_name text COLLATE pg_catalog."default" NOT NULL,
    contact_data jsonb,
    CONSTRAINT tickets_book_ref_fkey FOREIGN KEY (book_ref)
        REFERENCES public.bookings (book_ref) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.tickets
    OWNER to postgres;   
    
-- Table: public.bookings

-- DROP TABLE IF EXISTS public.bookings;

CREATE TABLE IF NOT EXISTS public.bookings
(
    book_ref character(6) COLLATE pg_catalog."default" NOT NULL,
    book_date timestamp with time zone NOT NULL,
    total_amount numeric(10,2) NOT NULL,
    CONSTRAINT bookings_pkey PRIMARY KEY (book_ref)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.bookings
    OWNER to postgres;
    
-- Table: public.boarding_passes

-- DROP TABLE IF EXISTS public.boarding_passes;

CREATE TABLE IF NOT EXISTS public.boarding_passes
(
    ticket_no character(15) COLLATE pg_catalog."default" NOT NULL,
    flight_id integer NOT NULL,
    boarding_no integer NOT NULL,
    seat_no character varying(4) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT boarding_passes_pkey PRIMARY KEY (ticket_no, flight_id),
    CONSTRAINT boarding_passes_flight_id_boarding_no_key UNIQUE (flight_id, boarding_no),
    CONSTRAINT boarding_passes_flight_id_seat_no_key UNIQUE (flight_id, seat_no)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.boarding_passes
    OWNER to postgres;
