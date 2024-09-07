-- Solution
select ifnull(
    (
        select salary
        from (
            select 
                salary,
                dense_rank() over (order by salary desc) as ranking
            from employee
        ) as tbl1
        where ranking = 2
        limit 1
    ),
    NULL
) as SecondHighestSalary
