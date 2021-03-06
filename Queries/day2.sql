-- what about the partial search
-- we use LIKE AND % (wild card)
-- % can represent 0 or more character of any kind
/*
 'D%' -- any thing that start with D like DAVID,Danny,Dog
 '%d' -- any thing that END with d like SID,Bid,Dad
 '%d% -- 0 or more like Aladdin,Adam,dog,Bid,

 'D%a'--   anything start with upper case D and End with lower case a
           Diana, Donna, Damla ,

 'S%e%n' anything start with S and End with n and has e in the middle
         Steven, Stephen, Selen , Serkan,

 'T_' start with T and has one character with any kind
     Tj, TD, TV, T!, T2,T12

 '_a_' start with any one character has followed by a and followed by any more character
        Dad, Man , Fat , Tab , Gap ,


 */
--'D%' -- any thing that start with D like DAVID,Danny,Dog
SELECT FIRST_NAME FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'D%' ;--9


--'%d' -- any thing that END with d like SID,Bid,Dad
SELECT FIRST_NAME FROM EMPLOYEES
WHERE FIRST_NAME LIKE '%d' ;--6


--'%d% -- 0 or more like Aladdin,Adam,dog,Bid,
SELECT FIRST_NAME FROM EMPLOYEES
WHERE FIRST_NAME LIKE '%d%' ;--15


--'D%a'--   anything start with upper case D and End with lower case a
SELECT FIRST_NAME FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'D%a' ;--1




SELECT FIRST_NAME FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'S%e%n' ;--3




SELECT FIRST_NAME FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'T_' ;--1



--'_a_' start with any one character has followed by a and followed by any more character
SELECT FIRST_NAME FROM EMPLOYEES
WHERE FIRST_NAME LIKE '_a_' ;--1


-- find out the phone numbers start with 515
SELECT PHONE_NUMBER FROM EMPLOYEES WHERE PHONE_NUMBER LIKE '515%';--21

-- find out phone numbers with 121 in the middle
SELECT PHONE_NUMBER FROM EMPLOYEES WHERE PHONE_NUMBER LIKE '%121%';--9


-- find out phone numbers with .121. in the middle
SELECT PHONE_NUMBER FROM EMPLOYEES WHERE PHONE_NUMBER LIKE '%.121.%';--8

-- you can optionally give the Nike Name
-- using the KEYWORD AS right after column Name
-- Display all FIRST_NAME , SALARY in Employee table
--Modify the column name for Salary in result to Money
SELECT FIRST_NAME , SALARY AS MONEY
FROM EMPLOYEES;

-- Display all FIRST_NAME , LAST_NAME in Employee table
--Modify the column name for AS BELOW
--FIRST_NAME -> GIVEN_NAME     LAST_NAME-> FAMILY_NAME
SELECT FIRST_NAME  AS GIVEN_NAME , LAST_NAME AS GIVEN_FAMILY_NAME FROM EMPLOYEES ;


-- Display all FIRST_NAME , LAST_NAME in Employee table
--Modify the column name for AS BELOW
--FIRST_NAME -> GIVEN_NAME     LAST_NAME-> FAMILY_NAME
-- does not have _ with use ""
SELECT FIRST_NAME AS "GIVEN NAME" , LAST_NAME AS "FAMILY NAME " FROM EMPLOYEES ;


-- CONCATENATION in SQL use DOUBLE PIPE || (this is not OR)
-- concatenate FULL_NAME ,LAST_NAME to FULL_NAME for Employee
-- use '' as space

SELECT FIRST_NAME,LAST_NAME,FIRST_NAME || ' ' || LAST_NAME AS "FULL_NAME" FROM EMPLOYEES;


--ARITHMETIC OPERATION : + - * /
-- Display Employee FIRST_Name Salary and Increases-salary after 5000$ RAISE
SELECT FIRST_NAME ,SALARY ,SALARY + 5000 AS "INCREASED_SALARY"
FROM EMPLOYEES;

--- ARITHMETIC OPERATION : + - * /
-- Display EMPLOYEE FIRST_NAME AND SALARY
-- AND DECREASED_SALARY AFTER 2000$ CUT

-- AND WEEKLY_SALARY  -- DIVIDE BY 4
SELECT FIRST_NAME ,SALARY ,SALARY - 2000 AS "DECREASED_SALARY"
FROM EMPLOYEES;


-- AND YEARLY_SALARY  -- MULTIPLY BY 12
SELECT FIRST_NAME , SALARY, SALARY * 12 AS "YEARLY_SALARY"
FROM EMPLOYEES;


-- and WEEKLY_SALARY DIVIDED BY 4
SELECT FIRST_NAME , SALARY ,
       SALARY / 4 AS "WEEKLY_SALARY"
