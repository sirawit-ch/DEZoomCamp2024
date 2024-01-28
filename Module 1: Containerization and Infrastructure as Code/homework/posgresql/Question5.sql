SELECT 
	SUM(total_amount), puz."Borough"
FROM 
	green_taxi_data gt
JOIN 
	zones puz
ON 
	gt."PULocationID" = puz."LocationID"
WHERE 
	TO_DATE(to_char(lpep_pickup_datetime, 'YYYY-MM-DD'),'YYYY-MM-DD') ='2019-09-18'
	AND TO_DATE(to_char(lpep_dropoff_datetime, 'YYYY-MM-DD'),'YYYY-MM-DD') ='2019-09-18'
AND puz."Borough" != 'Unknown'
GROUP BY puz."Borough"
HAVING SUM(total_amount) > 50000


SELECT 
    gt."DOLocationID", puz."Zone", gt.tip_amount
FROM 
    green_taxi_data gt
JOIN zones puz ON puz."LocationID" = gt."DOLocationID"
WHERE TO_CHAR(lpep_pickup_datetime, 'MM') = '09'
AND TO_CHAR(lpep_dropoff_datetime, 'MM') = '09'
AND gt."PULocationID" = 7
ORDER BY gt.tip_amount DESC;