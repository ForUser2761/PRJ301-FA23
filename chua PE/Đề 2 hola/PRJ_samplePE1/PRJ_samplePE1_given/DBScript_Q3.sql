CREATE DATABASE SamplePE1_Q3
GO

USE SamplePE1_Q3
GO
CREATE TABLE Employee(
	id int PRIMARY KEY,
	name varchar(150) NOT NULL,
	dob date NOT NULL,
	gender bit NOT NULL,
 )
GO
CREATE TABLE Employee_Skill(
	eid int NOT NULL,
	sid int NOT NULL,
 CONSTRAINT PK_Employee_Skill PRIMARY KEY CLUSTERED 
 (
	eid ASC,
	sid ASC
 )
)
GO
CREATE TABLE Skill(
	id int PRIMARY KEY,
	name varchar(150) NOT NULL
)
GO
INSERT INTO Employee (id, name, dob, gender) VALUES (1, N'Anna', CAST(N'1976-04-03' AS Date), 0)
INSERT INTO Employee (id, name, dob, gender) VALUES (2, N'Michel', CAST(N'1988-11-13' AS Date), 1)
INSERT INTO Employee (id, name, dob, gender) VALUES (3, N'Alex', CAST(N'1985-07-06' AS Date), 1)
INSERT INTO Employee (id, name, dob, gender) VALUES (4, N'Kim', CAST(N'1986-09-22' AS Date), 0)
INSERT INTO Skill (id, name) VALUES (1, N'C#')
INSERT INTO Skill (id, name) VALUES (2, N'Java')
INSERT INTO Skill (id, name) VALUES (3, N'Database System')
INSERT INTO Skill (id, name) VALUES (4, N'Algorithm')
ALTER TABLE Employee_Skill  WITH CHECK ADD  CONSTRAINT FK_Employee_Skill_Employee FOREIGN KEY(eid)
REFERENCES Employee (id)
GO
ALTER TABLE Employee_Skill CHECK CONSTRAINT FK_Employee_Skill_Employee
GO
ALTER TABLE Employee_Skill  WITH CHECK ADD  CONSTRAINT FK_Employee_Skill_Skill FOREIGN KEY(sid)
REFERENCES Skill (id)
GO
ALTER TABLE Employee_Skill CHECK CONSTRAINT FK_Employee_Skill_Skill
GO
