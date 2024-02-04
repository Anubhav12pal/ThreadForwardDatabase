SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS Vehicle; 
CREATE TABLE Vehicle (
    vehicle_id INT PRIMARY KEY,
    model VARCHAR(50),
    color VARCHAR(20),
    company VARCHAR(20),
    package_capacity INT,
    registration_number INT
);

DROP TABLE IF EXISTS Warehouse;
CREATE TABLE Warehouse (
    warehouse_id INT PRIMARY KEY,
    storage_place VARCHAR(50),
    donation_dropoff VARCHAR(50),
    garages VARCHAR(50),
    offices VARCHAR(50),
    state VARCHAR(2),
    street VARCHAR(50),
    city VARCHAR(20),
    zip INT
);

DROP TABLE IF EXISTS DeliveryLocation;
CREATE TABLE DeliveryLocation (
    location_id INT PRIMARY KEY,
    name VARCHAR(50),
    phone_number VARCHAR(15),
    email VARCHAR(50),
    city VARCHAR(20),
    state VARCHAR(2),
    street VARCHAR(50),
    zip INT,
    category VARCHAR(50),
    tracking_number INT,
    employee_id INT
);


DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    phone_number VARCHAR(15),
    employee_type VARCHAR(20),
    location_id INT
);


DROP TABLE IF EXISTS Package;
CREATE TABLE Package (
    tracking_number INT PRIMARY KEY,
    package_id INT,
    clothing_id INT,
    location_id INT,
    vehicle_id INT,
    warehouse_id INT
);


DROP TABLE IF EXISTS Request;
CREATE TABLE Request (
    request_id INT PRIMARY KEY,
    clothing_id INT
    
);

DROP TABLE IF EXISTS Clothing;
CREATE TABLE Clothing (
    clothing_id INT PRIMARY KEY,
    clothing_type VARCHAR(20),
    gender VARCHAR(1),
    size VARCHAR(3),
    quantity INT
);

ALTER TABLE DeliveryLocation
ADD CONSTRAINT tracking_number_fk
FOREIGN KEY (tracking_number)
REFERENCES Package (tracking_number);

ALTER TABLE DeliveryLocation
ADD CONSTRAINT employee_id_fk
FOREIGN KEY (employee_id)
REFERENCES Employee (employee_id);

ALTER TABLE Package
ADD CONSTRAINT location_id_fk
FOREIGN KEY (location_id)
REFERENCES DeliveryLocation (location_id);

ALTER TABLE Package
ADD CONSTRAINT vehicle_id_fk
FOREIGN KEY (vehicle_id)
REFERENCES Vehicle (vehicle_id);

ALTER TABLE Package
ADD CONSTRAINT clothing_id_fk
FOREIGN KEY (clothing_id)
REFERENCES Clothing (clothing_id);

ALTER TABLE Package
ADD CONSTRAINT warehouse_id_fk
FOREIGN KEY (warehouse_id)
REFERENCES Warehouse (warehouse_id);

ALTER TABLE Request
ADD CONSTRAINT req_clothing_id_fk
FOREIGN KEY (clothing_id)
REFERENCES Clothing (clothing_id);

ALTER TABLE Employee
ADD CONSTRAINT location_id_pk
FOREIGN KEY (location_id)
REFERENCES DeliveryLocation (location_id);


-- Insert 10 locations into the DeliveryLocation table (all from Turkey)
INSERT INTO DeliveryLocation (location_id, name, phone_number, email, city, state, street, zip, category, tracking_number, employee_id) VALUES
(1, 'Location 1', '555-1001', 'location1@example.com', 'Istanbul', 'TR', '1 Istiklal St', 34000, 'Residential', 30001, 1),
(2, 'Location 2', '555-1002', 'location2@example.com', 'Istanbul', 'TR', '2 Istiklal St', 34001, 'Commercial', 30002, 2),
(3, 'Location 3', '555-1003', 'location3@example.com', 'Ankara', 'TR', '3 Ataturk Blvd', 65000, 'Residential', 30003, 3),
(4, 'Location 4', '555-1004', 'location4@example.com', 'Ankara', 'TR', '4 Ataturk Blvd', 65001, 'Commercial', 30004, 4),
(5, 'Location 5', '555-1005', 'location5@example.com', 'Izmir', 'TR', '5 Kordon St', 35000, 'Residential', 30005, 5),
(6, 'Location 6', '555-1006', 'location6@example.com', 'Izmir', 'TR', '6 Kordon St', 35001, 'Commercial', 30006, 6),
(7, 'Location 7', '555-1007', 'location7@example.com', 'Antalya', 'TR', '7 Lara St', 70000, 'Residential', 30007, 7),
(8, 'Location 8', '555-1008', 'location8@example.com', 'Antalya', 'TR', '8 Lara St', 70001, 'Commercial', 30008, 8),
(9, 'Location 9', '555-1009', 'location9@example.com', 'Bursa', 'TR', '9 Uludag St', 16000, 'Residential', 30009, 9),
(10, 'Location 10', '555-1010', 'location10@example.com', 'Bursa', 'TR', '10 Uludag St', 16001, 'Commercial', 30010, 10);

