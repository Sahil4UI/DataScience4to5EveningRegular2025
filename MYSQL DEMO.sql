mysql> exit
Bye
sahil@MacBookAir ~ % clear

sahil@MacBookAir ~ % clear












sahil@MacBookAir ~ % mysql -u root
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 10
Server version: 9.4.0 Homebrew

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> use databases;
ERROR 1049 (42000): Unknown database 'databases'
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| assignments        |
| information_schema |
| mycompany          |
| mysql              |
| OurCOmpany         |
| performance_schema |
| school             |
| sys                |
+--------------------+
8 rows in set (0.017 sec)

mysql> create database company;
Query OK, 1 row affected (0.009 sec)

mysql> use company;
Database changed
mysql> create table emp
    -> (emp_id int primary key,name varchar(20),dept varchar(10),salary int);
Query OK, 0 rows affected (0.079 sec)

mysql> describe emp;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| emp_id | int         | NO   | PRI | NULL    |       |
| name   | varchar(20) | YES  |     | NULL    |       |
| dept   | varchar(10) | YES  |     | NULL    |       |
| salary | int         | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
4 rows in set (0.028 sec)

mysql> insert into emp(emp_id ,name,dept , salary)
    -> values (101,"Amit","IT",45000);
Query OK, 1 row affected (0.007 sec)

mysql> insert into emp values (101,"Amit","IT",45000); 
ERROR 1062 (23000): Duplicate entry '101' for key 'emp.PRIMARY'
mysql> 
mysql> 
mysql> insert into emp values (102,"Sahil","IT",75000);
Query OK, 1 row affected (0.001 sec)

mysql> insert into emp values (102,"Sahil","IT",75000),
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> 
mysql> insert into emp values (103,"Rahul","HR",95000),
    -> (104,"Sam","Sales",34000),
    -> (105,"Ronit","IT",65000);
