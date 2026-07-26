# Snowflake CDC Pipeline using Streams, Tasks & Stored Procedures

## Project Overview

This project demonstrates an end-to-end Change Data Capture (CDC) pipeline in Snowflake.

The pipeline captures INSERT, UPDATE, and DELETE operations from a source table using Snowflake Streams. A scheduled Task automatically executes a Stored Procedure, which processes incremental changes and updates the target table while maintaining an audit log.

## Project Flow

EMPLOYEE (Source Table)
        │
        ▼
EMPLOYEE_STREAM
        │
        ▼
SP_PROCESS_EMPLOYEE()
      │        │
      ▼        ▼
EMPLOYEE_NEW_TARGET   EMPLOYEE_AUDIT

## Features

- Create Source Table
- Create Stream
- Create Target Table
- Create Audit Table
- Stored Procedure for processing changes
- Automatic Task execution
- MERGE-based incremental loading
- Audit logging
- Testing scripts

## Technologies Used

- Snowflake
- SQL
- Streams
- Tasks
- Stored Procedures
- MERGE

## Project Structure

```text
01_Create_Source_Table.sql
02_Create_Stream.sql
03_Create_Target_Table.sql
04_Create_Audit_Table.sql
05_Create_Stored_Procedure.sql
06_Create_Task.sql
07_Testing_Script.sql
Employee_Source_Data_File.csv
CDC_Architecture.png
```

## How to Run

1. Create the source table.
2. Load the sample CSV data into the EMPLOYEE table.
3. Create the Stream.
4. Create the Target and Audit tables.
5. Create the Stored Procedure.
6. Create the Task.
7. Execute INSERT, UPDATE, and DELETE operations.
8. Verify the Stream, Target, and Audit tables.
9. Check Task History.

## Sample Verification Queries

```sql
SELECT * FROM EMPLOYEE_STREAM;

SELECT * FROM EMPLOYEE_AUDIT;

SELECT * FROM EMPLOYEE_NEW_TARGET;

SELECT SYSTEM$STREAM_HAS_DATA('EMPLOYEE_STREAM');

SELECT *
FROM TABLE(
    INFORMATION_SCHEMA.TASK_HISTORY(
        TASK_NAME => 'MERGE_EMP_TASK'
    )
)
ORDER BY SCHEDULED_TIME DESC;
```

## Author

**Vaishali Ganotra**

SQL Developer | Aspiring Data Engineer

Currently learning Snowflake, Azure Data Engineering, and building practical projects.
