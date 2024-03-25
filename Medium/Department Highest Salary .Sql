Table: Employee

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| id           | int     |
| name         | varchar |
| salary       | int     |
| departmentId | int     |
+--------------+---------+
id is the primary key (column with unique values) for this table.
departmentId is a foreign key (reference columns) of the ID from the Department table.
Each row of this table indicates the ID, name, and salary of an employee. It also contains the ID of their department.
 

Table: Department

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
+-------------+---------+
id is the primary key (column with unique values) for this table. It is guaranteed that department name is not NULL.
Each row of this table indicates the ID of a department and its name.
 

Write a solution to find employees who have the highest salary in each of the departments.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Employee table:
+----+-------+--------+--------------+
| id | name  | salary | departmentId |
+----+-------+--------+--------------+
| 1  | Joe   | 70000  | 1            |
| 2  | Jim   | 90000  | 1            |
| 3  | Henry | 80000  | 2            |
| 4  | Sam   | 60000  | 2            |
| 5  | Max   | 90000  | 1            |
+----+-------+--------+--------------+
Department table:
+----+-------+
| id | name  |
+----+-------+
| 1  | IT    |
| 2  | Sales |
+----+-------+
Output: 
+------------+----------+--------+
| Department | Employee | Salary |
+------------+----------+--------+
| IT         | Jim      | 90000  |
| Sales      | Henry    | 80000  |
| IT         | Max      | 90000  |
+------------+----------+--------+
Explanation: Max and Jim both have the highest salary in the IT department and Henry has the highest salary in the Sales department.




// solution 


// syntax for left join 
// syntax

select a. * , t .* 

from account a 
 left join 

transaction t 

 on 

a. id = t. account.id 



///


select a. *, t.*
from  Account a 
left join 
transaction t
on a. id = t.account_id;
where t.date between '2020-01-02' and  '2021-01-1'



// use sub query here other wise dense rank 

-- select  MAX(salary)   e.name as Employee ,  e.salary, d.name  from Employee  e  left join  department d on e.id = d.id
-- group by  name 



--  select d.Name as Department, e.Name as Employee, Salary from Department d 
-- join Employee e
-- on e.DepartmentId = d.Id
-- where (e.Salary, e.DepartmentId) in (select max(e.Salary), e.DepartmentId 
-- from Employee e group by e.DepartmentId)