SELECT
    DATE_TRUNC('month', started_at) AS month_year,
    member_casual,
    COUNT(*) AS trip_count
FROM trips
GROUP BY month_year, member_casual
ORDER BY month_year, member_casual