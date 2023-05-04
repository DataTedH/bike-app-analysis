CREATE TABLE IF NOT EXISTS trips (
                                     ride_id TEXT,
                                     rideable_type TEXT,
                                     started_at TIMESTAMP,
                                     ended_at TIMESTAMP,
                                     start_station_name TEXT,
                                     start_station_id TEXT,
                                     start_station_latitude FLOAT,
                                     start_station_longitude FLOAT,
                                     end_station_name TEXT,
                                     end_station_id TEXT,
                                     end_station_latitude FLOAT,
                                     end_station_longitude FLOAT,
                                     member_casual TEXT,
                                     ride_time INTERVAL
                                 )