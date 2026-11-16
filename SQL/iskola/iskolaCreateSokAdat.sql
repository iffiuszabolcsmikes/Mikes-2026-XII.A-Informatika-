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
('Torna'),
('Rajz');

insert into tanar(nev, email)
values
('Kovács László', 'kovacs.laszlo@gmail.com'),
('Székely Andrea', 'szekely.andrea@gmail.com'),
('Németh Gábor', 'nemeth.gabor@gmail.com'),
('Horváth Katalin', 'horvath.katalin@gmail.com'),
('Balázs Tamás', 'balazs.tamas@gmail.com'),
('Fekete Éva', 'fekete.eva@gmail.com'),
('Molnár Zoltán', 'molnar.zoltan@gmail.com'),
('Szabó Mária', 'szabo.maria@gmail.com'),
('Péterfi Attila', 'peterfi.attila@gmail.com'),
('Jakab Krisztina', 'jakab.krisztina@gmail.com');

insert into osztaly(nev,evfolyam)
values
('9.A', '2026-2027'),
('9.B', '2026-2027'),
('10.A', '2026-2027'),
('10.B', '2026-2027'),
('11.A', '2026-2027'),
('11.B', '2026-2027'),
('11.C', '2026-2027'),
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
('Veres Zoltán', 'veres.zoltan@gmail.com', '2008-06-21', '12.B', '2026-2027'),
('Kelemen Péter', 'kelemen.peter@gmail.com', '2009-02-14', '9.A', '2026-2027'),
('Nagy Dóra', 'nagy.dora@gmail.com', '2009-05-21', '9.A', '2026-2027'),
('Szabó Márton', 'szabo.marton@gmail.com', '2009-08-11', '9.B', '2026-2027'),
('Tóth Laura', 'toth.laura@gmail.com', '2009-12-03', '9.B', '2026-2027'),
('Molnár Bálint', 'molnar.balint@gmail.com', '2006-03-17', '10.A', '2026-2027'),
('Kiss Alexandra', 'kiss.alexandra@gmail.com', '2006-07-25', '10.A', '2026-2027'),
('Farkas Norbert', 'farkas.norbert@gmail.com', '2006-09-19', '10.B', '2026-2027'),
('Balogh Vivien', 'balogh.vivien@gmail.com', '2006-11-28', '10.B', '2026-2027'),
('Varga Levente', 'varga.levente@gmail.com', '2005-01-13', '11.A', '2026-2027'),
('Papp Barbara', 'papp.barbara@gmail.com', '2005-04-09', '11.A', '2026-2027'),
('Oláh Roland', 'olah.roland@gmail.com', '2005-06-22', '11.B', '2026-2027'),
('Lakatos Melinda', 'lakatos.melinda@gmail.com', '2005-10-16', '11.B', '2026-2027'),
('Bíró Kristóf', 'biro.kristof@gmail.com', '2005-02-08', '11.C', '2026-2027'),
('Veres Alexandra', 'veres.alexandra@gmail.com', '2005-08-30', '11.C', '2026-2027'),
('Antal Máté', 'antal.mate@gmail.com', '2008-04-12', '12.B', '2026-2027'),
('Sándor Emese', 'sandor.emese@gmail.com', '2007-03-27', '12.C', '2026-2027'),
('Kerekes Dávid', 'kerekes.david@gmail.com', '2008-07-19', '12.D', '2026-2027'),
('Bálint Réka', 'balint.reka@gmail.com', '2007-11-05', '12.A', '2026-2027'),
('Márton Ádám', 'marton.adam@gmail.com', '2008-09-23', '12.B', '2026-2027'),
('Simon Viktória', 'simon.viktoria@gmail.com', '2007-02-18', '12.C', '2026-2027');

insert into tanar_osztaly(tanar_id, osztaly_nev, evfolyam, tantargy_nev)
values
-- 1. tanár: Kovács László
(1, '9.A', '2026-2027', 'Matematika'),
(1, '10.A', '2026-2027', 'Matematika'),
(1, '11.A', '2026-2027', 'Matematika'),
(1, '12.A', '2026-2027', 'Matematika'),

