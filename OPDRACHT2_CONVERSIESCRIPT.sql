/*==============================================================*/
/* Database name:  Beroepsproduct - Alex Cheng & Wouter Koek    */
/* Script:		   Conversie Script			                    */
/* Created on:     10-dec-2019		                            */
/*==============================================================*/

/* 2.A */

use Beroepsproduct
go 

DELETE FROM Movie_Cast
DELETE FROM Movie_Directors
DELETE FROM Watchhistory
DELETE FROM Movie_Genre
DELETE FROM Genre
DELETE FROM Movie
DELETE FROM Person
DELETE FROM Customer
DELETE FROM Payment
DELETE FROM Country
DELETE FROM "Contract"

/* 2.B */

use master
go 

INSERT INTO Beroepsproduct.dbo.Person
SELECT DISTINCT CAST(Id AS int) AS person_id,
LEFT(Lname,50) AS lastname,
LEFT(Fname,50) AS firstname,
CAST(Gender AS char(1)) AS gender
FROM MYIMDB.dbo.Imported_Person

INSERT INTO Beroepsproduct.dbo.Person
SELECT DISTINCT CAST(Id AS int)+845465 AS person_id,
LEFT(Lname,50) AS lastname,
LEFT(Fname,50) AS firstname,
NULL AS gender
FROM MYIMDB.dbo.Imported_Directors

INSERT INTO Beroepsproduct.dbo.Genre
SELECT DISTINCT LEFT(Genre,255) AS genre_name,
NULL AS "description"
FROM MYIMDB.dbo.Imported_Genre

INSERT INTO Beroepsproduct.dbo.Movie
SELECT DISTINCT CAST(Id AS int) AS movie_id,
LEFT(Name,254) AS title,
NULL AS duration,
NULL AS "description",
CAST("Year" AS int) AS publication_year,
NULL AS cover_image,
NULL AS previous_part,
0 AS price,
NULL AS "URL"
FROM MYIMDB.dbo.Imported_Movie

/* 2.C */

INSERT INTO Beroepsproduct.dbo.Movie_Directors
SELECT DISTINCT CAST(Mid AS int) AS movie_id,
CAST(Did AS int)+845465 AS person_id
FROM MYIMDB.dbo.Imported_Movie_Directors

INSERT INTO Beroepsproduct.dbo.Movie_Cast
SELECT DISTINCT CAST(Mid AS int) AS person_id,
CAST(Pid AS int) AS movie_id,
LEFT("Role",255) AS "role"
FROM MYIMDB.dbo.Imported_Cast