FROM EMPLOYEES;



-- IN ONE SHOT
SELECT  FIRST_NAME, SALARY,
       SALARY + 5000 AS "INCREASED_SALARY",
       SALARY - 2000  AS "DECREASED_SALARY",
       SALARY * 12 AS "YEARLY_SALARY",
       SALARY / 4 As "WEEKLY_SALARY",

       FROM EMPLOYEES;


--- SQL BUILT-IN FUNCTIONS :
--- REUSABLE CODE THAT WRAPPED INTO FUNCTION FOR COMMON TASKS
-- LIKE ROUNDING NUMBERS , GETTING LENGTH OF STR AND MORE
-- SINGLE ROW FUNCTION :
-- IT AFFECT EACH AND EVERY ROW AND RETURN SAME NUMBER OF ROW

-- FEW TEXT FUNCTIONS :
-- UPPER , accept one parameter (column name with upper case) and return upper case
-- LOWER ,accept one parameter (column name with lower case) and return LOWER case
-- LENGTH , return the LENGTH of the STRING

-- Display FIRST_NAME , and UPPERCASE FIRST NAME IN EMPLOYEE TABLE
SELECT FIRST_NAME ,
       UPPER(FIRST_NAME) AS "UPPERCASE_NAME",
       LOWER(FIRST_NAME) AS "LOWERCASE_NAME",
       LENGTH(FIRST_NAME) AS "CHAR_COUNT"

FROM EMPLOYEES ;


---find out all first name and character count
--only display if character count is exactly 5

SELECT FIRST_NAME , LENGTH(FIRST_NAME)
FROM EMPLOYEES
WHERE LENGTH(FIRST_NAME) = 5 ;--35

--only display if FIRST_NAME  character count is more than 10
SELECT FIRST_NAME , LENGTH(FIRST_NAME)
FROM EMPLOYEES
WHERE LENGTH(FIRST_NAME) > 10 ;

--only display if FIRST_NAME  character count between 7-9
SELECT FIRST_NAME , LENGTH(FIRST_NAME)
FROM EMPLOYEES
WHERE LENGTH(FIRST_NAME) BETWEEN 7 AND 9 ;


--only display if FIRST_NAME  character count  not between 5-10
SELECT FIRST_NAME , LENGTH(FIRST_NAME)
FROM EMPLOYEES
WHERE LENGTH(FIRST_NAME)  NOT BETWEEN 5 AND 10 ;


--only display if FIRST_NAME  character count is 2 or 9 or 13
SELECT FIRST_NAME , LENGTH(FIRST_NAME)
FROM EMPLOYEES
WHERE LENGTH(FIRST_NAME) IN (2,9,11);



-- find out all FIRST_NAME that CONTAINS d or D
SELECT FIRST_NAME , UPPER(FIRST_NAME)
       FROM EMPLOYEES
            WHERE FIRST_NAME LIKE '%D%' OR FIRST_NAME LIKE '%d%';

-- NEXT WAY
SELECT FIRST_NAME , UPPER(FIRST_NAME)
FROM EMPLOYEES
WHERE UPPER(FIRST_NAME) LIKE '%D%';

SELECT FIRST_NAME , UPPER(FIRST_NAME)
FROM EMPLOYEES
WHERE UPPER(FIRST_NAME) LIKE '%d%';


-- Number FUNCTION
-- ROUND (DECIMAL NUMBER HERE) --> ROUNDER NUMBER


-- find out SALARY and daily salary of EMPLOYEE
SELECT SALARY ,
       ROUND( SALARY / 30),
       ROUND(SALARY / 30 , 5)
FROM EMPLOYEES ;


--you can use single row anywhere
-- including in select column list, condition, order by
SELECT FIRST_NAME
FROM EMPLOYEES
ORDER BY  LENGTH(FIRST_NAME) DESC ;


-- multi row FUNCTION | GROUP FUNCTION | AGGREGATE FUNCTION
-- COUNT , Max , MIN , SUM , AVG
-- means count everything from employee table and count all the FIRST name from Employee table
-- when use with * it will count all the ROWS count
SELECT COUNT(*) , COUNT(FIRST_NAME)
FROM EMPLOYEES;


--count commission-pct  with the value not null
-- means we have 35  employee with commission-pct value not null
SELECT COUNT(COMMISSION_PCT)
FROM EMPLOYEES;--35

-- I want to count how many employee work in department id number 90
-- get the employee count for EMPLOYMENT_ID of 90
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 90 ;


--find out the MAX Salary in EMPLOYEE table
SELECT MAX(SALARY)
FROM EMPLOYEES;--24000

----find out the MAX Salary in EMPLOYEE table Exclude 24000
SELECT SALARY FROM EMPLOYEES WHERE SALARY<> 24000;

