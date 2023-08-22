WITH daily_rates AS (

    SELECT *
    FROM {{ref('prep_rates')}}
),
total_avg AS (
    SELECT base_currency, 
       AVG(gbp) AS avg_gbp, 
       AVG(kes) AS avg_kes,
       AVG(hrk) AS avg_hrk 
    FROM daily_rates
    GROUP BY base_currency)
SELECT *
FROM total_avg