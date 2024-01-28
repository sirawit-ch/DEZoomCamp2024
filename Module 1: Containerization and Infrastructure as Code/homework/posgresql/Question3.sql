SELECT COUNT(1)
FROM green_taxi_data
WHERE TO_DATE(to_char(lpep_pickup_datetime, 'YYYY-MM-DD'),'YYYY-MM-DD') ='2019-09-18'
AND TO_DATE(to_char(lpep_dropoff_datetime, 'YYYY-MM-DD'),'YYYY-MM-DD') ='2019-09-18'