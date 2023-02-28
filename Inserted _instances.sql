use Book_Store



INSERT INTO BOOK
	(BOOK_title, BOOK_category, BOOK_langauge, BOOK_price, BOOK_PublisherName,BOOK_Rate)
	VALUES
	('Elfile Elazrak', 'horror', 'Arabic', 4.99,'Asser Elkotob',3.5),
	('Run', 'horror', 'English', 21.99,'Asser Elkotob',3.5),
	('Jog', 'Drama', 'English', 11.99,'Dar Elnashr',8.5),
	('Supernova', 'horror',  'English', 12.99, 'Dar Elnashr',2),
	('John Paul', 'horror',   'English', 18.99,'Nahdet Masr',9),
	('Frogs', 'Drama',  'English',17.99, 'THE HOUSE',7.5),
	('Dinos', 'Drama',  'English', 5.99,'Asser Elkotob',8.5),
	('Motorcycles', 'science fiction',  'English', 2.99,'Dar Elnashr',3.5),
	('Swim Fast', 'horror', 'English', 2.99,'Asser Elkotob',9.5),
	('Lost City', 'horror',  'English', 1.99,'Asser Elkotob',6.5),
	('Raptor', 'horror',  'English',7.99, 'Dar Elnashr',6.5),
	('Pope', 'science fiction', 'french', 34.99, 'Asser Elkotob',5.5),
	('Book Sale', 'Drama',  'English', 14.99, 'Dar Elnashr',5.2),
	('Portland', 'Drama',  'English', 15.16, 'THE HOUSE',6.5),
	('Seattle', 'science fiction',  'English', 24.99, 'THE HOUSE',5),
	('NorthWest', 'Drama',  'English', 14.99, 'Dar Elnashr',8),
	('Roaming',  'mystery', 'English', 4.99, 'THE HOUSE',6),
	('Meditation', 'mystery',  'English', 4.99, 'Dar Elnashr',7),
	('Yoga', 'Drama',  'English', 4.99, 'Asser Elkotob',9),
	('Fast', 'mystery', 'English', 4.99, 'Dar Elnashr',7.8)
;



INSERT INTO Publisher
	VALUES
	('THE HOUSE', 'nasr city', '14th'),
	('Nahdet Masr', 'cairo', 'abbas st'),
	('Asser Elkotob', 'port saeed', '36th'),
	('Dar Elnashr', ' alex ' ,' 306th ')



INSERT INTO Authors
	(AUTHORS_name, AUTHORS_city, AUTHORS_street, AUTHORS_email)
	VALUES
	('Ahmed Morad', 'Cairo', '18th st', 'ahmedmorad@gmail.com'),
	('Nova Dog', 'London', '18th st', 'NovaDog@gmail.com'),
	('Fred Jones', 'Paris', '18th st', 'FredJones@yahoo.com'),
	('Joe Schmo',  'London', '18th st', 'JoeSchmo@yahoo.com'),
	('Stephen King', 'Paris', '18th st', 'StephenKing@gmail.com'),
	('Manuel','Paris', '18th st', 'Manuelm@yahoo.com'),
	('Julius', 'London', '18th st', 'Juliusj@gmail.com'),
	('Picasso', 'London', '18th st', 'Picassop@yahoo.com'),
	('Sagan Sartre', 'London', '18th st', 'ReneSartre@gmail.com'),
	('Carl Sagan', 'Paris', '18th st', 'SaganCarl@gmail.com')
;




INSERT INTO Branch
	(BRANCH_name, BRANCH_city, BRANCH_street, BRANCH_phone, BRANCH_rate, BRANCH_manager_id)
	VALUES
	('dar elkotob', 'Tanta', '73rd St', '+20344325', 4, 5),
	('dar elMAAREFA', 'Alex', '79th St', '+20544325', 5, 10),
	('Ahla Elkotob', 'Cairo', 'Sadek elrafey St', '+20354325', 6, 11),
	('EL Tahrier', 'Cairo', 'EL Tahrier squer', '+20354325', 6, 9)
