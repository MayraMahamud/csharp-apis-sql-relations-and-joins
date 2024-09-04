

CREATE TABLE film (
    filmID serial Primary KEY,
    title VARCHAR,
    year int, 
    genre VARCHAR,
    score int,
    writerID int,
  foreign key (writerID) references writer (writerID),
   starID int,
  foreign key (starID) references star (starID),
   directorID int,
  foreign key (directorID) references director (directorID)
    );

create table director (
  directorID serial primary key,
  director_name varchar,
  director_country varchar,

); 


create table star (
  starID serial primary key,
  star_name varchar,
  star_dob DATE 
   
);


create table writer(
  writerID serial primary key,
  writer_name varchar,
  writer_email varchar
  
);




insert into director ( director_name, director_country) VALUES
('Stanley Kubrick', 'USA'),
('George Lucas', 'USA'),
('Robert Mulligan' , 'USA'),
('James Cameron	' , 'Canada'),
('David Lean' , 'UK'),
('Anthony Mann' , 'USA'),
('Theodoros Angelopoulos' , 'Greece'),
('Paul Verhoeven' , 'Netherlands'),
('Krzysztof Kieslowski' , 'Poland'),
('Jean-Paul Rappeneau' , 'France')
;


insert into writer (writer_name, writer_email) VALUES
('Arthur C Clarke', 'arthur@clarke.com'),
('George Lucas', 'george@email.com'),
('Harper Lee' , 'harper@lee.com'),
('James Cameron' , 'james@cameron.com'),
('Boris Pasternak' , 'boris@boris.com'),
('Frederick Frank' , 'fred@frank.com'),
('Theodoros Angelopoulos' , 'theo@angelopoulos.com'),
('Erik Hazelhoff Roelfzema' , 'erik@roelfzema.com'),
('Krzysztof Kieslowski' , 'email@email.com'),
('Edmond Rostand' , 'edmond@rostand.com')

;



insert into star (star_name, star_dob) VALUES
('Keir Dullea', '1936-05-30'),
('Mark Hamill', '1951-09-25'),
('Gregory Peck', '1916-04-05'),
('Leonardo DiCaprio', '1974-11-11'),
('Julie Christie', '1940-04-14'),
('Charlton Heston', '1923-10-04'),
('Manos Katrakis', '1908-08-14'),
('Rutger Hauer', '1944-01-23'),
('Juliette Binoche', '1964-03-09'),
('Gerard Depardieu', '1948-12-27');

delete from film where filmid > 10;



insert into film (title, year, genre, score, writerid, starid, directorid) VALUES
('2001: A Space Odyssey', 1968, 'Science Fiction', 10, 1, 1,1),
('Star Wars: A New Hope', 1977, 'Science Fiction', 7, 2, 2, 2),
('To Kill A Mockingbird', 1962, 'Drama', 10, 3, 3, 3),
('Titanic', 1997, 'Romance', 5, 4, 4, 4),
('Dr Zhivago', 1965, 'Historical', 8, 5, 5, 5),
('El Cid', 1961, 'Historical', 6, 6, 6, 6),
('Voyage to Cythera', 1984, 'Drama', 8, 7, 7, 7),
('Soldier of Orange', 1977, 'Thriller', 8, 8, 8, 8),
('Three Colours: Blue', 1993, 'Drama', 8, 9, 9, 9),
('Cyrano de Bergerac', 1990, 'Historical', 9, 10, 10, 10);



--Show the title and director name for all films
select film.title, director.director_name as directorName from film  join director on film.directorid =director.directorid;

--Show the title, director and star name for all films
select film.title, director.director_name as directorName, star.star_name as starname from film join director on film.directorid =director.directorid  join star on film.starid = star. starid;


-- Show the title of films where the director is from the USA
select film.title from film join director on film.directorid = director.directorid where director.director_country = 'USA';

--Show only those films where the writer and the director are the same person
select film.title from film join director on film.directorid = director.directorid join writer on film.writerid = writer.writerid where director.director_name = writer.writer_name;

-- Show directors and film titles for films with a score of 8 or higher
select film.title, director.director_name from film join director on film.directorid = director.directorid where film.score >= 8;


--Make at least 5 more queries to demonstrate your understanding of joins, and other relationships between tables.


select film.title, writer.writer_name as writerName from film join writer on film.writerid = writer.writerid;

select film.title, director.director_name from film join director on film.directorid = director.directorid order by film.title;

select film.title from film join director on film.directorid = director.directorid join writer on film.writerid = writer.writerid where genre = 'Drama';

select star.star_name, star.star_dob, film.title from star join film on star.starid = film.starid where star.star_name like 'M%';

select director.director_name, film.title, film.score from film join director on film.directorid = director.directorid order by film.score desc;

select director.director_name, film.title, writer.writer_name, writer_email from film join director on film.directorid = director.directorid join writer on writer.writerid = film.writerid;
--c