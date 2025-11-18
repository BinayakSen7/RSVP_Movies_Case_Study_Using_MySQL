create database RSVP_Movies;
use RSVP_Movies;

create table Movies(
movie_id int primary key,
title varchar(100),
release_year year,
genre varchar(50),
language varchar(30),
budget decimal(10,2),
revenue decimal(10,2));


create table Directors(
director_id int primary key,
name varchar(100));

create table Movie_Director(
movie_id int,
director_id int,
foreign key(movie_id) references Movies(movie_id),
foreign key(director_id) references Directors(director_id));

create table Ratings(
movie_id int,
rating decimal(3,1),
foreign key(movie_id) references Movies(movie_id));

insert into Movies(movie_id,title,release_year,genre,language,budget,revenue) values
(1, 'Uri: The Surgical Strike', 2019, 'Action', 'Hindi', 25.00, 
350.00), 
(2, 'Kedarnath', 2018, 'Romance', 'Hindi', 40.00, 100.00), 
(3, 'Love Per Square Foot', 2018, 'Comedy', 'Hindi', 20.00, 45.00); 

insert into Directors(director_id,name) values
(1, 'Aditya Dhar'), 
(2, 'Abhishek Kapoor'), 
(3, 'Anand Tiwari'); 

insert into Movie_Director(movie_id,director_id) values
(1, 1), 
(2, 2), 
(3, 3); 

insert into Ratings(movie_id,rating) values
(1, 8.3), 
(2, 6.9), 
(3, 7.3); 

--  List all movies released after 2017
select title,release_year from Movies where release_year > 2017;
--  Find the highest revenue movie
select title, revenue from Movies order by revenue desc limit 1;

--  Show movies with rating > 7
select m.title,r.rating from Movies m inner join Ratings r on m.movie_id = r.movie_id where r.rating > 7;

-- Get directors and their movies
select d.name as Director , m.title as Movies from Directors d
join Movie_Director md on d.director_id = md.director_id
join Movies m on md.movie_id = m.movie_id;

-- Calculate Profit = Revenue – Budget 
select title,(revenue - budget) as Profit from Movies;

-- Find average rating per genre
select m.genre,avg(r.rating) as Avg_rating from Movies m
join Ratings r on m.movie_id = r.movie_id group by m.genre;

--  Recommend Top 3 movies by rating 
select m.title,r.rating from Movies m join Ratings r on m.movie_id = r.movie_id order by r.rating desc limit 3;
