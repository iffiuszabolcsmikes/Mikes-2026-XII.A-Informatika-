select nev, osztaly_nev
from diak
where osztaly_nev = '12.A';

select t.nev, j.tantargy_nev, d.nev, j.jegy, j.time_stamp
from jegy j
	inner join diak d on d.id = j.diak_id
	inner join tanar t on t. id = j.tanar_id;
