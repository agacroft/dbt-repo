WITH temp_daily AS (
    SELECT * 
    FROM {{ref('staging_temp')}}
),
add_weekday AS (
    SELECT *,
           to_char(date, 'Day') AS weekday,
           date_part('dow', date) AS day_num
    FROM temp_daily
)
SELECT *
FROM add_weekday