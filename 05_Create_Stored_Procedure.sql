
/*=========================================================
  Project : Snowflake CDC Pipeline
  File    : 05_Create_Stored_Procedure.sql
  Purpose : Process incremental changes from stream
=========================================================*/

create or REPLACE procedure SP_PROCESS_EMPLOYEE()
RETURNS STRING
LANGUAGE SQL
as
$$
begin
        Create or replace Temp Table TEMP_EMP
        as
        select * from EMPLOYEE_STREAM;

        INSERT INTO employee_audit
        select 
            CURRENT_TIMESTAMP(),
            EMP_ID,
            EMP_NAME,
            department,
            salary,
            METADATA$Action,
            METADATA$ISUPDATE
        from TEMP_EMP;

       MERGE INTO Employee_Target a
USING TEMP_EMP b
ON a.EMP_ID = b.EMP_ID

WHEN MATCHED
AND b.METADATA$ACTION = 'DELETE'
AND b.METADATA$ISUPDATE = FALSE
THEN DELETE

WHEN MATCHED
AND b.METADATA$ACTION = 'INSERT'
AND b.METADATA$ISUPDATE = TRUE
THEN
UPDATE SET
    EMP_NAME = b.EMP_NAME,
    DEPARTMENT = b.DEPARTMENT,
    SALARY = b.SALARY

WHEN NOT MATCHED
AND b.METADATA$ACTION = 'INSERT'
AND b.METADATA$ISUPDATE = FALSE
THEN
INSERT
(
    EMP_ID,
    EMP_NAME,
    DEPARTMENT,
    SALARY
)
VALUES
(
    b.EMP_ID,
    b.EMP_NAME,
    b.DEPARTMENT,
    b.SALARY
);
        RETURN 'SUCESS';

end;
$$


