-- Codility - Shortest time of the fight from New York to Tokyo
select
    min(journey_time)
from (
    -- Direct flight
    select
        timestampdiff(minute, departure_time, arrival_time) as journey_time
    from
        flights
    where
        origin_port_code in (select port_code from airports where city = 'New York')
        and destination_port_code in (select port_code from airports where city = 'Tokyo')
    union
    -- Transist flight
    select
        timestampdiff(minute, first_flight.departure_time, second_flight.arrival_time) as journey_time
    from (
        select
            destination_port_code, departure_time, arrival_time
        from
            flights
        where
            origin_port_code in (select port_code from airports where city = 'New York')
    ) as first_flight
    inner join (
        select
            origin_port_code, departure_time, arrival_time
        from
            flights
        where
            destination_port_code in (select port_code from airports where city = 'Tokyo')
    ) as second_flight
    on first_flight.destination_port_code = second_flight.origin_port_code
    where
        first_flight.arrival_time <= second_flight.departure_time
)
