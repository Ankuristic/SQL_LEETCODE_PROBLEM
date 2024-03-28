574. Winning Candidate
Table: Candidate

+-----+---------+
| id  | Name    |
+-----+---------+
| 1   | A       |
| 2   | B       |
| 3   | C       |
| 4   | D       |
| 5   | E       |
+-----+---------+
Table: Vote

+-----+--------------+
| id  | CandidateId  |
+-----+--------------+
| 1   |     2        |
| 2   |     4        |
| 3   |     3        |
| 4   |     2        |
| 5   |     5        |
+-----+--------------+
id is the auto-increment primary key,
CandidateId is the id appeared in Candidate table.
Write a sql to find the name of the winning candidate, the above example will return the winner B.

+------+
| Name |
+------+
| B    |
+------+
Notes:

You may assume there is no tie, in other words there will be at most one winning candidate.
 


 select name from candidate where id in (select candidate id from vote group by candidateid 
 order by count(id)
 )



 id is the auto-increment primary key,
CandidateId is the id appeared in Candidate table.
Write a sql to find the name of the winning candidate, the above example will return the winner B.
+------+
| Name |
+------+
| B    |
+------+
Notes:
You may assume there is no tie, in other words there will be only one winning candidate




WITH cte AS (
SELECT c.id,c.Name, COUNT(c.id) AS cnt FROM Candidate c INNER JOIN Vote v ON c.id=v.CandidateId GROUP BY c.id,c.Name
)
SELECT Top 1 Name FROM cte ORDER BY cnt DESC

WITH cte AS (
SELECT c.id,c.Name, COUNT(c.id) AS cnt FROM Candidate c INNER JOIN Vote v ON c.id=v.CandidateId GROUP BY c.id,c.Name
)
SELECT Name FROM cte WHERE (cnt) = (SELECT MAX(cnt) FROM cte)