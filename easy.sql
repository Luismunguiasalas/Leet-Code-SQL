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