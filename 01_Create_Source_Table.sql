/*=========================================================
  Project : Snowflake CDC Pipeline
  File    : 01_Create_Source_Table.sql
  Purpose : Create the source EMPLOYEE table
=========================================================*/


Create Table Employee
(
     Emp_ID int,
     Emp_name STRING,
     Department STRING,
     Salary DECIMAL(18,2),
     Last_updated datetime DEFAULT CURRENT_TIMESTAMP()

)