/*=========================================================
  Project : Snowflake CDC Pipeline
  File    : 02_Create_Stream.sql
  Purpose : Create stream on EMPLOYEE table
=========================================================*/

Create or replace stream Employee_Stream
on table employee_new