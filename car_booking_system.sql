create database car_booking_systems;
use car_booking_system;

create table users(
	user_id int primary key auto_increment,
    first_name varchar(100),
    last_name varchar(100),
    email varchar(255),
    phone_number varchar(15),
    password varchar(100),
    address varchar(255),
    registration_date datetime
    );
create table carcategories(
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100)
);
create table carrentals(
	car_id int primary key auto_increment,
    car_model varchar(100),
    car_make varchar(100),
    car_type varchar(100),
    price_per_day decimal(10,2),
    available boolean,
    car_description text,
    registration_no varchar(100),
    category_id int,
    FOREIGN KEY (category_id) REFERENCES CarCategories(category_id)
);
create table bookings(
	booking_id int primary key auto_increment,
    user_id int,
    car_id int,
    booking_date datetime,
    start_date datetime,
    end_date datetime,
    total_price decimal(10,2),
    payment_status varchar(50),
    booking_status varchar(50),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (car_id) REFERENCES Carrentals(car_id)
);
create table payments(
    payment_id int primary key auto_increment,
    booking_id int,
    payment_date datetime,
    payment_method varchar(50),
    amount_paid decimal(10,2),
    payment_status varchar(50),
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
);
create table Itineraries(
    itinerary_id int primary key auto_increment,
    booking_id int,
    user_id int,
    pickup_location varchar(255),
    dropoff_location varchar(255),
    itinerary_notes text,
    departure_time datetime,
    return_time datetime,
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
create table caravailability(
    car_id int,
    available_date datetime,
    status varchar(50),
    PRIMARY KEY (car_id, available_date),
    FOREIGN KEY (car_id) REFERENCES carrentals(car_id)
);
INSERT INTO Users (first_name, last_name, email, phone_number, password, address, registration_date) VALUES
('John', 'Doe', 'john.doe@example.com', '+1234567890', 'hashed_password_1', '123 Main St, Cityville, NY', '2024-01-15 10:30:00'),
('Alice', 'Smith', 'alice.smith@example.com', '+1234567891', 'hashed_password_2', '456 Oak Rd, Springfield, IL', '2024-02-20 12:45:00'),
('Bob', 'Johnson', 'bob.johnson@example.com', '+1234567892', 'hashed_password_3', '789 Pine Ave, Denver, CO', '2024-03-10 15:00:00'),
('Charlie', 'Brown', 'charlie.brown@example.com', '+1234567893', 'hashed_password_4', '101 Maple Blvd, Orlando, FL', '2024-04-05 09:00:00'),
('David', 'Lee', 'david.lee@example.com', '+1234567894', 'hashed_password_5', '202 Birch Ln, Austin, TX', '2024-05-20 16:30:00'),
('Eve', 'Davis', 'eve.davis@example.com', '+1234567895', 'hashed_password_6', '303 Cedar St, Phoenix, AZ', '2024-06-18 11:00:00'),
('Frank', 'Miller', 'frank.miller@example.com', '+1234567896', 'hashed_password_7', '404 Elm St, Seattle, WA', '2024-07-25 14:00:00'),
('Grace', 'Wilson', 'grace.wilson@example.com', '+1234567897', 'hashed_password_8', '505 Oakwood Rd, Chicago, IL', '2024-08-01 08:45:00'),
('Hannah', 'Moore', 'hannah.moore@example.com', '+1234567898', 'hashed_password_9', '606 Pinehill Dr, Dallas, TX', '2024-09-10 12:15:00'),
('Isaac', 'Taylor', 'isaac.taylor@example.com', '+1234567899', 'hashed_password_10', '707 Redwood St, San Francisco, CA', '2024-10-22 13:30:00'),
('Jack', 'Anderson', 'jack.anderson@example.com', '+1234567900', 'hashed_password_11', '808 Birchwood Ave, Boston, MA', '2024-11-13 10:45:00'),
('Kelly', 'Thomas', 'kelly.thomas@example.com', '+1234567901', 'hashed_password_12', '909 Spruce St, Portland, OR', '2024-12-01 17:00:00'),
('Liam', 'Jackson', 'liam.jackson@example.com', '+1234567902', 'hashed_password_13', '1001 Maplewood Dr, Miami, FL', '2024-01-10 12:30:00'),
('Mia', 'White', 'mia.white@example.com', '+1234567903', 'hashed_password_14', '1102 Cherry Ln, Salt Lake City, UT', '2024-02-14 11:15:00'),
('Nathan', 'Harris', 'nathan.harris@example.com', '+1234567904', 'hashed_password_15', '1203 Pinecrest Ave, Los Angeles, CA', '2024-03-25 10:00:00'),
('Olivia', 'Clark', 'olivia.clark@example.com', '+1234567905', 'hashed_password_16', '1304 Birchwood Dr, New York, NY', '2024-04-02 14:30:00'),
('Paul', 'Lewis', 'paul.lewis@example.com', '+1234567906', 'hashed_password_17', '1405 Cedarwood Blvd, Houston, TX', '2024-05-15 16:00:00'),
('Quincy', 'Walker', 'quincy.walker@example.com', '+1234567907', 'hashed_password_18', '1506 Red Oak Rd, Washington, DC', '2024-06-28 09:30:00'),
('Rachel', 'Scott', 'rachel.scott@example.com', '+1234567908', 'hashed_password_19', '1607 Pineview Rd, San Diego, CA', '2024-07-08 15:00:00'),
('Sam', 'Adams', 'sam.adams@example.com', '+1234567909', 'hashed_password_20', '1708 Elmwood Dr, Atlanta, GA', '2024-08-18 11:45:00');

INSERT INTO carcategories (category_name) VALUES
('SUV'),
('Sedan'),
('Hatchback'),
('Coupe'),
('Convertible'),
('Minivan'),
('Truck'),
('Luxury'),
('Electric'),
('Hybrid'),
('Sportscar'),
('Family'),
('Compact'),
('Crossover'),
('Wagon'),
('Coupe SUV'),
('Roadster'),
('Pickup'),
('Four-Door'),
('Muscle Car');

INSERT INTO carrentals (car_model, car_make, car_type, price_per_day, available, car_description, registration_no, category_id) VALUES
('Model X', 'Tesla', 'Electric SUV', 120.00, TRUE, 'Electric SUV with autonomous driving features', 'XY123YZ', 9),
('Wrangler', 'Jeep', 'Off-road SUV', 80.00, TRUE, 'Off-road capable SUV perfect for adventure', 'AB456CD', 1),
('Civic', 'Honda', 'Sedan', 45.00, TRUE, 'Compact sedan for city driving', 'ZX987TY', 2),
('Corolla', 'Toyota', 'Sedan', 50.00, TRUE, 'Economical sedan for long drives', 'TY234LM', 2),
('Mustang', 'Ford', 'Sportscar', 150.00, FALSE, 'Classic American muscle car', 'MN567PQ', 20),
('Camry', 'Toyota', 'Sedan', 60.00, TRUE, 'Mid-size sedan with excellent fuel efficiency', 'QR345RT', 2),
('F-150', 'Ford', 'Truck', 90.00, TRUE, 'Full-size pickup truck with towing capabilities', 'ST789UV', 7),
('M3', 'BMW', 'Luxury Sedan', 200.00, TRUE, 'High-performance luxury sedan', 'GH123JK', 8),
('X5', 'BMW', 'Luxury SUV', 180.00, TRUE, 'Luxury SUV with great driving comfort', 'AB654DC', 8),
('Q7', 'Audi', 'Luxury SUV', 175.00, TRUE, 'Spacious luxury SUV with advanced features', 'DC987GF', 8),
('Prius', 'Toyota', 'Hybrid Sedan', 65.00, TRUE, 'Hybrid car with great fuel efficiency', 'IJ456OP', 10),
('F-Type', 'Jaguar', 'Luxury Coupe', 250.00, FALSE, 'Luxury sports coupe with stunning design', 'LM123VW', 20),
('Charger', 'Dodge', 'Muscle Car', 180.00, TRUE, 'Powerful muscle car with aggressive styling', 'NC789BY', 20),
('Explorer', 'Ford', 'SUV', 100.00, TRUE, 'Spacious SUV with great features for family trips', 'PQ567GH', 1),
('Escalade', 'Cadillac', 'Luxury SUV', 220.00, TRUE, 'Large luxury SUV with all the top features', 'KR234DE', 8),
('Yaris', 'Toyota', 'Compact Hatchback', 40.00, TRUE, 'Compact and fuel-efficient hatchback', 'GF123ZX', 3),
('Range Rover', 'Land Rover', 'Luxury SUV', 300.00, TRUE, 'High-end luxury SUV with rugged off-road capabilities', 'JK567TY', 1),
('Suburban', 'Chevrolet', 'Full-size SUV', 120.00, TRUE, 'Large family SUV with ample seating and storage', 'TY123IJ', 1),
('Civic Type R', 'Honda', 'Sport Sedan', 140.00, TRUE, 'Sporty sedan with a powerful engine', 'LM567QR', 2),
('Sienna', 'Toyota', 'Minivan', 85.00, TRUE, 'Family-friendly minivan with ample seating', 'GF123PO', 6);

INSERT INTO bookings (user_id, car_id, booking_date, start_date, end_date, total_price, payment_status, booking_status) VALUES
(1, 1, '2024-01-15 10:30:00', '2024-01-20 09:00:00', '2024-01-25 09:00:00', 600.00, 'Paid', 'Confirmed'),
(2, 2, '2024-02-20 12:45:00', '2024-02-25 10:00:00', '2024-02-28 10:00:00', 225.00, 'Paid', 'Confirmed'),
(3, 3, '2024-03-10 15:00:00', '2024-03-12 08:00:00', '2024-03-15 08:00:00', 135.00, 'Paid', 'Confirmed'),
(4, 4, '2024-04-05 09:00:00', '2024-04-07 10:00:00', '2024-04-10 10:00:00', 210.00, 'Pending', 'Pending'),
(5, 5, '2024-05-20 16:30:00', '2024-05-23 11:00:00', '2024-05-28 11:00:00', 750.00, 'Paid', 'Confirmed'),
(6, 6, '2024-06-18 11:00:00', '2024-06-21 12:00:00', '2024-06-25 12:00:00', 325.00, 'Paid', 'Confirmed'),
(7, 7, '2024-07-25 14:00:00', '2024-07-28 09:00:00', '2024-08-02 09:00:00', 360.00, 'Pending', 'Pending'),
(8, 8, '2024-08-01 08:45:00', '2024-08-05 09:00:00', '2024-08-08 09:00:00', 900.00, 'Paid', 'Confirmed'),
(9, 9, '2024-09-10 12:15:00', '2024-09-12 13:00:00', '2024-09-15 13:00:00', 525.00, 'Paid', 'Confirmed'),
(10, 10, '2024-10-22 13:30:00', '2024-10-25 10:00:00', '2024-10-30 10:00:00', 700.00, 'Pending', 'Pending'),
(11, 11, '2024-11-13 10:45:00', '2024-11-15 08:00:00', '2024-11-18 08:00:00', 540.00, 'Paid', 'Confirmed'),
(12, 12, '2024-12-01 17:00:00', '2024-12-05 09:00:00', '2024-12-10 09:00:00', 625.00, 'Paid', 'Confirmed'),
(13, 13, '2024-01-10 12:30:00', '2024-01-13 08:00:00', '2024-01-16 08:00:00', 195.00, 'Pending', 'Pending'),
(14, 14, '2024-02-14 11:15:00', '2024-02-16 10:00:00', '2024-02-19 10:00:00', 190.00, 'Paid', 'Confirmed'),
(15, 15, '2024-03-25 10:00:00', '2024-03-28 09:00:00', '2024-03-31 09:00:00', 380.00, 'Paid', 'Confirmed'),
(16, 16, '2024-04-02 14:30:00', '2024-04-05 10:00:00', '2024-04-08 10:00:00', 495.00, 'Pending', 'Pending'),
(17, 17, '2024-05-15 16:00:00', '2024-05-18 09:00:00', '2024-05-21 09:00:00', 540.00, 'Paid', 'Confirmed'),
(18, 18, '2024-06-28 09:30:00', '2024-07-01 12:00:00', '2024-07-05 12:00:00', 600.00, 'Paid', 'Confirmed'),
(19, 19, '2024-07-08 15:00:00', '2024-07-10 14:00:00', '2024-07-13 14:00:00', 470.00, 'Paid', 'Confirmed'),
(20, 20, '2024-08-18 11:45:00', '2024-08-20 08:00:00', '2024-08-25 08:00:00', 425.00, 'Pending', 'Pending');

INSERT INTO Payments (booking_id, payment_date, payment_method, amount_paid, payment_status) VALUES
(1, '2024-12-01 10:00:00', 'Credit Card', 250.00, 'Completed'),
(2, '2024-12-02 14:30:00', 'Debit Card', 180.50, 'Completed'),
(3, '2024-12-03 09:15:00', 'PayPal', 300.00, 'Pending'),
(4, '2024-12-03 16:00:00', 'Bank Transfer', 500.00, 'Completed'),
(5, '2024-12-04 08:45:00', 'Credit Card', 150.00, 'Failed'),
(6, '2024-12-04 11:30:00', 'Cash', 100.00, 'Completed'),
(7, '2024-12-05 13:20:00', 'Credit Card', 220.00, 'Pending'),
(8, '2024-12-06 10:00:00', 'Debit Card', 90.00, 'Completed'),
(9, '2024-12-06 15:40:00', 'PayPal', 500.00, 'Completed'),
(10, '2024-12-07 12:10:00', 'Bank Transfer', 450.00, 'Completed'),
(11, '2024-12-08 09:25:00', 'Credit Card', 120.00, 'Failed'),
(12, '2024-12-09 14:00:00', 'Debit Card', 210.00, 'Completed'),
(13, '2024-12-10 13:30:00', 'PayPal', 350.00, 'Pending'),
(14, '2024-12-11 09:00:00', 'Bank Transfer', 400.00, 'Completed'),
(15, '2024-12-11 17:30:00', 'Credit Card', 180.00, 'Completed'),
(16, '2024-12-12 08:00:00', 'Cash', 50.00, 'Completed'),
(17, '2024-12-13 10:00:00', 'Credit Card', 270.00, 'Completed'),
(18, '2024-12-14 11:45:00', 'Debit Card', 230.00, 'Pending'),
(19, '2024-12-14 16:20:00', 'PayPal', 200.00, 'Completed'),
(20, '2024-12-15 14:15:00', 'Bank Transfer', 320.00, 'Completed');

INSERT INTO Itineraries (booking_id, user_id, pickup_location, dropoff_location, itinerary_notes, departure_time, return_time) VALUES
(1, 1, 'New York', 'Los Angeles', 'Business trip, urgent meeting', '2024-12-01 08:00:00', '2024-12-05 18:00:00'),
(2, 2, 'Paris', 'London', 'Vacation trip, visiting family', '2024-12-02 09:00:00', '2024-12-09 17:30:00'),
(3, 3, 'Tokyo', 'Osaka', 'Conference attendance', '2024-12-03 07:30:00', '2024-12-07 15:00:00'),
(4, 4, 'Sydney', 'Melbourne', 'Holiday, sightseeing tour', '2024-12-04 10:00:00', '2024-12-10 14:00:00'),
(5, 5, 'Berlin', 'Munich', 'Business trip, client meeting', '2024-12-05 08:15:00', '2024-12-06 17:00:00'),
(6, 6, 'London', 'Edinburgh', 'University conference', '2024-12-06 09:45:00', '2024-12-08 18:30:00'),
(7, 7, 'Los Angeles', 'San Francisco', 'Road trip with friends', '2024-12-07 11:00:00', '2024-12-12 19:00:00'),
(8, 8, 'Dubai', 'Abu Dhabi', 'Work-related trip', '2024-12-08 07:00:00', '2024-12-10 17:30:00'),
(9, 9, 'Rome', 'Florence', 'Cultural trip, art museums', '2024-12-09 12:30:00', '2024-12-11 16:00:00'),
(10, 10, 'New York', 'Miami', 'Family vacation', '2024-12-10 10:00:00', '2024-12-14 14:30:00'),
(11, 11, 'Los Angeles', 'San Diego', 'Business meeting', '2024-12-11 08:30:00', '2024-12-11 18:30:00'),
(12, 12, 'Paris', 'Nice', 'Holiday, beach relaxation', '2024-12-12 09:00:00', '2024-12-14 17:00:00'),
(13, 13, 'Madrid', 'Barcelona', 'Event, sports competition', '2024-12-13 07:45:00', '2024-12-16 16:00:00'),
(14, 14, 'Tokyo', 'Kyoto', 'Business trip, trade show', '2024-12-14 10:30:00', '2024-12-18 17:00:00'),
(15, 15, 'Amsterdam', 'Brussels', 'Conference attendance', '2024-12-15 11:15:00', '2024-12-18 15:30:00'),
(16, 16, 'Singapore', 'Kuala Lumpur', 'Vacation, shopping spree', '2024-12-16 08:00:00', '2024-12-20 18:30:00'),
(17, 17, 'Los Angeles', 'Las Vegas', 'Short trip, weekend getaway', '2024-12-17 07:30:00', '2024-12-18 20:00:00'),
(18, 18, 'San Francisco', 'Seattle', 'Job interview', '2024-12-18 10:00:00', '2024-12-19 16:00:00'),
(19, 19, 'London', 'Paris', 'Cultural exchange program', '2024-12-19 09:30:00', '2024-12-22 17:00:00'),
(20, 20, 'Toronto', 'Vancouver', 'Family visit', '2024-12-20 08:00:00', '2024-12-24 19:30:00'); 

INSERT INTO caravailability (car_id, available_date, status) VALUES
(1, '2024-12-01 08:00:00', 'Available'),
(1, '2024-12-02 08:00:00', 'Booked'),
(1, '2024-12-03 08:00:00', 'Available'),
(2, '2024-12-01 08:00:00', 'Booked'),
(2, '2024-12-02 08:00:00', 'Available'),
(2, '2024-12-03 08:00:00', 'Maintenance'),
(3, '2024-12-01 08:00:00', 'Available'),
(3, '2024-12-02 08:00:00', 'Booked'),
(3, '2024-12-03 08:00:00', 'Available'),
(4, '2024-12-01 08:00:00', 'Maintenance'),
(4, '2024-12-02 08:00:00', 'Available'),
(4, '2024-12-03 08:00:00', 'Booked'),
(5, '2024-12-01 08:00:00', 'Available'),
(5, '2024-12-02 08:00:00', 'Booked'),
(5, '2024-12-03 08:00:00', 'Available'),
(6, '2024-12-01 08:00:00', 'Booked'),
(6, '2024-12-02 08:00:00', 'Available'),
(6, '2024-12-03 08:00:00', 'Maintenance'),
(7, '2024-12-01 08:00:00', 'Available'),
(7, '2024-12-02 08:00:00', 'Maintenance'); 

DELIMITER $$
CREATE PROCEDURE GetCarsByCategory(IN category_name VARCHAR(100))
BEGIN
    SELECT c.car_id, c.car_make, c.car_type, c.price_per_day, c.car_description, ca.available_date, ca.status
    FROM carrentals c
    JOIN carcategories cc ON c.category_id = cc.category_id
    JOIN caravailability ca ON c.car_id = ca.car_id
    WHERE cc.category_name = category_name;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE GetBookingsByUser(IN user_id INT)
BEGIN
    SELECT b.booking_id, b.booking_date, b.start_date, b.end_date, b.total_price, b.payment_status, b.booking_status
    FROM Bookings b
    WHERE b.user_id = user_id;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE GetAvailableCarsByCategory(IN category_name VARCHAR(100))
BEGIN
    SELECT c.car_id, c.car_model, c.car_type, c.price_per_day, c.car_description, ca.status AS availability_status
    FROM carrentals c
    JOIN carcategories cc ON c.category_id = cc.category_id
    JOIN carAvailability ca ON c.car_id = ca.car_id
    WHERE cc.category_name = category_name AND ca.status = 'Available';
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE GetUsersAndBookings()
BEGIN
    SELECT u.user_id, u.first_name, b.booking_id, b.start_date, b.end_date, c.car_model
    FROM users u
    JOIN bookings b ON u.user_id = b.user_id
    JOIN carrentals c ON b.car_id = c.car_id;
END$$
DELIMITER ; 

DELIMITER $$
CREATE PROCEDURE GetBookingPayments()
BEGIN
    SELECT b.booking_id, b.booking_date, p.payment_status, p.amount_paid
    FROM Bookings b
    LEFT JOIN Payments p ON b.booking_id = p.booking_id;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE GetUsersByPaymentAmount(IN amount DECIMAL(10, 2))
BEGIN
    SELECT u.user_id, u.first_name, u.last_name, b.booking_id, p.amount_paid
    FROM Users u
    JOIN Bookings b ON u.user_id = b.user_id
    JOIN Payments p ON b.booking_id = p.booking_id
    WHERE p.amount_paid = amount;
END$$
DELIMITER ; 

DELIMITER $$
CREATE PROCEDURE GetBookingsByCarModel(IN car_model VARCHAR(100))
BEGIN
    SELECT b.booking_id, b.start_date, b.end_date, u.first_name, u.last_name
    FROM bookings b
    JOIN carrentals c ON b.car_id = c.car_id
    JOIN users u ON b.user_id = u.user_id
    WHERE c.car_model = car_model;
END$$
DELIMITER ; 

DELIMITER $$
CREATE PROCEDURE GetTotalPaymentByUser(IN user_id INT)
BEGIN
    SELECT SUM(p.amount_paid) AS total_paid
    FROM Payments p
    JOIN bookings b ON p.booking_id = b.booking_id
    WHERE b.user_id = user_id;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE GetCarsBookedInRange(IN start_date DATETIME, IN end_date DATETIME)
BEGIN
    SELECT c.car_id, c.car_model, b.booking_id, b.start_date, b.end_date
    FROM carrentals c
    JOIN bookings b ON c.car_id = b.car_id
    WHERE (b.start_date BETWEEN start_date AND end_date)
       OR (b.end_date BETWEEN start_date AND end_date)
       OR (b.start_date <= start_date AND b.end_date >= end_date);
END$$
DELIMITER ; 

DELIMITER $$
CREATE PROCEDURE GetTotalBookingsByCarModel()
BEGIN
    SELECT c.car_model, COUNT(b.booking_id) AS total_bookings
    FROM carrentals c
    LEFT JOIN bookings b ON c.car_id = b.car_id
    GROUP BY c.car_model;
END$$
DELIMITER ;

CALL GetBookingsByUser(1);
CALL GetAvailableCarsByCategory('Luxury');
CALL GetUsersAndBookings(); 
CALL GetBookingPayments();
CALL GetUsersByPaymentAmount(500.00);
CALL GetBookingsByCarModel('Tesla Model X');
CALL GetTotalPaymentByUser(1);
CALL GetCarsBookedInRange('2024-12-01', '2024-12-05');
CALL GetTotalBookingsByCarModel();
CALL GetCarsByCategory('SUV');
