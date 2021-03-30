/*==============================================================*/
/* Database name:  Beroepsproduct - Alex Cheng & Wouter Koek    */
/* Script:		   Test script			                    */
/* Created on:     13-Nov-2019		                            */
/*==============================================================*/

--Test om te controleren of bij 'gender' waarde "M" of "F" is.
--[FOUT]
INSERT INTO Person(person_id, lastname, firstname, gender) VALUES
	(12348, 'Cheng', 'Alex', 'A')
--[GOED]
INSERT INTO Person(person_id, lastname, firstname, gender) VALUES
	(12349, 'Alex', 'Cheng', 'M')

--Test om te controleren of 'publication_year' tussen 1890 en het huidige jaar ligt.
--[FOUT]
INSERT INTO Movie(movie_id, title, duration, description, publication_year, cover_image, previous_part, price, URL) VALUES
	(11, 'Matrix, The', 122, 'Description of Matrix, The', 1871,  NULL, NULL, 2.50, 'https://www.youtube.com/watch?v=m8e-FF8MsqU')
--[GOED]
INSERT INTO Movie(movie_id, title, duration, description, publication_year, cover_image, previous_part, price, URL) VALUES
	(13, 'Matrix Revolutions, The', 103, 'Description of Matrix Revolutions, The', 2000,  NULL, 12, 3.50, 'https://www.youtube.com/watch?v=NhoaoTZJSX4')

--Test om te controleren of 'duration' niet negatief kan zijn.
--[FOUT] 
INSERT INTO Movie(movie_id, title, duration, description, publication_year, cover_image, previous_part, price, URL) VALUES
	(12, 'Matrix Reloaded, The', -22, 'Description of Matrix Reloaded, The', 2003,  NULL, 11, 2.50, 'https://www.youtube.com/watch?v=kYzz0FSgpSU')
--[GOED]
INSERT INTO Movie(movie_id, title, duration, description, publication_year, cover_image, previous_part, price, URL) VALUES
	(14, 'Lion King, The', 89, 'Description of Lion King, The', 1994, NULL, NULL, 4.75, 'https://www.youtube.com/watch?v=1Ono7DYJDQo')

--Test om te controleren of 'username' uniek moet zijn.
--[FOUT]
INSERT INTO Customer(customer_mail_address, lastname, firstname, payment_method, payment_card_number, contract_type, subscription_start, subscription_stop, user_name, password, country_name, gender, birth_date) VALUES
	('peter@pan.de', 'Pan', 'Peter', 'Mastercard', '0123456789', 'Basic', '01-oct-2014', '28-oct-2014', 'hoiikbenpeter', 'peterpass', 'The Netherlands', 'M', '26-jun-1971'),
	('guy@monk.nl', 'Threepwood', 'Guybrush', 'Visa', '333-555-777', 'Premium', '01-jan-2014', NULL, 'hoiikbenpeter', 'guyspass', 'Belgium', 'M', '03-mar-1972')
--[GOED]
INSERT INTO Customer(customer_mail_address, lastname, firstname, payment_method, payment_card_number, contract_type, subscription_start, subscription_stop, user_name, password, country_name, gender, birth_date) VALUES
	('peter@pan.de', 'Pan', 'Peter', 'Mastercard', '0123456789', 'Basic', '01-oct-2014', '28-oct-2014', 'peterpan123', 'peterpass', 'The Netherlands', 'M', '26-jun-1971'),
	('guy@monk.nl', 'Threepwood', 'Guybrush', 'Visa', '333-555-777', 'Premium', '01-jan-2014', NULL, 'guymonk123', 'guyspass', 'Belgium', 'M', '03-mar-1972')

--Test om te controleren of 'subscription_stop' pas na de 'subscription_start' is.
--[FOUT]
INSERT INTO Customer(customer_mail_address, lastname, firstname, payment_method, payment_card_number, contract_type, subscription_start, subscription_stop, user_name, password, country_name, gender, birth_date) VALUES
	('alex@cheng.nl', 'Cheng', 'Alex', 'Visa', '0611070503', 'Pro', '01-oct-2019', '01-oct-2018', 'abc123', 'epicpass', 'The Netherlands', 'M', '10-dec-2002')
--[GOED]
INSERT INTO Customer(customer_mail_address, lastname, firstname, payment_method, payment_card_number, contract_type, subscription_start, subscription_stop, user_name, password, country_name, gender, birth_date) VALUES
	('alex@cheng.nl', 'Cheng', 'Alex', 'Visa', '0611070503', 'Pro', '01-oct-2019', '15-oct-2019', 'abc123', 'epicpass', 'The Netherlands', 'M', '10-dec-2002')

--Test om te controleren of 'password' minimaal 8 karakters nodig heeft.
--[FOUT]
INSERT INTO Customer(customer_mail_address, lastname, firstname, payment_method, payment_card_number, contract_type, subscription_start, subscription_stop, user_name, password, country_name, gender, birth_date) VALUES
	('wouter@koek.de', 'Koek', 'Wouter', 'Mastercard', '9823234492', 'Pro', '01-dec-2018', '01-dec-2019', 'wouterkkk', 'koek', 'The Netherlands', 'M', '28-nov-2000')
--[GOED]
INSERT INTO Customer(customer_mail_address, lastname, firstname, payment_method, payment_card_number, contract_type, subscription_start, subscription_stop, user_name, password, country_name, gender, birth_date) VALUES
	('wouter@koek.de', 'Koek', 'Wouter', 'Mastercard', '9823234492', 'Pro', '01-dec-2018', '01-dec-2019', 'wouterkkk', 'koekjes1234', 'The Netherlands', 'M', '28-nov-2000')

--Test om te controleren of 'birth_date' moet ouder dan 14 zijn.
--[FOUT]
INSERT INTO Customer(customer_mail_address, lastname, firstname, payment_method, payment_card_number, contract_type, subscription_start, subscription_stop, user_name, password, country_name, gender, birth_date) VALUES
	('daan.geerts@dierckx.be', 'Geerts', 'Daan', 'Amex', '9876543210', 'Premium', '22-mar-2019', NULL, 'geertabc', 'dragon69', 'Belgium', 'M', '14-feb-2010')
--[GOED]
INSERT INTO Customer(customer_mail_address, lastname, firstname, payment_method, payment_card_number, contract_type, subscription_start, subscription_stop, user_name, password, country_name, gender, birth_date) VALUES
	('daan.geerts@dierckx.be', 'Geerts', 'Daan', 'Amex', '9876543210', 'Premium', '22-mar-2019', NULL, 'geertabc', 'dragon69', 'Belgium', 'M', '14-feb-2000')

