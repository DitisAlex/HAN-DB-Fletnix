/*==============================================================*/
/* Database name:  Beroepsproduct - Alex Cheng & Wouter Koek    */
/* Script:		   Select script			                    */
/* Created on:     10-Dec-2019		                            */
/*==============================================================*/ 

USE Beroepsproduct
GO

--Opdracht A: Alle films gesorteerd naar genre [movie title, publication year, genre].

SELECT title, publication_year, genre_name
FROM Movie, Genre
ORDER BY genre_name

go

--Opdracht B: Alle movies die tussen 1990 en 2010 geproduceerd zijn.

SELECT title, publication_year
FROM Movie
WHERE publication_year BETWEEN 1990 AND 2010

go

--Opdracht C: Alle klanten die op dit moment actief zijn (i.e. subscription_end moet leeg zijn, of subscription_end ligt in de toekomst) [customer lastname, firstname, subscription_start].

SELECT lastname, firstname, subscription_start
FROM Customer
WHERE subscription_stop IS NULL OR subscription_stop > getdate()

go

--Opdracht D: De cast uit alle Terminator movies uit het jaar 1991 [id, title, firstname, lastname, role].

SELECT P.person_id, M.title, P.firstname, P.lastname, MC.role
FROM Movie AS M inner join Movie_Cast AS MC ON M.movie_id = MC.movie_id 
    inner join Person AS P ON P.person_id = MC.person_id
WHERE M.title LIKE '%terminator%'

go

--Opdracht E: Alle movies waarin de acteur “Arnold Schwarzenegger” een rol speelt [movie title, publication year].

SELECT M.title, M.publication_year
FROM Movie AS M inner join Movie_Cast AS MC ON M.movie_id = MC.movie_id 
    inner join Person AS P ON P.person_id = MC.person_id
WHERE P.firstname = 'Arnold' AND P.lastname = 'Schwarzenegger'

go

--Opdracht F: Alle gebruikers met openstaande kosten [Customer lastname, firstname, total price] Maak een View voor deze informatiebehoefte.
--View query aanmaken

CREATE VIEW openstaande_kosten AS
SELECT C.lastname, C.firstname, SUM(WH.price) AS total_price
FROM Customer AS C inner join Watchhistory AS WH ON C.customer_mail_address = WH.customer_mail_address
WHERE WH.invoiced = 0
GROUP BY C.lastname, C.firstname, WH.customer_mail_address

go

--View query opvragen

SELECT * FROM openstaande_kosten

go

--View query verwijderen

DROP VIEW openstaande_kosten

go

--Opdracht G: Toon 100 movies die tot nu toe het minst bekeken zijn, gesorteerd naar het aantal keren dat ze gekeken werden. Dit houdt ook 0 keer in [movie title, number of times watched]. Maak een View voor deze informatiebehoefte.
--View query aanmaken
CREATE VIEW least_watched_movies AS
SELECT TOP(100) M.title, COUNT(WH.movie_id) AS times_watched
FROM Movie M left outer join WatchHistory WH ON M.movie_id = WH.movie_id
GROUP BY WH.movie_id, M.title
ORDER BY times_watched ASC

go

--View query opvragen

SELECT * FROM least_watched_movies

go

--View query verwijderen

DROP VIEW least_watched_movies

go

--Opdracht H: Alle movies die in de afgelopen twee maanden het meest bekeken zijn, gesorteerd naar het aantal keren dat ze gekeken werden. Toon alleen movies die minimaal één keer bekeken zijn [movie title, publication_year, number of times watched]. Maak een View voor deze informatiebehoefte. De sortering kun je niet binnen de view doen, laat die buiten de view.
--View query aanmaken

CREATE VIEW least_watched_movie_last_2months AS
SELECT M.title, M.publication_year, COUNT(WH.movie_id) AS times_watched
FROM Movie M left outer join WatchHistory WH ON M.movie_id = WH.movie_id
WHERE WH.watch_date > DATEADD(MONTH, -2, GETDATE())
GROUP BY WH.movie_id, M.title, M.publication_year

go

--View query opvragen

SELECT * FROM least_watched_movie_last_2months

go

--View query verwijderen

DROP VIEW least_watched_movie_last_2months

go

--Opdracht I: Alle movies die meer dan 8 genres hebben [title, publication_year].

SELECT title, publication_year
FROM Movie
WHERE movie_id IN (SELECT movie_id
                    FROM Movie_Genre
                    GROUP BY movie_id
                    HAVING COUNT(genre_name) > 8)

go

--Opdracht J: Alle vrouwen die in Horror movies en Family movies gespeeld hebben [firstname,lastname].

SELECT P.firstname, P.lastname
FROM Movie_Cast AS MC left outer join Person AS P ON MC.person_id = P.person_id
WHERE P.gender = 'F' AND MC.movie_id IN (SELECT movie_id
										FROM Movie_Genre
										WHERE genre_name = 'Horror' AND genre_name = 'Family')

go

--Opdracht K: De director die tot nu toe de meeste films geproduceerd heeft [firstname, lastname].

SELECT P.firstname, P.lastname, COUNT(MC.movie_id) AS aantal_geproduceerde_films
FROM Movie_Directors AS MC left outer join Person AS P ON MC.person_id = P.person_id
GROUP BY MC.person_id, P.firstname, P.lastname
ORDER BY aantal_geproduceerde_films desc

go

--Opdracht L: Alle Genres en het percentage dat de films uit het bepaalde genre uitmaken t.o.v. het totale aantal films [genre, percentage], gesorteerd op meest populaire genre. Maak een View voor deze informatiebehoefte. Je mag ook eerst één of meerdere (hulp-)views maken om de informatiebehoefte op te lossen.

CREATE VIEW genre_amount AS
SELECT genre_name, COUNT(genre_name) AS aantal
FROM Movie_Genre
GROUP BY genre_name

go

CREATE VIEW total_movies AS
SELECT COUNT_BIG(movie_id) AS totaal
FROM Movie

go

SELECT genre_name, aantal, aantal * 100 / (select count(*) from movie_genre) AS "percentage"
FROM genre_amount, total_movies


DROP VIEW genre_amount
DROP VIEW total_movies

go

--Opdracht M: Gebruikers [mail_adress] en het gemiddelde aantal films die elke gebruiker per dag kijkt. Toon alleen gebruikers die gemiddeld 2 of meer films per dag kijken, met het grootste gemiddelde bovenaan. Maak een View voor deze informatiebehoefte. Je mag ook eerst één of meerdere (hulp-)views maken om de informatiebehoefte op te lossen.

use FLETNIX_DOCENT

go

CREATE VIEW aantal_films AS 
SELECT customer_mail_address, COUNT(customer_mail_address) AS watched_movies
FROM Watchhistory
GROUP BY customer_mail_address

go

CREATE VIEW aantal_dagen AS 
SELECT customer_mail_address, DATEDIFF(day,2019-11-10, subscription_start) AS aantal_dagen
FROM Customer
GROUP BY customer_mail_address, subscription_start

go

SELECT AF.customer_mail_address, AF.watched_movies / AD.aantal_dagen AS films_per_dag, AF.watched_movies, AD.aantal_dagen
FROM aantal_films AF,aantal_dagen AD
WHERE AF.customer_mail_address = AD.customer_mail_address AND AF.watched_movies / AD.aantal_dagen > 2

DROP VIEW aantal_films
DROP VIEW aantal_dagen