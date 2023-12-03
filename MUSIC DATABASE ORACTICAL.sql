--Q1: who is the most senior employee  ?
select * from employee 
order by levels desc
limit 1;

--q2: which countries have the most invoice?
select billing_country,count(billing_country) from invoice
group by billing_country
order by count desc;

--Q3: what are top 3 values of total invoice ?
select * from invoice 
order by total desc
limit 3;

--Q4:which city has the best customer? we would like to throw a promotional music festival in the city we made the most money. 
--write a query that returns one city that has highest sum of invoice totals return both the city name ans sum of all
--voice total
select billing_city, count(billing_city), sum(total) as total from invoice 
group by billing_city
order by total desc;

--Q5:who is the best customer? the customer who has spent most money will be declared the best customer. 
-- write a query that returns the person who has spent the most money
 
select customer.customer_id, customer.first_name, customer.last_name, customer.city, customer.country,
 sum(invoice.total)as total from customer
join invoice
on customer.customer_id= invoice.customer_id
group by customer.customer_id
order by total desc;

--Q6:Write query to return the email, first name, last name, & Genre of all Rock Music
--listeners. Return your list ordered alphabetically by email starting with A
select * from customer;
select DISTINCT customer.customer_id, customer.first_name, customer.last_name, customer.email,genre.name from customer
join invoice on customer.customer_id=invoice.customer_id
join invoice_line on invoice.invoice_id= invoice_line.invoice_id
join track on track.track_id=invoice_line.track_id
join genre on track.genre_id=genre.genre_id
where genre.name='Rock'
order by email;


--Q7:Let's invite the artists who have written the most rock music in our dataset. Write a
--query that returns the Artist name and total track count of the top 10 rock bands
select name from artist;
SELECT artist.name, artist.artist_id, count(artist.artist_id) FROM track
JOIN album ON album.album_id=track.album_id
join artist on artist.artist_id=album.artist_id
join genre on genre.genre_id=track.genre_id
where genre.name like 'rock'
group by artist.artist_id;


--q8:Return all the track names that have a song length longer than the average song length. Return the Name and 
--Milliseconds for each track. Order by the song length with the longest songs listed first

select name,milliseconds from track
where milliseconds>
  (select avg(milliseconds) from track)
order by milliseconds desc
limit 10;

