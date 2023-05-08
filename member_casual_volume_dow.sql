select
    cast(date_part('dow', started_at) as INTEGER) as day_of_week,
    member_casual,
    count(*) as trips_taken
from trips
group by 1, 2
order by 1, 2