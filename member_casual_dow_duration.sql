select
    cast(date_part('dow', started_at) as INTEGER) as day_of_week,
    member_casual,
    sum(ride_time) as total_duration
from trips
group by 1, 2
order by 1, 2