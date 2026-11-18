--12.A diakok
select nev, osztaly_nev
from diak
where osztaly_nev='12.A';

--Ki milyen jegyet kapott kitol, mikor
select t.nev, j.tantargy_nev, d.nev, j.jegy, j.time_stamp
from jegy j
	inner join diak d on d.id=j.diak_id
	inner join tanar t on t.id=j.tanar_id;

--Osztalyatlagok
select osztaly_nev, avg(jegy) 
from diak d
	inner join jegy j on d.id=j.diak_id
group by osztaly_nev
order by avg(jegy) desc;

--Legnagyobb osztalyatlaggal rendelkezo osztalyok
with osztaly_atlagok as (
select osztaly_nev, avg(jegy) as atlag
from diak d
	left join jegy j on d.id=j.diak_id
	group by osztaly_nev
)
select *
from osztaly_atlagok
where atlag=
(
select max(atlag)
from osztaly_atlagok
);

--Minden diak eseten miden tantargybol a media
select d.nev, j.tantargy_nev, avg(jegy)
from diak d
	inner join jegy j on d.id=j.diak_id
	group by d.nev, j.tantargy_nev;

--Bukkott diak
select d.nev, j.tantargy_nev, avg(jegy)
from diak d
	inner join jegy j on d.id=j.diak_id
	group by d.nev, j.tantargy_nev
	having avg(jegy)<5;







	
