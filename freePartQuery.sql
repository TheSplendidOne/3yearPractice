USE EmployeeWorkingTimeSchedulerDb

SELECT EmployeeId, (100 - SUM(ParticipationPercentage)) as FreePart
FROM Schedules
GROUP BY EmployeeId