
#creating database 'Grosvenor'
create database Grosvenor;
use Grosvenor;

#creatin table 'HOTEL'

create table Hotel(hotel_no char(4) not null,
                   hotel_name varchar(20) not null,
                   address varchar(50) not null,
                   primary key(hotel_no));
				
                
#Inserting values into table 'HOTEL'

insert into hotel values('H111', 'Grosvenor Hotel','London');
insert into hotel values('H112', 'mahadev Hotel','india');
insert into hotel values('H113', 'Le Bristol Hotel','paris');
insert into hotel values('H114', 'five star Hotel','france');
insert into hotel values('H115', 'Crowne Plaza Hotel','London');
insert into hotel values('H116', 'The New View Hotel','London');


select * from hotel;


#creating table 'Room'

CREATE TABLE room ( room_no VARCHAR(4) NOT NULL, 
                  hotel_no CHAR(4) NOT NULL, 
                  type CHAR(1)NOT NULL,
                  price DECIMAL(5,2) NOT NULL,
                  primary key(room_no,hotel_no),
                  foreign key(hotel_no) references hotel(hotel_no));
                  


 #inserting  values into table 'room'
 
insert into room values('1', 'H111', 'S', 72.00);
insert into room values('2', 'H111', 'D', 102.00);
insert into room values('3', 'H111', 'F', 212.00);

insert into room values('A1', 'H112', 'F', 112.00);
insert into room values('A2', 'H112', 'D', 92.00);
insert into room values('A3', 'H112', 'S', 69.00);

insert into room values('M1', 'H113', 'F', 204.00);
insert into room values('M2', 'H113', 'D', 105.00);
insert into room values('M3', 'H113', 'S', 84.00);

insert into room values('V1', 'H114', 'F', 200.00);
insert into room values('V2', 'H114', 'D', 179.00);
insert into room values('V3', 'H114', 'S', 100.00);

insert into room values('Z1', 'H115', 'D', 190.00);
insert into room values('Z2', 'H115', 'F', 100.00);
insert into room values('Z3', 'H115', 'S', 68.00);

insert into room values('S1', 'H116', 'F', 240.00);
insert into room values('S2', 'H116', 'S', 196.00);
insert into room values('S3', 'H116', 'D', 110.00);


select * from room


#creating table ' GUEST'


CREATE TABLE guest ( guest_no CHAR(4) NOT NULL, 
                    name VARCHAR(20) NOT NULL, 
                    address VARCHAR(50) NOT NULL,
                    primary key(guest_no));
                    
      
 #inserting values into table 'guest'
 
INSERT INTO guest VALUES ('G123', 'John Smith', 'London');
INSERT INTO guest VALUES ('G111', 'arnold', 'france');
INSERT INTO guest VALUES ('G113', 'Johny', 'london');
INSERT INTO guest VALUES ('G121', 'varsha', 'india');
INSERT INTO guest VALUES ('G122', 'laxmi narsaiah', 'London');
INSERT INTO guest VALUES ('G112', 'padma', 'paris');
INSERT INTO guest VALUES ('G131', 'laxmi', 'London');
INSERT INTO guest VALUES ('G132', 'pravlika', 'france');
INSERT INTO guest VALUES ('G141', 'honey', 'paris');
INSERT INTO guest VALUES ('G144', 'james', 'London');
INSERT INTO guest VALUES ('G152', 'anivi', 'india');



select * from guest;


#creating table 'Booking'

CREATE TABLE booking (hotel_no CHAR(4) NOT NULL, 
                     guest_no CHAR(4) NOT NULL, 
                     date_from DATETIME NOT NULL,
                     date_to DATETIME NULL,
                     room_no CHAR(4) NOT NULL,
                     PRIMARY KEY( hotel_no,guest_no,date_from),
                     foreign key(hotel_no,room_no) references room(hotel_no,room_no),
                     foreign key(guest_no) references guest(guest_no));
                     
                    
                     
 #inseritng values into table 'booking'                    
 
