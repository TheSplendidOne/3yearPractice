USE EmployeeWorkingTimeSchedulerDb

SELECT TOP 5 ProjectId, COUNT(EmployeeId) as TotalEmployees, SUM(ParticipationPercentage) as TotalParticipation
FROM Schedules
GROUP BY ProjectId
ORDER BY TotalParticipation DESC