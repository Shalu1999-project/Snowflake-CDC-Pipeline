/*=========================================================
  Project : Snowflake CDC Pipeline
  File    : 03_Create_Target_Table.sql
  Purpose : Create Employee Target Table
=========================================================*/

 Create Table Employee_new_Target
 (
     Emp_ID int,
     Emp_name varchar(250),
     Department Varchar(100),
     Salary DECIMAL(18,2),
     Last_updated datetime DEFAULT CURRENT_TIMESTAMP()


 )