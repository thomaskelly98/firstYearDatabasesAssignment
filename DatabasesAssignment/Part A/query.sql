--Query 1
SELECT Equipment.EquipmentID, Equipment.Make, Equipment.Model, Equipment.Description FROM Equipment LEFT JOIN EquipmentLoan ON Equipment.EquipmentID = EquipmentLoan.EquipmentID WHERE Type LIKE '%video%' OR Description LIKE '%video%' AND Damaged=0 AND (Current=0 OR Current IS NULL);


--Query 2
SELECT Employee.EmployeeID, Employee.FirstName, Employee.LastName FROM Employee LEFT JOIN Contract ON Employee.EmployeeID = Contract.EmployeeID WHERE Current = 1 AND DueFinish LIKE '%2019%';


--Query 3
SELECT Project.Title, SUM(Expense.Amount) AS 'Expenses' FROM Project LEFT JOIN Expense ON Project.ProjectID = Expense.ProjectID GROUP BY Title;


--Query 4
SELECT Employee.FirstName, Employee.LastName, Employee.Email, Grade.Title AS 'Grade' FROM Employee INNER JOIN Grade ON Employee.GradeID = Grade.GradeID INNER JOIN EmployeeSkill ON Employee.EmployeeID = EmployeeSkill.EmployeeID INNER JOIN Skill ON EmployeeSkill.SkillID = Skill.SkillID WHERE Skill.Title LIKE '%video%' GROUP BY Employee.EmployeeID;


--Query 5
SELECT Project.Title, COUNT(Assignment.EmployeeID) AS 'No Of Employees'FROM Project LEFT JOIN Assignment ON Project.ProjectID = Assignment.ProjectID LEFT JOIN Employee ON Assignment.EmployeeID = Employee.EmployeeID WHERE Employee.Current = 1 AND Project.Internal = 0 GROUP BY Title HAVING COUNT(Assignment.EmployeeID)>2;


--Query 6
SELECT Employee.EmployeeID, Employee.FirstName, Employee.LastName FROM Employee Left Join Assignment ON Employee.EmployeeID = Assignment.EmployeeID WHERE Assignment.ProjectID IS NULL GROUP BY Employee.EmployeeID;


--Query 7
SELECT Skill.Title AS 'Skill Name', COUNT(EmployeeSkill.EmployeeID) AS ' Number of Skilled Employees' FROM Skill LEFT JOIN EmployeeSkill ON Skill.SkillID = EmployeeSkill.SkillID GROUP BY Skill.Title HAVING COUNT(EmployeeSkill.EmployeeID) >= 1;


--Query 8
SELECT EquipmentLoan.EmployeeID, COUNT(EquipmentLoan.EquipmentID) AS 'Equipment Loans' FROM EquipmentLoan WHERE EquipmentLoan.Current = 1 GROUP BY EquipmentLoan.EmployeeID;


--Query 9
SELECT EquipmentLoan.EmployeeID, COUNT(EquipmentLoan.EquipmentID) AS 'All Time Loans' FROM EquipmentLoan GROUP BY EmployeeID;


--Query 10
SELECT Employee.EmployeeID, Payslip.PayslipID FROM Payslip LEFT JOIN Employee ON Payslip.EmployeeID = Employee.EmployeeID LEFT JOIN Contract ON Employee.EmployeeID = Contract.EmployeeID WHERE (Payslip.Payday LIKE '%2017%') AND ((Contract.DueFinish LIKE '%2017%') OR Contract.DueFinish IS NULL) GROUP BY Payslip.PayslipID;