insert into booking values('H114', 'G111', DATE'1999-01-01', DATE'1999-01-02', 'V1');
insert into booking values('H113', 'G112', DATE'2000-01-01', DATE'2000-01-02', 'M3');
insert into booking values('H115', 'G113', DATE'2001-08-05', DATE'2000-08-10', 'Z2');
insert into booking values('H112', 'G121', DATE'1998-09-08', DATE'1998-09-10', 'A1');
insert into booking values('H116', 'G122', DATE'1972-06-01', DATE'1972-06-06', 'S1');
insert into booking values('H111', 'G123', DATE'2022-07-18', DATE'2022-07-20', '1');
insert into booking values('H116', 'G131', DATE'2000-09-15', DATE'2000-09-15', 'S3');
insert into booking values('H114', 'G132', DATE'2010-11-03', DATE'2010-11-10', 'V3');
insert into booking values('H113', 'G141', DATE'2009-01-21', DATE'2009-01-28', 'M2');
insert into booking values('H115', 'G144', DATE'2021-08-01', DATE'2021-08-01', 'Z1');
insert into booking values('H112', 'G152', DATE'2022-07-19', DATE'2022-07-20', 'A2');

select * from booking



#UPDATING THE TABLES

UPDATE room SET price = price*1.05;

select * from room;


#Create a separate table with the same structure as the Booking table to hold archive records.

CREATE TABLE booking_old ( hotel_no CHAR(4) NOT NULL, 
                         guest_no CHAR(4) NOT NULL,
                         date_from DATETIME NOT NULL,
                         date_to DATETIME NULL,
                         room_no VARCHAR(4) NOT NULL,
                         primary key (hotel_no,guest_no,date_from),
                         foreign key(hotel_no,room_no) references room(hotel_no,room_no),
						 foreign key(guest_no) references guest(guest_no));

				
##Using the INSERT statement, copy the records from the Booking table to the archive table relating to bookings before 1st January 2000. 

               
               
	INSERT INTO booking_old(
                        SELECT * FROM booking
                        WHERE date_to < DATE'2000-01-01');
        
        
   select *  from booking_old
   
   #Delete all bookings before 1st January 2000 from the Booking table.
   
DELETE FROM booking
	 WHERE date_to < DATE'2000-01-01';
     
   select * from  booking;
   
   
   #Simple Queries
   
  #1. List full details of all hotels.

 select *  from hotel ;
 
 #2. List full details of all hotels in London.
 
 select * from hotel 
  where address = 'london';
  
  
  

#3. List the names and addresses of all guests in London, alphabetically ordered by name.
  
select name,address
  from guest
where address = 'london'
order by name;


#4. List all double or family rooms with a price below £40.00 per night, in ascending order of price.

select * from room
  where price < 40 and type in ('D','F')
  order by price;
  
#5. List the bookings for which no date_to has been specified.

select * from booking 
   where date_to  IS NULL;  
  
  
  
#  Aggregate Functions

#1. How many hotels are there?

select count(*)
from hotel;

#2. What is the average price of a room?

select avg(price) 
   from room;
   
 #  3. What is the total revenue per night from all double rooms?
 

select sum(price) as 'total revenue'
from room
 where type = 'D';
  
  
#4. How many different guests have made bookings for August?

select count(distinct guest_no) as 'number of guest'
  from booking
  where month(date_from) = 08
 
 
 


#Subqueries and Joins

#1. List the price and type of all rooms at the Grosvenor Hotel.

Select price,type
 from room r
 inner join hotel h
 on r.hotel_no = h.hotel_no
 where hotel_name = 'Grosvenor Hotel';
 
 #OR

 SELECT price, type
 FROM room
 WHERE hotel_no = (SELECT hotel_no FROM hotel
WHERE hotel_name = 'Grosvenor Hotel');

#2. List all guests currently staying at the Grosvenor Hotel.

select guest_no,name,date_from,date_to
from guest
natural join booking
natural join hotel
where date_from = current_date and date_to = current_date 
and hotel_name= 'Grosvenor Hotel';

#or

