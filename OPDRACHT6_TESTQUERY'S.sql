/*==============================================================*/
/* Database name:  Beroepsproduct - Alex Cheng & Wouter Koek    */
/* Script:		   TEST Query's Opdracht 6			            */
/* Created on:     12-MAR-2020		                            */
/*==============================================================*/

/* KPI 1 */

SELECT genre_name, COUNT(Watchhistory.movie_id) AS aantal, YEAR(watch_date)
FROM Movie_Genre
    INNER JOIN Watchhistory ON Movie_Genre.movie_id = Watchhistory.movie_id
GROUP BY genre_name, watch_date
/* KPI 2 */

SELECT SUM(price) revenue, YEAR(watch_date), country_name
FROM Customer, Watchhistory
WHERE Customer.customer_mail_address = Watchhistory.customer_mail_address
GROUP BY watch_date, country_name
/* KPI 3 */

SELECT customer_mail_address, YEAR(GETDATE()) - YEAR(birth_date) AS leeftijd
FROM Customer

/* KPI 4 */

SELECT customer_mail_address, YEAR(GETDATE()) - YEAR(birth_date) AS leeftijd, country_name
FROM Customer