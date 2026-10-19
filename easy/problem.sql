-- select names where both values are 'yes'
select product_id from products where low_fats = "y" and recyclable = "y" 

-- where id != 2
select name from customer where referee_id != 2 or referee_id is null

-- Write a solution to find all the authors that viewed at least one of their own articles. Return the result table sorted by id in ascending order.
select distinct author_id as id from views where author_id = viewer_id order by author_id

-- Write a solution to find the IDs of the invalid tweets. The tweet is invalid if the number of characters used in the content of the tweet is strictly greater than 15.
select tweet_id from Tweets where length(content) > 15

-- Write a solution to show the unique ID of each user, If a user does not have a unique ID replace just show null.
select eu.unique_id, e.name 
from employees e
left join employeeUNI eu
on e.id = eu.id

-- Customer Who Visited but Did Not Make Any Transactions
select v.customer_id, count(v.visit_id) as count_no_trans
from visits v
left join transactions t
on v.visit_id = t.visit_id
where t.transaction_id is null
group by v.customer_id

--  id with higher temperatures compared to its previous dates (yesterday).
select w1.id 
from weather w1
join weather w2
on DATEDIFF(w1.recordDate, w2.recordDate) = 1
where w1.temperature > w2.temperature

--Average Time of Process per Machine
SELECT a.machine_id,
    ROUND(AVG(b.timestamp - a.timestamp), 3) AS processing_time
FROM Activity a
JOIN Activity b
    ON a.machine_id = b.machine_id
    AND a.process_id = b.process_id
WHERE a.activity_type = 'start'
  AND b.activity_type = 'end'
GROUP BY a.machine_id;

-- The employee has a bonus less than 1000. The employee did not get any bonus.
select e.name, b.bonus
from employee e
left join bonus b
on e.empid = b.empid
where b.bonus < 1000 or b.bonus is null

