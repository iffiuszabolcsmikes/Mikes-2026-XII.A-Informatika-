drop table if exists film_szinesz;
drop table if exists film_rendezo;
drop table if exists szinesz;
drop table if exists rendezo;
drop table if exists film;
drop table if exists cert;

create table szinesz
(
    id int generated always as identity primary key,
    nev varchar(255) not null unique
);

create table rendezo
(
    id int generated always as identity primary key,
    nev varchar(255) not null unique
);

create table cert
(
    code varchar(255) primary key,
    description varchar(255)
);

create table film
(
    id int generated always as identity primary key,
    cim varchar(255) not null,
    megj_ev int not null,
    leiras text,
    cert varchar(255) references cert(code),
    imdb_link varchar(255)
);

create table film_szinesz
(
    film_id int references film(id),
    szinesz_id int references szinesz(id),
    szerep varchar(255),
    primary key(film_id, szinesz_id, szerep)
);

create table film_rendezo
(
    film_id int references film(id),
    rendezo_id int references rendezo(id),
    primary key(film_id, rendezo_id)
);

insert into cert(code, description)
values
('G', 'General Audiences'),
('PG', 'Parental Guidance Suggested'),
('PG-13', 'Parents Strongly Cautioned'),
('R', 'Restricted - Under 17 requires accompanying parent or adult'),
('NC-17', 'No One 17 and Under Admitted');

insert into rendezo(nev)
values
('Christopher Nolan'),
('Greta Gerwig'),
('Justin Lin'),
('Mary Harron'),
('Lana Wachowski'),
('Lilly Wachowski'),
('Nancy Meyers'),
('James Cameron'),
('Frank Darabont'),
('Francis Ford Coppola'),
('Robert Zemeckis'),
('Steven Spielberg'),
('Quentin Tarantino'),
('Peter Jackson'),
('David Fincher'),
('James Gunn');

insert into szinesz(nev)
values
('Ryan Gosling'),
('Margot Robbie'),
('Vin Diesel'),
('Michelle Rodriguez'),
('Christian Bale'),
('Heath Ledger'),
('Matt Damon'),
('Leonardo DiCaprio'),
('Elliot Page'),
('Lindsay Lohan'),
('Kate Winslet'),
('Keanu Reeves'),
('Morgan Freeman'),
('Tim Robbins'),
('Marlon Brando'),
('Al Pacino'),
('Tom Hanks'),
('Robin Wright'),
('Matthew McConaughey'),
('Anne Hathaway'),
('Joseph Gordon-Levitt'),
('Sam Neill'),
('Laura Dern'),
('Jeff Goldblum'),
('John Travolta'),
('Samuel L. Jackson'),
('Uma Thurman'),
('Elijah Wood'),
('Ian McKellen'),
('Viggo Mortensen'),
('Brad Pitt'),
('Edward Norton'),
('Robert Downey Jr.'),
('Chris Evans'),
('Chris Hemsworth');

insert into film(cim, megj_ev, leiras, cert, imdb_link)
values

('Barbie', 2023,
'Barbie and Ken are having the time of their lives in the seemingly perfect world of Barbie Land. However, when they get a chance to go to the outside world, they soon discover the joys and perils of living among regular humans.',
'PG-13',
'https://www.imdb.com/title/tt1517268/'),

('F9: The Fast Saga', 2021,
'Dom and the crew must take on an international terrorist who turns out to be Dom and Mia''s estranged brother.',
'PG-13',
'https://www.imdb.com/title/tt5433138/'),

('The Dark Knight', 2008,
'When the Joker wreaks havoc on Gotham City, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.',
'PG-13',
'https://www.imdb.com/title/tt0468569/'),

('The Odyssey', 2026,
'After the Trojan War, Odysseus faces a dangerous voyage back to Ithaca, meeting creatures like the Cyclops Polyphemus, Sirens, and Calypso along the way.',
'R',
'https://www.imdb.com/title/tt33764258/'),

