/*=========================================================
  STEP 1 : Check Source Data
=========================================================*/

SELECT *
FROM EMPLOYEE;


/*=========================================================
  STEP 2 : Check Stream Data
=========================================================*/

SELECT *
FROM EMPLOYEE_STREAM;


/*=========================================================
  STEP 3 : Check whether Stream has data
=========================================================*/

SELECT SYSTEM$STREAM_HAS_DATA('EMPLOYEE_STREAM');


/*=========================================================
  STEP 4 : Check Audit Table
=========================================================*/

SELECT *
FROM EMPLOYEE_AUDIT;


/*=========================================================
  STEP 5 : Check Target Table
=========================================================*/

SELECT *
FROM EMPLOYEE_NEW_TARGET;


/*=========================================================
  STEP 6 : Check Task Execution History
=========================================================*/

SELECT *
FROM TABLE(
    INFORMATION_SCHEMA.TASK_HISTORY(
        TASK_NAME => 'MERGE_EMP_TASK'
    )
)
ORDER BY SCHEDULED_TIME DESC;


/*=========================================================
  STEP 7 : Manual Procedure Execution (Optional)
=========================================================*/

CALL SP_PROCESS_EMPLOYEE();


--- Testing QUery

insert into employee_new
(emp_id,emp_name,department,salary)
values
(126,'Vaishali ui','SQL', 98000)


UPDATE EMPLOYEE
SET SALARY=65000
WHERE EMP_ID=101;

DELETE
FROM EMPLOYEE
WHERE EMP_ID=101;

SELECT * FROM EMPLOYEE_STREAM;

SELECT * FROM EMPLOYEE_AUDIT;

SELECT * FROM EMPLOYEE_NEW_TARGET;