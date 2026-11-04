drop table if exists film_szinesz;

drop table if exists szinesz;

create table szinesz
(
	id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	nev varchar(255)
);

insert into szinesz (nev)
values
('Ryan Gosling'),
('Margot Robbie'),
('Vin Diesel'),
('Christian Bale'),
('Heath Ledger'),
('Matt Damon'),
('Leonardo DiCaprio'),
('Elliot(Ellen) Page'),
('Lindsay Lohan'),
('Kate Winslet'),
('Keanu Reeves');

select * from szinesz;

drop table if exists rendezo;

create table rendezo
(
	id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	nev varchar(255)
);

insert into rendezo (nev)
values
('Christopher Nolan'),
('Greta Gerwig'),
('Justin Lin'),
('Mary Harron'),
('Lana Wachowski'),
('Lilly Wachowski'),
('Nancy Meyers'),
('James Cameron');

select * from rendezo;

drop table if exists film;

drop table if exists cert;
create table cert
(
	code varchar(255) primary key,
	description varchar(255)
);

insert into cert (code, description)
values
('G',	'For all audiences'),
('NC-17',	'Under 17 not admitted'),
('PG',	'Parental Guidance Suggested (mainly for under 10''s)'),
('PG-13',	'PG-13 - Parental Guidance Suggested for children under 13'),
('R',	'Under 17 not admitted without parent or guardian');
select * from cert;

create table film 
(
	id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	cim varchar(255) not null,
	megj_ev int ,
	leiras text,
	cert varchar(255) references cert(code),
	imdb_link varchar(255)
);

insert into film (cim, megj_ev,leiras,cert,imdb_link)
values
('Barbie', 2023, 'Barbie and Ken are having the time of their lives in the seemingly perfect world of Barbie Land. However, when they get a chance to go to the outside world, they soon discover the joys and perils of living among regular humans.', 'PG-13', 'https://www.imdb.com/title/tt1517268/?ref_=fn_t_1'),
('F9: The Fast Saga', 2021, 'Dom and the crew must take on an international terrorist who turns out to be Dom and Mia''s estranged brother.', 'PG-13', 'https://www.imdb.com/title/tt5433138/?ref_=nv_sr_srsg_0_tt_7_nm_1_in_0_q_f9'),
('The Dark Knight', 2008, 'When a menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman, James Gordon and Harvey Dent must work together to put an end to the madness.', 'PG-13', 'https://www.imdb.com/title/tt0468569/?ref_=nv_sr_srsg_1_tt_6_nm_1_in_0_q_the%20dark%20kn'),
('The Odyssey', 2026, 'After the Trojan War, Odysseus faces a dangerous voyage back to Ithaca, meeting creatures like the Cyclops Polyphemus, Sirens, and Calypso along the way.', 'R', 'https://www.imdb.com/title/tt33764258/'),
('American Psycho', 2000, 'A wealthy New York City investment banking executive, Patrick Bateman, hides his alternate psychopathic ego from his co-workers and friends as he delves deeper into his violent, hedonistic fantasies.', 'R', 'https://www.imdb.com/title/tt0144084/?ref_=fn_t_1'),
('Inception', 2010, 'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a CEO, but his tragic past may doom the project and his team to disaster.', 'PG-13', 'https://www.imdb.com/title/tt1375666/?ref_=fn_t_1'),
('Matrix', 1999, 'A computer hacker discovers that his life is nothing more than an elaborate simulation run by an evil AI.', 'R', 'https://www.imdb.com/title/tt0133093/'),
('The Parent Trap', 1998, 'Identical twins Annie and Hallie, separated at birth and each raised by one of their biological parents, discover each other for the first time at summer camp and make a plan to bring their wayward parents back together.', 'PG', 'https://www.imdb.com/title/tt0120783/'),
('Titanic', 1997, 'A young aristocrat falls in love with a poor artist aboard the luxurious, ill-fated RMS Titanic.', 'PG-13', 'https://www.imdb.com/title/tt0120338/');

create table film_szinesz(
film_id int references film(id),
szinesz_id int references szinesz(id),
szerep varchar(255),
primary key(film_id, szinesz_id, szerep)
);

insert into film_szinesz(film_id, szinesz_id, szerep)
values
(1, 1, 'Ken'),
(2, 3,'Dom Torrento'),
(3, 4,'Batman'),
(4, 6,'Odysseus'),
(4, 8,'Sinon'),
(5, 4,'Patrick Bateman'),
(6, 7,'Cobb'),
(6, 8,'Ariadne'),
(8, 9,'Annie James'),
(8, 9,'Hallie Parker'),
(9, 7,'Jack Dawson'),
(9, 10,'Rose DeWitt Bukater'),
(7, 11,'Neo');

select f.cim, sz.nev, fsz.szerep
from film as f
	inner join film_szinesz as fsz on
		f.id=fsz.film_id
	inner join szinesz sz on
		sz.id=fsz.szinesz_id;
