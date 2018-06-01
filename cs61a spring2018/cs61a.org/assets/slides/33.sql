----------
-- Dogs --
----------

-- Parents
CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

-- Fur
CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur UNION
  SELECT "barack"         , "short"       UNION
  SELECT "clinton"        , "long"        UNION
  SELECT "delano"         , "long"        UNION
  SELECT "eisenhower"     , "short"       UNION
  SELECT "fillmore"       , "curly"       UNION
  SELECT "grover"         , "short"       UNION
  SELECT "herbert"        , "curly";

-- Parents of curly dogs
SELECT parent FROM parents, dogs WHERE child = name AND fur = "curly";

-- Siblings
SELECT a.child AS first, b.child AS second
  FROM parents AS a, parents AS b
  WHERE a.parent = b.parent AND a.child < b.child;

-- Grandparents
CREATE TABLE grandparents AS
  SELECT a.parent AS grandog, b.child AS granpup
    FROM parents AS a, parents AS b
    WHERE b.parent = a.child;

-- Grandogs with the same fur AS their granpups
SELECT grandog, granpup, c.fur FROM grandparents, dogs AS c, dogs AS d
  WHERE grandog = c.name AND
        granpup = d.name AND
        c.fur = d.fur;

------------
-- Cities --
------------

CREATE TABLE cities AS
  SELECT 38 AS latitude, 122 AS longitude, "Berkeley" AS name UNION
  SELECT 42,              71,              "Cambridge"        UNION
  SELECT 45,              93,              "Minneapolis"      UNION
  SELECT 33,             117,              "San Diego"        UNION
  SELECT 26,              80,              "Miami"            UNION
  SELECT 90,               0,              "North Pole";

CREATE TABLE cold AS
  SELECT name FROM cities WHERE latitude > 43 UNION
  SELECT "Chicago";

SELECT name, "is cold!" FROM cold;

CREATE TABLE distances AS
  SELECT a.name AS first, b.name AS second,
         60*(a.latitude-b.latitude) AS distance
         FROM cities AS a, cities AS b
         WHERE a.name != b.name
         ORDER BY a.longitude;

SELECT second FROM distances WHERE first="Minneapolis" ORDER BY -distance;

---------------
-- Sentences --
---------------

CREATE TABLE nouns AS
  SELECT "the dog" AS phrase UNION
  SELECT "the cat"           UNION
  SELECT "the bird";

SELECT subject.phrase || " chased " || object.phrase
       FROM nouns AS subject, nouns AS object
       WHERE subject.phrase != object.phrase;

CREATE TABLE ands AS
  SELECT phrase FROM nouns UNION
  SELECT first.phrase || " AND " || second.phrase
         FROM nouns AS first, nouns AS second
         WHERE first.phrase != second.phrase;

SELECT subject.phrase || " chased " || object.phrase
       FROM ands AS subject, ands AS object
       WHERE subject.phrase != object.phrase;

