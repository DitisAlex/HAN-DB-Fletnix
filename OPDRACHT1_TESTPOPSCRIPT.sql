/*==============================================================*/
/* Database name:  Beroepsproduct - Alex Cheng & Wouter Koek    */
/* Script:		   Test script			                    */
/* Created on:     13-Nov-2019		                            */
/*==============================================================*/

DELETE FROM Contract;
DELETE FROM Country;
DELETE FROM Customer;
DELETE FROM Genre;
DELETE FROM Movie;
DELETE FROM Movie_Cast;
DELETE FROM Movie_Directors; 
DELETE FROM Movie_Genre;
DELETE FROM Payment;
DELETE FROM Person;
DELETE FROM Watchhistory;

INSERT INTO Contract(contract_type,price_per_month,discount_percentage) VALUES 
	('Basic', 4, 0),
	('Premium',5, 20),
	('Pro',6, 40)

INSERT INTO Country(country_name) VALUES
	('Belgium'),
    ('The Netherlands')

INSERT INTO Payment(payment_method) VALUES
	('Mastercard'),
	('Visa'),
	('Amex')

INSERT INTO Customer(customer_mail_address, lastname, firstname, payment_method, payment_card_number, contract_type, subscription_start, subscription_stop, user_name, password, country_name, gender, birth_date) VALUES
	('peter@pan.de', 'Pan', 'Peter', 'Mastercard', '0123456789', 'Basic', '01-oct-2014', '28-oct-2014', 'pp123', 'peterpass', 'The Netherlands', 'M', '26-jun-1971'),
	('guy@monk.nl', 'Threepwood', 'Guybrush', 'Visa', '333-555-777', 'Premium', '01-jan-2014', NULL, 'gm4ever', 'guyspass', 'Belgium', 'M', '03-mar-1972'),
	('alex@cheng.nl', 'Cheng', 'Alex', 'Visa', '0611070503', 'Pro', '01-oct-2019', NULL, 'abc123', 'epicpass', 'The Netherlands', 'M', '10-dec-2002'),
	('wouter@koek.de', 'Koek', 'Wouter', 'Mastercard', '9823234492', 'Pro', '01-dec-2018', '01-dec-2019', 'wouterkkk', 'koekjes321', 'The Netherlands', 'M', '28-nov-2000'),
	('daan.geerts@dierckx.be', 'Geerts', 'Daan', 'Amex', '9876543210', 'Premium', '22-mar-2019', NULL, 'geertabc', 'dragon69', 'Belgium', 'M', '14-feb-2004'),
	('keeskaas@gmail.com', 'Kaas', 'Kees', 'Mastercard', '111525999', 'Basic', '01-jan-2019', '01-jan-2020', 'kaaskop57', 'kaas1234', 'Belgium', 'M', '02-feb-1996' ),
	('fatima@yahoo.com','Mo','Fatima','Visa','0611223344','Premium','03-nov-2017', NULL, 'fatima2312','gamer666', 'The Netherlands', 'F', '21-mar-2000'),
	('momo@yahoo.com', 'Jansen', 'Moniek', 'Amex', '0699774422', 'Premium', '17-apr-2019', NULL, 'moniekj5', 'jansenmo123', 'The Netherlands', 'F', '18-sep-1999' ),
	('laurensvanbrecht@gmail.com', 'van Brecht', 'Laurens', 'Mastercard', '3242348827', 'Pro', '22-dec-2018', '22-dec-2022', 'laurens222', 'vanbrechtlau123', 'The Netherlands', 'M', '22-jun-2001'),
	('junaid@hotmail.com', 'Baljeet', 'Junaid', 'Visa', '5522848492', 'Basic', '15-jul-2019', NULL, 'balyeet22', 'yeetmeister123', 'Belgium', 'M', '11-oct-1995'),
	('ben10@gmail.com', 'Jansen', 'Ben', 'Mastercard', '9912131415', 'Basic', '17-apr-2019', '17-apr-2020', 'benten10', 'benpass10', 'The Netherlands', 'M', '17-nov-1990'),
	('jamescharles@gmail.com', 'Charles', 'James', 'Visa', '8123223429', 'Premium', '28-aug-2019', NULL, 'therealjamescharles', 'realcharles', 'Belgium', 'M', '28-nov-1999') 


