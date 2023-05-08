SELECT
    DATE(t.started_at) AS start_date,
    s.latitude,
    s.longitude,
    COUNT(*) AS trip_count
FROM trips t
         JOIN stations s ON t.start_station_id = s.station_id
GROUP BY start_date, s.latitude, s.longitude
