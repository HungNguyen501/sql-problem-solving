-- PostgreSQL
select
    sum(is_repeated)
from (
    select 
        case
            when extract(
                epoch from transaction_timestamp - lag(transaction_timestamp) 
                    over(
                    partition by merchant_id, credit_card_id, amount
                    order by transaction_timestamp)
            ) / 60 <= 10 then 1
            else 0
        end as is_repeated
    from transactions
) as tbl
;

/*Result
+-------+
|sum    |
+-------+
|4      | 
+-------+
*/

