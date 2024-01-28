WITH largest_tip_pickups_astoria AS (
	SELECT gt.total_amount, puz."Zone" AS "PickUpZone", gt.tip_amount, gt."DOLocationID"
	FROM green_taxi_data gt
	JOIN zones puz
	ON gt."PULocationID" = puz."LocationID"
	WHERE TO_CHAR(lpep_pickup_datetime, 'MM') = '09'
	AND TO_CHAR(lpep_dropoff_datetime, 'MM') = '09'
	AND puz."Zone" = 'Astoria'
	ORDER BY gt.tip_amount DESC
	LIMIT 1
)
SELECT 
     lt.tip_amount, doz."Zone"
FROM 
    largest_tip_pickups_astoria lt
INNER JOIN zones doz 
ON lt."DOLocationID" = doz."LocationID"
