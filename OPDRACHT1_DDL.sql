/*==============================================================*/
/* Database name:  Beroepsproduct - Alex Cheng & Wouter Koek    */
/* Script:		   Create script			                    */
/* Created on:     13-Nov-2019		                            */
/*==============================================================*/
use master
go

drop database Beroepsproduct
go

create database Beroepsproduct
go


use Beroepsproduct
go

CREATE TABLE "Contract" (
	contract_type VARCHAR(10) NOT NULL,
	price_per_month NUMERIC(5,2) NOT NULL,
	discount_percentage NUMERIC(2) NULL,
	CONSTRAINT pk_contract PRIMARY KEY (contract_type)
)

CREATE TABLE Country (
	country_name VARCHAR(50) NOT NULL,
	CONSTRAINT pk_country PRIMARY KEY (country_name)
)

CREATE TABLE Payment (
	payment_method VARCHAR(10) NOT NULL,
	CONSTRAINT pk_payment PRIMARY KEY (payment_method)
)

CREATE TABLE Person (
	person_id INTEGER NOT NULL,
	lastname VARCHAR(50) NOT NULL,
	firstname VARCHAR(50) NOT NULL,
	gender char(1),
	CONSTRAINT pk_person PRIMARY KEY (person_id),
	/* 1.B I */
	CONSTRAINT ck_gender CHECK (gender IN ('M','F'))
)

CREATE TABLE Movie (
	movie_id INTEGER NOT NULL,
	title VARCHAR(255) NOT NULL,
	duration INTEGER,
	"description"VARCHAR(255),
	publication_year INTEGER,
	cover_image VARCHAR(255),
	previous_part INTEGER,
	price NUMERIC(5,2) NOT NULL,
	"URL" VARCHAR(255),
	CONSTRAINT pk_movie PRIMARY KEY (movie_id),
	CONSTRAINT fk_movie FOREIGN KEY (previous_part)
		REFERENCES Movie (movie_id) ON UPDATE NO ACTION ON DELETE NO ACTION,
	/* 1.B II */
	CONSTRAINT ck_movie1 CHECK (publication_year > 1890 AND publication_year < 2020),
	/* 1.C duration niet negatief */
	CONSTRAINT ck_movie2 CHECK (duration > 0)
)

CREATE TABLE Movie_Cast (
	movie_id INTEGER NOT NULL,
	person_id INTEGER NOT NULL,
	"role" VARCHAR(255) NOT NULL,
	CONSTRAINT fk_movie_cast1 FOREIGN KEY (movie_id)
		REFERENCES Movie (movie_id) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT fk_movie_cast2 FOREIGN KEY (person_id)
		REFERENCES Person (person_id) ON UPDATE CASCADE ON DELETE CASCADE
)

CREATE TABLE Customer (
	customer_mail_address VARCHAR(255) NOT NULL,
	lastname VARCHAR(50) NOT NULL,
	firstname VARCHAR(50) NOT NULL,
	payment_method VARCHAR(10) NOT NULL,
	payment_card_number VARCHAR(30) NOT NULL,
	contract_type VARCHAR(10) NOT NULL,
	subscription_start DATE NOT NULL,
	subscription_stop DATE,
	"user_name" VARCHAR(30) NOT NULL,
	"password" VARCHAR(50) NOT NULL,
	country_name VARCHAR(50) NOT NULL,
	gender VARCHAR(1),
	birth_date DATE,
	CONSTRAINT pk_customer PRIMARY KEY (customer_mail_address),
	CONSTRAINT fk_customer1 FOREIGN KEY (contract_type)
		REFERENCES "Contract" (contract_type) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT fk_customer2 FOREIGN KEY (country_name)
		REFERENCES Country (country_name) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT fk_payment3 FOREIGN KEY (payment_method)
		REFERENCES Payment (payment_method) ON UPDATE CASCADE ON DELETE CASCADE,
	/* 1.B IV */
	CONSTRAINT ak_customer1 UNIQUE ("user_name"),
	/* 1.B III */
	CONSTRAINT ck_customer1 CHECK (subscription_start < subscription_stop),
	/* 1.C password moet minimaal 8 karakters hebben */
	CONSTRAINT ck_customer2 CHECK (len("password") >= 8 ),
	/* 1.C birth_date moet ouder dan 14 */
	CONSTRAINT ck_customer3 CHECK (birth_date < GETDATE() - year (14))
)

CREATE TABLE Genre (
	genre_name VARCHAR(255) NOT NULL,
	"description" VARCHAR(255),
	CONSTRAINT pk_genre PRIMARY KEY (genre_name)
)

CREATE TABLE Movie_Genre (
	movie_id INTEGER NOT NULL,
	genre_name VARCHAR(255) NOT NULL,
	CONSTRAINT fk_movie_genre1 FOREIGN KEY (movie_id)
		REFERENCES Movie (movie_id) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT fk_movie_genre2 FOREIGN KEY (genre_name)
		REFERENCES Genre (genre_name) ON UPDATE CASCADE ON DELETE CASCADE
)

CREATE TABLE Movie_Directors (
	movie_id INTEGER NOT NULL,
	person_id INTEGER NOT NULL,
	CONSTRAINT fk_movie_directors1 FOREIGN KEY (movie_id)
		REFERENCES Movie (movie_id) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT fk_movie_directors2 FOREIGN KEY (person_id)
		REFERENCES Person (person_id) ON UPDATE CASCADE ON DELETE CASCADE
)

CREATE TABLE Watchhistory (
	movie_id INTEGER NOT NULL,
	customer_mail_address VARCHAR(255) NOT NULL,
	watch_date DATE NOT NULL,
	price NUMERIC(5,2) NOT NULL,
	invoiced BIT NOT NULL,
	CONSTRAINT fk_watch1 FOREIGN KEY (customer_mail_address)
		REFERENCES Customer (customer_mail_address) ON UPDATE CASCADE ON DELETE NO ACTION,
	CONSTRAINT fk_watch2 FOREIGN KEY (movie_id)
		REFERENCES Movie (movie_id) ON UPDATE CASCADE ON DELETE NO ACTION,
)