-- Insert 20 employees into the Employee table (10 drivers and 10 workers)
INSERT INTO Employee (employee_id, name, phone_number, employee_type, location_id) VALUES
(1, 'Ali', '555-2001', 'Driver', 1),
(2, 'Ayse', '555-2002', 'Driver', 2),
(3, 'Mehmet', '555-2003', 'Driver', 3),
(4, 'Fatma', '555-2004', 'Driver', 4),
(5, 'Hasan', '555-2005', 'Driver', 5),
(6, 'Emine', '555-2006', 'Driver', 6),
(7, 'Ahmet', '555-2007', 'Driver', 7),
(8, 'Zeynep', '555-2008', 'Driver', 8),
(9, 'Murat', '555-2009', 'Driver', 9),
(10, 'Nesrin', '555-2010', 'Driver', 10),
(11, 'Osman', '555-2011', 'Worker', 1),
(12, 'Seda', '555-2012', 'Worker', 2),
(13, 'Can', '555-2013', 'Worker', 3),
(14, 'Elif', '555-2014', 'Worker', 4),
(15, 'Ismail', '555-2015', 'Worker', 5),
(16, 'Derya', '555-2016', 'Worker', 6),
(17, 'Kemal', '555-2017', 'Worker', 7),
(18, 'Merve', '555-2018', 'Worker', 8),
(19, 'Hakan', '555-2019', 'Worker', 9),
(20, 'Gul', '555-2020', 'Worker', 10);

-- Insert 10 vehicles into the Vehicle table
INSERT INTO Vehicle (vehicle_id, model, color, company, package_capacity, registration_number) VALUES
(1, 'Ford Transit', 'White', 'Ford', 10, 10001),
(2, 'Mercedes Sprinter', 'Blue', 'Mercedes-Benz', 12, 10002),
(3, 'Volkswagen Crafter', 'Red', 'Volkswagen', 11, 10003),
(4, 'Iveco Daily', 'Silver', 'Iveco', 10, 10004),
(5, 'Renault Master', 'Black', 'Renault', 9, 10005);

-- Insert 10 warehouses into the Warehouse table
INSERT INTO Warehouse (warehouse_id, storage_place, donation_dropoff, garages, offices, state, street, city, zip) VALUES
(1, 'Storage A', 'Dropoff A', 'Garage A', 'Office A', 'TR', 'AtatC<rk Caddesi', 'Istanbul', 34000),
(2, 'Storage B', 'Dropoff B', 'Garage B', 'Office B', 'TR', 'D0nC6nC< Caddesi', 'Ankara', 6000),
(3, 'Storage C', 'Dropoff C', 'Garage C', 'Office C', 'TR', 'Cumhuriyet Caddesi', 'Izmir', 35200);

-- Insert 20 packages into the Package table
INSERT INTO Package (tracking_number, package_id, clothing_id, location_id, vehicle_id, warehouse_id) VALUES
(30001, 1, 3, 1, 1, 2),
(30002, 2, 5, 2, 2, 1),
(30003, 3, 4, 3, 5, 3),
(30004, 4, 13, 4, 4, 2),
(30005, 5, 35, 5, 3, 2),
(30006, 6, 24, 6, 4, 1),
(30007, 7, 24, 7, 5, 1),
(30008, 8, 34, 8, 5, 1),
(30009, 9, 1, 9, 1, 2),
(30010, 10, 2, 10, 1, 2),
(30011, 11, 3, 1, 1, 3),
(30012, 12, 8, 2, 4, 1),
(30013, 13, 17, 3, 3, 1),
(30014, 14, 22, 4, 2, 2),
(30015, 15, 25, 5, 2, 3),
(30016, 16, 38, 6, 3, 3),
(30017, 17, 5, 7, 5, 3),
(30018, 18, 13, 8, 1, 1),
(30019, 19, 21, 9, 4, 2),
(30020, 20, 33, 10, 3, 3);

