use pubs
select * from sysobjects
select name,xtype from sysobjects where xtype='u'
select * from authors
select au_lname,state from authors
select * from authors where state='ca'
select * from authors where au_lname='white' and state='ca'
select * from  titles
select title from titles where ytd_sales>8000
select title , royalty from titles where royalty>=12 and royalty<=24

select title , royalty from titles where royalty<12 or royalty>24
SELECT * FROM TITLES ORDER BY PRICE ASC
SELECT title,price FROM TITLES ORDER BY PRICE ASC; --ascending list will be show
SELECT * FROM TITLES ORDER BY PRICE DESC --decending list will be show
SELECT title,price FROM TITLES ORDER BY PRICE DESC
select MAX(price) as max_price from titles;
SELECT AVG(PRICE) from TITLES
select title , royalty from titles  where royalty    between 12 and 24
SELECT TYPE , AVG(PRICE) AS average_price,sum(ytd_sales) AS total_ytd_sales from TITLES GROUP BY TYPE
SELECT TYPE , MAX(PRICE) from TITLES GROUP BY TYPE
SELECT TYPE , AVG(PRICE) from TITLES GROUP BY TYPE HAVING AVG(price)>15
SELECT TYPE , MAX(PRICE) from TITLES GROUP BY TYPE HAVING AVG(price)>15
SELECT TYPE ,MAX(PRICE) as maxprice,sum(ytd_sales) from TITLES GROUP BY TYPE
SELECT "Name"=SUBSTRING(au_fname,1,1) + '. '+ au_lname, phone FROM authors
SELECT "Name"=SUBSTRING (au_fname,1,5) + '. '+ (au_lname), phone FROM authors
SELECT au_lname, pub_name FROM authors, publishers where  authors.city=publishers.city
SELECT "Name"=SUBSTRING (au_fname,1,5) + '. '+ (au_lname), phone,pub_name FROM authors, publishers where  authors.city=publishers.city
SELECT "Name"=SUBSTRING (au_fname,1,5) + '. '+ (au_lname),authors.city,pub_name,publishers.city  FROM authors ,publishers where  authors.city=publishers.city
