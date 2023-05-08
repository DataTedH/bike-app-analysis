select
    cast(date_part('dow', started_at) as INTEGER) as day_of_week,
    member_casual,
    count(*) as at_risk_trips
from trips
where ride_time >= interval '1' day
group by 1, 2
order by 1, 2