('American Psycho', 2000,
'A wealthy New York City investment banking executive hides his psychopathic alter ego from his co-workers and friends.',
'R',
'https://www.imdb.com/title/tt0144084/'),

('Inception', 2010,
'A thief who steals corporate secrets through dream-sharing technology is given the inverse task of planting an idea into the mind of a CEO.',
'PG-13',
'https://www.imdb.com/title/tt1375666/'),

('The Matrix', 1999,
'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.',
'R',
'https://www.imdb.com/title/tt0133093/'),

('The Parent Trap', 1998,
'Identical twins separated at birth discover each other at summer camp and make a plan to bring their divorced parents back together.',
'PG',
'https://www.imdb.com/title/tt0120783/'),

('Titanic', 1997,
'A seventeen-year-old aristocrat falls in love with a kind but poor artist aboard the luxurious, ill-fated RMS Titanic.',
'PG-13',
'https://www.imdb.com/title/tt0120338/'),

('The Shawshank Redemption', 1994,
'A banker sentenced to life in prison develops a friendship with another inmate and never gives up hope of freedom.',
'R',
'https://www.imdb.com/title/tt0111161/'),

('The Godfather', 1972,
'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant youngest son.',
'R',
'https://www.imdb.com/title/tt0068646/'),

('Forrest Gump', 1994,
'The life of a simple man from Alabama unfolds through several decades of American history.',
'PG-13',
'https://www.imdb.com/title/tt0109830/'),

('Interstellar', 2014,
'A team of explorers travels beyond this galaxy to discover whether mankind has a future among the stars.',
'PG-13',
'https://www.imdb.com/title/tt0816692/'),

('Jurassic Park', 1993,
'A pragmatic paleontologist visits an almost complete theme park on an island where cloned dinosaurs have been brought back to life.',
'PG-13',
'https://www.imdb.com/title/tt0107290/'),

('Pulp Fiction', 1994,
'The lives of two mob hitmen, a boxer, a gangster and his wife intertwine in four tales of violence and redemption.',
'R',
'https://www.imdb.com/title/tt0110912/'),

('The Lord of the Rings: The Fellowship of the Ring', 2001,
'A meek Hobbit and eight companions set out on a journey to destroy a powerful ring and save Middle-earth from darkness.',
'PG-13',
'https://www.imdb.com/title/tt0120737/'),

('Fight Club', 1999,
'An insomniac office worker and a soap maker form an underground fight club that evolves into something much more dangerous.',
'R',
'https://www.imdb.com/title/tt0137523/');

insert into film_rendezo(film_id, rendezo_id)
select f.id, r.id
from (values
    ('Barbie', 'Greta Gerwig'),
    ('F9: The Fast Saga', 'Justin Lin'),
    ('The Dark Knight', 'Christopher Nolan'),
    ('The Odyssey', 'Christopher Nolan'),
    ('American Psycho', 'Mary Harron'),
    ('Inception', 'Christopher Nolan'),
    ('The Matrix', 'Lana Wachowski'),
    ('The Matrix', 'Lilly Wachowski'),
    ('The Parent Trap', 'Nancy Meyers'),
    ('Titanic', 'James Cameron'),
    ('The Shawshank Redemption', 'Frank Darabont'),
    ('The Godfather', 'Francis Ford Coppola'),
    ('Forrest Gump', 'Robert Zemeckis'),
    ('Interstellar', 'Christopher Nolan'),
    ('Jurassic Park', 'Steven Spielberg'),
    ('Pulp Fiction', 'Quentin Tarantino'),
    ('The Lord of the Rings: The Fellowship of the Ring', 'Peter Jackson'),
    ('Fight Club', 'David Fincher')
) as x(film, rendezo)
join film f on f.cim = x.film
join rendezo r on r.nev = x.rendezo;

