CREATE DATABASE AIRLINES;
use airlines;
DROP TABLE route_details;
CREATE TABLE route_details (
    route_id INT PRIMARY KEY,  -- Unique identifier for the route
    flight_num VARCHAR(10000),  -- Flight number must start with 'FL'
    origin_airport VARCHAR(100),  -- IATA code for the origin airport
    destination_airport VARCHAR(100),  -- IATA code for the destination airport
    aircraft_id VARCHAR(100),  -- Identifier for the aircraft
    distance_miles DECIMAL(10, 2) CHECK (distance_miles > 0)  -- Distance in miles must be greater than 0
);

-- Adding a unique constraint for the route_id field
ALTER TABLE route_details ADD CONSTRAINT unique_route_id UNIQUE (route_id);

INSERT INTO route_details
VALUES(1, 1111, 'EWR', 'HNL', '767-301ER', 4962);

INSERT INTO route_details
VALUES(2, 1112, 'HNL', 'EWR',	'767-301ER', 4962),
(3, 1113, 'EWR', 'LHR', 'A321', 3466),
(4,	1114, 'DFK', 'LAX',	'767-301ER', 2475),
(5,	1115, 'LAX', 'JFK', '767-301ER', 2475),
(6,	1116, 'HNL', 'LAX',	'767-301ER', 2556),
(7,	1117,	'LAX',	'ORD',	'A321',	1745),
(8,	1118,	'ORD',	'EWR',	'A321',	719),
(9,	1119,	'DEN',	'LAX',	'ERJ142', 862),
(10, 1120,	'HNL',	'DEN',	'A321',	3365),
(12, 1122,	'ABI',	'ADK',	'767-301ER', 4300),
(13, 1123,	'ADK',	'BQN',	'A321',	2232),
(14, 1124,	'BQN',	'CAK',	'A321',	2445),
(15, 1125,	'CAK',	'ANI',	'767-301ER', 2000),
(16, 1126,	'ALB',	'APN',	'A321',	1700),
(17, 1127,	'APN',	'BLV',	'767-301ER', 1900),
(18, 1128,	'ANI',	'BGR',	'ERJ142', 2450),
(19, 1129,	'ATW',	'AVL',	'A321',	2222),
(20, 1130,	'AVL',	'BOI',	'767-301ER', 3134),
(21, 1131,	'BFL',	'BET',	'A321',	2425),
(22, 1132,	'BGR',	'BJI',	'ERJ142', 1242),
(23, 1133,	'BLV',	'BFL',	'767-301ER', 2354),
(24, 1134,	'BJI',	'BQN',	'A321',	1575),
(25, 1135,	'RDM',	'BJI',	'A321',	2425),
(26, 1136,	'BET',	'BTM',	'ERJ142', 1311),
(27, 1137,	'BOI',	'CLD',	'A321',	578),
(28, 1138,	'BOS',	'CDC',	'767-301ER', 246),
(29, 1139,	'BKG',	'CRW',	'767-301ER', 909),
(30, 1140,	'BUR',	'STT',	'CRJ900', 780),
(31, 1141,	'BTM',	'CHA',	'ERJ142', 660),
(32, 1142,	'CLD',	'CHI',	'767-301ER', 246),
(33, 1143,	'CDC',	'CST',	'CRJ900', 1345),
(34, 1144,	'CRW',	'COD',	'A321',	2452),
(35, 1145,	'STT',	'CDB',	'ERJ142', 2121),
(36, 1146,	'CHA',	'COU',	'CRJ900', 1212),
(37, 1147,	'CHI',	'CST',	'767-301ER', 999),
(38, 1148,	'CST',	'DAL',	'A321',	1111),
(39, 1149,	'COD',	'SCC',	'CRJ900', 1579),
(40, 1150,	'CDB',	'DEC',	'A321',	909),
(41, 1151,	'CAE',	'DRT',	'ERJ142', 898),
(42, 1152,	'CSG',	'BOS',	'767-301ER', 890),
(43, 1153,	'CBM',	'BOI',	'A321',	8989),
(44, 1154,	'COU',	'CAK',	'767-301ER', 7676),
(45, 1155,	'CCR',	'EWR',	'CRJ900', 676),
(46, 1156,	'CDV',	'HNL',	'767-301ER', 8668),
(47, 1157,	'DAL',	'LAX',	'CRJ900', 675),
(48, 1158,	'SCC',	'DEN',	'A321',	5645),
(49, 1159,	'DEC',	'ABI',	'A321',	4533),
(50, 1160,	'DRT',	'ORD',	'A321',	2445);


SELECT * FROM route_details;


SELECT DISTINCT p.passenger_id, p.first_name, p.last_name
FROM passengers_on_flights p
WHERE p.route_id BETWEEN '01' AND '25';

SELECT 
    COUNT(*) AS number_flight_num,  -- Count of passengers in business class
    SUM(route_id) AS total_Distance_miles          -- Total revenue from business class tickets
FROM 
     route_details
WHERE 
    class = 'Business';                  -- Filter for business class tickets
    
    
 SELECT 
    first_name + ' ' + last_name AS full_name
FROM 
    customer;   
    
SELECT 
    route_id, 
    flight_num, 
	origin_airport, 
    Destination_airport  -- You can include other route details as needed
FROM 
    route_details 
INNER JOIN 
    route_details r ON route_id = r.route_id;  -- Join on route_id
    
SELECT * FROM route_details; 

SELECT DISTINCT c.customer_id, c.customer_name, c.registration_date
FROM customer c
JOIN ticket_details t ON c.customer_id = t.customer_id
WHERE c.registration_date IS NOT NULL
  AND t.ticket_id IS NOT NULL;
  
  SELECT c.first_name, c.last_name
FROM customer c
JOIN ticket_details t ON c.customer_id = t.customer_id
WHERE t.brand = 'Emirates';

SELECT customer_id, COUNT(*) AS travel_count
FROM passengers_on_flights
WHERE travel_class = 'Economy Plus'
GROUP BY customer_id
HAVING COUNT(*) > 0;

SELECT 
    IF(SUM(revenue) > 10000, 'Revenue has crossed 10000', 'Revenue has not crossed 10000') AS revenue_status
FROM 
    ticket_details;
    
    -- Create a new user
CREATE USER 'new_user'@'localhost' IDENTIFIED BY 'password';

-- Grant privileges to the new user on a specific database
GRANT ALL PRIVILEGES ON database_name.* TO 'new_user'@'localhost';

-- Flush privileges to ensure that the changes take effect
FLUSH PRIVILEGES;

SELECT 
    class,
    ticket_price,
    MAX(ticket_price) OVER (PARTITION BY class) AS max_ticket_price
FROM 
    ticket_details;
    
    WITH MaxPrices AS (
    SELECT 
        class,
        MAX(ticket_price) AS max_ticket_price
    FROM 
        ticket_details
    GROUP BY 
        class
)
SELECT * FROM MaxPrices;

SELECT *
FROM passengers_on_flights
WHERE route_id = 4;
CREATE INDEX idx_route_id ON passengers_on_flights(route_id);

SELECT passenger_id, passenger_name
FROM passengers_on_flights
WHERE route_id = 4;
ANALYZE TABLE passengers_on_flights;
