
/*=========================================================
  Project : Snowflake CDC Pipeline
  File    : 06_Create_Task.sql
  Purpose : Schedule Task 
=========================================================*/

 Create or REPLACE Task Merge_EMP_TASK
 warehouse = 'COMPUTE_WH',
 SCHEDULE = '1 Minute'
 when SYSTEM$Stream_Has_data ('EMPLOYEE_STREAM')
 as
 call SP_PROCESS_EMPLOYEE()