SELECT * FROM guest
WHERE guest_no =
(SELECT guest_no FROM booking
WHERE date_from <= CURRENT_DATE AND date_to >= CURRENT_DATE AND
hotel_no = (SELECT hotel_no FROM hotel
WHERE hotel_name = 'Grosvenor'));
 
 
 #3. List the details of all rooms at the Grosvenor Hotel, including the name of the guest staying in theroom, if the room is occupied.
 
 select r.* ,g.name as 'guest name',h.hotel_name
 from room r
 inner join hotel h
 on r.hotel_no=h.hotel_no
 inner join booking b
 on h.hotel_no = b.hotel_no
 inner join guest g
 on b.guest_no = g.guest_no
 where h.hotel_name = 'grosvenor hotel'
    and b.room_no in
(date_from <=current_date or date_to >=current_date);


#or

SELECT r.* 
FROM room r 
LEFT JOIN
(SELECT g.name, h.hotel_no, b.room_no FROM guest g, Booking b, Hotel h
WHERE g.guest_no = b.guest_no AND b.hotel_no = h.hotel_no AND
h.hotel_name= 'Grosvenor' AND
b.date_from <= CURRENT_DATE or b.date_to >= CURRENT_DATE) AS occupied
ON r.hotel_no = occupied.hotel_no AND r.room_no = occupied.room_no;


#4.What is the total income from bookings for the Grosvenor Hotel today?

select sum(r.price) as 'total income'
from room r
inner  join hotel h
on r.hotel_no=h.hotel_no
inner join booking b
on h.hotel_no=b.hotel_no
where h.hotel_name = 'Grosvenor Hotel'
and
b.date_from <= current_date and b.date_to >= current_date;

#or

SELECT SUM(r.price) FROM booking b, room r, hotel h
WHERE (b.date_from <= CURRENT_DATE AND
b.date_to >= CURRENT_DATE) AND h.hotel_name = 'grosvenor hotel' and 
r.hotel_no = h.hotel_no AND r.room_no = b.room_no;


 
 
 

 
 
 #5. List the rooms that are currently unoccupied at the Grosvenor Hotel.
 
 select r.* from room r
 inner join booking b
 on r.room_no = b.room_no
 inner join hotel h
 on b.hotel_no = h.hotel_no
 where h.hotel_name = 'Grosvenor Hotel'
 and r.room_no not in 
 (date_from = current_date and date_to = current_date);
 
 
 
 #or
 
 SELECT * FROM room r
WHERE room_no NOT IN
(SELECT room_no FROM booking b, hotel h
WHERE (date_from <= CURRENT_DATE AND
date_to >= CURRENT_DATE) AND
b.hotel_no = h.hotel_no AND hotel_name = 'Grosvenor');
 
 


#6. What is the lost income from unoccupied rooms at the Grosvenor Hotel?

SELECT SUM(price) FROM room r
WHERE room_no NOT IN
(SELECT room_no FROM booking b, hotel h
WHERE (date_from <= CURRENT_DATE AND
date_to >= CURRENT_DATE) AND
b.hotel_no = h.hotel_no AND hotel_name = 'Grosvenor');


#Grouping

#1. List the number of rooms in each hotel.

select count(room_no) as 'number of rooms',hotel_name
from room
natural join hotel
group by hotel_name;


#OR 

select count(room_no) as 'number of rooms',hotel_no
from room
natural join hotel
group by hotel_no;
 
 
 #2. List the number of rooms in each hotel in London.
 
 select count(room_no) as 'number of rooms',hotel_name
 from room
 natural join hotel
 where address = 'london'
 group by hotel_no;
 
 
 
 #3. What is the average number of bookings for each hotel in August?
 
 SELECT AVG(room_no) AS AveNumBook FROM
 (SELECT hotel_no, COUNT(hotel_no) AS hotels
FROM booking b
 WHERE (month(b.date_from)=08) 
GROUP BY hotel_no)





#4. What is the most commonly booked room type for each hotel in London?

select max(type) as 'commonly booked room',hotel_name
from room 
natural join hotel
natural join booking
where address = 'london'
group by hotel_no;




#5. What is the lost income from unoccupied rooms at each hotel today?

SELECT hotel_no, SUM(price) FROM room r
WHERE room_no NOT IN
(SELECT room_no FROM booking b, hotel h
WHERE (date_from <= CURRENT_DATE AND
date_to >= CURRENT_DATE) AND
b.hotel_no = h.hotel_no)
GROUP BY hotel_no;