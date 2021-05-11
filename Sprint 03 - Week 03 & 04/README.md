# Running Sprint 3 Instructions
These are instructions for checking the work of 2 students, one with all correct answers and the other with all incorrect answers. Between each student, the SQL Server may need disconnecting and reconnecting to allow for the databases to change.

## Student with Correct Answers
1. Execute file = CorrectAnswerStudent/CorrectDatabase_Script.sql
2. Execute file = CorrectAnswerStudent/CorrectTestQueries_Script.sql
3. Execute file = tSQLtTesting_Script.sql
4. The output of all tests should be **Success**

## Student with Incorrect Answers
1. Execute file = InCorrectAnswerStudent/InCorrectDatabase_Script.sql
2. Execute file = InCorrectAnswerStudent/InCorrectTestQueries_Script.sql
3. Execute file = tSQLtTesting_Script.sql
4. The output of the tests should be **Failure** or **Error**

## Improvements from Sprint 2
- Queries are not hard coded, queries are saved as stored procedures and passed into tests.
- Multiple types of queries are tested.
- Tests are organised in a test format, e.g. example question #.
- Database and data scripts are treated as seperate student work.
- The use of schemas is removed, instead reliant on databases with tables, this is more organised.
