CREATE DATABASE EmployeeWorkingTimeSchedulerDb
GO

USE EmployeeWorkingTimeSchedulerDb

CREATE TABLE Employees
(
    Id INT IDENTITY PRIMARY KEY,
    FullName NVARCHAR(50) NOT NULL
)

CREATE TABLE Projects
(
    Id INT IDENTITY PRIMARY KEY,
    Title NVARCHAR(50) NOT NULL
)

CREATE TABLE Schedules
(
    EmployeeId INT FOREIGN KEY REFERENCES Employees(ID),
    ProjectId INT FOREIGN KEY REFERENCES Projects(ID),
    ParticipationPercentage INT NOT NULL,
    PRIMARY KEY (EmployeeId, ProjectId)
)
GO

CREATE FUNCTION SumParticipation(@EmployeeId INT)
RETURNS INT
AS
BEGIN
	RETURN (SELECT SUM(ParticipationPercentage)
			FROM EmployeeWorkingTimeSchedulerDb.dbo.Schedules
			WHERE EmployeeId = @EmployeeId)
END
GO

ALTER TABLE Schedules
ADD CONSTRAINT ParticipationPercentageValidation
	CHECK(dbo.SumParticipation(EmployeeId) <= 100 AND ParticipationPercentage > 0)