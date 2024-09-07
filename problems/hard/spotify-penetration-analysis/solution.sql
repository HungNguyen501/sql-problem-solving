-- Solution
with tbl_country as (
    select
        country,
        count(1) as population,
        sum(
            case
                when (timestampdiff(day, last_active_date, cast('2024-01-31' as date)) <= 30
                        and sessions >= 5 and listening_hours >= 10)  then 1
                else 0
            end
        ) as active_users
    from penetration_analysis
    group by country
)
select
    country,
    round(active_users / population, 2) as active_user_penetration_rate
from
    tbl_country

/*Result:
+-----------+-------------------------------+
|country    |active_user_penetration_rate   |
+-----------+-------------------------------+
|USA        |0.41                           |
|Japan      |0.45                           |
|Germany    |0.42                           |
|France     |0.51                           |
|Brazil     |0.43                           |
+-----------+-------------------------------+
*/