;



INSERT INTO Staff_emplyees
	(STAFF_name, SALARY, AGE, RATE,  Branch_id, SINCE,LEADER_id)
	VALUES
	
	('yousef Ahmed', 7800, 28, 5, 1, '2020-12-14',5),
	('manal Moh', 1800, 28, 5, 3, '2020-1-14',11),
	('aya Moh', 2800, 38, 5, 1, '2020-12-14',5),
	('omnia ali', 3800, 48, 5, 2, '2020-10-14',10),
	('sameh ahmoud', 2800, 22, 5, 4, '2020-09-14',9),
	('yousef saied', 2800, 35, 5, 1, '2020-08-14',5),
	('sara Mohamed', 2800, 50, 5, 3, '2010-08-14',11),
	('yousry ragab', 7500, 33, 7, 1, '2015-12-14',5),
	('ibrahim Moh', 1800, 18, 9, 3, '2020-1-14',11),
	('noha Mondy', 2800, 22, 8, 2, '2020-12-14',10),
	('amany ali', 3800, 31, 5, 4, '2020-02-11',9);





INSERT INTO Customer
	(CUSTOMER_NAME , CUSTOMER_PHONE, CUSTOMER_ADDRESS)
	VALUES ('Joe Smith','0123121234','1321 4th Street New York'),
		('Jane Smith','0129314124','1321 4th Street New York'),
		('Tom Li','01349027455','981 Main Street Ann Arbor'),
		('Angela Thompson','0135912122','2212 Green Avenue Ann Arbor'),
		('Harry Emnace','0125125522','121 Park Drive, Ann Arbor '),
		('Tom Haverford','212-631-3418','23 75th Street, New York NY 10014'),
		('Haley Jackson','212-419-9935','231 52nd Avenue New York, NY 10014'),
		('Michael Horford','734-998-1513','653 Glen Avenue, Ann Arbor, MI 48104');




INSERT INTO Subscriber_customer (CID, Subscribed_since,Subscribtion_expire)
	VALUES (1,'2022-10-08','2023-10-08'),
		   (2,'2022-01-20','2023-01-20'); 
		             
INSERT INTO Subscriber_customer (CID, Subscribed_since)
	VALUES(3,'2022-04-22'),
		  (4,'2022-05-05');







INSERT INTO REGULER (CID, No_visits)
	VALUES (5,10),
		   (8,12),
           (6,8),
		   (7,15);
		   