-- 2. tanár: Székely Andrea
(2, '9.B', '2026-2027', 'Filozofia'),
(2, '10.B', '2026-2027', 'Filozofia'),
(2, '11.B', '2026-2027', 'Filozofia'),
(2, '12.B', '2026-2027', 'Filozofia'),

-- 3. tanár: Németh Gábor
(3, '9.A', '2026-2027', 'Biologia'),
(3, '10.A', '2026-2027', 'Biologia'),
(3, '11.C', '2026-2027', 'Biologia'),
(3, '12.C', '2026-2027', 'Biologia'),

-- 4. tanár: Horváth Katalin
(4, '9.B', '2026-2027', 'Informatika'),
(4, '10.B', '2026-2027', 'Informatika'),
(4, '11.A', '2026-2027', 'Informatika'),
(4, '12.A', '2026-2027', 'Informatika'),

-- 5. tanár: Balázs Tamás
(5, '10.A', '2026-2027', 'Foldrajz'),
(5, '11.B', '2026-2027', 'Foldrajz'),
(5, '12.D', '2026-2027', 'Foldrajz'),

-- 6. tanár: Fekete Éva
(6, '9.A', '2026-2027', 'Torna'),
(6, '10.B', '2026-2027', 'Torna'),
(6, '11.C', '2026-2027', 'Torna'),
(6, '12.C', '2026-2027', 'Torna'),

-- 7. tanár: Molnár Zoltán
(7, '9.B', '2026-2027', 'Rajz'),
(7, '10.A', '2026-2027', 'Rajz'),
(7, '11.A', '2026-2027', 'Rajz'),
(7, '12.B', '2026-2027', 'Rajz'),

-- 8. tanár: Szabó Mária
(8, '9.A', '2026-2027', 'Foldrajz'),
(8, '10.A', '2026-2027', 'Informatika'),
(8, '11.B', '2026-2027', 'Matematika'),
(8, '12.D', '2026-2027', 'Torna'),

-- 9. tanár: Péterfi Attila
(9, '9.B', '2026-2027', 'Biologia'),
(9, '10.B', '2026-2027', 'Matematika'),
(9, '11.C', '2026-2027', 'Filozofia'),
(9, '12.C', '2026-2027', 'Rajz'),

-- 10. tanár: Jakab Krisztina
(10, '9.A', '2026-2027', 'Filozofia'),
(10, '10.B', '2026-2027', 'Foldrajz'),
(10, '11.B', '2026-2027', 'Biologia'),
(10, '12.D', '2026-2027', 'Informatika');

insert into jegy(diak_id, tanar_id, tantargy_nev, jegy)
values
-- 1. diák - Kovács Péter (12.A)
(1, 1, 'Matematika', 8),
(1, 4, 'Informatika', 9),
(1, 3, 'Biologia', 7),
(1, 5, 'Foldrajz', 8),
(1, 8, 'Torna', 10),

-- 2. diák - Nagy Anna (12.B)
(2, 2, 'Filozofia', 9),
(2, 7, 'Rajz', 10),
(2, 5, 'Foldrajz', 8),
(2, 3, 'Biologia', 7),
(2, 6, 'Torna', 9),

-- 3. diák - Szabó Gábor (12.A)
(3, 1, 'Matematika', 6),
(3, 4, 'Informatika', 8),
(3, 3, 'Biologia', 9),
(3, 5, 'Foldrajz', 7),
(3, 8, 'Torna', 8),

-- 4. diák - Tóth Eszter (12.C)
(4, 3, 'Biologia', 10),
(4, 9, 'Rajz', 9),
(4, 6, 'Torna', 8),
(4, 2, 'Filozofia', 7),
(4, 1, 'Matematika', 9),

-- 5. diák - Molnár Dávid (12.A)
(5, 1, 'Matematika', 7),
(5, 4, 'Informatika', 10),
(5, 3, 'Biologia', 8),
(5, 5, 'Foldrajz', 6),
(5, 8, 'Torna', 9),