INSERT INTO Movie(movie_id, title, duration, description, publication_year, cover_image, previous_part, price, URL) VALUES
	(11, 'Matrix, The', 122, 'Description of Matrix, The', 1999,  NULL, NULL, 2.50, 'https://www.youtube.com/watch?v=m8e-FF8MsqU'),
	(12, 'Matrix Reloaded, The', 106, 'Description of Matrix Reloaded, The', 2003,  NULL, 11, 2.50, 'https://www.youtube.com/watch?v=kYzz0FSgpSU'),
	(13, 'Matrix Revolutions, The', 103, 'Description of Matrix Revolutions, The', 2003,  NULL, 12, 3.50, 'https://www.youtube.com/watch?v=NhoaoTZJSX4'),
	(14, 'Lion King, The', 89, 'Description of Lion King, The', 1994, NULL, NULL, 4.75, 'https://www.youtube.com/watch?v=1Ono7DYJDQo'),
	(15, 'Finding Nemo', 100, 'Description of Finding Nemo', 2003, NULL, NULL, 2.50, 'https://www.youtube.com/watch?v=wZdpNglLbt8'),
	(16, 'Finding Dory', 97, 'Description of Finding Dory', 2016, NULL, 15, 3.50, 'https://www.youtube.com/watch?v=JhvrQeY3doI'),
	(17, 'Titanic, The', 195, 'Description of Titanic, The', 1998, NULL, NULL, 4.30, 'https://www.youtube.com/watch?v=2e-eXJ6HgkQ'),
	(18, 'Avengers: Endgame', 181, 'Description of Avengers: Endgame', 2019, NULL, NULL, 5.90, 'https://www.youtube.com/watch?v=TcMBFSGVi1c')

INSERT INTO Genre(genre_name, description) VALUES
    ('Action', 'Creative works characterized by emphasis on exciting action sequences'),
    ('Drama', 'Fictional division between comedy and tragedy'),
    ('Family','Movies suitable for a wide range of age groups'),
    ('Sci-Fi', 'Fictional movies dealing with imaginative content such as futuristic settings, futuristic science and technology, space travel, time travel, parallel universes, and extraterrestrial life'),
	('Animation', 'Animation is a method in which pictures are manipulated to appear as moving images.')
	
INSERT INTO Person(person_id, lastname, firstname, gender) VALUES
	(83616, 'Wachowski', 'Andy', 'M'),
	(83617, 'Wachowski', 'Larry', 'M'),
	(393411, 'Keanu', 'Reeves', 'M'),
	(729933, 'Moss', 'Carrie-Anne', 'F'),
	(151786, 'Fishburne', 'Laurence', 'M'),
	(202020, 'Earl Jones', 'James', 'M' ),
	(202021, 'Irons', 'Jeremy', 'M'),
	(202022, 'Broderick', 'Matthew', 'M'),
	(202000, 'Minkoff', 'Rob', 'M'),
	(303030, 'Gould', 'Alexander', 'M'),
	(303031, 'DeGeneres', 'Ellen', 'F'),
	(303000, 'Stanton', 'Andrew', 'M'),
	(303032, 'Rolence', 'Hayden', 'F'),
	(404040, 'DiCaprio', 'Leonaro', 'M'),
	(404041, 'Winslet', 'Kate', 'F'),
	(404000, 'Carson', 'James', 'M'),
	(505050, 'Downey jr.', 'Robert', 'M'),
	(505051, 'Holland', 'Tom', 'M'),
	(505052, 'Evans', 'Chris', 'M'),
	(505053, 'Hemsworth', 'Chris', 'M'),
	(505000, 'Russo', 'Joe', 'M'),
	(515000, 'Brothers', 'Russo', 'M')

INSERT INTO Movie_Cast(movie_id, person_id, role) VALUES
	(11, 393411, 'Neo'),
	(11, 729933, 'Trinity'),
	(11, 151786, 'Morpheus'),
	(14, 202020, 'Mufasa'),
	(14, 202021, 'Scar'),
	(14, 202022, 'Simba'),
	(15, 303030, 'Nemo'),
	(15, 303031, 'Dory'),
	(16, 303031, 'Dory'),
	(16, 303032, 'Nemo'),
	(17, 404040, 'Jack Dawson'),
	(17, 404041, 'Rose DeWitt Bukater'),
	(18, 505050, 'Iron Man'),
	(18, 505051, 'Spiderman'),
	(18, 505052, 'Captain America'),
	(18, 505053, 'Thor')

INSERT INTO Movie_Directors(movie_id, person_id) VALUES
	(11, 83616),
	(11, 83617),
	(12, 83616),
	(12, 83617),
	(14, 202000),
	(15, 303000),
	(16, 303000),
	(17, 404000),
	(18, 505000),
	(18, 515000)