INSERT INTO Purchases
	( BOOK_ID, BRANCH_ID, CID, Purchase_DATE_time)
	VALUES
	(1, 1, 3, '2020-10-12  12:55:01'),
	(5, 1, 8, '2020-10-10  00:00:22'),
	(4, 2, 1, '2020-10-01  12:00:20'),
	(3, 1, 7, '2020-10-02  00:50:22'),
	(7, 3, 7, '2020-10-03  09:02:22'),
	(8, 1, 4, '2020-10-05  10:55:01'),
	(10,1, 2, '2020-10-03  10:20:00'),
	(10,2, 5, '2020-09-1   15:00:00'),
	(10,1, 8, '2020-03-1   04:22:01'),
	(11,1, 1, '2020-03-1   12:55:01'),
	(15,1, 6, '2020-02-1   12:55:01'),
	(3, 2, 8,  '2020-03-1  12:55:01'),
	(4, 2, 8,  '2020-06-1  12:25:01'),
	(4, 2, 2,  '2020-01-1  12:35:03'),
	(7, 2, 2,  '2020-10-1  22:15:07'),
	(5, 2, 8, '2020-10-1   11:05:11'),
	(1, 4, 4,  '2020-10-1  13:33:10'),
	(2, 1, 3,  '2020-10-1  18:20:01'),
	(2, 3, 3, '2022-05-05  09:51:30'),
	(3, 2, 3,  '2012-10-1  12:55:01'),
	(4, 2, 7, '2020-10-1   12:55:01'),
	(5, 2, 2, '2021-10-10  10:40:20'),
	(6, 2, 2,  '2020-10-1  00:22:53'),
	(7, 2, 5,  '2022-10-1  12:55:01'),
	(7, 2, 6,  '2020-02-1  12:55:01'),
	(9, 2, 5,  '2020-10-1  11:05:11'),
	(8, 2, 4, '2020-10-1   09:51:30'),
	(9, 2, 1,  '2020-10-1  13:33:10'),
	(10,2, 1, '2021-10-1   13:33:10'),
	(1, 3, 3, '2020-10-1   12:55:01'),
	(1, 3, 6,  '2020-10-1  09:51:30'),
	(10,3, 4,  '2021-10-1  12:55:01'),
	(9, 3, 5,  '2020-10-1  13:33:10'),
	(8, 3, 8,  '2020-10-1  12:55:01'),
	(7, 3, 4,  '2020-12-1  12:55:01'),
	(6, 3, 7, '2020-10-1   09:51:30'),
	(5, 3, 7, '2020-01-1   11:05:11'),
	(4, 3, 3, '2020-10-1   09:51:30'),
	(3, 3, 1, '2020-11-12  12:55:01'),
	(2, 3, 5, '2020-10-21  09:02:22'),
	(1, 4, 5, '2020-12-11  12:55:01'),
	(2, 4, 8, '2020-10-1   12:55:01'),
	(3, 4, 2,  '2020-10-1  13:33:10'),
	(4, 4, 4, '2020-10-1   09:02:22');







INSERT INTO Publisher_phone
	(PUBLISHER_name, PUBLISHER_phone)
	VALUES
	('Dar Elnashr', '+20344325'),
	('Dar Elnashr', '+20152072414'),
	('Dar Elnashr', '+20105300014'),
	('THE HOUSE', '+202443295'),
	('Nahdet Masr', '+209622323'),
	('Asser Elkotob', '+202315320');



INSERT INTO Book_authors
	(BOOK_id, AUTHOR_Name)
	VALUES
	(18,'Ahmed Morad'),
	(19, 'Nova Dog'),
	(20, 'Fred Jones'),
	(1, 'Joe Schmo'),
	(7, 'Stephen King'),
	(9, 'Manuel'),
	(15, 'Julius'),
	(19, 'Picasso'),
	(3, 'Carl Sagan'),
	(11, 'Manuel'),
	(13, 'Julius'),
	(12, 'Picasso'),
	(20, 'Carl Sagan');


INSERT INTO BRANCH_BOOK_COPIES
	(BOOK_ID, BRANCH_NUM, COPIES)
	VALUES
	(18, 1, 5),
	(19, 2, 2),
	(20, 3, 3),
	(12, 4, 7),
	(19, 1, 2),
	(9, 2, 2),
	(18, 3, 2),
	(20, 1, 2),
	(8, 1, 2),
	(4, 2, 2),
	(5, 3, 6),
	(20, 4, 4),
	(10, 1, 3),
	(11, 2, 2),
	(12, 3, 2),
	(20, 2, 2),
	(17, 1, 2),
	(13, 4, 2);




insert into requst 
(CID,book_name,Expected_arrival_date)
values
(1,'To Kill a Mockingbird','2023-10-08'),
(2,'The Great Gatsby','2023-01-20'),
(3,'Ulysses','2023-12-30'),
(4,'The Catcher in the Rye','2023-12-30'),
(5,'Pride and Prejudice','2023-12-30'),
(6,'Adventures of Huckleberry Finn','2023-12-30'),
(7,'Alice’s Adventure in Wonderland','2023-12-30'),
(8,'To the Lighthouse','2023-12-30')
