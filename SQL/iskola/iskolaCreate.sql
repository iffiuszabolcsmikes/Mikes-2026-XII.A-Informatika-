--DROP

drop table if exists jegy;
drop table if exists tanar_osztaly;
drop table if exists diak;
drop table if exists tanar;
drop table if exists tantargy;
drop table if exists osztaly;

--CREATE

create table tantargy
(
	nev varchar(255) primary key
);

create table tanar
(
	id int generated always as identity primary key,
	nev varchar(255) not null,
	email varchar(255) unique
);

create table osztaly
(
	nev varchar(255) not null,
	evfolyam varchar(255) not null,
	primary key (nev, evfolyam)
);

create table diak
(
	id int generated always as identity primary key,
	nev varchar(255) not null,
	email varchar(255) unique,
	szul_datum date not null,
	osztaly_nev varchar(255) not null,
	evfolyam varchar(255) not null,
	foreign key (osztaly_nev, evfolyam) references osztaly(nev, evfolyam)
);

create table jegy
(
	jegy_id int generated always as identity primary key,
	diak_id int not null references diak(id),
	tanar_id int  not null references tanar(id),
	tantargy_nev varchar(255) not null references tantargy(nev),
	jegy int not null check(jegy>=1 and jegy<=10),
	time_stamp timestamp not null default current_timestamp
);

create table tanar_osztaly
(
	tanar_id int references tanar(id),
	osztaly_nev varchar(255) not null,
	evfolyam varchar(255) not null,
	tantargy_nev varchar(255) references tantargy(nev),
	foreign key (osztaly_nev, evfolyam) references osztaly(nev, evfolyam),
	primary key (tanar_id, osztaly_nev, evfolyam, tantargy_nev)
);

--INSERT

insert into tantargy(nev)
values
('Foldrajz'),
('Matematika'),
('Informatika'),
('Filozofia'),
('Biologia'),
('Torna');

insert into tanar(nev, email)
values
('Bela', 'Belabacsi@gmail.com'),
('Istvan', 'Pityubacsi@gmail.com'),
('Ildiko', 'ildineni34@gmail.com'),
('Erszike', 'nagyerzsi78@gmail.com'),
('Erika', 'amacskaimamindenem@gmail.com');

insert into osztaly(nev,evfolyam)
values
('12.A', '2026-2027'),
('12.B', '2026-2027'),
('12.C', '2026-2027'),
('12.D', '2026-2027');

insert into diak(nev, email, szul_datum, osztaly_nev, evfolyam)
values
('Kovács Péter', 'kovacs.peter@gmail.com', '2008-03-15', '12.A', '2026-2027'),
('Nagy Anna', 'nagy.anna@gmail.com', '2007-07-22', '12.B', '2026-2027'),
('Szabó Gábor', 'szabo.gabor@gmail.com', '2008-11-04', '12.A', '2026-2027'),
('Tóth Eszter', 'toth.eszter@gmail.com', '2007-01-19', '12.C', '2026-2027'),
('Molnár Dávid', 'molnar.david@gmail.com', '2008-05-30', '12.A', '2026-2027'),
('Kiss Réka', 'kiss.reka@gmail.com', '2007-09-12', '12.A', '2026-2027'),
('Farkas Bence', 'farkas.bence@gmail.com', '2008-12-08', '12.A', '2026-2027'),
('Balogh Zsófia', 'balogh.zsofia@gmail.com', '2007-04-25', '12.D', '2026-2027'),
('Varga Márk', 'varga.mark@gmail.com', '2008-08-17', '12.D', '2026-2027'),
('Papp Lilla', 'papp.lilla@gmail.com', '2007-06-03', '12.B', '2026-2027'),
('Oláh Tamás', 'olah.tamas@gmail.com', '2008-02-11', '12.A', '2026-2027'),
('Lakatos Enikő', 'lakatos.eniko@gmail.com', '2007-10-29', '12.D', '2026-2027'),
('Bíró András', 'biro.andras@gmail.com', '2008-01-07', '12.C', '2026-2027'),
('Kelemen Noémi', 'kelemen.noemi@gmail.com', '2007-12-14', '12.A', '2026-2027'),
('Veres Zoltán', 'veres.zoltan@gmail.com', '2008-06-21', '12.B', '2026-2027');

insert into jegy(diak_id, tanar_id, tantargy_nev, jegy)
values
(1, 4,'Informatika', 7),
(2, 3, 'Biologia', 9 ),
(5, 5, 'Foldrajz', 5 ),
(4, 1, 'Matematika', 4),
(3, 2, 'Filozofia', 10);

insert into tanar_osztaly(tanar_id, osztaly_nev, evfolyam, tantargy_nev)
values
(1, '12.A', '2026-2027', 'Matematika'),
(2, '12.B', '2026-2027', 'Filozofia'),
(1, '12.C', '2026-2027', 'Matematika'),
(3, '12.D', '2026-2027', 'Foldrajz'),
(2, '12.D', '2026-2027', 'Filozofia'),
(3, '12.A', '2026-2027', 'Biologia'),
(2, '12.A', '2026-2027', 'Filozofia');
