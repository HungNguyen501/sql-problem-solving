-- MySQL
-- DDL
CREATE TABLE `facebook_web_log` (
    `user_id` bigint DEFAULT NULL,
    `action` text,
    `timestamp` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

-- Solution
with tbl_session as (
select
    date_format(timestamp, '%Y%m%d') as event_date,
    user_id,
    max(case
        when action = 'page_load' then timestamp end
    ) as load_time,
    min(
        case when action = 'page_exit' then timestamp end
    ) as exit_time
from facebook_web_log
group by user_id, event_date
)
select 
    user_id,
    sum(timestampdiff(second, load_time, exit_time)) / count(1) as session_time
from tbl_session
where load_time is not null and exit_time is not null
group by user_id
;
