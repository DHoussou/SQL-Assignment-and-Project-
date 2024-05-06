-- HW 2 - SQL DDL+DML
-- Replace nnn with your ID

USE BMGT402_DB_Student_119
PRINT 'dropping tables - order matters'
-- <Q1>
-- DROP TABLE statements here
-- <A1>
DROP TABLE IF EXISTS [HW2.Booking] ;
DROP TABLE IF EXISTS [HW2.Guest] ;
DROP TABLE IF EXISTS [HW2.Room] ;
DROP TABLE IF EXISTS [HW2.Hotel] ;

-- CREATE TABLE and INSERT INTO statements here
-- <Q2>
-- CREATE TABLE Hotel here
-- attributes: hotelNo, hotelName, city
-- Use CHAR and VARCHAR datatypes.

-- <A2>

CREATE TABLE [HW2.Hotel] (
hotelNo CHAR (4) NOT NULL,
hotelName VARCHAR (25),
ciity VARCHAR (25),
CONSTRAINT pk_Hotel2_hotelNo PRIMARY KEY (hotelNo) );

INSERT INTO [HW2.Hotel] VALUES
('fb01', 'Grosvenor', 'London'),
('ch01', 'Omni Shoreham', 'London');
-- <Q3>
-- Complete 2 more insertions for ch02 and dc01.
-- ch02 Phoenix Park London
-- dc01 Latham Berlin
-- fb02 Watergate. Paris

-- <A3>
INSERT INTO [HW2.Hotel] VALUES
('ch02', 'Phoenix Park', 'London'),
('dc01', 'Latham', 'Berlin'),
('fb02', 'Watergate', 'Paris');
-- <Q4>
-- CREATE TABLE Room here
-- attributes: roomNo, hotelNo, type, price
-- Use SMALLINT, CHAR, VARCHAR and DECIMAL(5,2) datatypes.
-- Name following FK constraint for hotelNo:
-- CONSTRAINT fk_Room_hotelNo FOREIGN KEY (???) REFERENCES ??? (???) ON DELETE ??? ON UPDATE ???
-- <A4>
CREATE TABLE [HW2.Room] (
roomNo SMALLINT NOT NULL,
hotelNo CHAR (4) NOT NULL,
type VARCHAR (10),

price Decimal (5,2),
CONSTRAINT pk_Room2 PRIMARY KEY CLUSTERED (roomNo, hotelNo),
CONSTRAINT fk_Hotel2_hotelNo FOREIGN KEY (hotelNo)
REFERENCES [HW2.Hotel] (hotelNo)
ON DELETE CASCADE ON UPDATE CASCADE);

-- <Q5>
-- What is the business rule (in English) that was used for the referential  constraint fk_Room_hotelNo.
-- Choose between (a) and (b):
-- (a) When a hotel is deleted then all rooms in the hotel are deleted.
-- (b) A hotel cannot be deleted if rooms from that hotel are in the database.
-- <A5>
-- The correct answer is (a)

INSERT INTO [HW2.Room] VALUES
(501, 'fb01', 'single', 19.00),
(601, 'fb01', 'double', 29.00),
(701, 'fb01', 'family', 39.00),
(1001, 'fb02', 'single', 58.00),
(1101, 'fb02', 'double', 86.00),
(1001, 'ch01', 'single', 29.99),
(1101, 'ch01', 'family', 59.99),
(701, 'ch02', 'single', 10.00),
(801, 'ch02', 'double', 15.00);
-- <Q6>
-- Complete 3 more insertions for 901, 1001 and 1101 for dc01.
-- 901 dc01 single 18.00
-- 1001 dc01 double 30.00
-- 1101 dc01 family 35.00
-- <A6>
INSERT INTO [HW2.Room] VALUES
(901, 'dc01', 'single', 18.00),
(1001, 'dc01', 'double', 30.00),
(1101, 'dc01', 'family', 35.00) ;

-- <Q7>
-- CREATE TABLE Guest here
-- attributes: guestNo, guestName, guestAddress
-- Use SMALLINT and VARCHAR datatypes.
-- <A7>

CREATE TABLE [HW2.Guest] (
guestNo SMALLINT NOT NULL,
guestName VARCHAR (25),
guestAddress VARCHAR (25),
CONSTRAINT pk_Guest2_guestNo PRIMARY KEY (guestNo) );
INSERT INTO [HW2.Guest] VALUES
(10001, 'John Kay', '56 High St, London'),
(10002, 'Mike Ritchie', '18 Tain St, London'),
(10003, 'Mary Tregear', '5 Tarbot Rd, Aberdeen');

-- <Q8>
-- Complete 4 more insertions for 10004, 10005, 10006 and 10007.
-- 10004 Joe Keogh 2 Fergus Dr, Aberdeen

-- 10005 Carol Farrel 6 Achray St, Glasgow
-- 10006 Tina Murphy 63 Well St, Glasgow
-- 10007 Tony Shaw 12 Park Pl, Glasgow

