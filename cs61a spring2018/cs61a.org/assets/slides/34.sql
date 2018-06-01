create table animals as
  select "dog" as kind, 4 as legs, 20 as weight union
  select "cat"        , 4        , 10           union
  select "ferret"     , 4        , 10           union
  select "parrot"     , 2        , 6            union
  select "penguin"    , 2        , 10           union
  select "t-rex"      , 2        , 12000;

select max(legs) from animals;

select sum(weight) from animals;

select max(legs - weight) + 5 from animals;

select min(legs), max(weight) from animals where kind <> "t-rex";

select max(legs) + min(weight) from animals;

select count(legs) from animals;

select count(*) from animals;

select count(distinct legs) from animals;

select kind, max(weight) from animals;

select legs, max(weight) from animals group by legs;

select weight/legs, count(*) from animals group by weight/legs;

select weight/legs, count(*) from animals group by weight/legs having count(*)>1;

select legs, weight, count(*) from animals group by legs, weight;

-- Discussion solutions

select max(a.legs-b.legs) from animals as a, animals as b where a.weight=b.weight;

select max(legs)-min(legs) as diff from animals group by weight order by -diff limit 1;



