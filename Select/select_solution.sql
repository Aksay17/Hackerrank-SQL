-- Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA.
select * from city where population > 100000 and Countrycode = 'USA';

-- Query all columns for a city in CITY with the ID 1661.
select * from city where id = '1661';

-- Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer.
select distinct city from station where id%2 = 0;

-- Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.
select count(city) - count(distinct city) from station;

-- Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
-- You can write two separate queries to get the desired output. It need not be a single query.
select city, length(city) as name_length from station order by name_length, city limit 1;
select city, length(city) as name_length from station order by name_length desc, city limit 1;

-- Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.
select distinct city from station where left(city, 1) in ('a','e','i','o','u');

-- Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.
select distinct city from station where right(city, 1) in ('a','e','i','o','u');

-- Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.
select distinct city from station where right(city, 1) in ('a','e','i','o','u') and left(city, 1) in ('a','e','i','o','u');

-- Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
select distinct city from station where left(city, 1) not in ('a','e','i','o','u');

-- Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.
select distinct city from station where right(city, 1) not in ('a','e','i','o','u') or left(city, 1) not in ('a','e','i','o','u');

-- Query the Name of any student in STUDENTS who scored higher than 75 Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.
select name from students where marks > 75 order by right(name, 3), id;

-- Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.
select name from employee order by name;

-- Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than 2000 per month who have been employees for less than 10 months. Sort your result by ascending employee_id.
select name from employee where salary > 2000 and months < 10 order by employee_id;

-- ADVANCED SELECT

-- Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:
-- Equilateral: It's a triangle with 3 sides of equal length.
-- Isosceles: It's a triangle with 2 sides of equal length.
-- Scalene: It's a triangle with 3 sides of differing lengths.
-- Not A Triangle: The given values of A, B, and C don't form a triangle.

SELECT
  CASE
    WHEN a + b <= c OR c + b <= a OR a + c <= b THEN 'Not A Triangle'
    WHEN a = b AND b = c THEN 'Equilateral'
    WHEN a = b OR b = c OR a = c THEN 'Isosceles'
    WHEN a <> b AND b <> c THEN 'Scalene'
  END AS tuple
FROM triangles;

-- a) Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).
select concat(name,'(',left(occupation,1),')') from occupations order by name;

-- b) Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, and output them in the following format:
-- There are a total of [occupation_count] [occupation]s.
-- where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and [occupation] is the lowercase occupation name. If more than one Occupation has the same [occupation_count], they should be ordered alphabetically.
select concat('There are a total of ', count(occupation), ' ', lower(occupation),'s.') from occupations group by occupation order by count(occupation);



