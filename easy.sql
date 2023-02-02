-- 595. Big Countries
select name, population,area
from World
where area >= 3000000 or popoulation >= 25000000

-- 1757. Recyclable and Low Fat Products
select product_id
from Products
where low_fats = 'Y' and recyclable = 'Y'


-- 584. Find Customer Referee
select name
from Customer
where referee_id <> 2 or referee_id is null

-- # 183. Customer Who never order
select name as 'Customers'
from Customers
where Customers.id not in (
  select customerId
  from Orders
)

-- 1378. Replace Employee ID with the Unique Identifier
select EmployeeUNI.unique_id, Employees.name
from Employees
left join EmployeeUNI
on EmployeeUNI.id = Employees.unique_id


-- 2356. Number of Unique subjects taught by each teacher
select teacher_id, count(distinct subject_id) as 'cnt'
from Teacher
group by teacher_id

-- 1683. Invalid Tweets
select tweet_id
from Tweets
where char_length(content) < 15

-- 1741. Find Total Time Spent by Each Employee
select event_day as 'day', emp_id, sum(out_time - in_time) as 'total_time'
from Employees
group by event_day, emp_id

-- 1303. Find the Team Size
select employee_id, count(employee_id) over (partition by team_id) as team_size
from Employee
order by employee_id

-- 1350. Students with invalid departments
select id, name
from Students
where Students.department_id not in (select id from Departments)

-- 1571. Warehouse Manager
select w.name as 'warehouse_name', sum(w.units * p.Width * p.Height * p.Length) as 'volume'
from Warehouse as w, Products as p
where w.product_id = p.product_id
group by w.name

-- 1821. Find customers with positive revenuw this year
select customer_id
from Customers
where year = '2021' and revenue > 0

-- 1693. Daily leads and partners
select date_id, make_name, count(distinct lead_id) as 'unique_leads', count(distinct partner_id) as 'unique_partners'
from DailySales
group by date_id, make_name

-- 2338. All the matches of the league
select a.team_name as 'home_team', b.team_name as 'away_team'
from Teams as a, Teams as b
where a.team_name <> b.team_name

-- 1795. Rearrange Products table
select product_id, 'store1' as store, store1 as price
from Products
where store1 is not NULL
union
select product_id, 'store2', store2
from Products
where store2 is not null
union
select product_id, 'store3', store3
from Products
where store3 is not null

-- 1587. Bank account summary II
select u.name, sum(t.amount) as balance
from Transaction as t, Users as u
where t.account = u.account
group by t.account
having balance > 10000

-- 1852. Convert Date Format
select date_format(day '%W, %M %e, %Y') as 'day'
from Days

-- 1623. All Valid Triplets That Can Represent a Country
select a.student_name as 'member_A', b.student_name as 'member_B', c.student_name as 'member_C'
from SchoolA as a, SchoolB as b, SchoolC as c
where a.student_name != b.student_name and a.student_name!= c.student_name and b.student_name != c.student_name
and a.student_id != b.student_id and a.student_id != c.student_id and b.student_id != c.student_id

-- 1581. Customer who visited but dit not make any transactions
select customer_id, count(customer_id) as 'count_no_trans'
from Visits
where Visits.visit_id not in (select visit_id from Transactions)
group by customer_id

-- 2026. Low Quality Problems
select problem_id
from Problemswhere (likes / (likes + dislikes)) < .60
order by problem_id

-- 1777. Product's Price for Each store
select product_id,
sum(case when store = 'store1' then price else null end) as store1,
sum(case when store = 'store2' then price else null end) as store2,
sum(case when store = 'store3' then price else null end) as store3
from Products
group by product_id

-- 1873. Calculate Special Bonus
select employee_id, (case when (employee_id % 2) = 1 and name not like('M%') then salary else 0 end) as 'bonus'
from Employees
order by employee_id

-- 627. Swap Salary
update Salary
set sex = case when sex = 'm' then 'f' else 'm' end

-- 196. Delete Duplicate Emails
delete p1
from Person as p1, Person as p2
where p1.email = p2.email and p1.id > p2.id

-- 1667. Fix Names in a Table
select user_id, concat(upper(substring(name, 1,1)), lower(substring(name, 2)))
from Users
order by user_id

-- 1484. Group Sold Products By The Date
select sell_date,
 count(distinct product) as 'num_sold',
 group_concat(distinct product order by product) as'products'
from Activities
group by sell_date