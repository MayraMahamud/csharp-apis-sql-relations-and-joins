create table person(
  personID serial primary key,
  name varchar
);


CREATE TABLE film2 (
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

create table director2 (
  directorID serial primary key,
  director_country varchar,
  personID int,
  foreign key (personID) references person (personID)
   
); 


create table star2 (
  starID serial primary key,
  star_dob DATE,
   personID int,
  foreign key (personID) references person (personID)
   
);


create table writer2(
  writerID serial primary key,
  writer_email varchar,
   personID int,
  foreign key (personID) references person (personID)
  
);


insert into person (name) VALUES
--stars
('Keir Dullea'),
('Mark Hamill'),
('Gregory Peck'),
('Leonardo DiCaprio'),
('Julie Christie'),
('Charlton Heston'),
('Manos Katrakis'),
('Rutger Hauer'),
('Juliette Binoche'),
('Gerard Depardieu'),

--write
('Arthur C Clarke'),
('George Lucas'),
('Harper Lee'),
('James Cameron'),
('Boris Pasternak'),
('Frederick Frank'),
('Theodoros Angelopoulos'),
('Erik Hazelhoff Roelfzema'),
('Krzysztof Kieslowski' ),
('Edmond Rostand'),

--directors
('Stanley Kubrick'),
('George Lucas'),
('Robert Mulligan' ),
('James Cameron	'),
('David Lean'),
('Anthony Mann'),
('Theodoros Angelopoulos'),
('Paul Verhoeven' ),
('Krzysztof Kieslowski' ),
('Jean-Paul Rappeneau' );


insert into star2 (star_dob, personid) VALUES
('1936-05-30', 1),
( '1951-09-25', 2),
( '1916-04-05', 3),
( '1974-11-11', 4),
( '1940-04-14', 5),
( '1923-10-04', 6),
( '1908-08-14', 7),
( '1944-01-23', 8),
( '1964-03-09',9),
( '1948-12-27', 10);


insert into writer2 ( writer_email, personid) VALUES
( 'arthur@clarke.com',11 ),
('george@email.com', 12),
('harper@lee.com', 13),
( 'james@cameron.com', 14),
( 'boris@boris.com', 15),
( 'fred@frank.com', 16),
( 'theo@angelopoulos.com', 17),
( 'erik@roelfzema.com', 18),
( 'email@email.com', 19),
( 'edmond@rostand.com', 20);


insert into director2 (director_country, personid) VALUES
('USA', 21),
('USA', 22),
('USA', 23),
('Canada', 24),
('UK', 25),
('USA', 26),
('Greece', 27),
('Netherlands', 28),
( 'Poland', 29),
('France', 30);



insert into film2 (title, year, genre, score, writerid, starid, directorid) VALUES
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

--TESTING EXTENSION 1:
select  person.name from person join  star2 on person.personid = star2.starid;

select  person.name from person join director2 on person.personid = director2.personid;

select person.name from person join writer2 on person.personid = writer2.personid;
--c

