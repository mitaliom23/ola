CREATE DATABASE OLA;
USE OLA;
Create View Successful_Bookings AS
SELECT * FROM Bookings
WHERE Booking_Status = 'Success';

SELECT * FROM Successful_Bookings;

Create View ride_distance_for_each_vehicle AS
SELECT Vehicle_Type, AVG(Ride_Distance)
as avg_distance FROM bookings
GROUP BY Vehicle_Type;
SELECT * FROM ride_distance_for_each_vehicle ;

Create View  canceled_rides_by_customers AS
SELECT COUNT(*) FROM Bookings
WHERE Booking_status = 'Canceled by customers';

SELECT * FROM canceled_rides_by_customers;

DROP TABLE IF EXISTS Top_5_customers;
CREATE VIEW Top_5_customers AS  
SELECT Customer_ID, COUNT(Booking_ID) as total_rides  
FROM bookings  
GROUP BY Customer_ID  
ORDER BY total_rides DESC  
LIMIT 5;
SELECT * FROM Top_5_customers;

CREATE VIEW Rides_canceled_by_drivers_P_C_Issues AS
SELECT COUNT(*) FROM Bookings
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';

CREATE VIEW Max_Min_Driver_Rating AS
SELECT MAX(Driver_Ratings) as max_rating,
MIN(Driver_Ratings) as min_rating
FROM Bookings WHERE Vehicle_Type = 'Prime Sedan';

CREATE VIEW UPI_Payment AS
SELECT * FROM Bookings
WHERE Payment_Method ='UPI';

CREATE VIEW  AVG_Cust_Rating AS
SELECT Vehicle_Type, AVG(Customer_Rating) AS avg_customer_rating
FROM Bookings
GROUP BY Vehicle_Type;

CREATE VIEW total_successful_ride AS
SELECT SUM(Booking_Value) as total_successful_value
FROM Bookings
WHERE Booking_status = 'Success';

CREATE VIEW Incomplete_Rides_Reason AS
SELECT Booking_ID, Incomplete_Rides_Reason
FROM Bookings
WHERE Incomplete_Rides = 'Yes';
 SELECT * FROM Incomplete_Rides_Reason;
 




