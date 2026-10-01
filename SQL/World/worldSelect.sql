--Romania orszag adatai
select *
from country
where name = 'Romania';

--Kontinensek
select distinct continent 
from country ;

--Kormanyzasi formak
select distinct government_form
from country
order by government_form asc;

--Torpeallamok
select name
from country
where surface_area < 1000;

--Europai torpeallamok
select name
from country
where surface_area < 1000 and continent = 'Europe';

--10 Legkisebb nepessegu orszagok
select name
from country
order by population asc
limit 10;

--Az USA allamelnoke
select head_of_state
from country
where code = 'USA';

--Antarktiszi orszagok
select name
from country 
where continent = 'Antarctica';

--fuggetlen orszagok
select name, indep_year
from country
where indep_year is not null
order by indep_year asc;

--fuggo teruletek
select name
from country
where indep_year is null;

--Orszagok nepsuruseg szerint csokkeno sorrrendben
select name, population / surface_area as population_density
from country
order by 2 desc;

--10 legnepesebb orszag
select name, population
from country
order by population desc
limit 10;

--10 legnepesebb varos
select name, population
from city
order by population desc
limit 10;

--fold lakossga
select sum(population) as foldnepesseg
from country;

--kontinensenkent hany ember van
select continent, sum(population) as nepesseg
from country
group by continent
order by nepesseg desc;

--hany orszag van europaban
select count(*)
from country
where continent = 'Europe';

--hany nyelvet beszelnek a foldon
select distinct language
from country_language;

--kontinensek lakossaganak atlaga
select continent, avg(population)
from country
group by continent
order by 2 desc;

--legkisebb orszag terulet
select min(surface_area)
from country;

--kontinensek terulete
select continent, sum(surface_area)
from country
group by continent
order by 2 desc;

--orszagok ahol varhato elettartam kisebb mint 50 ev
select name, life_expectancy
from country
where life_expectancy < 50;

--kontinensek ahol az atlageletkor kisebb mint 60 ev
select continent, avg(life_expectancy) as atlag
from country
group by continent
having avg(life_expectancy) < 60;

--regiok
select distinct region
from country
order by region asc;

--regio ahol legalabb 10 orszag van
select region, count(name) as orszag_szam
from country
group by region
having count(name) > 10
order by region asc;

--regio ahol legalabb 10 fuggetlen orszag van
select region,count(name) as orszag_szam
from country
where indep_year is not null
group by region
having count(name) > 10
order by region asc;

--kormanyzasi formak amiben legalabb 100 millio lakos el
select government_form, sum(population)
from country
group by government_form
having sum(population) > 100000000;

--korzetek ahol tobb mint 10 varos van
select district, count(*)
from city
group by district
having count(*)>10
order by count desc;

--nyelvek amiket legalabb 20 orszagban beszelnek
select  language, count(*)
from country_language
group by language
having count(*)>10
order by 2 desc;

--nyelvek amik hivatalos nyelvek az orszagban
select  language, count(*)
from country_language
where is_official
group by language
having count(*)>5
order by 2 desc;

--torpeallamok nem europaban
select name
from country
where surface_area < 1000 and continent != 'Europe';

select name
from country
where surface_area < 1000 and continent in ('South America','Asia', 'Oceania', 'North America', 'Africa', 'Antarctica');

--a vilag torpeallamainak hany %-a van Europaban
select (
	select cast(count(*) as numeric)
	from country
	where surface_area<1000 and continent ='Europe')
	/
	(
	select count(*)
	from country
	where surface_area<1000) as szazalek;

--join pelda
select ci.name, co.name
from city as ci
	inner join country co on ci.country_code = co.code;

--orszagonkent hany varos
select  co.name, count(ci.*) as varosok_szama
from city ci
	inner join country co on ci.country_code = co.code
group by co.name
order by 2 desc;

--atlagosan hany varos van egy orszagban
select avg(tmp.number_of_cities)
from (
	select co.name, count(ci.*) as number_of_cities
	from city ci
		inner join country co on ci.country_code = co.code
	group by co.name) as tmp;

--hany magyar el a foldon
select sum(cl.percentage * co.population) as magyar_beszelok
from country_language cl
	inner join country co on cl.country_code = co.code
where language = 'Hungarian';

--Europai varosok tobb mint 1000000 lakossal
select ci.name, ci.population 
from city ci
	inner join country co on ci.country_code=co.code
where ci.population > 1000000 and continent = 'Europe';

--Beszelt nyelvek szama kontinensenkent
select continent, count(cl.*) as nyelvek_szama
from country_language cl
	inner join country cn on cl.country_code=cn.code
group by continent
order by 2 desc;

--CTE

--melyik nyelvet beszelik a legtobben a vilagon
with nyelv_beszelok_szama as (
	select cl.language, sum(cl.percentage*cn.population) as beszelok_szama
	from country_language cl
		inner join country cn on cl.country_code=cn.code
	group by language
)
select language, beszelok_szama
from nyelv_beszelok_szama
where beszelok_szama = (
		select max(beszelok_szama)
		from nyelv_beszelok_szama
	);

--vagy

with nyelv_beszelok_szama as (
	select cl.language, sum(cl.percentage*cn.population) as beszelok_szama
	from country_language cl
		inner join country cn on cl.country_code=cn.code
	group by language
),
max_beszelok as (
	select max(beszelok_szama) legtobb
	from nyelv_beszelok_szama
)
select language, beszelok_szama
from nyelv_beszelok_szama nybsz
	inner join max_beszelok mb on nybsz.beszelok_szama = mb.legtobb;

--kontinensenkent a legelterjedtebb nyelv
with kontinens_nyelv_beszelok_szama as (
    select cn.continent, cl.language, sum(cl.percentage*cn.population) as beszelok_szama
    from country_language cl
        inner join country cn on cl.country_code=cn.code
    group by cn.continent, language
),
kontinens_max_beszelok as (
    select continent, max(beszelok_szama) as max_beszelok
    from kontinens_nyelv_beszelok_szama
    group by continent
)
select knybsz.continent, language
from kontinens_nyelv_beszelok_szama knybsz
	inner join kontinens_max_beszelok kmb on knybsz.beszelok_szama = kmb.max_beszelok;

--orszagonkent a legnepesebb varosok
--Legnepesebb orszag minden kontinensen
--mely orszagok favarosa azonos a sajat nevukkel
--atlagos orszagmeret kontinensenkent
--legmagasabb nepsurusegu orszag
--legalacsonyabb nepsurusegu orszag
--A legnepesebb varos a világon es az orszag, ahol talalhato
--Orszagok, ahol tobb mint 5 nyelvet beszelnek
--legtobb nyelvet beszelok orszagai
--Mely orszagokban el legalabb annyi mint a vilag nepessegenek egy szazaleka