--MIN
-- find out minimum SALARY from Employee table
SELECT MIN(SALARY) FROM EMPLOYEES;--2100


-- find out minimum salary exclude salary 2100
SELECT MIN(SALARY) FROM EMPLOYEES WHERE SALARY <> 2100;--2200


-- GET the SUM of ENTIRE EMPLOYEE SALARY
SELECT SUM(SALARY) FROM EMPLOYEES;--691416

-- Get sum of the salary for DEPARTMENT_ID 90
SELECT SUM(SALARY) FROM EMPLOYEES WHERE DEPARTMENT_ID =90;--58000

-- AVG
-- FIND OUT AVERAGE SALARY OF ALL EMPLOYEES
SELECT AVG(SALARY) FROM EMPLOYEES;


-- FIND OUT AVERAGE SALARY OF ALL EMPLOYEES with  round number
-- round accept one parameter with all disimal numbers or two parameters with exact disimal number
SELECT AVG(SALARY) , ROUND(AVG(SALARY),3 )FROM EMPLOYEES;


--ALL IN ONE SHOT
SELECT COUNT(*) AS "EMPLOYEE COUNT",
       MAX(SALARY) AS "HIGHERST SALARY",
       MIN(SALARY) AS "LOWEST SALARY",
       SUM(SALARY) AS "SUM OF ALL SALARY ",
       AVG(SALARY) AS "AVERAGE SALARY"
FROM EMPLOYEES;

--- GROUP BY
-- means we have 12 department id
-- DISPLAY THE NUMBER OF THE EMPLOYEES IN EACH DEPARTMENT

SELECT COUNT(*) FROM EMPLOYEES GROUP BY DEPARTMENT_ID;--12


--means each department has how many employee
SELECT DEPARTMENT_ID, COUNT(*) AS "DEP_EMP_COUNT"
       FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

--DISPLAY COUNT OF EMPLOYEES IN EACH JOB_ID
SELECT JOB_ID , COUNT (*)--  count(*) means count JOB_ID
FROM EMPLOYEES
GROUP BY JOB_ID ;


--DISPLAY THE MAX SALARY OF EACH DEPARTMENT
--DISPLAY THE AVG SALARY OF EACH DEPARTMENT
--DISPLAY THE SUM SALARY OF EACH DEPARTMENT
--DISPLAY THE MIN SALARY OF EACH DEPARTMENT

SELECT DEPARTMENT_ID ,MAX(SALARY) AS "MAX_SALARY",
       MIN(SALARY) AS "LOWEST SALARY",
       ROUND(AVG(SALARY)) AS "AVRAGE SALARY",
       SUM(SALARY) AS "SALARY SUM"
FROM EMPLOYEES GROUP BY DEPARTMENT_ID;

--USING COUNTRIES
-- HOW MANY COUNTRY IN EACH REGION
--DISPLAY COUNT OF COUNTRY IN EACH REGION
SELECT REGION_ID , COUNT(*) AS "COUNT OF COUNTRIS"
FROM COUNTRIES
GROUP BY REGION_ID;



--HAVING
-- you can use HAVING if you are using AGGREGATE FUNCTION AFTER GROUP BY
--means count each department id and find each department id from employees that having more than 10 employee
--DISPLAY COUNT OF EMPLOYEE IN EACH DEPARTMENT
--ONLY DISPLAY IF THE COUNT OF EMPLOYEES ARE  MORE THAN 10
SELECT DEPARTMENT_ID,
       COUNT(*) AS "DEP_EMP_COUNT"
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) > 10 ;--2

-- find department exactly have 10 employee
SELECT DEPARTMENT_ID,
       COUNT(*) AS "DEP_EMP_COUNT"
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) = 10 ;



--DISPLAY THE MAX SALARY IN EACH DEPARTMENT
--ONLY DISPLAY IF DEPARTMENT MAX SALARY IS MORE THAN
SELECT DEPARTMENT_ID , MAX(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING MAX(SALARY) > 10000 ;


--DISPLAY THE MAX SALARY IN EACH DEPARTMENT
---DISPLAY ONLY IF DEPARTMENT_ID IS NOT 100
SELECT DEPARTMENT_ID, MAX(SALARY)
FROM EMPLOYEES
WHERE DEPARTMENT_ID != 100
GROUP BY DEPARTMENT_ID;


-- any time uoy use the function you are not to use WHERE class and also not working with AGGREGATE FUNCTION
SELECT DEPARTMENT_ID, MAX(SALARY)
FROM EMPLOYEES
--WHERE DEPARTMENT_ID != 100
GROUP BY DEPARTMENT_ID
HAVING DEPARTMENT_ID != 100;










