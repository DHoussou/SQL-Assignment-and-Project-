USE BMGT402_DB_Project_0301_Team_06


INSERT INTO [Group6.Manager] (managerId, managerFirstName, managerLastName) VALUES 
	('M0001', 'John', 'Smith'),
	('M0002', 'Eric', 'Johnson'),
	('M0003', 'Jon', 'Jones'),
	('M0004', 'Greg', 'Brown'),
	('M0005', 'Julia', 'Song')
	;

INSERT INTO [GROUP6.Client] (clientId, clientFirstName, clientLastName) VALUES 
	('C0001', 'Kathy', 'Smith'),
	('C0002', 'Eric', 'James'),
	('C0003', 'Matt', 'Jones'),
	('C0004', 'Greg', 'White'),
	('C0005', 'Kent', 'Clark'),
	('C0006', 'Erik', 'Geibler'),
	('C0007', 'White', 'Brown'),
	('C0008', 'Tiffany', 'Lop')
	;

INSERT INTO [Group6.Project] (projectId, projectStartDate, projectEndDate, projectType, projectMilestone, projectCurrentStatus, clientId) VALUES 
	('P0001', '2023-12-12', '2024-06-23', 'OH', 'Planning', 'Cancelled', 'C0001'),
	('P0002', '2023-12-12', '2024-01-28', 'OH', 'Design', 'Completed', 'C0002'),
	('P0003', '2024-01-25', '2024-07-12', 'UG', 'Design', 'Cancelled', 'C0005'),
	('P0004', '2024-01-25', '2024-08-29', 'UG', 'Production', 'Completed', 'C0002'),
	('P0005', '2024-02-12', '2024-05-23', 'UG', 'Planning', 'Completed', 'C0004'),
	('P0006', '2024-09-12', '2024-11-28', 'OH', 'Planning', 'Cancelled', 'C0006'),
	('P0007', '2024-08-15', '2024-12-23', 'UG', 'Planning', 'Cancelled', 'C0005'),
	('P0008', '2024-09-01', '2024-10-28', 'UG', 'Implementation', 'Completed', 'C0006'),
	('P0009', '2023-12-31', '2024-06-23', 'OH', 'Implementation', 'Completed', 'C0008'),
	('P0010', '2024-06-17', '2024-10-28', 'UG', 'Design', 'Completed', 'C0007'),
	('P0011', '2023-12-12', '2024-03-23', 'UG', 'Implementation', 'Completed', 'C0003'),
	('P0012', '2023-12-12', '2024-12-28', 'UG', 'Implementation', 'Cancelled', 'C0007'),
	('P0013', '2023-12-12', '2024-06-23', 'UG', 'Planning', 'Completed', 'C0001'),
	('P0014', '2023-11-12', '2024-01-28', 'OH', 'Design', 'Completed', 'C0005'),
	('P0015', '2024-01-25', '2024-07-12', 'UG', 'Design', 'Completed', 'C0005'),
	('P0016', '2024-01-25', '2024-08-29', 'UG', 'Production', 'Completed', 'C0003'),
	('P0017', '2024-02-12', '2024-05-23', 'UG', 'Planning', 'Cancelled', 'C0004'),
	('P0018', '2024-09-12', '2024-11-28', 'OH', 'Planning', 'Completed', 'C0003'),
	('P0019', '2024-09-15', '2024-12-23', 'OH', 'Planning', 'Cancelled', 'C0004'),
	('P0020', '2024-07-01', '2024-10-28', 'OH', 'Implementation', 'Completed', 'C0003'),
	('P0021', '2023-12-31', '2024-05-22', 'UG', 'Implementation', 'Completed', 'C0008'),
	('P0022', '2024-02-17', '2024-05-26', 'OH', 'Design', 'Cancelled', 'C0008'),
	('P0023', '2023-07-12', '2024-01-23', 'UG', 'Implementation', 'Completed', 'C0004'),
	('P0024', '2023-05-12', '2024-12-29', 'OH', 'Implementation', 'Cancelled', 'C0007')
	;

INSERT INTO [Group6.Work] (managerId, projectId) VALUES
	('M0001', 'P0001'),
	('M0002', 'P0002'),
	('M0003', 'P0003'),
	('M0004', 'P0004'),
	('M0005', 'P0005'),
	('M0001', 'P0006'),
	('M0001', 'P0007'),
	('M0002', 'P0008'),
	('M0001', 'P0009'),
	('M0003', 'P0010'),
	('M0004', 'P0011'),
	('M0002', 'P0012'),
	('M0001', 'P0013'),
	('M0002', 'P0014'),
	('M0003', 'P0015'),
	('M0004', 'P0016'),
	('M0005', 'P0017'),
	('M0001', 'P0018'),
	('M0001', 'P0019'),
	('M0002', 'P0020'),
	('M0001', 'P0021'),
	('M0003', 'P0022'),
	('M0004', 'P0023'),
	('M0002', 'P0024')
	;

INSERT INTO [Group6.Engineer] (engineerId, engineerFirstName, engineerLastName) VALUES 
	('E0001', 'Frank', 'Johnson'),
	('E0002', 'Dylan', 'Tam'),
	('E0003', 'Ryan', 'Chng'),
	('E0004', 'Dorian', 'Hossou'),
	('E0005', 'Greg', 'Heffley')
	;

INSERT INTO [Group6.Assign] (engineerId, projectId) VALUES 
	('E0001', 'P0001'),
	('E0002', 'P0002'),
	('E0003', 'P0003'),
	('E0004', 'P0004'),
	('E0005', 'P0005'),
	('E0001', 'P0006'),
	('E0002', 'P0007'),
	('E0003', 'P0008'),
	('E0004', 'P0009'),
	('E0005', 'P0010'),
	('E0005', 'P0011'),
	('E0005', 'P0012'),
	('E0004', 'P0013'),
	('E0001', 'P0014'),
	('E0002', 'P0015'),
	('E0002', 'P0016'),
	('E0002', 'P0017'),
	('E0001', 'P0018'),
	('E0002', 'P0019'),
	('E0002', 'P0020'),
	('E0004', 'P0021'),
	('E0001', 'P0022'),
	('E0002', 'P0023'),
	('E0005', 'P0024'),
	('E0003', 'P0012'),
	('E0004', 'P0012')
	;