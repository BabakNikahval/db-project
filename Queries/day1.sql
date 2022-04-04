select * FROM REGIONS ;

-- single line comment is like this
/*
 multi line comment like this
 */

-- each query you write known as sql SELECT statement
SELECT * FROM COUNTRIES;

SELECT * From DEPARTMENTS;

SELECT * FROM EMPLOYEES;

SELECT * FROM JOBS;

SELECT * FROM JOB_HISTORY;

SELECT * FROM LOCATIONS;

/*
This is looking for people with unique first name and last name and Email address
 */
SELECT  DISTINCT FIRST_NAME , LAST_NAME, EMAIL
FROM EMPLOYEES;

SELECT DISTINCT LAST_NAME
FROM EMPLOYEES;

-- display the Employee information for thr employee with name Ellen
-- in sql we use single quote for string.
SELECT * FROM EMPLOYEES WHERE FIRST_NAME = 'Ellen';

-- display the Employee information for thr employee with  first name, last name,Salary
-- for the employee with salary 11000
SELECT FIRST_NAME, LAST_NAME, SALARY FROM EMPLOYEES WHERE SALARY=11000;

-- display the Employee information for thr employee with  First-Name, Last-Name, Salary
-- display the Employee with salary 4800 and first name David
SELECT FIRST_NAME, LAST_NAME,SALARY FROM EMPLOYEES WHERE FIRST_NAME ='David' AND SALARY = 4800;

-- Display the Employee information for thr employee with  First-Name, Last-Name, Salary
-- Display the Employee with Salary 4800 OR First-Name David
-- Logical OR
SELECT FIRST_NAME,LAST_NAME,SALARY
FROM EMPLOYEES
WHERE FIRST_NAME ='David' OR SALARY= 4800;

-- Display the Employees that makes more than 5000 and less than 12000
SELECT * FROM EMPLOYEES
    WHERE SALARY > 5000 AND SALARY<12000 ;--49


-- Range Checking
-- BETWEEN ..... AND
--Is same as below one but inCloud lower number and upper number
    SELECT *FROM EMPLOYEES
        WHERE SALARY BETWEEN 5000 AND 12000 ;



-- Display  the Employees that Job-ID of
                               -- AD_VP
                               -- AD_ASST
                               -- FI_ACCOUNT
                               -- AC_ACCOUNT

SELECT FIRST_NAME, JOB_ID  FROM EMPLOYEES
WHERE JOB_ID ='AD_VP'
OR JOB_ID = 'AD_ASST'
OR JOB_ID = 'FI_ACCOUNT'
OR JOB_ID = 'AC_ACCOUNT';

--Using KEYWORD IN for multiple possible value of same column in condition
SELECT FIRST_NAME,JOB_ID FROM EMPLOYEES
WHERE JOB_ID IN ('AD_VP','AD_ASST','FI_ACCOUNT','AC_ACCOUNT') ;



-- How to say NOT in SQL ?
-- for equality check != <> ,
--Find out all REGIONS EXPECT the REGION_ID of 1
SELECT * FROM REGIONS WHERE REGION_ID != 1;

--Find the region not from Americas
SELECT *FROM REGIONS WHERE REGION_NAME <> 'America';

-- for BETWEEN AND --> Not BETWEEN..AND
--for IN ---> Not In

-- Display the employees that does not make more than 5000 and less than 12000
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY NOT BETWEEN 5000 AND 12000;


-- Display  the Employees that Job-ID  is not one of these
-- AD_VP
-- AD_ASST
-- FI_ACCOUNT
-- AC_ACCOUNT
SELECT FIRST_NAME, JOB_ID FROM EMPLOYEES
WHERE JOB_ID NOT IN ('AD_VP', 'AD_ASST', 'FI_ACCOUNT', 'AC_ACCOUNT');

--How to use null in the condition ?
--Example ; find out all DEPARTMENT with does not have MANAGER_ID
SELECT * FROM DEPARTMENTS
WHERE MANAGER_ID is null ;

--How to use  IS NOT NULL in the condition ?
--Example ; find out all DEPARTMENT with does have MANAGER_ID
SELECT *FROM DEPARTMENTS
WHERE MANAGER_ID IS NOT NULL ;


--SORTING the result in ASCENDING (low to high)
-- or DESCENDING order(high to low)
--order by clause can be used to order the result of your query
--it use either column name or column index
--it must be the last port of the statement
--ASC for (low to high) by default

--FIRST_NAME ASC
--LAST_NAME DESC



SELECT FIRST_NAME,LAST_NAME,SALARY
FROM EMPLOYEES
--ORDER BY FIRST_NAME ASC;
--ORDER BY LAST_NAME DEST;
--ORDER BY SALARY ASC:

ORDER BY FIRST_NAME,LAST_NAME;

SELECT FIRST_NAME,LAST_NAME,SALARY
FROM EMPLOYEES
--ORDER BY FIRST_NAME ASC;
--ORDER BY LAST_NAME DEST;
--ORDER BY SALARY ASC:

ORDER BY 1 DESC ;-- this means sort the result by first column
--SQL INDEX start with 1 not 0 !!!!!!!!


--WHIT ABOUT THE PARTIAL SEARCH
--WE USE LINK AND % (WILD CARD)
-- % can represent 0 or more character of any kind
-- _ can represent exactly one character of any kind


-- DISPLAY All THE FIRST_NAME THAT START WITH LETTER A IN EMPLOYEE TABLE
SELECT FIRST_NAME FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'A%';-- means give me name start with A



-- DISPLAY All THE FIRST_NAME THAT START WITH LETTER a IN EMPLOYEE TABLE
SELECT FIRST_NAME FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'a%';-- if have first name start with a




