Query OK, 3 rows affected (0.003 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from emp;
+--------+-------+-------+--------+
| emp_id | name  | dept  | salary |
+--------+-------+-------+--------+
|    101 | Amit  | IT    |  45000 |
|    102 | Sahil | IT    |  75000 |
|    103 | Rahul | HR    |  95000 |
|    104 | Sam   | Sales |  34000 |
|    105 | Ronit | IT    |  65000 |
+--------+-------+-------+--------+
5 rows in set (0.001 sec)

mysql> select emp_id,name from emp;
+--------+-------+
| emp_id | name  |
+--------+-------+
|    101 | Amit  |
|    102 | Sahil |
|    103 | Rahul |
|    104 | Sam   |
|    105 | Ronit |
+--------+-------+
5 rows in set (0.002 sec)

mysql> select * from emp where emp_id=101;
+--------+------+------+--------+
| emp_id | name | dept | salary |
+--------+------+------+--------+
|    101 | Amit | IT   |  45000 |
+--------+------+------+--------+
1 row in set (0.001 sec)

mysql> select * from emp where emp_id between 101 and 104;
+--------+-------+-------+--------+
| emp_id | name  | dept  | salary |
+--------+-------+-------+--------+
|    101 | Amit  | IT    |  45000 |
|    102 | Sahil | IT    |  75000 |
|    103 | Rahul | HR    |  95000 |
|    104 | Sam   | Sales |  34000 |
+--------+-------+-------+--------+
4 rows in set (0.003 sec)

mysql> select * from emp where emp_id in (101,105);
+--------+-------+------+--------+
| emp_id | name  | dept | salary |
+--------+-------+------+--------+
|    101 | Amit  | IT   |  45000 |
|    105 | Ronit | IT   |  65000 |
+--------+-------+------+--------+
2 rows in set (0.001 sec)

mysql> select * from emp where emp_id in (101,105);
+--------+-------+------+--------+
| emp_id | name  | dept | salary |
+--------+-------+------+--------+
|    101 | Amit  | IT   |  45000 |
|    105 | Ronit | IT   |  65000 |
+--------+-------+------+--------+
2 rows in set (0.001 sec)

mysql> select * from emp where name like "A%" ;
+--------+------+------+--------+
| emp_id | name | dept | salary |
+--------+------+------+--------+
|    101 | Amit | IT   |  45000 |
+--------+------+------+--------+
1 row in set (0.004 sec)

mysql> select * from emp where name like "a%" ;
+--------+------+------+--------+
| emp_id | name | dept | salary |
+--------+------+------+--------+
|    101 | Amit | IT   |  45000 |
+--------+------+------+--------+
1 row in set (0.000 sec)

mysql> select * from emp where name like "%t" ;
+--------+-------+------+--------+
| emp_id | name  | dept | salary |
+--------+-------+------+--------+
|    101 | Amit  | IT   |  45000 |
|    105 | Ronit | IT   |  65000 |
+--------+-------+------+--------+
2 rows in set (0.000 sec)

mysql> select * from emp where name like "%a%" ;
+--------+-------+-------+--------+
| emp_id | name  | dept  | salary |
+--------+-------+-------+--------+
|    101 | Amit  | IT    |  45000 |
|    102 | Sahil | IT    |  75000 |
|    103 | Rahul | HR    |  95000 |
|    104 | Sam   | Sales |  34000 |
+--------+-------+-------+--------+
4 rows in set (0.001 sec)

mysql> select * from emp where name like "__i%";
+--------+------+------+--------+
| emp_id | name | dept | salary |
+--------+------+------+--------+
|    101 | Amit | IT   |  45000 |
+--------+------+------+--------+
1 row in set (0.000 sec)

mysql> select * from emp;
+--------+-------+-------+--------+
| emp_id | name  | dept  | salary |
+--------+-------+-------+--------+
|    101 | Amit  | IT    |  45000 |
|    102 | Sahil | IT    |  75000 |
|    103 | Rahul | HR    |  95000 |
|    104 | Sam   | Sales |  34000 |
|    105 | Ronit | IT    |  65000 |
+--------+-------+-------+--------+
5 rows in set (0.000 sec)

mysql> select min(salary) from emp;
+-------------+
| min(salary) |
+-------------+
|       34000 |
+-------------+
1 row in set (0.003 sec)

mysql> select max(salary) from emp;
+-------------+
| max(salary) |
+-------------+
|       95000 |
+-------------+
1 row in set (0.000 sec)

mysql> select sum(salary) from emp;
+-------------+
| sum(salary) |
+-------------+
|      314000 |
+-------------+
1 row in set (0.001 sec)

mysql> select avg(salary) from emp;
+-------------+
| avg(salary) |
+-------------+
|  62800.0000 |
+-------------+
1 row in set (0.000 sec)

mysql> select count(*) from emp;
+----------+
| count(*) |
+----------+
|        5 |
+----------+
1 row in set (0.008 sec)

mysql> select * from emp;
+--------+-------+-------+--------+
| emp_id | name  | dept  | salary |
+--------+-------+-------+--------+
|    101 | Amit  | IT    |  45000 |
|    102 | Sahil | IT    |  75000 |
|    103 | Rahul | HR    |  95000 |
|    104 | Sam   | Sales |  34000 |
|    105 | Ronit | IT    |  65000 |
+--------+-------+-------+--------+
5 rows in set (0.000 sec)

mysql> select dept,count(*) from emp group by dept;
+-------+----------+
| dept  | count(*) |
+-------+----------+
| IT    |        3 |
| HR    |        1 |
| Sales |        1 |
+-------+----------+
3 rows in set (0.001 sec)

mysql> select dept,count(*) from emp group by dept having dept="IT";
+------+----------+
| dept | count(*) |
+------+----------+
| IT   |        3 |
+------+----------+
1 row in set (0.002 sec)

mysql> 
