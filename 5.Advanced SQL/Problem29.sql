CREATE TABLE WorkHours (	WorkHoursId int IDENTITY,	EmployeeId int NOT NULL,	CONSTRAINT AK_EmployeeId UNIQUE(EmployeeId),	Date date,	Task nvarchar(100) NOT NULL,	Hours int,	Comments text	CONSTRAINT PK_WorkHours PRIMARY KEY(WorkHoursId))ALTER TABLE WorkHours	ADD CONSTRAINT FK_Employees_WorkHours
  FOREIGN KEY (EmployeeId) REFERENCES WorkHours(EmployeeId)