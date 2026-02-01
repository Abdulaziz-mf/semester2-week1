-- For each department, calculate the number of enrolments in its courses.
-- Expected Columns:
-- DepartmentName, TotalEnrolments

SELECT DepartmentName, COUNT(EnrolmentId) AS TotalEnrolments 
FROM Department 
JOIN Course ON Department.DepartmentId = Course.DepartmentId 
JOIN Enrolment ON Enrolment.CourseId = Course.CourseId 
GROUP BY Department.DepartmentId;