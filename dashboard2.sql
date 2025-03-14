-- Display the number of wins, podiums, and places gained for each driver
SELECT 
	driver ,
    SUM(CASE WHEN position = '1' THEN 1 ELSE 0 END) AS wins,
	SUM(CASE WHEN position IN ('1','2','3') THEN 1 ELSE 0 END) AS podiums,
    SUM(CASE 
			WHEN position IN ('NC', 'DQ') THEN 0
			WHEN position < `starting grid` THEN 0
			ELSE position - `starting grid`
		END) AS 'total places gained'
FROM races 
WHERE position NOT IN ('NC','DQ')
GROUP BY 1
ORDER BY 2 DESC;

-- Display the fastest lap for each track
SELECT track, driver, `Fastest Lap Time`
FROM races
WHERE `Set Fastest Lap` = 'Yes';

-- Display the podium for each track
SELECT track, driver, position
FROM races
WHERE position IN ('1', '2', '3');