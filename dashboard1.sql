-- Display Constructors Championship
SELECT 
	team,  
    RANK() OVER( ORDER BY SUM(Points) DESC) AS `rank`,
    SUM(points) AS points
FROM races
GROUP BY team
ORDER BY points DESC;

-- Display Driver's Championship
SELECT 
	driver, 
    RANK() OVER( ORDER BY SUM(Points) DESC) AS `rank`,
    SUM(points) AS points 
FROM races
GROUP BY driver
ORDER BY points DESC;

-- Display the podium of each circuit
SELECT track, driver, team, position
FROM races
WHERE position <= 3 AND position NOT IN ('NC', 'DQ');