insert into film_szinesz(film_id, szinesz_id, szerep)
select f.id, s.id, x.szerep
from (values
    ('Barbie', 'Ryan Gosling', 'Ken'),
    ('Barbie', 'Margot Robbie', 'Barbie'),

    ('F9: The Fast Saga', 'Vin Diesel', 'Dominic Toretto'),
    ('F9: The Fast Saga', 'Michelle Rodriguez', 'Letty Ortiz'),

    ('The Dark Knight', 'Christian Bale', 'Bruce Wayne / Batman'),
    ('The Dark Knight', 'Heath Ledger', 'Joker'),

    ('The Odyssey', 'Matt Damon', 'Odysseus'),
    ('The Odyssey', 'Tom Holland', 'Telemachus'),
    ('The Odyssey', 'Anne Hathaway', 'Penelope'),
    ('The Odyssey', 'Elliot Page', 'Sinon'),

    ('American Psycho', 'Christian Bale', 'Patrick Bateman'),

    ('Inception', 'Leonardo DiCaprio', 'Dom Cobb'),
    ('Inception', 'Elliot Page', 'Ariadne'),

    ('The Matrix', 'Keanu Reeves', 'Neo'),

    ('The Parent Trap', 'Lindsay Lohan', 'Annie James'),
    ('The Parent Trap', 'Lindsay Lohan', 'Hallie Parker'),

    ('Titanic', 'Leonardo DiCaprio', 'Jack Dawson'),
    ('Titanic', 'Kate Winslet', 'Rose DeWitt Bukater'),

    ('The Shawshank Redemption', 'Tim Robbins', 'Andy Dufresne'),
    ('The Shawshank Redemption', 'Morgan Freeman', 'Ellis Boyd Redding'),

    ('The Godfather', 'Marlon Brando', 'Vito Corleone'),
    ('The Godfather', 'Al Pacino', 'Michael Corleone'),

    ('Forrest Gump', 'Tom Hanks', 'Forrest Gump'),
    ('Forrest Gump', 'Robin Wright', 'Jenny Curran'),

    ('Interstellar', 'Matthew McConaughey', 'Joseph Cooper'),
    ('Interstellar', 'Anne Hathaway', 'Amelia Brand'),

    ('Jurassic Park', 'Sam Neill', 'Alan Grant'),
    ('Jurassic Park', 'Laura Dern', 'Ellie Sattler'),
    ('Jurassic Park', 'Jeff Goldblum', 'Ian Malcolm'),

    ('Pulp Fiction', 'John Travolta', 'Vincent Vega'),
    ('Pulp Fiction', 'Samuel L. Jackson', 'Jules Winnfield'),
    ('Pulp Fiction', 'Uma Thurman', 'Mia Wallace'),

    ('The Lord of the Rings: The Fellowship of the Ring', 'Elijah Wood', 'Frodo Baggins'),
    ('The Lord of the Rings: The Fellowship of the Ring', 'Ian McKellen', 'Gandalf'),
    ('The Lord of the Rings: The Fellowship of the Ring', 'Viggo Mortensen', 'Aragorn'),

    ('Fight Club', 'Brad Pitt', 'Tyler Durden'),
    ('Fight Club', 'Edward Norton', 'The Narrator')

) as x(film, szinesz, szerep)
join film f on f.cim = x.film
join szinesz s on s.nev = x.szinesz;

alter table szinesz
add column szuletesi_datum date,
add column halalozasi_datum date;

alter table rendezo
add column szuletesi_datum date,
add column halalozasi_datum date;

update szinesz s
set
    szuletesi_datum = x.szuletett,
    halalozasi_datum = x.elhunyt
