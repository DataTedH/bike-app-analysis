SELECT
    DATE(t.started_at) AS start_date,
    s.latitude,
    s.longitude,
    COUNT(*) AS trip_count
FROM trips t
    JOIN stations s ON t.start_station_id = s.station_id
WHERE
    t.member_casual = 'casual'
    AND t.started_at >= '2022-01-01'
GROUP BY 1, 2, 3
ORDER BY 1