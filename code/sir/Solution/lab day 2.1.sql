use pubs 
select * from authors
select * from titles
select * from titleauthor
select * from publishers
select title,au_fname +au_lname  from titleauthor join titles on titleauthor.title_id= titles.title_id join authors on titleauthor.au_id=authors.au_id
select title,au_fname +' '+au_lname as author_name,pub_name 
 from authors join titleauthor on titleauthor.au_id=authors.au_id join titles 
on titleauthor.title_id= titles.title_id join publishers on titles.pub_id=publishers.pub_id
select au_lname,pub_name from authors,publishers where authors.city=publishers.city

select  (au_fname +' '+au_lname) as author_name  from authors
  join titleauthor on titleauthor.au_id= authors.au_id join titles on  (titleauthor.title_id=titles.title_id)
 where (royalty in(select avg(royalty ) from titles))

select  au_id from titles join titleauthor on  titles.title_id = titleauthor.title_id where royalty = (select max(royalty) from titles)
select title_id  from titles where royalty =(select max(royalty) from titles)
select au_id  from titles,titleauthor where royalty=(select max(royalty) from titles)