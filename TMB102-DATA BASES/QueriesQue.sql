--erwthma a
select 
ts.passenger_name, fl.flight_no
from flights as fl,boarding_passes as bp,tickets as ts
where 
date_trunc('day', fl.actual_departure)=(now() - INTERVAL '1 day') 
and fl.flight_id = bp.flight_id
and bp.seat_no like '1A' 
and bp.ticket_no = ts.ticket_no

--erwthma b
select count(sts.seat_no) as total_free
from seats as sts
where not exists
(
select bp.seat_no
from flights as fl, boarding_passes as bp
where fl.flight_no='PG0124'
and bp.flight_id=fl.flight_id 
and sts.seat_no=bp.seat_no
)


--erwthma c
select fl.actual_departure - fl.scheduled_departure as f_delay, fl.flight_no
from flights as fl 
order by f_delay;
 desc limit 5

--erwthma d
select tks.passenger_name, sum(fl.distance) as total_distance_km
from  flights as fl, ticket_flights as tf, tickets as tks
where fl.flight_id=tf.flight_id 
and tf.ticket_no= tks.ticket_no
and date_trunc('year', fl.scheduled_departure ) = date_trunc('year', now()) 
group by tks.passenger_name
order by total_distance_km desc
limit 5;

--erwthma e
select ct.city, count(tf.ticket_no) as total_visits
from airports_data as ct,flights as fl, ticket_flights as tf
where ct.airport_code=fl.arrival_airport
and fl.flight_id=tf.flight_id
and date_trunc('year', fl.scheduled_departure ) = date_trunc('year', now())
group by ct.city
order by total_visits desc
limit 5;


--erwthma f
select tks.passenger_name,min(bp.boarding_no) as faster_boarding
from ticket_flights as tf, boarding_passes as bp, tickets as tks
where bp.ticket_no=tf.ticket_no
and tf.ticket_no=tks.ticket_no
group by tks.passenger_name
HAVING count(tks.passenger_name)>2 
order by faster_boarding asc 