-- Insert 20 requests into the Request table
INSERT INTO Request (request_id, clothing_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20);

-- Insert 40 clothing items into the Clothing table
INSERT INTO Clothing (clothing_id, clothing_type, gender, size, quantity) VALUES
(1, 'Shirt', 'M', 'L', 5),
(2, 'Shirt', 'M', 'M', 7),
(3, 'Shirt', 'M', 'S', 3),
(4, 'Shirt', 'F', 'L', 6),
(5, 'Shirt', 'F', 'M', 8),
(6, 'Shirt', 'F', 'S', 4),
(7, 'Pants', 'M', 'L', 10),
(8, 'Pants', 'M', 'M', 12),
(9, 'Pants', 'M', 'S', 6),
(10, 'Pants', 'F', 'L', 11),
(11, 'Pants', 'F', 'M', 13),
(12, 'Pants', 'F', 'S', 7),
(13, 'Jacket', 'M', 'L', 4),
(14, 'Jacket', 'M', 'M', 5),
(15, 'Jacket', 'M', 'S', 2),
(16, 'Jacket', 'F', 'L', 5),
(17, 'Jacket', 'F', 'M', 6),
(18, 'Jacket', 'F', 'S', 3),
(19, 'Dress', 'F', 'L', 7),
(20, 'Dress', 'F', 'M', 9),
(21, 'Dress', 'F', 'S', 5),
(22, 'Skirt', 'F', 'L', 6),
(23, 'Skirt', 'F', 'M', 8),
(24, 'Skirt', 'F', 'S', 4),
(25, 'T-shirt', 'M', 'L', 10),
(26, 'T-shirt', 'M', 'M', 12),
(27, 'T-shirt', 'M', 'S', 6),
(28, 'T-shirt', 'F', 'L', 11),
(29, 'T-shirt', 'F', 'M', 13),
(30, 'T-shirt', 'F', 'S', 7),
(31, 'Shorts', 'M', 'L', 4),
(32, 'Shorts', 'M', 'M', 5),
(33, 'Shorts', 'M', 'S', 2),
(34, 'Shorts', 'F', 'L', 5),
(35, 'Shorts', 'F', 'M', 6),
(36, 'Shorts', 'F', 'S', 3),
(37, 'Sweater', 'M', 'L', 7),
(38, 'Sweater', 'M', 'M', 9),
(39, 'Sweater', 'M', 'S', 5),
(40, 'Sweater', 'F', 'L', 8);

-- Find the count of the number of packages sent through the vehicle that is assigned the most packages to deliver
SELECT p.vehicle_id, COUNT(p.package_id) AS total_packages
FROM Package p
JOIN Vehicle v ON p.vehicle_id = v.vehicle_id
GROUP BY p.vehicle_id
ORDER BY total_packages DESC;

-- Show a listing of a key entity in the database

SELECT TABLE_NAME, COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'ThreadForwardProject' AND COLUMN_KEY = 'PRI';

-- Get all donations of a specific clothing type 
SELECT clothing_id,  clothing_type 
FROM Clothing 
WHERE clothing_type = 'Shirt' AND gender = 'M';

-- Find most requested clothing type
SELECT c.clothing_type, COUNT(*) AS request_count
FROM Request r
JOIN Clothing c ON r.clothing_id = c.clothing_id
GROUP BY c.clothing_type
ORDER BY request_count DESC
LIMIT 1;

-- From all delivery locations, derives an aggregate table with the location ids and names of locations that are in the same city of (city) and zipcode of (zipcode). 
FROM DeliveryLocation a
INNER JOIN DeliveryLocation b
ON a.city = b.city AND a.zip = b.zip 
ORDER BY a.location_id;

-- Displays the clothing stock before
SELECT *
FROM Clothing;

-- Uodating the clothing stock, as the Large shirts were burned due to fire.
UPDATE Clothing
SET quantity = 0
WHERE clothing_type = 'Shirt' AND size = 'L';

-- Displaying the updated Clothing 
SELECT *
FROM Clothing;




