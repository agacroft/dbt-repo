WITH extracted_rates AS (
    SELECT ((extracted_data -> 'date')::VARCHAR)::DATE AS timestamp,
           (extracted_data -> 'base')::VARCHAR  AS base_currency,
           ((extracted_data -> 'rates' -> 'GBP')::VARCHAR)::FLOAT  AS gbp,
           ((extracted_data -> 'rates' -> 'KES')::VARCHAR)::FLOAT  AS kes,
           ((extracted_data -> 'rates' -> 'HRK')::VARCHAR)::FLOAT  AS hrk
    FROM {{source("staging", "raw_rates")}}
)
SELECT *
FROM extracted_rates