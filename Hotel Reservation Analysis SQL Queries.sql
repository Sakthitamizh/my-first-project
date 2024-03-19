show databases;
use hotel_reservation;
show tables;
select * from hotel_reserve;

#1  TOTAL NUMBER OF RESERVATIONS
SELECT COUNT(*) as total_number_of_reservations
FROM hotel_reserve;

#2 MOST POPULAR MEAL PLAN
SELECT type_of_meal_plan as most_popular_meal_plan, COUNT(type_of_meal_plan) as total_guests_selected
FROM hotel_reserve
GROUP BY type_of_meal_plan 
HAVING COUNT(*) >1
LIMIT 1;

#3 AVG RICE PER ROOM FOR RESERVATIONS INVOLVING CHILD
SELECT booking_id, no_of_children, avg_price_per_room
FROM hotel_reserve
WHERE no_of_children > 0
LIMIT 10;

#4 NO OF RESERVATIONS IN 2018
SELECT COUNT(*) as Total_reservations, EXTRACT(YEAR FROM arrival_date) AS YEAR
FROM hotel_reserve
GROUP BY EXTRACT(YEAR FROM arrival_date)
HAVING YEAR = 2018;

#5 MOST COMMONLY BOOKED ROOM TYPE
SELECT room_type_reserved as most_booked_room_type, COUNT(room_type_reserved) as total_no_of_bookings 
FROM hotel_reserve
GROUP BY room_type_reserved
HAVING COUNT(*) >= 1
ORDER BY total_no_of_bookings DESC
LIMIT 1;

#6 NO OF RESERVATIONS FALL ON WEEKEND
SELECT COUNT(no_of_weekend_nights) as no_of_weekend_nights_reservations
FROM hotel_reserve
WHERE no_of_weekend_nights > 0; 

#7 HIGHEST AND LOWEST LEAD TIME
SELECT MAX(lead_time) as Highest_lead_time, MIN(lead_time) as Lowest_lead_time
FROM hotel_reserve;

#8 MOST COMMON MARKET SEGMENT TYPE
SELECT market_segment_type AS most_common_segment_type, COUNT(market_segment_type) AS segment_type_counts
FROM hotel_reserve
GROUP BY market_segment_type
HAVING COUNT(*) >= 1
ORDER BY most_common_segment_type DESC
LIMIT 1;

#9 NO OF RESERVATIONS WITH CONFIRMED STATUS
SELECT COUNT(booking_status) AS bookings_with_confirmed
FROM hotel_reserve
WHERE booking_status = "Confirmed";

#10 TOTAL ADULT AND CHILDREN 
SELECT SUM(no_of_adults) AS Total_adults, SUM(no_of_children) as Total_children
FROM hotel_reserve;

#11 AVG NO OF WEEKEND NIGHTS INVOLVING CHILDREN
SELECT no_of_children, avg(no_of_weekend_nights)
FROM hotel_reserve
WHERE no_of_children > 0
GROUP BY no_of_children;

#12 RESERVATIONS MADE IN EACH MONTH OF THE YEAR
SELECT EXTRACT(MONTH FROM arrival_date) as Month, COUNT(*) as no_of_reservations
FROM hotel_reserve
GROUP BY EXTRACT(MONTH FROM arrival_date)
ORDER BY Month;

#13 AVG NO OF NIGHTS SPENT BY GUEST FOR EACH ROOM TYPE
SELECT room_type_reserved, AVG(no_of_week_nights), AVG(no_of_weekend_nights) 
FROM hotel_reserve
GROUP BY room_type_reserved;

#14 MOST COMMON ROOM TYPE FOR RESERVATIONS WITH CHILDREN AND AVG PRICE
SELECT room_type_reserved AS most_common_used_room_type, COUNT(*) AS num_of_reservations_with_children, AVG(avg_price_per_room) AS Avg_price_of_room_type
FROM hotel_reserve
WHERE no_of_children > 0
GROUP BY room_type_reserved
ORDER BY num_of_reservations_with_children DESC
LIMIT 1;

#15 MARKET SEGMENT TYPE WHICH GENERATES HIGHEST AVG PRICE PER ROOM
SELECT market_segment_type, MAX(avg_price_per_room) AS Highest_avg_price
FROM hotel_reserve
GROUP BY market_segment_type
ORDER BY Highest_avg_price DESC
LIMIT 1;