use [master];
go
CREATE DATABASE Academy_3;
go
USE Academy_3;
go
CREATE TABLE Departments
(
[Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
[Financing] MONEY NOT NULL DEFAULT 0, 
[Name] NVARCHAR(100) NOT NULL UNIQUE,
CONSTRAINT CK_Department_Financing CHECK([Financing]>=0),
CONSTRAINT CK_Department_Name CHECK([Name] <> N'')
);
go
CREATE TABLE Faculties
(
[Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
[Dean] NVARCHAR(max) NOT NULL,
[Name] NVARCHAR(100) NOT NULL UNIQUE,
CONSTRAINT CK_Faculties_Dean CHECK([Dean] <> N'')
);
go
CREATE TABLE Groups
(
[Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
[Name] NVARCHAR(10) NOT NULL UNIQUE,
[Rating] INT NOT NULL,
[Year] INT NOT NULL,
CONSTRAINT CK_Groups_Name CHECK([Name] <> N''),
CONSTRAINT CK_Groups_Rating CHECK([Rating] > 0 AND [Rating] <= 5),
CONSTRAINT CK_Groups_Year CHECK([Year] >= 1 AND [Year] <= 5)
);
go
CREATE TABLE Teachers
(
[Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
[Name] NVARCHAR(max) NOT NULL,
[Surname] NVARCHAR(max) NOT NULL,
[Position] NVARCHAR(max) NOT NULL,
[EmploymentDate] DATE NOT NULL,
[IsAssistant] BIT NOT NULL DEFAULT 0,
[IsProfessor] BIT NOT NULL DEFAULT 0,
[Salary] MONEY NOT NULL,
[Premium] MONEY NOT NULL DEFAULT 0,
CONSTRAINT CK_Teachers_EmploymentDate CHECK([EmploymentDate] !< '1990-01-01'),
CONSTRAINT CK_Teachers_Name CHECK([Name] <> N''),
CONSTRAINT CK_Teachers_Position CHECK([Position] <> N''),
CONSTRAINT CK_Teachers_Premium CHECK([Premium] > 0),
CONSTRAINT CK_Teachers_Salary CHECK([Salary] > 0),
CONSTRAINT CK_Teachers_Surname CHECK([Surname] <> N'')
);
go