-- 6. diák - Kiss Réka (12.A)
(6, 1, 'Matematika', 9),
(6, 4, 'Informatika', 8),
(6, 3, 'Biologia', 10),
(6, 5, 'Foldrajz', 9),
(6, 8, 'Torna', 7),

-- 7. diák - Farkas Bence (12.A)
(7, 1, 'Matematika', 5),
(7, 4, 'Informatika', 7),
(7, 3, 'Biologia', 8),
(7, 5, 'Foldrajz', 9),
(7, 8, 'Torna', 10),

-- 8. diák - Balogh Zsófia (12.D)
(8, 5, 'Foldrajz', 10),
(8, 10, 'Informatika', 9),
(8, 9, 'Rajz', 8),
(8, 6, 'Torna', 9),
(8, 2, 'Filozofia', 7),

-- 9. diák - Varga Márk (12.D)
(9, 5, 'Foldrajz', 7),
(9, 10, 'Informatika', 8),
(9, 9, 'Rajz', 6),
(9, 6, 'Torna', 10),
(9, 2, 'Filozofia', 9),

-- 10. diák - Papp Lilla (12.B)
(10, 2, 'Filozofia', 10),
(10, 7, 'Rajz', 9),
(10, 5, 'Foldrajz', 8),
(10, 3, 'Biologia', 9),
(10, 6, 'Torna', 10),

-- 11. diák - Oláh Tamás (12.A)
(11, 1, 'Matematika', 8),
(11, 4, 'Informatika', 7),
(11, 3, 'Biologia', 6),
(11, 5, 'Foldrajz', 9),
(11, 8, 'Torna', 8),

-- 12. diák - Lakatos Enikő (12.D)
(12, 5, 'Foldrajz', 9),
(12, 10, 'Informatika', 10),
(12, 9, 'Rajz', 9),
(12, 6, 'Torna', 8),
(12, 2, 'Filozofia', 10),

-- 13. diák - Bíró András (12.C)
(13, 3, 'Biologia', 8),
(13, 9, 'Rajz', 7),
(13, 6, 'Torna', 9),
(13, 2, 'Filozofia', 8),
(13, 1, 'Matematika', 6),

-- 14. diák - Kelemen Noémi (12.A)
(14, 1, 'Matematika', 10),
(14, 4, 'Informatika', 9),
(14, 3, 'Biologia', 9),
(14, 5, 'Foldrajz', 10),
(14, 8, 'Torna', 8),

-- 15. diák - Veres Zoltán (12.B)
(15, 2, 'Filozofia', 7),
(15, 7, 'Rajz', 8),
(15, 5, 'Foldrajz', 9),
(15, 3, 'Biologia', 6),
(15, 6, 'Torna', 7),

-- 16. diák - Kelemen Péter (9.A)
(16, 1, 'Matematika', 8),
(16, 3, 'Biologia', 9),
(16, 8, 'Foldrajz', 7),
(16, 6, 'Torna', 10),
(16, 10, 'Filozofia', 8),

-- 17. diák - Nagy Dóra (9.A)
(17, 1, 'Matematika', 10),
(17, 3, 'Biologia', 9),
(17, 8, 'Foldrajz', 8),
(17, 6, 'Torna', 9),
(17, 10, 'Filozofia', 10),

-- 18. diák - Szabó Márton (9.B)
(18, 2, 'Filozofia', 6),
(18, 4, 'Informatika', 8),
(18, 9, 'Biologia', 7),
(18, 7, 'Rajz', 9),
(18, 6, 'Torna', 8),

-- 19. diák - Tóth Laura (9.B)
(19, 2, 'Filozofia', 9),
(19, 4, 'Informatika', 10),
(19, 9, 'Biologia', 8),
(19, 7, 'Rajz', 10),
(19, 6, 'Torna', 9),

-- 20. diák - Molnár Bálint (10.A)
(20, 1, 'Matematika', 7),
(20, 5, 'Foldrajz', 8),
(20, 3, 'Biologia', 9),
(20, 8, 'Informatika', 6),
(20, 7, 'Rajz', 10),

