/*==============================================================*/
/* Database name:  Beroepsproduct - Alex Cheng & Wouter Koek    */
/* Script:		   DDL Opdracht 4			                    */
/* Created on:     12-MAR-2020		                            */
/*==============================================================*/

use Beroepsproduct
go

CREATE TABLE "Location" (
	country VARCHAR(255) NOT NULL,
	place_of_studio VARCHAR(255) NOT NULL,
	CONSTRAINT pk_location PRIMARY KEY (country)
)

CREATE TABLE Series (
	title VARCHAR(255) NOT NULL,
	"start" INT NOT NULL,
	seasons INT NOT NULL,
    episodes INT NOT NULL,
	CONSTRAINT pk_series PRIMARY KEY (title,"start"),
)

CREATE TABLE Age (
	age_advisery VARCHAR(3) NOT NULL,
	age_advisery_description VARCHAR(255) NOT NULL,
	CONSTRAINT pk_age PRIMARY KEY (age_advisery)
)

CREATE TABLE Company (
	company VARCHAR(255) NOT NULL,
	company_code varchar(1) NOT NULL,
	CONSTRAINT pk_company PRIMARY KEY (company)
)

CREATE TABLE Serieregel (
	country_name VARCHAR(50) NOT NULL,
	title VARCHAR(255) NOT NULL,
	person_id INT NOT NULL,
    age_advisery INT NOT NULL,
	company VARCHAR(255) NOT NULL,
	CONSTRAINT pk_serieregel PRIMARY KEY (country_name, title, person_id),
	CONSTRAINT fk_serieregelCountry FOREIGN KEY (country_name)
		REFERENCES Country(country_name),
	CONSTRAINT fk_serieregelPerson FOREIGN KEY (person_id)
		REFERENCES Person (person_id),
)

INSERT INTO "Location"(country, place_of_studio) VALUES
    ('The Netherlands','Aalsmeer'),
    ('The United States of America','Los ANgeles'),
    ('France','Paris')

INSERT INTO Person(person_id, firstname, lastname, gender) VALUES
	(48752,'Dick','Maas',NULL),
	(269426,'Laurens','Geels',NULL),
	(213445,'John','de Mol',NULL),
	(945466,'David','Benioff',NULL),
	(945467,'Paul','Simms',NULL),
	(945468,'Hugues','Pagan',NULL),
	(945469,'Murielle','Magellan',NULL),
	(945470,'Anne','Giaferri',NULL)

INSERT INTO Series(title, "start", seasons, episodes) VALUES
	('Flodder',1993,5,62),
	('Divorce',2012,4,49),
	('Game Of Thrones',2011,6,60),
	('Divorce',2016,1,10),
	('Mafiosa',2006,5,40),
	('Les Petits Meurtres dÁgatha Christie',2009,3,31)

INSERT INTO Age(age_advisery, age_advisery_description) VALUES
	('ALL','All Ages'),
	(12,'12 years or older'),
	(16,'16 years or older')

INSERT INTO Company(company, company_code) VALUES
	('Veronica','V'),
	('RTL4','R'),
	('HBO','H'),
	('Canal+','C'),
	('France 2','F')

INSERT INTO Serieregel(country_name,title,person_id,age_advisery,company) VALUES
	('NL','Flodder',48752,'ALL','Veronica'),
	('NL','Flodder',269426,'ALL','Veronica'),
	('NL','Divorce',213445,12,'RTL4'),
	('USA','Game Of Thrones',945466,12,'HBO'),
	('USA','Divorce',945467,16,'HBO'),
	('FR','Mafiosa',945468,12,'Canal +'),
	('FR','Les Petitis Meurtres dÁgatha Christie',945468,12,'France 2'),
	('FR','Les Petitis Meurtres dÁgatha Christie',945469,12,'France 2')