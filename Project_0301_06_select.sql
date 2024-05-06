USE BMGT402_DB_Project_0301_Team_06

-- number of jobs worked by engineers
SELECT CONCAT(e.engineerFirstName, ' ', e.engineerLastName) AS engineerName, COUNT(DISTINCT a.projectId) AS numberOfJobs
FROM [GROUP6.Engineer] e, [GROUP6.Assign] a
WHERE e.engineerId = a.engineerId
GROUP BY e.engineerFirstName, e.engineerLastName
ORDER BY numberOfJobs DESC
;

-- engineers and number of completed projects
SELECT p.projectType, COUNT(e.engineerId) AS avgEngineers
FROM [Group6.Engineer] e, [GROUP6.Assign] a, [GROUP6.Project] p
WHERE e.engineerId = a.engineerId AND a.projectId = p.projectId
GROUP BY e.engineerFirstName, e.engineerLastName
;

-- Milestone Completeion Rate
SELECT p.projectMilestone, FORMAT((c.completedProjects * 1.0 / COUNT(DISTINCT p.projectId)), '0.00') AS Rate
FROM [GROUP6.Project] p, (
    SELECT projectMilestone, COUNT(DISTINCT projectId) AS completedProjects
    FROM [GROUP6.Project]
    WHERE projectCurrentStatus = 'Completed'
    GROUP BY projectMilestone 
	) c
WHERE p.projectMilestone IS NOT NULL AND p.projectMilestone = c.projectMilestone
GROUP BY p.projectMilestone, c.completedProjects
ORDER BY Rate DESC
;

-- manager success rate
SELECT CONCAT(m.managerFirstName, ' ', m.managerLastName) AS managerName, FORMAT((c.completedProjects * 1.0 / COUNT(DISTINCT p.projectId)), '0.00') AS Rate
FROM [GROUP6.Project] p, [GROUP6.Work] w, [GROUP6.Manager] m, (
    SELECT m.managerId, COUNT(p.projectId) AS completedProjects
    FROM [GROUP6.Project] p, [GROUP6.Work] w, [GROUP6.Manager] M
    WHERE p.projectId = w.projectId and w.managerId = M.managerId AND projectCurrentStatus = 'Completed'
    GROUP BY m.managerId 
	) c
WHERE p.projectId = w.projectId AND w.managerId = m.managerId AND m.managerId = c.managerId
GROUP BY m.managerFirstName, m.managerLastName, c.completedProjects
ORDER BY Rate DESC
;

-- number of projects proposed by clients
SELECT CONCAT(c.clientFirstName, ' ', c.clientLastName) AS clientName, COUNT(p.projectId) AS numberOfProjects
FROM [GROUP6.Client] c, [GROUP6.Project] p
WHERE c.clientId = p.clientId
GROUP BY clientFirstName, clientLastName
ORDER BY numberOfProjects DESC
;

-- projects completed within 6 months
SELECT CONCAT(m.managerFirstName, ' ' ,m.managerLastName) AS managerName, COUNT(DISTINCT p.projectId) AS 'Projects Completed Within 6 Months'
FROM [GROUP6.Manager] m, [GROUP6.Work] w, [GROUP6.Project] p
WHERE m.managerId = w.managerId AND w.projectId = p.projectID AND DATEDIFF(MONTH, p.projectStartDate, p.projectEndDate) <= 6
GROUP BY m.managerFirstName, m.managerLastName
ORDER BY 'Projects Completed Within 6 Months' DESC
;

-- What is the average duration per job?
SELECT p.projectType, AVG(DATEDIFF(MONTH, p.projectStartDate, p.projectEndDate)) AS 'Average Project Duration'
FROM [GROUP6.Project] p
GROUP BY p.projectType
ORDER BY 'Average Project Duration' DESC
;

-- What is the most common project type woprked on?
SELECT projectType, COUNT (*) AS num_projects
FROM [GROUP6.Project] p
GROUP BY projectType
ORDER BY num_projects DESC
;

-- what is the proportion of jobs that are completed vs canceled for each engineer?
SELECT CONCAT(e.engineerFirstName, ' ', e.engineerLastName) AS engineerName, 
	   COUNT(DISTINCT c.projectId) AS completedProjects, 
	   COUNT(DISTINCT x.projectId) AS cancelledProjects
FROM [Group6.Engineer] e,
	(
	SELECT p.projectId, a.engineerId
	FROM [GROUP6.Project] p, [Group6.Assign] a
	WHERE p.projectId = a.projectId AND p.projectCurrentStatus = 'Completed'
	) c,
	(
	SELECT p.projectId, a.engineerId
	FROM [GROUP6.Project] p, [Group6.Assign] a
	WHERE p.projectId = a.projectId AND p.projectCurrentStatus = 'Cancelled'
	) x
WHERE  c.engineerId = e.engineerId AND x.engineerId = e.engineerId 
GROUP BY e.engineerFirstName, e.engineerLastName
ORDER BY engineerName
;