INSERT INTO Movie_Genre(movie_id, genre_name) VALUES
	(11, 'Action'),
	(11, 'Sci-Fi'),
	(12, 'Action'),
	(12, 'Sci-Fi'),
	(13, 'Action'),
	(13, 'Sci-Fi'),
	(14, 'Family'),
	(14, 'Animation'),
	(15, 'Animation'),
	(15, 'Family'),
	(15, 'Drama'),
	(16, 'Animation'),
	(16, 'Family'),
	(16, 'Drama'),
	(17, 'Drama'),
	(18, 'Action')

INSERT INTO Watchhistory(movie_id, customer_mail_address, watch_date, price, invoiced) VALUES
	(11, 'peter@pan.de', '01-oct-2014', 2.50, 1),
	(11, 'peter@pan.de', '02-oct-2014', 2.50, 0),
	(12, 'guy@monk.nl', '10-mar-2014', 2.00, 0),
	(11, 'alex@cheng.nl', '10-dec-2019', 2.50, 1),
	(14, 'alex@cheng.nl', '5-dec-2019', 4.75, 1),
	(17, 'alex@cheng.nl', '1-dec-2019', 4.30, 1),
	(18, 'alex@cheng.nl', '30-nov-2019', 5.90, 0),
	(11, 'wouter@koek.de', '4-dec-2019', 2.50, 1),
	(12, 'wouter@koek.de', '6-dec-2019', 2.50, 1),
	(13, 'wouter@koek.de', '10-dec-2019', 3.50, 0),
	(17, 'wouter@koek.de', '1-dec-2019', 4.30, 0),
	(11, 'daan.geerts@dierckx.be', '5-dec-2019', 2.50, 0),
	(12, 'daan.geerts@dierckx.be', '7-dec-2019', 2.50, 0),
	(15, 'daan.geerts@dierckx.be', '30-nov-2019', 2.50, 1),
	(11, 'daan.geerts@dierckx.be', '2-dec-2019', 3.50, 1),
	(11, 'fatima@yahoo.com', '3-dec-2019', 2.50, 1),
	(13, 'fatima@yahoo.com', '4-dec-2019', 3.50, 0),
	(14, 'fatima@yahoo.com', '28-nov-2019', 4.75, 1),
	(18, 'fatima@yahoo.com', '1-dec-2019', 5.90, 1),
	(11, 'keeskaas@gmail.com', '5-dec-2019', 2.50, 0),
	(12, 'keeskaas@gmail.com', '6-dec-2019', 2.50, 0),
	(15, 'keeskaas@gmail.com', '30-nov-2019', 2.50, 1),
	(18, 'keeskaas@gmail.com', '7-dec-2019', 5.90, 1),
	(11, 'momo@yahoo.com', '6-dec-2019', 2.50, 0),
	(12, 'momo@yahoo.com', '8-dec-2019', 2.50, 1),
	(13, 'momo@yahoo.com', '10-dec-2019', 3.50, 1),
	(17, 'momo@yahoo.com', '1-dec-2019', 3.50, 0),
	(11, 'laurensvanbrecht@gmail.com', '4-dec-2019', 2.50, 1),
	(14, 'laurensvanbrecht@gmail.com', '2-dec-2019', 4.75, 1),
	(17, 'laurensvanbrecht@gmail.com', '6-dec-2019', 4.30, 0),
	(18, 'laurensvanbrecht@gmail.com', '9-dec-2019', 5.90, 1),
	(11, 'junaid@hotmail.com', '10-dec-2019', 2.50, 0),
	(14, 'junaid@hotmail.com', '29-nov-2019', 4.75, 1),
	(15, 'junaid@hotmail.com', '4-dec-2019', 2.50, 0),
	(18, 'junaid@hotmail.com', '5-dec-2019', 5.90, 0),
	(11, 'ben10@gmail.com', '7-dec-2019', 2.50, 1),
	(13, 'ben10@gmail.com', '9-dec-2019', 3.50, 1),
	(15, 'ben10@gmail.com', '1-dec-2019', 2.50, 1),
	(16, 'ben10@gmail.com', '2-dec-2019', 3.50, 0),
	(11, 'jamescharles@gmail.com', '7-dec-2019', 2.50, 1),
	(14, 'jamescharles@gmail.com', '3-dec-2019', 4.75, 1),
	(16, 'jamescharles@gmail.com', '30-nov-2019', 3.50, 0),
	(17, 'jamescharles@gmail.com', '10-dec-2019', 4.30, 1)

	/* INSERT INTO Movie(movie_id, title, duration, description, publication_year, cover_image, previous_part, price, URL) VALUES
    (13, 'Matrix Revolutions, The', 103, 'Description of Matrix Revolutions, The', 1990,  NULL, 12, 3.50, 'https://www.youtube.com/watch?v=NhoaoTZJSX4%27') */