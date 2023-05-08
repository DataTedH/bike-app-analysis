CREATE TABLE IF NOT EXISTS trips (
                                     ride_id TEXT,
                                     rideable_type TEXT,
                                     started_at TIMESTAMP,
                                     ended_at TIMESTAMP,
                                     start_station_id TEXT,
                                     end_station_id TEXT,
                                     member_casual TEXT,
                                     ride_time INTERVAL
                                 )