from (values
    ('Ryan Gosling', DATE '1980-11-12', NULL::date),
    ('Margot Robbie', DATE '1990-07-02', NULL::date),
    ('Vin Diesel', DATE '1967-07-18', NULL::date),
    ('Michelle Rodriguez', DATE '1978-07-12', NULL::date),
    ('Christian Bale', DATE '1974-01-30', NULL::date),
    ('Heath Ledger', DATE '1979-04-04', DATE '2008-01-22'),
    ('Matt Damon', DATE '1970-10-08', NULL::date),
    ('Leonardo DiCaprio', DATE '1974-11-11', NULL::date),
    ('Elliot Page', DATE '1987-02-21', NULL::date),
    ('Lindsay Lohan', DATE '1986-07-02', NULL::date),
    ('Kate Winslet', DATE '1975-10-05', NULL::date),
    ('Keanu Reeves', DATE '1964-09-02', NULL::date),
    ('Morgan Freeman', DATE '1937-06-01', NULL::date),
    ('Tim Robbins', DATE '1958-10-16', NULL::date),
    ('Marlon Brando', DATE '1924-04-03', DATE '2004-07-01'),
    ('Al Pacino', DATE '1940-04-25', NULL::date),
    ('Tom Hanks', DATE '1956-07-09', NULL::date),
    ('Robin Wright', DATE '1966-04-08', NULL::date),
    ('Matthew McConaughey', DATE '1969-11-04', NULL::date),
    ('Anne Hathaway', DATE '1982-11-12', NULL::date),
    ('Joseph Gordon-Levitt', DATE '1981-02-17', NULL::date),
    ('Sam Neill', DATE '1947-09-14', NULL::date),
    ('Laura Dern', DATE '1967-02-10', NULL::date),
    ('Jeff Goldblum', DATE '1952-10-22', NULL::date),
    ('John Travolta', DATE '1954-02-18', NULL::date),
    ('Samuel L. Jackson', DATE '1948-12-21', NULL::date),
    ('Uma Thurman', DATE '1970-04-29', NULL::date),
    ('Elijah Wood', DATE '1981-01-28', NULL::date),
    ('Ian McKellen', DATE '1939-05-25', NULL::date),
    ('Viggo Mortensen', DATE '1958-10-20', NULL::date),
    ('Brad Pitt', DATE '1963-12-18', NULL::date),
    ('Edward Norton', DATE '1969-08-18', NULL::date),
    ('Robert Downey Jr.', DATE '1965-04-04', NULL::date),
    ('Chris Evans', DATE '1981-06-13', NULL::date),
    ('Chris Hemsworth', DATE '1983-08-11', NULL::date),
    ('Tom Holland', DATE '1996-06-01', NULL::date)
) as x(nev, szuletett, elhunyt)
where s.nev = x.nev;

update rendezo r
set
    szuletesi_datum = x.szuletett,
    halalozasi_datum = x.elhunyt
from (values
    ('Christopher Nolan', DATE '1970-07-30', NULL::date),
    ('Greta Gerwig', DATE '1983-08-04', NULL::date),
    ('Justin Lin', DATE '1971-10-11', NULL::date),
    ('Mary Harron', DATE '1953-01-12', NULL::date),
    ('Lana Wachowski', DATE '1965-06-21', NULL::date),
    ('Lilly Wachowski', DATE '1967-12-29', NULL::date),
    ('Nancy Meyers', DATE '1949-12-08', NULL::date),
    ('James Cameron', DATE '1954-08-16', NULL::date),
    ('Frank Darabont', DATE '1959-01-28', NULL::date),
    ('Francis Ford Coppola', DATE '1939-04-07', NULL::date),
    ('Robert Zemeckis', DATE '1952-05-14', NULL::date),
    ('Steven Spielberg', DATE '1946-12-18', NULL::date),
    ('Quentin Tarantino', DATE '1963-03-27', NULL::date),
    ('Peter Jackson', DATE '1961-10-31', NULL::date),
    ('David Fincher', DATE '1962-08-28', NULL::date),
    ('James Gunn', DATE '1966-08-05', NULL::date)
) as x(nev, szuletett, elhunyt)
where r.nev = x.nev;

select nev
from szinesz
where szuletesi_datum is null;

select nev
from rendezo
where szuletesi_datum is null;
