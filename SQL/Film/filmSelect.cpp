select f.cim
from film f
	inner join film_szinesz as fsz on f.id = fsz.film_id
	inner join szinesz as sz on sz.id=fsz.szinesz_id
where sz.nev = 'Kate Winslet'

intersect

select f.cim
from film f
	inner join film_szinesz as fsz on f.id = fsz.film_id
	inner join szinesz as sz on sz.id=fsz.szinesz_id
where sz.nev = 'Leonardo DiCaprio'

select f.cim, sz.nev, count(szerep)
from film f
	inner join film_szinesz as fsz on f.id = fsz.film_id
	inner join szinesz as sz on sz.id=fsz.szinesz_id
group by f.cim, sz.nev
having count(szerep) > 1 
