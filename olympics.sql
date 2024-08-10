--DASHBOARD QUERIES
-- WHICH EDITION HAD THE BIGGEST FEMALE PARTICIPATION?
SELECT Games,
       COUNT(Name) AS total_athletes,
       SUM(CASE WHEN Sex = 'F' THEN 1 ELSE 0 END) AS total_women,
       (SUM(CASE WHEN Sex = 'F' THEN 1 ELSE 0 END) / COUNT(*) * 100) AS perc_women
FROM 'athlete_events'
GROUP BY Games
ORDER BY total_women DESC;


--WHAT IS THE SPORT WITH THE BIGGEST FEMALE PARTICIPATION?
SELECT Sport, count(Sport) AS female_participation
FROM 'athlete_events'
WHERE Sex LIKE 'F'
GROUP BY Sport
ORDER BY female_participation DESC
LIMIT 10;


--NUMBER OF MIXED EVENTS
SELECT COUNT(DISTINCT Event) AS Mixed_Events, Year, Season, Games
FROM 'athlete_events'
WHERE Event LIKE '%Mixed%' AND Sport NOT LIKE 'Art Competitions'
GROUP BY Year, Season, Games
ORDER BY Year;


-- NUMBER OF FEMALE EVENTS
SELECT COUNT(DISTINCT Event) AS Female_Events, Year, Season, Games
FROM 'athlete_events'
WHERE Sex = 'F'
  AND Event NOT IN (
    SELECT DISTINCT Event
    FROM 'athlete_events'
    WHERE Sex = 'M'
  )
GROUP BY Year, Season, Games
ORDER BY Year;


--TOTAL NUMBER OF EVENTS
SELECT COUNT(DISTINCT Event) AS Total_Events, Year, Season, Games
FROM 'athlete_events'
GROUP BY Year, Season, Games
ORDER BY Year;




-- OTHER INVESTIGATIVE QUERIES (BECAUSE I’M CURIOUS)
-- WHICH FEMALE ATHLETE HAS THE HIGHTEST NUMBER OF PARTICIPATIONS?
SELECT Name, Team, count(DISTINCT Games) AS total_participations
FROM 'athlete_events'
WHERE Sex LIKE 'F'
GROUP BY Name, Team
ORDER BY total_participations DESC
LIMIT 10;


-- WHICH MALE ATHLETE HAS THE HIGHTEST NUMBER OF PARTICIPATIONS?
SELECT Name, Team, count(DISTINCT Games) AS total_participations
FROM 'athlete_events'
WHERE Sex LIKE 'M'
GROUP BY Name, Team
ORDER BY total_participations DESC
LIMIT 10;


--WHO WAS THE OLDEST PERSON TO COMPETE?
SELECT Name, Team, Games,CAST(Age AS INT) AS Age_num
FROM 'athlete_events'
WHERE Age NOT LIKE 'NA'
GROUP BY Name, Team, Games, Age
ORDER BY Age DESC
LIMIT 10;


--WHO WAS THE YOUNGEST PERSON TO COMPETE?
SELECT Name, Team, Games,CAST(Age AS INT) AS Age_num
FROM 'athlete_events'
WHERE Age NOT LIKE 'NA'
GROUP BY Name, Team, Games, Age
ORDER BY Age
LIMIT 10;


--WHICH SPORT HAS THE HIGHEST AVERAGE HIGHT?
SELECT Sport, ROUND (AVG(CAST(Height AS INT64)), 2) AS avg_height
FROM 'athlete_events'
WHERE Height != 'NA'
GROUP BY Sport
ORDER BY avg_height DESC
LIMIT 10;


--WHICH SPORT HAS THE LOWEST AVERAGE HIGHT?
SELECT Sport, ROUND (AVG(CAST(Height AS INT64)), 2) AS avg_height
FROM 'athlete_events'
WHERE Height != 'NA'
GROUP BY Sport
ORDER BY avg_height
LIMIT 10;


--TOTAL MEDAL NUMBER BY COUNTRY IN SUMMER ATHLETIC COMPETITIONS
SELECT
  t2.region,
  SUM(CASE WHEN t1.Medal = 'Gold' THEN 1 ELSE 0 END) AS total_gold_medals,
  SUM(CASE WHEN t1.Medal = 'Silver' THEN 1 ELSE 0 END) AS total_silver_medals,
  SUM(CASE WHEN t1.Medal = 'Bronze' THEN 1 ELSE 0 END) AS total_bronze_medals
FROM 'athlete_events' AS t1
INNER JOIN 'noc_regions' AS t2 ON t1.NOC = t2.NOC
WHERE Season LIKE 'Summer' AND Sport NOT LIKE 'Art Competitions'
GROUP BY t2.region
ORDER BY total_gold_medals DESC
LIMIT 10;


--EXPLORING ART COMPETITIONS: Games and Events
SELECT Games, Event
FROM 'athlete_events'
WHERE Sport LIKE 'Art Competitions'
GROUP BY Event, Games
ORDER BY Games;


--EXPLORING ART COMPETITIONS: Artists
SELECT COUNT(DISTINCT Name) AS total_artists, Sex, Team, Year
FROM 'athlete_events'
WHERE Sport LIKE 'Art Competitions'
GROUP BY Year, Team, Sex
ORDER BY Year;
