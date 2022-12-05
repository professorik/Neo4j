LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/professorik/Neo4j/main/actors.csv' AS line
WITH line LIMIT 25
CREATE (a :Actor {name: line.Name})
RETURN a

LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/professorik/Neo4j/main/genres.csv' AS line
WITH line LIMIT 25
CREATE (g :Genre {name: line.Genre})
RETURN g

LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/professorik/Neo4j/main/directors.csv' AS line
WITH line LIMIT 25
CREATE (d :Director {name: line.Name})
RETURN d

LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/professorik/Neo4j/main/IMDb.csv' AS line
WITH line LIMIT 25
CREATE (i :IMDb {name: line.Score})
RETURN i

LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/professorik/Neo4j/main/movies.csv' AS line
WITH line LIMIT 25
CREATE (m :Film {name: line.Name, year: line.Year})
RETURN m