-- 21. diák - Kiss Alexandra (10.A)
(21, 1, 'Matematika', 9),
(21, 5, 'Foldrajz', 10),
(21, 3, 'Biologia', 8),
(21, 8, 'Informatika', 9),
(21, 7, 'Rajz', 8),

-- 22. diák - Farkas Norbert (10.B)
(22, 2, 'Filozofia', 8),
(22, 4, 'Informatika', 9),
(22, 9, 'Matematika', 7),
(22, 6, 'Torna', 8),
(22, 10, 'Foldrajz', 9),

-- 23. diák - Balogh Vivien (10.B)
(23, 2, 'Filozofia', 10),
(23, 4, 'Informatika', 10),
(23, 9, 'Matematika', 9),
(23, 6, 'Torna', 10),
(23, 10, 'Foldrajz', 8),

-- 24. diák - Varga Levente (11.A)
(24, 1, 'Matematika', 6),
(24, 4, 'Informatika', 8),
(24, 7, 'Rajz', 9),
(24, 3, 'Biologia', 7),
(24, 8, 'Torna', 8),

-- 25. diák - Papp Barbara (11.A)
(25, 1, 'Matematika', 10),
(25, 4, 'Informatika', 9),
(25, 7, 'Rajz', 10),
(25, 3, 'Biologia', 9),
(25, 8, 'Torna', 10),

-- 26. diák - Oláh Roland (11.B)
(26, 2, 'Filozofia', 7),
(26, 5, 'Foldrajz', 8),
(26, 8, 'Matematika', 6),
(26, 10, 'Biologia', 9),
(26, 6, 'Torna', 8),

-- 27. diák - Lakatos Melinda (11.B)
(27, 2, 'Filozofia', 9),
(27, 5, 'Foldrajz', 10),
(27, 8, 'Matematika', 8),
(27, 10, 'Biologia', 10),
(27, 6, 'Torna', 9),

-- 28. diák - Bíró Kristóf (11.C)
(28, 3, 'Biologia', 7),
(28, 9, 'Filozofia', 8),
(28, 6, 'Torna', 9),
(28, 1, 'Matematika', 6),
(28, 5, 'Foldrajz', 8),

-- 29. diák - Veres Alexandra (11.C)
(29, 3, 'Biologia', 10),
(29, 9, 'Filozofia', 9),
(29, 6, 'Torna', 10),
(29, 1, 'Matematika', 9),
(29, 5, 'Foldrajz', 10),

-- 30. diák - Antal Máté (12.B)
(30, 2, 'Filozofia', 8),
(30, 7, 'Rajz', 9),
(30, 5, 'Foldrajz', 7),
(30, 3, 'Biologia', 8),
(30, 6, 'Torna', 9),

-- 31. diák - Sándor Emese (12.C)
(31, 3, 'Biologia', 10),
(31, 9, 'Rajz', 10),
(31, 6, 'Torna', 9),
(31, 2, 'Filozofia', 8),
(31, 1, 'Matematika', 9),

-- 32. diák - Kerekes Dávid (12.D)
(32, 5, 'Foldrajz', 8),
(32, 10, 'Informatika', 7),
(32, 9, 'Rajz', 9),
(32, 6, 'Torna', 8),
(32, 2, 'Filozofia', 6),

-- 33. diák - Bálint Réka (12.A)
(33, 1, 'Matematika', 9),
(33, 4, 'Informatika', 10),
(33, 3, 'Biologia', 8),
(33, 5, 'Foldrajz', 9),
(33, 8, 'Torna', 10),

-- 34. diák - Márton Ádám (12.B)
(34, 2, 'Filozofia', 7),
(34, 7, 'Rajz', 8),
(34, 5, 'Foldrajz', 9),
(34, 3, 'Biologia', 8),
(34, 6, 'Torna', 7),

-- 35. diák - Simon Viktória (12.C)
(35, 3, 'Biologia', 9),
(35, 9, 'Rajz', 10),
(35, 6, 'Torna', 9),
(35, 2, 'Filozofia', 10),
(35, 1, 'Matematika', 8);
