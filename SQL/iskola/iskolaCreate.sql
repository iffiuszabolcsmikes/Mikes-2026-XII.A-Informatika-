drop table if exists tantargy;
create table tantargy
(
	nev varchar(255) primary key
);
insert into tantargy (nev)
values
('Foldrajz'),
('Matematika'),
('Informatika'),
('Torna');

drop table if exists tanar;
create table tanar
(
	id int generated always as identity primary key,
	nev varchar(255) not null,
	email varchar(255)
);
insert into tanar (nev, email)
values
('Simon', 'bfhjdsbj@gmail.com'),
('András', 'uerfkuekjui@gmail.com'),
('Elizabet','qwertyuio@gmail.com');

drop table if exists diak;
create table diak
(
	id int generated always as identity primary key,
	nev varchar(255) not null,
	email varchar(255),
	szul_datum date
);
insert into diak (nev, email,szul_datum)
values
('Izabella Ibolya', 'grefrwu@gmail.com','2007-12-15'),
('Anett Fanni','gure@gmail.com', '2008-12-15'),
('Kovács Péter', 'kovacs.peter@gmail.com', '2008-03-15'),
('Nagy Anna', 'nagy.anna@gmail.com', '2007-07-22'),
('Szabó Gábor', 'szabo.gabor@gmail.com', '2008-11-04'),
('Tóth Eszter', 'toth.eszter@gmail.com', '2007-01-19'),
('Molnár Dávid', 'molnar.david@gmail.com', '2008-05-30'),
('Kiss Réka', 'kiss.reka@gmail.com', '2007-09-12'),
('Farkas Bence', 'farkas.bence@gmail.com', '2008-12-08'),
('Balogh Zsófia', 'balogh.zsofia@gmail.com', '2007-04-25'),
('Varga Márk', 'varga.mark@gmail.com', '2008-08-17'),
('Papp Lilla', 'papp.lilla@gmail.com', '2007-06-03'),
('Oláh Tamás', 'olah.tamas@gmail.com', '2008-02-11'),
('Lakatos Enikő', 'lakatos.eniko@gmail.com', '2007-10-29'),
('Bíró András', 'biro.andras@gmail.com', '2008-01-07'),
('Kelemen Noémi', 'kelemen.noemi@gmail.com', '2007-12-14'),
('Veres Zoltán', 'veres.zoltan@gmail.com', '2008-06-21');
/*
create table tanar_diak 
(
	tanar_id int references tanar(id),
	diak_id int references diak(id),
	tantargy_nev varchar(255) references tantargy(nev),
	primary key (tanar_id, diak_id, tantargy_nev)	
);
*/
