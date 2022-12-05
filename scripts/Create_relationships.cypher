MATCH (a:Actor), (f:Film)
WITH rand() as r, a, f
WHERE r < 0.1
CREATE (a)-[:ACTED_IN]->(f)
RETURN a, f


MATCH (d :Director), (m :Film)
WITH rand() as r, d, m
WHERE r < 0.1 AND NOT (d)-[:DIRECTED]->(:Film)
CREATE (d)-[:DIRECTED]->(m)
RETURN d, m


MATCH (i:IMDb)
WITH collect(i) as ratings
MATCH (f:Film)
WITH f, apoc.coll.randomItem(ratings) as i
CREATE (f)-[:RATED]->(i)
RETURN f, i


MATCH (g:Genre)
WITH count(g) as c, collect(g) as genres
WITH range(1,4) as genresRange, genres
MATCH (f:Film)
WITH f, apoc.coll.randomItems(genres, apoc.coll.randomItem(genresRange)) as genres
FOREACH (genre in genres | CREATE (f)-[:HAS]->(genre))
WITH genres
MATCH (f:Film)-[:HAS]->(g:Genre)
RETURN f, g