-- Query a count of the number of cities in CITY having a Population larger than 100000.
select count(*) from city where population > 100000;

-- Query the total population of all cities in CITY where District is California.
select sum(population) from city where district = 'California';

-- Query the average population of all cities in CITY where District is California.
select avg(population) from city where district = 'California';

-- Query the average population for all cities in CITY, rounded down to the nearest integer.
select round(avg(population)) from city;

-- Query the difference between the maximum and minimum populations in CITY.
select max(population) - min(population) from city;

-- Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 38.7780. Round your answer to 4 decimal places.
select round(min(lat_n),4) from station where lat_n > 38.7780;

-- Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, but did not realize her keyboard's 0 key was broken until after completing the calculation. She wants your help finding the difference between her miscalculation (using salaries with any zeros removed), 
-- and the actual average salary.
-- Write a query calculating the amount of error (i.e.: actual - miscalulated average monthly salaries), and round it up to the next integer.
select ceil(avg(salary) - avg(replace(salary, 0, ''))) from employees;

-- We define an employee's total earnings to be their monthly  worked, and the maximum total earnings to be the maximum total earnings for any employee in the Employee table.
-- Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. Then print these values as  space-separated integers.
select months*salary, count(*) from employee group by months*salary order by months*salary desc limit 1;

-- Query the sum of Northern Latitudes (LAT_N) from STATION having 
-- values greater than 38.7880  and less than 137.2345. Truncate your answer to  decimal places.
select round(sum(lat_n),4) from station where lat_n > 38.7880 and lat_n < 137.2345;

-- Consider p1(a,b) and p2(c,d) to be two points on a 2D plane.
-- a happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
-- b happens to equal the minimum value in Western Longitude (LONG_W in STATION).
-- c happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
-- d happens to equal the maximum value in Western Longitude (LONG_W in STATION).
-- Query the Manhattan Distance between points p1 and p2 and round it to a scale of 4 decimal places.
-- Manhattan Distance = | x 1 − x 2 | + | y 1 − y 2 | 
select round(abs(min(lat_n) - max(lat_n)) + abs(min(long_w) - max(long_w)),4) from station; 

-- Consider p1(a,c) and p1(b,d) to be two points on a 2D plane where (a,b) are the respective minimum and maximum values of Northern Latitude (LAT_N) and (c,d) are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION.
-- Query the Euclidean Distance between points p1 and p2 and format your answer to display 4 decimal digits.
-- d = √[(x2 – x1)^2 + (y2 – y1)^2]
select round(sqrt(pow(min(lat_n) - max(lat_n),2) + pow(min(long_w) - max(long_w),2)),4) from station; 
