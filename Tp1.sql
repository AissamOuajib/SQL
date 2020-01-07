-- 4 - a
select * from employees
-- 4 - b
select FIRST_NAME, LAST_NAME, SALARY from employees
-- 4 - c
select FIRST_NAME, LAST_NAME, SALARY from employees
where SALARY > 20000
-- 4 - d
select FIRST_NAME, LAST_NAME, SALARY from employees
-- 4 - e
select FIRST_NAME, LAST_NAME, SALARY from employees 
where (SALARY between 6000 and 20000)
and (DEPARTMENT_ID = 200 or DEPARTMENT_ID = 201 or DEPARTMENT_ID = 203 or DEPARTMENT_ID = 121)
--4 - f
select FIRST_NAME, LAST_NAME, SALARY from employees E, departments D
where E.DEPARTMENT_ID = D.DEPARTMENT_ID and D.DEPARTMENT_NAME like  'E%'
-- 4 - g
select FIRST_NAME, LAST_NAME, SALARY from employees E, jobs J
where E.JOB_ID = J.JOB_ID and ( J.JOB_ID != 'IT_PROG' and J.JOB_ID != 'AD_VP')
-- 4 - h
select distinct DEPARTMENT_ID from departments
-- 4 - i
select E.DEPARTMENT_ID, E.SALARY from employees E, departments D
where E.DEPARTMENT_ID = D.DEPARTMENT_ID 


-- 5 - a
select E.DEPARTMENT_ID, E.SALARY, E.SALARY * 1.15 SALARY15 
from employees E, departments D
where E.DEPARTMENT_ID = D.DEPARTMENT_ID 
-- 5 - b
select E.DEPARTMENT_ID, E.SALARY, E.SALARY * 1.15 SALARY15 
from employees E, departments D
where E.DEPARTMENT_ID = D.DEPARTMENT_ID 
-- 5 - c
select D.DEPARTMENT_ID, E.SALARY 
FROM employees E, departments D 
where D.DEPARTMENT_ID = E.DEPARTMENT_ID
order by D.DEPARTMENT_ID ASC, E.SALARY DESC


-- 6 - a
select SUBSTR(job_title, 1, 6) premier_6carc_job_title from jobs
-- 6 - b
select first_name, last_name, LENGTH(last_name) last_name_length 
from employees
-- 6 - c
select CONCAT(CONCAT(first_name, ' '), last_name) full_name from employees
-- 6 - d
select CONCAT(CONCAT('NOM: ', first_name), CONCAT(CONCAT('  PRENOM: ', LAST_NAME), CONCAT('  SALAIRE : ', SALARY))) full_name from employees
-- 6 - e
select upper(last_name) last_name,lower(first_name) first_name from employees
-- 6 - f
select first_name, last_name from employees
where lower(first_name) = 'david'
--6 - g
select first_name, last_name, TO_CHAR(salary, '99,999') SALARY from employees
--6 - h
select first_name, last_name, CONCAT(TO_CHAR(salary, '99,999'), '$') SALARY from employees
--6 - i
select first_name, last_name, TO_CHAR(hire_date, 'dd/mm/yyyy') hire_date from employees
--6 - j
select first_name, last_name, TO_CHAR(hire_date, 'dd/mm/yyyy') hire_date from employees
where TO_CHAR(hire_date, 'mm') = '01'
--6 - k
select first_name, last_name,  hire_date, months_between(sysdate, hire_date) Anciennete from employees
order by Anciennete desc
--6 - l
select first_name, last_name,  hire_date, to_number(to_char(sysdate, 'yyyy')) - to_number(to_char(hire_date, 'yyyy')) Anciennete from employees
order by Anciennete desc


-- 7 - a
select E.first_name, E.last_name, D.department_name from employees E, departments D
where E.department_id = D.department_id
--7 - b
select D.department_name, E.first_name, E.last_name from employees E, departments D
where E.department_id = D.department_id
order by  D.department_name