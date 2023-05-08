select
    cast(date_part('dow', started_at) as INTEGER) as day_of_week,
    member_casual,
    avg(ride_time) as average_duration
from trips
group by 1, 2
order by 1, 2