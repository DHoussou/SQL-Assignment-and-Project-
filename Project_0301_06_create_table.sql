USE BMGT402_DB_Project_0301_Team_06

CREATE TABLE [GROUP6.Manager] (
	managerId CHAR(5) NOT NULL,
	managerFirstName VARCHAR(20),
	managerLastName VARCHAR(20),
	CONSTRAINT pk_Manager_managerId PRIMARY KEY (managerId)
	);

CREATE TABLE [GROUP6.Client] (
	clientId CHAR(5) NOT NULL,
	clientFirstName VARCHAR(20),
	clientLastName VARCHAR(20),
	CONSTRAINT pk_Client_clientId PRIMARY KEY (clientId)
	);

CREATE TABLE [GROUP6.Project] (
	projectId CHAR(5) NOT NULL,
	projectStartDate DATETIME,
	projectEndDate DATETIME,
	projectType VARCHAR (2),
	projectMilestone VARCHAR (20),
	projectCurrentStatus VARCHAR(20),
	clientId CHAR(5),
	CONSTRAINT pk_Project_projectId PRIMARY KEY (projectId),
	CONSTRAINT fk_Project_clientId FOREIGN KEY (clientId) REFERENCES [GROUP6.Client] (clientId) ON DELETE NO ACTION ON UPDATE NO ACTION 
	);

CREATE TABLE [GROUP6.Work] (
	managerId CHAR(5) NOT NULL,
	projectId CHAR(5) NOT NULL,
	CONSTRAINT pk_Work_managerId_projectId PRIMARY KEY (managerId, projectId),
	CONSTRAINT fk_Work_managerId FOREIGN KEY (managerId) REFERENCES [GROUP6.Manager] (managerId) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT fk_Work_projectId FOREIGN KEY (projectId) REFERENCES [GROUP6.Project] (projectId) ON DELETE NO ACTION ON UPDATE NO ACTION 
	);


CREATE TABLE [Group6.Engineer] (
	engineerId CHAR(5) NOT NULL,
	engineerFirstName VARCHAR(20),
	engineerLastName VARCHAR(20),
	CONSTRAINT pk_Engineer_engineerId PRIMARY KEY (engineerId)
	);

CREATE TABLE [Group6.Assign] (
	engineerId CHAR(5) NOT NULL,
	projectId CHAR(5) NOT NULL,
	CONSTRAINT pk_Assign_engineerId_projectId PRIMARY KEY (engineerId, projectId),
	CONSTRAINT fk_Assign_engineerId FOREIGN KEY (engineerId) REFERENCES [Group6.Engineer] (engineerId) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT fk_Assign_projectId FOREIGN KEY (projectId) REFERENCES [Group6.Project] (projectId) ON DELETE NO ACTION ON UPDATE NO ACTION
	);
