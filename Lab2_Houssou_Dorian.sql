USE BMGT402_DB_Student_119


DROP TABLE IF EXISTS [Lab.Shift];
DROP TABLE IF EXISTS [Lab.Project];
DROP TABLE IF EXISTS [Lab.Library];
DROP TABLE IF EXISTS [Lab.Manager];

CREATE TABLE [Lab.Library] (
	libraryId CHAR(4) NOT NULL,
	libraryName VARCHAR(50),
	libraryStreet VARCHAR(50),
	libraryCity VARCHAR(50),
	libraryState VARCHAR(50),
	libraryZip VARCHAR(50),
	libraryPhone VARCHAR(50),
	CONSTRAINT  pk_Library_libraryId PRIMARY KEY (libraryId)
	)

	
CREATE TABLE [Lab.Manager] (
	managerId CHAR(4) NOT NULL,
	managerFirstName VARCHAR(50),
	managerLastName VARCHAR(50),
	managerPhone VARCHAR(50),
	libraryId VARCHAR(50),
	CONSTRAINT  pk_Manager_managerId PRIMARY KEY (managerId)
	)

	
CREATE TABLE [Lab.Project] (
	projectId CHAR(4) NOT NULL,
	projectName VARCHAR(50),
	projectStart VARCHAR(50),
	projectEnd VARCHAR(50),
	libraryId VARCHAR(50),
	CONSTRAINT  pk_Project_projectId PRIMARY KEY (projectId)
	)

	
CREATE TABLE [Lab.Shift] (
	shiftId CHAR(4) NOT NULL,
	shiftStart VARCHAR(50),
	shiftEnd VARCHAR(50),
	libraryId VARCHAR(50),
	managerId VARCHAR(50),
	CONSTRAINT  pk_Shift_shiftId PRIMARY KEY (shiftId)
	)

	INSERT INTO [Lab.Library]VALUES
	('BL01', 'Beltsville Library', '4319 Sellman Road', 'Beltsville', 'MD', '20705', '2404555451'),
	('GL01', 'Greenbelt Library', '411 Crescent Road', 'Greenbelt', 'MD', '20770', '2404555451' ),
	('HL01', 'Hyattsville Library', '6530 Adelphi Road', 'Hyattsville', 'MD', '20782', '2404555451')

	INSERT INTO [Lab.Manager]VALUES
	('BM01', 'Blair', 'Motta', '8057921838', 'BL01'),
	('FM01', 'Frank', 'Mestas', '6627737092', 'GL01'),
	('MM01', 'Mel', 'Miller', '3012345678', 'HL01')

	INSERT INTO [Lab.Project]VALUES
	('PJ01', 'Reorganizing furniture', '2024-03-01', '2024-05-31', 'BL01'),
	('PJ02', 'Sorting miscellaneous', '2024-03-01', '2024-05-31', 'GL01'),
	('PJ03', 'Sorting miscellaneous', '2024-03-01', '2024-05-31', 'HL01')

	INSERT INTO [Lab.Shift]VALUES
	('SF01', '2024-03-01 13:00:00', '2024-03-01 17:00:00', 'BL01', 'BM01'),
	('SF02', '2024-03-01 17:00:00', '2024-03-01 21:00:00', 'BL01', 'BM01'),
	('SF03', '2024-03-01 13:00:00', '2024-03-01 17:00:00', 'GL01', 'FM01'),
	('SF04', '2024-03-01 17:00:00', '2024-03-01 21:00:00', 'GL01', 'FM01'),
	('SF05', '2024-03-01 13:00:00', '2024-03-01 17:00:00', 'HL01', 'MM01')

SELECT * FROM [Lab.Library] ;
SELECT * FROM [Lab.Manager] ;
SELECT * FROM [Lab.Project] ;
SELECT * FROM [Lab.Shift] ;
