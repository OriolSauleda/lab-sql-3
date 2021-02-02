-- How many distinct (different) actors' last names are there?
select count(distinct(last_name)) from sakila.actor;

-- In how many different languages where the films originally produced? (Use the column language_id from the film table)
select count(distinct(language_id)) from sakila.film;

-- How many movies were released with "PG-13" rating?
select count(film_id) from sakila.film
where rating = 'PG-13';

-- Get 10 the longest movies from 2006.
select title, length, release_year from sakila.film
where release_year = '2006'
order by length desc
limit 10;

select * from sakila.film
where release_year = '2006'
order by length desc
limit 10;

-- How many days has been the company operating (check DATEDIFF() function)? necessitem datediff pel format de la data, tel posa en dies
select datediff(max(last_update), min(rental_date)) from sakila.rental;

-- Show rental info with additional columns month and weekday. Get 20.
Select *, date_format(rental_date, '%M') as month, date_format(rental_date, '%W') as weekday from sakila.rental
limit 20;

SELECT *, EXTRACT(MONTH from rental_date) as month, date_format(rental_date, '%W') as weekday
FROM sakila.rental
LIMIT 20;

-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select *, 
case 
when date_format(rental_date, '%W') IN ('Saturday', 'Sunday') then 'Weekend'
else 'Workday'
End as day_type
from sakila.rental;

-- How many rentals were in the last month of activity?
select count(rental_id) from sakila.rental
where EXTRACT(YEAR from rental_date)='2006' and EXTRACT(MONTH from rental_date)='02'; -- previously I've figured out what are the last year and month select rental_date from sakila.rentalorder by rental_date desc limit 1;