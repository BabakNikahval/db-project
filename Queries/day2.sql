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
-- concatenate FULL_NAME ,LAST_NAME , FULL_NAME for Employee
-- use '' as space
SELECT FIRST_NAME,LAST_NAME,FIRST_NAME || ' ' || LAST_NAME FROM EMPLOYEES;






