--12.A diakok
select nev, osztaly_nev
from diak
where osztaly_nev = '12.A';

--Ki milyen jegyet kapott kitol, mikor
select t.nev, j.tantargy_nev, d.nev, j.jegy, j.time_stamp
from jegy j
	inner join diak d on d.id = j.diak_id
	inner join tanar t on t.id = j.tanar_id;

--Osztalyatlagok
select osztaly_nev, avg(jegy) 
from diak d
	inner join jegy j on d.id = j.diak_id
group by osztaly_nev
order by avg(jegy) desc;

--Legnagyobb osztalyatlaggal rendelkezo osztalyok
with osztaly_atlagok as (
select osztaly_nev, avg(jegy) as atlag
from diak d
	left join jegy j on d.id = j.diak_id
	group by osztaly_nev
)
select *
from osztaly_atlagok
where atlag = (
	select max(atlag)
	from osztaly_atlagok
);

--Minden diak eseten minden tantargybol a media
select d.nev, j.tantargy_nev, avg(jegy)
from diak d
	inner join jegy j on d.id = j.diak_id
	group by d.nev, j.tantargy_nev;

--Bukkott diak
select d.nev, j.tantargy_nev, avg(jegy)
from diak d
	inner join jegy j on d.id = j.diak_id
group by d.nev, j.tantargy_nev
having avg(jegy)<5;

--osztaly elsok
with media as (
select d.id, j.tantargy_nev, avg(jegy) as media
from diak d
	inner join jegy j on d.id = j.diak_id
group by d.id, j.tantargy_nev),
osszmedia as (
select id, avg(media) as osszmedia
from media 
group by id),
maxmedia as (
select d.osztaly_nev, max (om.osszmedia) maxmedia
from diak d
	inner join osszmedia om on d.id = om.id
group by osztaly_nev
)
select d.osztaly_nev, d.nev, om.osszmedia
from diak d
	inner join osszmedia om on d.id = om.id
	inner join maxmedia mm
		on	mm.osztaly_nev = d.osztaly_nev
		and om.osszmedia = mm.maxmedia
order by osztaly_nev asc, osszmedia desc, nev asc;

--melyik tanar tanitja a legtobb osztalyt
with osztalyok_szama as 
(select tanar_id, count(osztaly_nev) osztaly_szam
from tanar_osztaly
group by tanar_id)
select t.nev, osztaly_szam
from osztalyok_szama
inner join tanar t on tanar_id=t.id
where osztaly_szam=
(select max (osztaly_szam)
from osztalyok_szama);



	