-- <A8>
INSERT INTO [HW2.Guest] VALUES
('10004', 'Joe Keogh', '2 Fergus Dr, Aberdeen'),
('10005', 'Carol Farrel', '6 Achray St, Glasgow'),
('10006', 'Tina Murphy', '63 Well St, Glasgow'),
('10007', 'Tony Shaw', '12 Park Pl, Glasgow') ;
-- <Q9>
-- CREATE TABLE Booking here
-- attributes: hotelno, guestno, datefrom, dateto, roomno
-- Use CHAR, SMALLINT and DATE datatypes.

-- <A9>
CREATE TABLE [HW2.Booking] (
hotelNo CHAR (4) NOT Null,
roomNo SMALLINT NOT NULL,
dateFrom Date,
dateTo Date,
guestNo SMALLINT,
CONSTRAINT pk_Booking2 PRIMARY KEY CLUSTERED (hotelNo, roomNo,

guestNo),

CONSTRAINT fk_Room2 FOREIGN KEY (roomNo, hotelNo)
REFERENCES [HW2.Room] (roomNo, hotelNo)
ON DELETE NO ACTION ON UPDATE CASCADE,
CONSTRAINT fk_Guest2_guestNo FOREIGN KEY (guestNo)
REFERENCES [HW2.Guest] (guestNo)
ON DELETE CASCADE ON UPDATE CASCADE);

-- <Q10>
-- Do you want to use ON DELETE CASCADE or the default ON DELETE NO ACTION?
-- Provide a comment with the business rule you wish to use in English.
-- <A10>
-- I want to choose ON DELETE NO ACTION, so that when a room is deleted from the
-- system the bookings related to the room will not be deleted.
-- This could be usefull for financial records in case the company looks back on
-- booking related to an old building.
-- Then the same for Guests, I want to choose ON DELETE CASCADE,so that when a guest is deleted for the system, their
-- past bookings should be updated along with the changes.

INSERT INTO [HW2.Booking] VALUES
('fb01', 501, '2022-04-01', '2022-04-08', 10001),
('fb01', 601, '2022-04-15', '2022-05-15', 10004),
('fb01', 501, '2022-05-02', '2022-05-07', 10005),
('fb01', 601, '2022-05-16', '2022-05-29', 10002),
('fb01', 701, '2022-05-01', NULL, 10001),
('fb02', 1001, '2022-04-05', '2022-04-10', 10003),
('fb02', 1101, '2022-05-12', '2022-05-30', 10005);

-- <Q11>
-- Complete 4 more insertions for ch01, ch02 and dc01.
-- ch01 1101 2022-04-21 NULL 10006
-- ch02 801 2022-04-25 2022-05-06 10002

-- dc01 1001 2022-05-20 NULL 10003
-- dc01 1001 2022-05-13 2022-05-15 10007
-- <A11>

INSERT INTO [HW2.Booking] VALUES
('ch01', 1101, '2022-04-21', NULL, '10006'),
('ch02', 801, '2022-04-25', '2022-05-06', '10002'),
('dc01', 1001, '2022-05-20', NULL, '10003'),
('dc01', 1001, '2022-05-13', '2022-05-15', '10007') ;

-- YOUR DML STATEMENTS HERE
SELECT * FROM [HW2.Hotel];
SELECT * FROM [HW2.Room];
SELECT * FROM [HW2.Guest];
SELECT * FROM [HW2.Booking];

-- <Q12> an SQL DML statement
-- What are the average price, the minimum price, and the maximum price of rooms for each hotel, and sort results by the hotel numbers?
-- <A12>
SELECT h.hotelNo, AVG(r.price) AS 'Average Price',MIN(r.price) AS 'Minimum Price',
MAX(r.price) AS 'Maximum Price'
FROM [HW2.Room] r, [HW2.Hotel] h
WHERE r.hotelNo = h.hotelNo
GROUP BY h.hotelNo

-- <Q13> an SQL DML statement
-- What are the name and the total number of bookings of each frequent guests, who booked more than once?
-- <A13>
SELECT b.guestNo, g.guestName, COUNT(b.roomNo) AS 'Count of Bookings'
FROM [HW2.Booking] b, [HW2.Guest] g
WHERE b.guestNo = g.guestNo
GROUP BY b.guestNo, g.guestName
HAVING COUNT(b.roomNo) > 1
-- <Q14> an SQL DML statement
-- What is the premium hotel, which average room price is greater than $40, and total number of rooms in each hotel?
-- <A14>
SELECT h.hotelNo, AVG(r.price) AS 'Average Price', COUNT (r.roomNo) AS 'Count of
Rooms'
FROM [HW2.Hotel] h, [HW2.Room] r
WHERE h.hotelNo = r.hotelNo
GROUP BY h.hotelNo
HAVING AVG (r.price) > 40 ;