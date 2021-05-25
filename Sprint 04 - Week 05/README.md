# Running Sprint 4 Instructions
This sprint contains 2 sets of work, the first is MyLunchTest and the second is SQLPracticalTest2020.
These are instructions for checking the work of 2 students, one with all correct answers and the other with all incorrect answers included in each set of work folder.

## Improvements from Sprint 3
- The expected data is no longer hard coded, the model answer stored procedures run are set as the expected answers of the tests.
- The SQLPracticalTest2020 works with a restored backup copy of a database with the testing script.

## MyLunchTest
*The questions to the query answers not available*

1. Go to directory = 01_MyLunchTest
2. Execute file = myLunch_StartingScript.sql
3. Execute file = myLunch_ModelAnswerQueries.sql
From here you can go for either scenario.

### Student with Correct Answers
1. Execute file = myLunch_CorrectStudentAnswerQueries.sql
2. Execute file = myLunch_tSQLt_TestingScript.sql
4. The output of all tests should be **Success**

### Student with InCorrect Answers
1. Execute file = myLunch_InCorrectStudentAnswerQueries.sql
2. Execute file = myLunch_tSQLt_TestingScript.sql
4. The output of the tests should be **Success**, **Failure** or **Error**

## SQLPracticalTest2020
*The questions to the query answers = BCDE103-2020-Practical Test.pdf*

1. Go to directory = 02_SQLPracticalTest2020
2. Restore database backup using *SQLTest.bak* file
3. Execute file = PracticalTest_ModelAnswerQueries.sql
From here you can go for either scenario.

### Student with Correct Answers
1. Execute file = PracticalTest_CorrectStudentAnswerQueries.sql
2. Execute file = PracticalTest_tSQLt_TestingScript.sql
4. The output of all tests should be **Success**

### Student with InCorrect Answers
1. Execute file = PracticalTest_InCorrectStudentAnswerQueries.sql
2. Execute file = PracticalTest_tSQLt_TestingScript.sql
4. The output of the tests should be **Success**, **Failure** or **Error**
