SELECT * FROM dbo.EMPLOYEE  ----D1,D2,D10
SELECT * FROM dbo.DEPARTMENT  ---D1,D2,D3,D4
SELECT * FROM dbo.MANAGER
SELECT * FROM dbo.PROJECT

----Fetch the employee name and the departmnet name they belong too.

SELECT emp_name,dept_name FROM EMPLOYEE AS e
INNER JOIN DEPARTMENT AS d on e.dept_id=d.dep_id

----Fetch All the employee name and the departmnet name they belong too.

SELECT emp_name,dept_name FROM EMPLOYEE e 
LEFT JOIN DEPARTMENT d on e.dept_id=d.dep_id

SELECT emp_name,dept_name FROM EMPLOYEE e
RIGHT JOIN DEPARTMENT d on e.dept_id=d.dep_id

----Fetch All the employee name their manager , their  departmnet name and projects they are working on too.

SELECT emp_name,dept_name,manager_name,project_name 
FROM EMPLOYEE e
LEFT JOIN DEPARTMENT d ON e.dept_id=d.dep_id
INNER JOIN MANAGER m ON e.manager_id=m.manager_id
LEFT JOIN PROJECT p ON p.team_member_id=e.emp_id

SELECT emp_name,dept_name
FROM EMPLOYEE e
FULL JOIN DEPARTMENT d ON d.dep_id=e.dept_id

---CROSS JOIN 

SELECT emp_name,dept_name
FROM EMPLOYEE e
CROSS JOIN DEPARTMENT d;

CREATE TABLE COMPANY(company_id varchar(10), company_name varchar(30),company_location varchar(30))
INSERT INTO COMPANY values('V00231','UAE ELECTRONICS','UAE');

SELECT emp_name,dept_name,company_id,company_location,company_name
FROM EMPLOYEE e
LEFT JOIN DEPARTMENT d ON e.dept_id=d.dep_id
CROSS JOIN COMPANY c ;

---SELF JOIN

CREATE TABLE FAMILY(member_id VARCHAR(10),name VARCHAR(15),age INT,parent_id  VARCHAR(10))
INSERT INTO FAMILY VALUES('F1','sheikh',33,'F4'),('F2','burhaan',7,'F1'),('F3','zareena',39,'F5')
SELECT * FROM FAMILY
INSERT INTO FAMILY VALUES('F4','noubee',60,'F6'),('F5','GHANI',86,'F9'),('F6','latheef',65,'F7'),('F7','bandusha',100,'F8')
INSERT INTO FAMILY VALUES('F10','jahangeer',76,'F11')


UPDATE FAMILY SET parent_id = 'F11' WHERE member_id= 'F10';

---Fetch child name and age corresponding  with their parent name and age.

SELECT child.name AS child_name, 
child.age AS child_age,
parent.name AS parent_name,
parent.age AS parent_age
FROM FAMILY AS child 
JOIN FAMILY AS parent ON child.parent_id=parent.member_id

SELECT * FROM FAMILY

DELETE FROM FAMILY WHERE member_id='F9'
