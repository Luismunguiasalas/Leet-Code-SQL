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

-- 