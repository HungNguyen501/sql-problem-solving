-- PostgreSQL

with tbl_measurement_cats as (
    select
        measurement_value,
        date(measurement_time) as measurement_day,
        row_number() over(
            partition by date(measurement_time)
            order by measurement_time
        ) as number_in_day
    from measurements
)
select
  measurement_day,
  sum(case when number_in_day %2 = 1 then measurement_value end) as odd_sum,
  sum(case when number_in_day %2 = 0 then measurement_value end) as even_sum
from tbl_measurement_cats
group by measurement_day
order by 1
;

/*Result
+-----------------------+-----------+-----------+
|measurement_day        |odd_sum	|even_sum   |
+-----------------------+-----------+-----------+
|07/10/2022 00:00:00	|2355.75	|1662.74    |
|07/11/2022 00:00:00	|2377.12	|2480.70    |
|07/12/2022 00:00:00	|2903.40	|1244.30    |
+-----------------------+-----------+-----------+
*/
