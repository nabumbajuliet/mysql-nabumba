-- Active: 1728711505202@@127.0.0.1@3306@hotel_management
SHOW DATABASES;
CREATE TABLE guests (
guest_id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL,
phone VARCHAR(20)
);
INSERT INTO guests (first_name, last_name, email, phone) VALUES
('John', 'Smith', 'john.smith@email.com', '+1-555-123-4567'),
('Emma', 'Johnson', 'emma.j@email.com', '+1-555-234-5678'),
('Michael', 'Brown', 'michael.b@email.com', '+1-555-345-6789'),
('Sarah', 'Davis', 'sarah.d@email.com', '+1-555-456-7890'),
('David', 'Wilson', 'david.w@email.com', '+1-555-567-8901');
CREATE TABLE rooms (
room_id INT PRIMARY KEY AUTO_INCREMENT,
room_number VARCHAR(10) UNIQUE NOT NULL,
room_type ENUM('Single', 'Double', 'Suite', 'Deluxe') NOT NULL,
floor_number INT NOT NULL,
rate_per_night DECIMAL(10,2) NOT NULL,
status ENUM('Available', 'Occupied', 'Maintenance') DEFAULT 'Available',
description TEXT
);
INSERT INTO rooms (room_number, room_type, floor_number, rate_per_night, status, description) VALUES
('101', 'Single', 1, 100.00, 'Available', 'Cozy single room with city view'),
('201', 'Double', 2, 150.00, 'Occupied', 'Spacious double room with twin beds'),
('301', 'Suite', 3, 300.00, 'Available', 'Luxury suite with living room and kitchen'),
('401', 'Deluxe', 4, 250.00, 'Maintenance', 'Deluxe room with ocean view'),
('202', 'Double', 2, 150.00, 'Available', 'Double room with mountain view');
CREATE TABLE bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    guest_id INT NOT NULL,
    room_id INT NOT NULL,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    booking_status ENUM('Confirmed', 'Checked-in', 'Checked-out', 'Cancelled') DEFAULT 'Confirmed',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (guest_id) REFERENCES guests(guest_id),
    FOREIGN KEY (room_id) REFERENCES rooms(room_id)
);
INSERT INTO bookings (guest_id, room_id, check_in_date, check_out_date, total_amount, booking_status) VALUES
(1, 1, '2024-10-20', '2024-10-23', 300.00, 'Confirmed'),
(2, 2, '2024-10-19', '2024-10-21', 300.00, 'Checked-in'),
(3, 3, '2024-10-25', '2024-10-28', 900.00, 'Confirmed'),
(4, 4, '2024-10-18', '2024-10-19', 250.00, 'Checked-out'),
(5, 5, '2024-10-22', '2024-10-24', 300.00, 'Confirmed');
CREATE TABLE Payment (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method ENUM('Cash', 'Credit Card', 'Debit Card', 'Online Transfer') NOT NULL,
    payment_status ENUM('Pending', 'Completed', 'Failed', 'Refunded') DEFAULT 'Pending',
    transaction_reference VARCHAR(100),
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
);
INSERT INTO payment (booking_id, amount, payment_method, payment_status, transaction_reference) VALUES
(1, 300.00, 'Credit Card', 'Completed', 'TXN123456'),
(2, 300.00, 'Debit Card', 'Completed', 'TXN123457'),
(3, 450.00, 'Online Transfer', 'Pending', 'TXN123458'),
(4, 250.00, 'Cash', 'Completed', 'TXN123459'),
(5, 150.00, 'Credit Card', 'Completed', 'TXN123460');
select*from guests;
select*from rooms;
select*from bookings;
select*from payment;