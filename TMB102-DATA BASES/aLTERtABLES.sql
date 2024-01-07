ALTER TABLE ONLY aircrafts_data
    ADD CONSTRAINT aircrafts_pkey PRIMARY KEY (aircraft_code);




ALTER TABLE ONLY airports_data
    ADD CONSTRAINT airports_data_pkey PRIMARY KEY (airport_code);






ALTER TABLE ONLY boarding_passes
    ADD CONSTRAINT boarding_passes_pkey PRIMARY KEY (ticket_no, flight_id);



ALTER TABLE ONLY bookings
    ADD CONSTRAINT bookings_pkey PRIMARY KEY (book_ref);





ALTER TABLE ONLY flights
    ADD CONSTRAINT flights_pkey PRIMARY KEY (flight_id);


ALTER TABLE ONLY seats
    ADD CONSTRAINT seats_pkey PRIMARY KEY (aircraft_code, seat_no);



ALTER TABLE ONLY ticket_flights
    ADD CONSTRAINT ticket_flights_pkey PRIMARY KEY (ticket_no, flight_id);









ALTER TABLE ONLY flights
    ADD CONSTRAINT flights_aircraft_code_fkey FOREIGN KEY (aircraft_code) REFERENCES aircrafts_data(aircraft_code);




ALTER TABLE ONLY flights
    ADD CONSTRAINT flights_arrival_airport_fkey FOREIGN KEY (arrival_airport) REFERENCES airports_data(airport_code);



ALTER TABLE ONLY flights
    ADD CONSTRAINT flights_departure_airport_fkey FOREIGN KEY (departure_airport) REFERENCES airports_data(airport_code);




ALTER TABLE ONLY seats
    ADD CONSTRAINT seats_aircraft_code_fkey FOREIGN KEY (aircraft_code) REFERENCES aircrafts_data(aircraft_code) ON DELETE CASCADE;



ALTER TABLE ONLY ticket_flights
    ADD CONSTRAINT ticket_flights_flight_id_fkey FOREIGN KEY (flight_id) REFERENCES flights(flight_id);







ALTER TABLE ONLY tickets
    ADD CONSTRAINT tickets_book_ref_fkey FOREIGN KEY (book_ref) REFERENCES bookings(book_ref);
    
ALTER TABLE ONLY tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (ticket_no);    
    
select t.ticket_no, count(*) from tickets t group by t.ticket_no having count(*)>1 order by t.ticket_no 

select a2.* from
(select t.ticket_no from tickets t group by t.ticket_no having count(*)>1) as a1, tickets as a2
where a1.ticket_no = a2.ticket_no
order by a2.ticket_no, a2.contact_data

update tickets t1 set t1.ticket_no= t1.ticket_no + 10000000000
where t1.ticket_no=(select t2.ticket_no from tickets t2 where t2.ticket_no=0005433367218)



--0005433367218, 0005433367219
--select * from tickets t1 where t1.ticket_no in 
update tickets t0 
set t0.ticket_no = '1' + t0.ticket_no
from 
(select a2.* from
(select t.ticket_no from tickets t group by t.ticket_no having count(*)>1) as a1, tickets as a2
where a1.ticket_no = a2.ticket_no) as t2
where t0.ticket_no=t2.ticket_no 
and t0.contact_data > t2.contact_data

