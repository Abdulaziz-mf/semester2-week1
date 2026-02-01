-- For each student, calculate the total number of credits from courses they passed. Assume a passing grade is 40 or higher.
-- Expected Columns:
-- StudentId, FirstName, LastName, TotalCreditsPassed

SELECT Student.StudentId, FirstName, LastName, SUM(credits) AS TotalCreditsPassed 
FROM Student 
JOIN Enrolment ON Student.StudentId = Enrolment.StudentId 
JOIN Course ON Enrolment.CourseId = Course.CourseId 
WHERE Grade >= 40 
GROUP BY Student.StudentId, FirstName, LastName;
 