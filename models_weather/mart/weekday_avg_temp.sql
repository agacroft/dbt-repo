WITH weekday_name AS (
    SELECT *
    FROM {{ref('prep_temp')}}
),
weekday_avg  AS (
    SELECT  --day_num,
            weekday,
            AVG(maxtemp_c) AS avg_max_temp, 
            AVG(mintemp_c) AS avg_min_temp, 
            AVG(avgtemp_c) AS avg_temp
    FROM weekday_name
    GROUP BY weekday, day_num
    ORDER BY day_num
)
SELECT * 
FROM weekday_avg