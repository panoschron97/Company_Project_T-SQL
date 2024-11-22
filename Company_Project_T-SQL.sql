USE [Master];
GO
CREATE SCHEMA [Database];
GO
CREATE OR ALTER PROCEDURE [Database].[CreationOfDatabase] AS 
BEGIN
CREATE DATABASE [Company_Project_T_SQL];
END
GO
CREATE OR ALTER PROCEDURE [Database].[DeletionOfDatabase] AS
BEGIN
DROP DATABASE IF EXISTS [Company_Project_T_SQL];
END
GO
EXECUTE [Database].[CreationOfDatabase];
------------------------------
USE [Company_Project_T_SQL];
GO
CREATE SCHEMA [Users];
GO
CREATE OR ALTER PROCEDURE [Users].[CreationOfLogins] AS
BEGIN
CREATE LOGIN [Panos_Chron] WITH PASSWORD = N'Panos_Chron', DEFAULT_DATABASE = [Company_Project_T_SQL];
CREATE LOGIN [Panos_Chron2] WITH PASSWORD = N'Panos_Chron2', DEFAULT_DATABASE = [Company_Project_T_SQL];
END
GO
CREATE OR ALTER PROCEDURE [Users].[CreationOfUsers] AS
BEGIN
CREATE USER [Panos_Chron] FOR LOGIN [Panos_Chron] WITH DEFAULT_SCHEMA = [Users];
CREATE USER [Panos_Chron2] FOR LOGIN [Panos_Chron2] WITH DEFAULT_SCHEMA = [Users];
END
GO
CREATE OR ALTER PROCEDURE [Users].[CreationOfRoles] AS
BEGIN
CREATE ROLE [CompaniesRoles];
CREATE ROLE [LocationsRoles];
CREATE ROLE [DepartmentsRoles];
CREATE ROLE [ProjectsRoles];
CREATE ROLE [EmployeesRoles];
END
GO
CREATE OR ALTER PROCEDURE [Users].[AddPrivilegesToUsers] AS
BEGIN
--GRANT SELECT ON SCHEMA::[Companies] TO [CompaniesRoles] WITH GRANT OPTION;
--GRANT UNMASK ON SCHEMA::[Companies] TO [CompaniesRoles] WITH GRANT OPTION;
--GRANT SELECT ON SCHEMA::[Companies] TO [Panos_Chron] WITH GRANT OPTION;
--GRANT UNMASK ON SCHEMA::[Companies] TO [Panos_Chron] WITH GRANT OPTION;
--GRANT SELECT ON OBJECT::[Companies].[Companies] TO [Panos_Chron] WITH GRANT OPTION;
--GRANT UNMASK ON OBJECT::[Companies].[Companies] TO [Panos_Chron] WITH GRANT OPTION;
GRANT SELECT ON [Companies].[Companies] TO [CompaniesRoles] WITH GRANT OPTION;
GRANT SELECT ON [Locations].[Locations] TO [LocationsRoles] WITH GRANT OPTION;
GRANT SELECT ON [Departments].[Departments] TO [DepartmentsRoles] WITH GRANT OPTION;
GRANT SELECT ON [Projects].[Projects] TO [ProjectsRoles] WITH GRANT OPTION;
GRANT SELECT ON [Employees].[Employees] TO [EmployeesRoles] WITH GRANT OPTION;
GRANT UNMASK ON [Companies].[Companies] TO [CompaniesRoles] WITH GRANT OPTION;
GRANT UNMASK ON [Locations].[Locations] TO [LocationsRoles] WITH GRANT OPTION;
GRANT UNMASK ON [Departments].[Departments] TO [DepartmentsRoles] WITH GRANT OPTION;
GRANT UNMASK ON [Projects].[Projects] TO [ProjectsRoles] WITH GRANT OPTION;
GRANT UNMASK ON [Employees].[Employees] TO [EmployeesRoles] WITH GRANT OPTION;
GRANT SELECT ON [Companies].[Companies] TO [Panos_Chron] WITH GRANT OPTION;
GRANT SELECT ON [Locations].[Locations] TO [Panos_Chron] WITH GRANT OPTION;
GRANT SELECT ON [Departments].[Departments] TO [Panos_Chron] WITH GRANT OPTION;
GRANT SELECT ON [Projects].[Projects] TO [Panos_Chron] WITH GRANT OPTION;
GRANT SELECT ON [Employees].[Employees] TO [Panos_Chron] WITH GRANT OPTION;
GRANT UNMASK ON [Companies].[Companies] TO [Panos_Chron] WITH GRANT OPTION;
GRANT UNMASK ON [Locations].[Locations] TO [Panos_Chron] WITH GRANT OPTION;
GRANT UNMASK ON [Departments].[Departments] TO [Panos_Chron] WITH GRANT OPTION;
GRANT UNMASK ON [Projects].[Projects] TO [Panos_Chron] WITH GRANT OPTION;
GRANT UNMASK ON [Employees].[Employees] TO [Panos_Chron] WITH GRANT OPTION;
END
GO
CREATE OR ALTER PROCEDURE [Users].[GivePrivilegesToUsers] AS
BEGIN
ALTER ROLE [CompaniesRoles] ADD MEMBER [Panos_Chron];
ALTER ROLE [LocationsRoles] ADD MEMBER [Panos_Chron];
ALTER ROLE [DepartmentsRoles] ADD MEMBER [Panos_Chron];
ALTER ROLE [ProjectsRoles] ADD MEMBER [Panos_Chron];
ALTER ROLE [EmployeesRoles] ADD MEMBER [Panos_Chron];
END
GO
CREATE OR ALTER PROCEDURE [Users].[RemovePrivilegesToUsers] AS
BEGIN
--REVOKE SELECT ON SCHEMA::[Companies] TO [CompaniesRoles] CASCADE;
--REVOKE UNMASK ON SCHEMA::[Companies] TO [CompaniesRoles] CASCADE;
--REVOKE SELECT ON SCHEMA::[Companies] TO [Panos_Chron] CASCADE;
--REVOKE UNMASK ON SCHEMA::[Companies] TO [Panos_Chron] CASCADE;
--REVOKE SELECT ON OBJECT::[Companies].[Companies] TO [Panos_Chron] CASCADE;
--REVOKE UNMASK ON OBJECT::[Companies].[Companies] TO [Panos_Chron] CASCADE;
REVOKE SELECT ON [Companies].[Companies] TO [CompaniesRoles] CASCADE;
REVOKE SELECT ON [Locations].[Locations] TO [LocationsRoles] CASCADE;
REVOKE SELECT ON [Departments].[Departments] TO [DepartmentsRoles] CASCADE;
REVOKE SELECT ON [Projects].[Projects] TO [ProjectsRoles] CASCADE;
REVOKE SELECT ON [Employees].[Employees] TO [EmployeesRoles] CASCADE;
REVOKE UNMASK ON [Companies].[Companies] TO [CompaniesRoles] CASCADE;
REVOKE UNMASK ON [Locations].[Locations] TO [LocationsRoles] CASCADE;
REVOKE UNMASK ON [Departments].[Departments] TO [DepartmentsRoles] CASCADE;
REVOKE UNMASK ON [Projects].[Projects] TO [ProjectsRoles] CASCADE;
REVOKE UNMASK ON [Employees].[Employees] TO [EmployeesRoles] CASCADE;
REVOKE SELECT ON [Companies].[Companies] TO [Panos_Chron] CASCADE;
REVOKE SELECT ON [Locations].[Locations] TO [Panos_Chron] CASCADE;
REVOKE SELECT ON [Departments].[Departments] TO [Panos_Chron] CASCADE;
REVOKE SELECT ON [Projects].[Projects] TO [Panos_Chron] CASCADE;
REVOKE SELECT ON [Employees].[Employees] TO [Panos_Chron] CASCADE;
REVOKE UNMASK ON [Companies].[Companies] TO [Panos_Chron] CASCADE;
REVOKE UNMASK ON [Locations].[Locations] TO [Panos_Chron] CASCADE;
REVOKE UNMASK ON [Departments].[Departments] TO [Panos_Chron] CASCADE;
REVOKE UNMASK ON [Projects].[Projects] TO [Panos_Chron] CASCADE;
REVOKE UNMASK ON [Employees].[Employees] TO [Panos_Chron] CASCADE;
END
GO
CREATE OR ALTER PROCEDURE [Users].[TakePrivilegesToUsers] AS
BEGIN
ALTER ROLE [CompaniesRoles] DROP MEMBER [Panos_Chron];
ALTER ROLE [LocationsRoles] DROP MEMBER [Panos_Chron];
ALTER ROLE [DepartmentsRoles] DROP MEMBER [Panos_Chron];
ALTER ROLE [ProjectsRoles] DROP MEMBER [Panos_Chron];
ALTER ROLE [EmployeesRoles] DROP MEMBER [Panos_Chron];
END
GO
CREATE OR ALTER PROCEDURE [Users].[BlockPrivilegesToUsers] AS
BEGIN
--DENY SELECT ON SCHEMA::[Companies] TO [CompaniesRoles] CASCADE;
--DENY UNMASK ON SCHEMA::[Companies] TO [CompaniesRoles] CASCADE;
--DENY SELECT ON SCHEMA::[Companies] TO [Panos_Chron] CASCADE;
--DENY UNMASK ON SCHEMA::[Companies] TO [Panos_Chron] CASCADE;
--DENY SELECT ON OBJECT::[Companies].[Companies] TO [Panos_Chron] CASCADE;
--DENY UNMASK ON OBJECT::[Companies].[Companies] TO [Panos_Chron] CASCADE;
DENY SELECT ON [Companies].[Companies] TO [CompaniesRoles] CASCADE;
DENY SELECT ON [Locations].[Locations] TO [LocationsRoles] CASCADE;
DENY SELECT ON [Departments].[Departments] TO [DepartmentsRoles] CASCADE;
DENY SELECT ON [Projects].[Projects] TO [ProjectsRoles] CASCADE;
DENY SELECT ON [Employees].[Employees] TO [EmployeesRoles] CASCADE;
DENY UNMASK ON [Companies].[Companies] TO [CompaniesRoles] CASCADE;
DENY UNMASK ON [Locations].[Locations] TO [LocationsRoles] CASCADE;
DENY UNMASK ON [Departments].[Departments] TO [DepartmentsRoles] CASCADE;
DENY UNMASK ON [Projects].[Projects] TO [ProjectsRoles] CASCADE;
DENY UNMASK ON [Employees].[Employees] TO [EmployeesRoles] CASCADE;
DENY SELECT ON [Companies].[Companies] TO [Panos_Chron] CASCADE;
DENY SELECT ON [Locations].[Locations] TO [Panos_Chron] CASCADE;
DENY SELECT ON [Departments].[Departments] TO [Panos_Chron] CASCADE;
DENY SELECT ON [Projects].[Projects] TO [Panos_Chron] CASCADE;
DENY SELECT ON [Employees].[Employees] TO [Panos_Chron] CASCADE;
DENY UNMASK ON [Companies].[Companies] TO [Panos_Chron] CASCADE;
DENY UNMASK ON [Locations].[Locations] TO [Panos_Chron] CASCADE;
DENY UNMASK ON [Departments].[Departments] TO [Panos_Chron] CASCADE;
DENY UNMASK ON [Projects].[Projects] TO [Panos_Chron] CASCADE;
DENY UNMASK ON [Employees].[Employees] TO [Panos_Chron] CASCADE;
END
GO
CREATE OR ALTER PROCEDURE [Users].[DeletionOfRoles] AS
BEGIN
DROP ROLE IF EXISTS [CompaniesRoles];
DROP ROLE IF EXISTS [LocationsRoles];
DROP ROLE IF EXISTS [DepartmentsRoles];
DROP ROLE IF EXISTS [ProjectsRoles];
DROP ROLE IF EXISTS [EmployeesRoles];
END
GO
CREATE OR ALTER PROCEDURE [Users].[DeletionOfUsers] AS
BEGIN
DROP USER IF EXISTS [Panos_Chron];
DROP USER IF EXISTS [Panos_Chron2];
END
GO
CREATE OR ALTER PROCEDURE [Users].[DeletionOfLogins] AS
BEGIN
DROP LOGIN [Panos_Chron];
DROP LOGIN [Panos_Chron2];
END
------------------------------
USE [Company_Project_T_SQL];
GO
EXECUTE [Users].[CreationOfLogins];
GO
EXECUTE [Users].[CreationOfUsers];
GO
EXECUTE [Users].[CreationOfRoles];
------------------------------
USE [Company_Project_T_SQL];
GO
CREATE SCHEMA [Companies];
GO
CREATE OR ALTER PROCEDURE [Companies].[CreationOfTablesCompanies] AS
BEGIN
CREATE TABLE [Companies].[Companies]
(
[CompanyID] INTEGER NOT NULL,--IDENTITY(1,1),
[CompanyName] VARCHAR(50) MASKED WITH (FUNCTION = 'Default()') NOT NULL,
[CompanyNameXML] XML MASKED WITH (FUNCTION = 'Default()') NOT NULL,
[CompanyNameJSON] NVARCHAR(MAX) MASKED WITH (FUNCTION = 'Default()') NOT NULL,
CONSTRAINT [CompanyID_PK] PRIMARY KEY CLUSTERED ([CompanyID] ASC),
CONSTRAINT [CompanyName_UNQ] UNIQUE ([CompanyName]),
CONSTRAINT [CompanyNameXML_CHK] CHECK (TRY_CONVERT(XML, [CompanyNameXML]) IS NOT NULL),
CONSTRAINT [CompanyNameJSON_CHK] CHECK (ISJSON([CompanyNameJSON]) > 0)
);

CREATE TABLE [Companies].[CompaniesLog]
(
[CompanyID] INTEGER NOT NULL,--IDENTITY(1,1),
[CompanyName] VARCHAR(50) MASKED WITH (FUNCTION = 'Default()') NOT NULL,
[DataManipulationLanguageStatement] VARCHAR(50) NOT NULL,
[TrackOfTransactions] DATETIMEOFFSET MASKED WITH (FUNCTION = 'Default()') NULL DEFAULT GETDATE(),
CONSTRAINT [DataManipulationLanguageStatement_CHK_Company] CHECK ([DataManipulationLanguageStatement] IN ('Insert Statement', 'Update Statement', 'Delete Statement'))
);
END
GO
CREATE OR ALTER PROCEDURE [Companies].[DeletionOfTablesCompanies] AS
BEGIN
DROP TABLE IF EXISTS [Companies].[CompaniesLog];
DROP TABLE IF EXISTS [Companies].[Companies];
END
------------------------------
USE [Company_Project_T_SQL];
GO
EXECUTE [Companies].[CreationOfTablesCompanies];
------------------------------
USE [Company_Project_T_SQL];
GO
CREATE OR ALTER TRIGGER [Companies].[CompaniesDMLStatements] ON [Companies].[Companies]
AFTER INSERT, UPDATE, DELETE AS
DECLARE
@CompanyID AS INTEGER, @CompanyName AS VARCHAR(50);
BEGIN
IF EXISTS (SELECT * FROM [Inserted]) AND NOT EXISTS (SELECT * FROM [Deleted]) 
BEGIN
SELECT  @CompanyID = [CompanyID], @CompanyName = [CompanyName] FROM [Inserted];
BEGIN TRANSACTION
INSERT INTO [Companies].[CompaniesLog]([CompanyID], [CompanyName], [DataManipulationLanguageStatement])
VALUES(@CompanyID, @CompanyName, 'Insert Statement');
COMMIT TRANSACTION
END
IF EXISTS (SELECT * FROM [Inserted]) AND EXISTS (SELECT * FROM [Deleted]) 
BEGIN
SELECT  @CompanyID = [Deleted].[CompanyID], @CompanyName = [Deleted].[CompanyName] FROM [Inserted], [Deleted];
BEGIN TRANSACTION
INSERT INTO [Companies].[CompaniesLog]([CompanyID], [CompanyName], [DataManipulationLanguageStatement])
VALUES(@CompanyID, @CompanyName, 'Update Statement');
COMMIT TRANSACTION
END
IF NOT EXISTS (SELECT * FROM [Inserted]) AND EXISTS (SELECT * FROM [Deleted]) 
BEGIN
SELECT  @CompanyID = [CompanyID], @CompanyName = [CompanyName] FROM [Deleted];
BEGIN TRANSACTION
INSERT INTO [Companies].[CompaniesLog]([CompanyID], [CompanyName], [DataManipulationLanguageStatement])
VALUES(@CompanyID, @CompanyName, 'Delete Statement');
COMMIT TRANSACTION
END
END
------------------------------
USE [Company_Project_T_SQL];
GO
CREATE OR ALTER PROCEDURE [Companies].[InsertUpdateDeleteOfCompanies](@OptionNumber AS INTEGER) AS
BEGIN
IF @OptionNumber = 1
BEGIN
BEGIN TRANSACTION
INSERT INTO [Companies].[Companies] ([CompanyID], [CompanyName], [CompanyNameXML], [CompanyNameJSON]) VALUES (1, 'Amazon', '<CompanyName>Amazon</CompanyName>', '{"CompanyName": "Amazon"}');
INSERT INTO [Companies].[Companies] ([CompanyID], [CompanyName], [CompanyNameXML], [CompanyNameJSON]) VALUES (2, 'Google', '<CompanyName>Google</CompanyName>', '{"CompanyName": "Google"}');
INSERT INTO [Companies].[Companies] ([CompanyID], [CompanyName], [CompanyNameXML], [CompanyNameJSON]) VALUES (3, 'Microsoft', '<CompanyName>Microsoft</CompanyName>', '{"CompanyName": "Microsoft"}');
INSERT INTO [Companies].[Companies] ([CompanyID], [CompanyName], [CompanyNameXML], [CompanyNameJSON]) VALUES (4, 'Apple', '<CompanyName>Apple</CompanyName>', '{"CompanyName": "Apple"}');
INSERT INTO [Companies].[Companies] ([CompanyID], [CompanyName], [CompanyNameXML], [CompanyNameJSON]) VALUES (5, 'Facebook', '<CompanyName>Facebook</CompanyName>', '{"CompanyName": "Facebook"}');
INSERT INTO [Companies].[Companies] ([CompanyID], [CompanyName], [CompanyNameXML], [CompanyNameJSON]) VALUES (6, 'Twitter', '<CompanyName>Twitter</CompanyName>', '{"CompanyName": "Twitter"}');
INSERT INTO [Companies].[Companies] ([CompanyID], [CompanyName], [CompanyNameXML], [CompanyNameJSON]) VALUES (7, 'IBM', '<CompanyName>IBM</CompanyName>', '{"CompanyName": "IBM"}');
INSERT INTO [Companies].[Companies] ([CompanyID], [CompanyName], [CompanyNameXML], [CompanyNameJSON]) VALUES (8, 'Intel', '<CompanyName>Intel</CompanyName>', '{"CompanyName": "Intel"}');
INSERT INTO [Companies].[Companies] ([CompanyID], [CompanyName], [CompanyNameXML], [CompanyNameJSON]) VALUES (9, 'Oracle', '<CompanyName>Oracle</CompanyName>', '{"CompanyName": "Oracle"}');
INSERT INTO [Companies].[Companies] ([CompanyID], [CompanyName], [CompanyNameXML], [CompanyNameJSON]) VALUES (10, 'Tesla', '<CompanyName>Tesla</CompanyName>', '{"CompanyName": "Tesla"}');
INSERT INTO [Companies].[Companies] ([CompanyID], [CompanyName], [CompanyNameXML], [CompanyNameJSON]) VALUES (11, 'Samsung', '<CompanyName>Samsung</CompanyName>', '{"CompanyName": "Samsung"}');
INSERT INTO [Companies].[Companies] ([CompanyID], [CompanyName], [CompanyNameXML], [CompanyNameJSON]) VALUES (12, 'Sony', '<CompanyName>Sony</CompanyName>', '{"CompanyName": "Sony"}');
INSERT INTO [Companies].[Companies] ([CompanyID], [CompanyName], [CompanyNameXML], [CompanyNameJSON]) VALUES (13, 'Nvidia', '<CompanyName>Nvidia</CompanyName>', '{"CompanyName": "Nvidia"}');
INSERT INTO [Companies].[Companies] ([CompanyID], [CompanyName], [CompanyNameXML], [CompanyNameJSON]) VALUES (14, 'Adobe', '<CompanyName>Adope</CompanyName>', '{"CompanyName": "Adope"}');
INSERT INTO [Companies].[Companies] ([CompanyID], [CompanyName], [CompanyNameXML], [CompanyNameJSON]) VALUES (15, 'Salesforce', '<CompanyName>Salesforce</CompanyName>', '{"CompanyName": "Salesforce"}');
INSERT INTO [Companies].[Companies] ([CompanyID], [CompanyName], [CompanyNameXML], [CompanyNameJSON]) VALUES (16, 'Alibaba', '<CompanyName>Alibaba</CompanyName>', '{"CompanyName": "Alibaba"}');
INSERT INTO [Companies].[Companies] ([CompanyID], [CompanyName], [CompanyNameXML], [CompanyNameJSON]) VALUES (17, 'Zoom', '<CompanyName>Zoom</CompanyName>', '{"CompanyName": "Zoom"}');
INSERT INTO [Companies].[Companies] ([CompanyID], [CompanyName], [CompanyNameXML], [CompanyNameJSON]) VALUES (18, 'Slack', '<CompanyName>Slack</CompanyName>', '{"CompanyName": "Slack"}');
INSERT INTO [Companies].[Companies] ([CompanyID], [CompanyName], [CompanyNameXML], [CompanyNameJSON]) VALUES (19, 'Spotify', '<CompanyName>Spotify</CompanyName>', '{"CompanyName": "Spotify"}');
INSERT INTO [Companies].[Companies] ([CompanyID], [CompanyName], [CompanyNameXML], [CompanyNameJSON]) VALUES (20, 'PayPal', '<CompanyName>Paypal</CompanyName>', '{"CompanyName": "Paypal"}');
INSERT INTO [Companies].[Companies] ([CompanyID], [CompanyName], [CompanyNameXML], [CompanyNameJSON]) VALUES (21, 'Netflix', '<CompanyName>Netflix</CompanyName>', '{"CompanyName": "Netflix"}');
INSERT INTO [Companies].[Companies] ([CompanyID], [CompanyName], [CompanyNameXML], [CompanyNameJSON]) VALUES (22, 'eBay', '<CompanyName>eBay</CompanyName>', '{"CompanyName": "eBay"}');
INSERT INTO [Companies].[Companies] ([CompanyID], [CompanyName], [CompanyNameXML], [CompanyNameJSON]) VALUES (23, 'LinkedIn', '<CompanyName>LinkedIn</CompanyName>', '{"CompanyName": "LinkedIn"}');
INSERT INTO [Companies].[Companies] ([CompanyID], [CompanyName], [CompanyNameXML], [CompanyNameJSON]) VALUES (24, 'Uber', '<CompanyName>Uber</CompanyName>', '{"CompanyName": "Uber"}');
INSERT INTO [Companies].[Companies] ([CompanyID], [CompanyName], [CompanyNameXML], [CompanyNameJSON]) VALUES (25, 'Lyft', '<CompanyName>Lyft</CompanyName>', '{"CompanyName": "Lyft"}');
INSERT INTO [Companies].[Companies] ([CompanyID], [CompanyName], [CompanyNameXML], [CompanyNameJSON]) VALUES (26, 'Shopify', '<CompanyName>Shopify</CompanyName>', '{"CompanyName": "Shopify"}');
INSERT INTO [Companies].[Companies] ([CompanyID], [CompanyName], [CompanyNameXML], [CompanyNameJSON]) VALUES (27, 'Square', '<CompanyName>Square</CompanyName>', '{"CompanyName": "Square"}');
INSERT INTO [Companies].[Companies] ([CompanyID], [CompanyName], [CompanyNameXML], [CompanyNameJSON]) VALUES (28, 'Dropbox', '<CompanyName>Dropbox</CompanyName>', '{"CompanyName": "Dropbox"}');
INSERT INTO [Companies].[Companies] ([CompanyID], [CompanyName], [CompanyNameXML], [CompanyNameJSON]) VALUES (29, 'Pinterest', '<CompanyName>Pinterest</CompanyName>', '{"CompanyName": "Pinterest"}');
INSERT INTO [Companies].[Companies] ([CompanyID], [CompanyName], [CompanyNameXML], [CompanyNameJSON]) VALUES (30, 'Reddit', '<CompanyName>Reddit</CompanyName>', '{"CompanyName": "Reddit"}');
COMMIT TRANSACTION
SELECT * FROM [Companies].[Companies];
SELECT * FROM [Companies].[CompaniesLog];
END
IF @OptionNumber = 2
BEGIN
BEGIN TRANSACTION
UPDATE [Companies].[Companies] SET [CompanyID] = 31
FROM [Companies].[Companies] WHERE [CompanyID] = 1;
COMMIT TRANSACTION
SELECT * FROM [Companies].[Companies];
SELECT * FROM [Companies].[CompaniesLog];
END
IF @OptionNumber = 3
BEGIN
BEGIN TRANSACTION
DELETE [Companies].[Companies] FROM [Companies].[Companies] WHERE [CompanyID] = 31;
COMMIT TRANSACTION
SELECT * FROM [Companies].[Companies];
SELECT * FROM [Companies].[CompaniesLog];
END
END
------------------------------
USE [Company_Project_T_SQL];
GO
CREATE SCHEMA [Locations];
GO
CREATE OR ALTER PROCEDURE [Locations].[CreationOfTablesLocations] AS
BEGIN
CREATE TABLE [Locations].[Locations]
(
[LocationID] INTEGER NOT NULL,--IDENTITY(1,1),
[LocationLatitude] FLOAT MASKED WITH (FUNCTION = 'Default()') NOT NULL,
[LocationLongitude] FLOAT MASKED WITH (FUNCTION = 'Default()') NOT NULL,
[GeographicalLocation] AS GEOGRAPHY::[Point]([LocationLatitude], [LocationLongitude], 4326) PERSISTED NOT NULL,
[CompanyID] INTEGER NOT NULL,
CONSTRAINT [LocationID_PK] PRIMARY KEY CLUSTERED ([LocationID] ASC),
CONSTRAINT [LocationLatitude_LocationLongitude_UNQ] UNIQUE ([LocationLatitude], [LocationLongitude]),
CONSTRAINT [CompanyID_FK] FOREIGN KEY ([CompanyID]) REFERENCES [Companies].[Companies] ([CompanyID]) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE [Locations].[LocationsLog]
(
[LocationID] INTEGER NOT NULL,--IDENTITY(1,1),
[LocationLatitude] FLOAT MASKED WITH (FUNCTION = 'Default()') NOT NULL,
[LocationLongitude] FLOAT MASKED WITH (FUNCTION = 'Default()') NOT NULL,
[GeographicalLocation] AS GEOGRAPHY::[Point]([LocationLatitude], [LocationLongitude], 4326) PERSISTED NOT NULL,
[CompanyID] INTEGER NOT NULL,
[DataManipulationLanguageStatement] VARCHAR(50) NOT NULL,
[TrackOfTransactions] DATETIMEOFFSET MASKED WITH (FUNCTION = 'Default()') NULL DEFAULT GETDATE(),
CONSTRAINT [DataManipulationLanguageStatement_CHK_Location] CHECK ([DataManipulationLanguageStatement] IN ('Insert Statement', 'Update Statement', 'Delete Statement'))
);
END
GO
CREATE OR ALTER PROCEDURE [Locations].[DeletionOfTablesLocations] AS
BEGIN
DROP TABLE IF EXISTS [Locations].[LocationsLog];
DROP TABLE IF EXISTS [Locations].[Locations];
END
------------------------------
USE [Company_Project_T_SQL];
GO
EXECUTE [Locations].[CreationOfTablesLocations];
------------------------------
USE [Company_Project_T_SQL];
GO
CREATE OR ALTER TRIGGER [Locations].[LocationsDMLStatements] ON [Locations].[Locations]
AFTER INSERT, UPDATE, DELETE AS
DECLARE
@LocationID AS INTEGER, @LocationLatitude AS FLOAT, @LocationLongitude AS FLOAT, @CompanyID AS INTEGER;
BEGIN
IF EXISTS (SELECT * FROM [Inserted]) AND NOT EXISTS (SELECT * FROM [Deleted]) 
BEGIN
SELECT  @LocationID = [LocationID], @LocationLatitude = [LocationLatitude], @LocationLongitude = [LocationLongitude], @CompanyID = [CompanyID] FROM [Inserted];
BEGIN TRANSACTION
INSERT INTO [Locations].[LocationsLog]([LocationID], [LocationLatitude], [LocationLongitude], [CompanyID], [DataManipulationLanguageStatement])
VALUES(@LocationID, @LocationLatitude, @LocationLongitude, @CompanyID, 'Insert Statement');
COMMIT TRANSACTION
END
IF EXISTS (SELECT * FROM [Inserted]) AND EXISTS (SELECT * FROM [Deleted]) AND (NOT UPDATE([CompanyID]))
BEGIN
SELECT  @LocationID = [Deleted].[LocationID], @LocationLatitude = [Deleted].[LocationLatitude], @LocationLongitude = [Deleted].[LocationLongitude], @CompanyID = [Inserted].[CompanyID] FROM [Inserted], [Deleted];
BEGIN TRANSACTION
INSERT INTO [Locations].[LocationsLog]([LocationID], [LocationLatitude], [LocationLongitude], [CompanyID], [DataManipulationLanguageStatement])
VALUES(@LocationID, @LocationLatitude, @LocationLongitude, @CompanyID, 'Update Statement');
COMMIT TRANSACTION
END
IF NOT EXISTS (SELECT * FROM [Inserted]) AND EXISTS (SELECT * FROM [Deleted]) 
BEGIN
SELECT  @LocationID = [LocationID], @LocationLatitude = [LocationLatitude], @LocationLongitude = [LocationLongitude], @CompanyID = [CompanyID] FROM [Deleted];
BEGIN TRANSACTION
INSERT INTO [Locations].[LocationsLog]([LocationID], [LocationLatitude], [LocationLongitude], [CompanyID], [DataManipulationLanguageStatement])
VALUES(@LocationID, @LocationLatitude, @LocationLongitude, @CompanyID, 'Delete Statement');
COMMIT TRANSACTION
END
END
------------------------------
USE [Company_Project_T_SQL];
GO
CREATE OR ALTER PROCEDURE [Locations].[InsertUpdateDeleteOfLocations](@OptionNumber AS INTEGER) AS
BEGIN
IF @OptionNumber = 1
BEGIN
BEGIN TRANSACTION
INSERT INTO [Locations].[Locations] ([LocationID], [LocationLatitude], [LocationLongitude], [CompanyID]) VALUES (1, 47.6062, -122.3321, 1);
INSERT INTO [Locations].[Locations] ([LocationID], [LocationLatitude], [LocationLongitude], [CompanyID]) VALUES (2, 37.7749, -122.4194, 2);
INSERT INTO [Locations].[Locations] ([LocationID], [LocationLatitude], [LocationLongitude], [CompanyID]) VALUES (3, 37.9838, 23.7275, 3);
INSERT INTO [Locations].[Locations] ([LocationID], [LocationLatitude], [LocationLongitude], [CompanyID]) VALUES (4, 37.3318, -122.0312, 4);
INSERT INTO [Locations].[Locations] ([LocationID], [LocationLatitude], [LocationLongitude], [CompanyID]) VALUES (5, 40.7128, -74.0060, 5);
INSERT INTO [Locations].[Locations] ([LocationID], [LocationLatitude], [LocationLongitude], [CompanyID]) VALUES (6, 51.5074, -0.1278, 6);
INSERT INTO [Locations].[Locations] ([LocationID], [LocationLatitude], [LocationLongitude], [CompanyID]) VALUES (7, 35.6895, 139.6917, 7);
INSERT INTO [Locations].[Locations] ([LocationID], [LocationLatitude], [LocationLongitude], [CompanyID]) VALUES (8, 48.8566, 2.3522, 8);
INSERT INTO [Locations].[Locations] ([LocationID], [LocationLatitude], [LocationLongitude], [CompanyID]) VALUES (9, 34.0522, -118.2437, 9);
INSERT INTO [Locations].[Locations] ([LocationID], [LocationLatitude], [LocationLongitude], [CompanyID]) VALUES (10, 41.9028, 12.4964, 10);
INSERT INTO [Locations].[Locations] ([LocationID], [LocationLatitude], [LocationLongitude], [CompanyID]) VALUES (11, 39.9042, 116.4074, 11);
INSERT INTO [Locations].[Locations] ([LocationID], [LocationLatitude], [LocationLongitude], [CompanyID]) VALUES (12, -33.8688, 151.2093, 12);
INSERT INTO [Locations].[Locations] ([LocationID], [LocationLatitude], [LocationLongitude], [CompanyID]) VALUES (13, 55.7558, 37.6173, 13);
INSERT INTO [Locations].[Locations] ([LocationID], [LocationLatitude], [LocationLongitude], [CompanyID]) VALUES (14, 39.7392, -104.9903, 14);
INSERT INTO [Locations].[Locations] ([LocationID], [LocationLatitude], [LocationLongitude], [CompanyID]) VALUES (15, -23.5505, -46.6333, 15);
INSERT INTO [Locations].[Locations] ([LocationID], [LocationLatitude], [LocationLongitude], [CompanyID]) VALUES (16, 40.7306, -73.9352, 16);
INSERT INTO [Locations].[Locations] ([LocationID], [LocationLatitude], [LocationLongitude], [CompanyID]) VALUES (17, 30.2672, -97.7431, 17);
INSERT INTO [Locations].[Locations] ([LocationID], [LocationLatitude], [LocationLongitude], [CompanyID]) VALUES (18, 36.1627, -86.7816, 18);
INSERT INTO [Locations].[Locations] ([LocationID], [LocationLatitude], [LocationLongitude], [CompanyID]) VALUES (19, 43.6510, -79.3470, 19);
INSERT INTO [Locations].[Locations] ([LocationID], [LocationLatitude], [LocationLongitude], [CompanyID]) VALUES (20, 52.5200, 13.4050, 20);
INSERT INTO [Locations].[Locations] ([LocationID], [LocationLatitude], [LocationLongitude], [CompanyID]) VALUES (21, 55.9533, -3.1883, 21);
INSERT INTO [Locations].[Locations] ([LocationID], [LocationLatitude], [LocationLongitude], [CompanyID]) VALUES (22, 60.1695, 24.9354, 22);
INSERT INTO [Locations].[Locations] ([LocationID], [LocationLatitude], [LocationLongitude], [CompanyID]) VALUES (23, 51.1657, 10.4515, 23);
INSERT INTO [Locations].[Locations] ([LocationID], [LocationLatitude], [LocationLongitude], [CompanyID]) VALUES (24, 35.6762, 139.6503, 24);
INSERT INTO [Locations].[Locations] ([LocationID], [LocationLatitude], [LocationLongitude], [CompanyID]) VALUES (25, -34.6037, -58.3816, 25);
INSERT INTO [Locations].[Locations] ([LocationID], [LocationLatitude], [LocationLongitude], [CompanyID]) VALUES (26, 23.8103, 90.4125, 26);
INSERT INTO [Locations].[Locations] ([LocationID], [LocationLatitude], [LocationLongitude], [CompanyID]) VALUES (27, 15.8700, 100.9925, 27);
INSERT INTO [Locations].[Locations] ([LocationID], [LocationLatitude], [LocationLongitude], [CompanyID]) VALUES (28, 48.1351, 11.5820, 28);
INSERT INTO [Locations].[Locations] ([LocationID], [LocationLatitude], [LocationLongitude], [CompanyID]) VALUES (29, 1.3521, 103.8198, 29);
INSERT INTO [Locations].[Locations] ([LocationID], [LocationLatitude], [LocationLongitude], [CompanyID]) VALUES (30, 39.9138, 116.4040, 30);
COMMIT TRANSACTION
SELECT * FROM [Locations].[Locations];
SELECT * FROM [Locations].[LocationsLog];
END
IF @OptionNumber = 2
BEGIN
BEGIN TRANSACTION
UPDATE [Locations].[Locations] SET [LocationID] = 31
FROM [Locations].[Locations] WHERE [LocationID] = 1;
COMMIT TRANSACTION
SELECT * FROM [Locations].[Locations];
SELECT * FROM [Locations].[LocationsLog];
END
IF @OptionNumber = 3
BEGIN
BEGIN TRANSACTION
DELETE [Locations].[Locations] FROM [Locations].[Locations] WHERE [LocationID] = 31;
COMMIT TRANSACTION
SELECT * FROM [Locations].[Locations];
SELECT * FROM [Locations].[LocationsLog];
END
END
------------------------------
USE [Company_Project_T_SQL];
GO
CREATE SCHEMA [Departments];
GO
CREATE OR ALTER PROCEDURE [Departments].[CreationOfTablesDepartments] AS
BEGIN
CREATE TABLE [Departments].[Departments]
(
[DepartmentID] INTEGER NOT NULL,--IDENTITY(1,1),
[DepartmentName] VARCHAR(50) MASKED WITH (FUNCTION = 'Default()') NOT NULL,
[DepartmentLocation] VARCHAR(50) MASKED WITH (FUNCTION = 'Default()') NOT NULL,
[LocationID] INTEGER NOT NULL,
CONSTRAINT [DepartmentID_PK] PRIMARY KEY CLUSTERED ([DepartmentID] ASC),
CONSTRAINT [DepartmentName_DepartmentLocation_UNQ] UNIQUE ([DepartmentName], [DepartmentLocation]),
CONSTRAINT [LocationID_FK] FOREIGN KEY ([LocationID]) REFERENCES [Locations].[Locations] ([LocationID]) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE [Departments].[DepartmentsLog]
(
[DepartmentID] INTEGER NOT NULL,--IDENTITY(1,1),
[DepartmentName] VARCHAR(50) MASKED WITH (FUNCTION = 'Default()') NOT NULL,
[DepartmentLocation] VARCHAR(50) MASKED WITH (FUNCTION = 'Default()') NOT NULL,
[LocationID] INTEGER NOT NULL,
[DataManipulationLanguageStatement] VARCHAR(50) NOT NULL,
[TrackOfTransactions] DATETIMEOFFSET MASKED WITH (FUNCTION = 'Default()') NULL DEFAULT GETDATE(),
CONSTRAINT [DataManipulationLanguageStatement_CHK_Department] CHECK ([DataManipulationLanguageStatement] IN ('Insert Statement', 'Update Statement', 'Delete Statement'))
);
END
GO
CREATE OR ALTER PROCEDURE [Departments].[DeletionOfTablesDepartments] AS
BEGIN
DROP TABLE IF EXISTS [Departments].[DepartmentsLog];
DROP TABLE IF EXISTS [Departments].[Departments];
END
------------------------------
USE [Company_Project_T_SQL];
GO
EXECUTE [Departments].[CreationOfTablesDepartments];
GO
ALTER TABLE [Departments].[Departments] ADD [DepartmentBudget] DECIMAL(7,2) MASKED WITH (FUNCTION = 'Default()') NULL;
GO
ALTER TABLE [Departments].[Departments] ADD CONSTRAINT [DepartmentBudget_CHK] CHECK ([DepartmentBudget] >= 10000.00 AND [DepartmentBudget] <= 50000.00);
GO
ALTER TABLE [Departments].[DepartmentsLog] ADD [DepartmentOldBudget] DECIMAL(7,2) NULL;
GO
ALTER TABLE [Departments].[DepartmentsLog] ADD [DepartmentNewBudget] DECIMAL(7,2) NULL;
------------------------------
USE [Company_Project_T_SQL];
GO
CREATE OR ALTER TRIGGER [Departments].[DepartmentsDMLStatements] ON [Departments].[Departments]
AFTER INSERT, UPDATE, DELETE AS
DECLARE
@DepartmentID AS INTEGER, @DepartmentName AS VARCHAR(50), @DepartmentLocation AS VARCHAR(50), @LocationID AS INTEGER, @DepartmentBudget AS DECIMAL(7,2),
@DepartmentOldBudget AS DECIMAL(7,2), @DepartmentNewBudget AS DECIMAL(7,2);
BEGIN
IF EXISTS (SELECT * FROM [Inserted]) AND NOT EXISTS (SELECT * FROM [Deleted]) 
BEGIN
SELECT  @DepartmentID = [DepartmentID], @DepartmentName = [DepartmentName], @DepartmentLocation = [DepartmentLocation], @LocationID = [LocationID], @DepartmentNewBudget = [DepartmentBudget] FROM [Inserted];
BEGIN TRANSACTION
INSERT INTO [Departments].[DepartmentsLog]([DepartmentID], [DepartmentName], [DepartmentLocation], [LocationID], [DataManipulationLanguageStatement], [DepartmentNewBudget])
VALUES(@DepartmentID, @DepartmentName, @DepartmentLocation, @LocationID, 'Insert Statement', @DepartmentNewBudget);
COMMIT TRANSACTION
END
IF EXISTS (SELECT * FROM [Inserted]) AND EXISTS (SELECT * FROM [Deleted]) AND (NOT UPDATE([LocationID])) 
BEGIN
SELECT  @DepartmentID = [Deleted].[DepartmentID], @DepartmentName = [Deleted].[DepartmentName], @DepartmentLocation = [Deleted].[DepartmentLocation], @LocationID = [Inserted].[LocationID], @DepartmentOldBudget = [Deleted].[DepartmentBudget], @DepartmentNewBudget = [Inserted].[DepartmentBudget] FROM [Inserted], [Deleted];
BEGIN TRANSACTION
INSERT INTO [Departments].[DepartmentsLog]([DepartmentID], [DepartmentName], [DepartmentLocation], [LocationID], [DataManipulationLanguageStatement], [DepartmentOldBudget], [DepartmentNewBudget])
VALUES(@DepartmentID, @DepartmentName, @DepartmentLocation, @LocationID, 'Update Statement', @DepartmentOldBudget, @DepartmentNewBudget);
COMMIT TRANSACTION
END
IF NOT EXISTS (SELECT * FROM [Inserted]) AND EXISTS (SELECT * FROM [Deleted]) 
BEGIN
SELECT  @DepartmentID = [DepartmentID], @DepartmentName = [DepartmentName], @DepartmentLocation = [DepartmentLocation], @LocationID = [LocationID] FROM [Deleted];
BEGIN TRANSACTION
INSERT INTO [Departments].[DepartmentsLog]([DepartmentID], [DepartmentName], [DepartmentLocation], [LocationID], [DataManipulationLanguageStatement])
VALUES(@DepartmentID, @DepartmentName, @DepartmentLocation, @LocationID, 'Delete Statement');
COMMIT TRANSACTION
END
END
------------------------------
USE [Company_Project_T_SQL];
GO
CREATE OR ALTER PROCEDURE [Departments].[InsertUpdateDeleteOfDepartments](@OptionNumber AS INTEGER) AS
BEGIN
IF @OptionNumber = 1
BEGIN
BEGIN TRANSACTION
INSERT INTO [Departments].[Departments] ([DepartmentID], [DepartmentName], [DepartmentLocation], [LocationID], [DepartmentBudget]) 
VALUES (1, 'Engineering', 'Seattle', 1, 30000.00);
INSERT INTO [Departments].[Departments] ([DepartmentID], [DepartmentName], [DepartmentLocation], [LocationID], [DepartmentBudget]) 
VALUES (2, 'Marketing', 'San Francisco', 2, 25000.00);
INSERT INTO [Departments].[Departments] ([DepartmentID], [DepartmentName], [DepartmentLocation], [LocationID], [DepartmentBudget]) 
VALUES (3, 'Product', 'Los Angeles', 3, 20000.00);
INSERT INTO [Departments].[Departments] ([DepartmentID], [DepartmentName], [DepartmentLocation], [LocationID], [DepartmentBudget]) 
VALUES (4, 'Design', 'Cupertino', 4, 15000.00);
INSERT INTO [Departments].[Departments] ([DepartmentID], [DepartmentName], [DepartmentLocation], [LocationID], [DepartmentBudget]) 
VALUES (5, 'HR', 'New York', 5, 18000.00);
INSERT INTO [Departments].[Departments] ([DepartmentID], [DepartmentName], [DepartmentLocation], [LocationID], [DepartmentBudget]) 
VALUES (6, 'Sales', 'London', 6, 20000.00);
INSERT INTO [Departments].[Departments] ([DepartmentID], [DepartmentName], [DepartmentLocation], [LocationID], [DepartmentBudget]) 
VALUES (7, 'Support', 'Tokyo', 7, 22000.00);
INSERT INTO [Departments].[Departments] ([DepartmentID], [DepartmentName], [DepartmentLocation], [LocationID], [DepartmentBudget]) 
VALUES (8, 'Research', 'Paris', 8, 18000.00);
INSERT INTO [Departments].[Departments] ([DepartmentID], [DepartmentName], [DepartmentLocation], [LocationID], [DepartmentBudget]) 
VALUES (9, 'Analytics', 'Berlin', 9, 17000.00);
INSERT INTO [Departments].[Departments] ([DepartmentID], [DepartmentName], [DepartmentLocation], [LocationID], [DepartmentBudget]) 
VALUES (10, 'Finance', 'Rome', 10, 20000.00);
INSERT INTO [Departments].[Departments] ([DepartmentID], [DepartmentName], [DepartmentLocation], [LocationID], [DepartmentBudget]) 
VALUES (11, 'Legal', 'Beijing', 11, 21000.00);
INSERT INTO [Departments].[Departments] ([DepartmentID], [DepartmentName], [DepartmentLocation], [LocationID], [DepartmentBudget]) 
VALUES (12, 'Customer Service', 'Sydney', 12, 17000.00);
INSERT INTO [Departments].[Departments] ([DepartmentID], [DepartmentName], [DepartmentLocation], [LocationID], [DepartmentBudget]) 
VALUES (13, 'Content', 'Moscow', 13, 18000.00);
INSERT INTO [Departments].[Departments] ([DepartmentID], [DepartmentName], [DepartmentLocation], [LocationID], [DepartmentBudget]) 
VALUES (14, 'Public Relations', 'Denver', 14, 15000.00);
INSERT INTO [Departments].[Departments] ([DepartmentID], [DepartmentName], [DepartmentLocation], [LocationID], [DepartmentBudget]) 
VALUES (15, 'Operations', 'S?o Paulo', 15, 25000.00);
INSERT INTO [Departments].[Departments] ([DepartmentID], [DepartmentName], [DepartmentLocation], [LocationID], [DepartmentBudget]) 
VALUES (16, 'Procurement', 'Austin', 16, 22000.00);
INSERT INTO [Departments].[Departments] ([DepartmentID], [DepartmentName], [DepartmentLocation], [LocationID], [DepartmentBudget]) 
VALUES (17, 'Quality Assurance', 'Nashville', 17, 20000.00);
INSERT INTO [Departments].[Departments] ([DepartmentID], [DepartmentName], [DepartmentLocation], [LocationID], [DepartmentBudget]) 
VALUES (18, 'Logistics', 'Toronto', 18, 23000.00);
INSERT INTO [Departments].[Departments] ([DepartmentID], [DepartmentName], [DepartmentLocation], [LocationID], [DepartmentBudget]) 
VALUES (19, 'Training', 'Montreal', 19, 18000.00);
INSERT INTO [Departments].[Departments] ([DepartmentID], [DepartmentName], [DepartmentLocation], [LocationID], [DepartmentBudget]) 
VALUES (20, 'Strategy', 'Hamburg', 20, 25000.00);
INSERT INTO [Departments].[Departments] ([DepartmentID], [DepartmentName], [DepartmentLocation], [LocationID], [DepartmentBudget]) 
VALUES (21, 'Compliance', 'Edinburgh', 21, 21000.00);
INSERT INTO [Departments].[Departments] ([DepartmentID], [DepartmentName], [DepartmentLocation], [LocationID], [DepartmentBudget]) 
VALUES (22, 'Business Development', 'Helsinki', 22, 22000.00);
INSERT INTO [Departments].[Departments] ([DepartmentID], [DepartmentName], [DepartmentLocation], [LocationID], [DepartmentBudget]) 
VALUES (23, 'Innovation', 'Berlin', 23, 23000.00);
INSERT INTO [Departments].[Departments] ([DepartmentID], [DepartmentName], [DepartmentLocation], [LocationID], [DepartmentBudget]) 
VALUES (24, 'IT', 'Tokyo', 24, 24000.00);
INSERT INTO [Departments].[Departments] ([DepartmentID], [DepartmentName], [DepartmentLocation], [LocationID], [DepartmentBudget]) 
VALUES (25, 'Facilities', 'Buenos Aires', 25, 22000.00);
INSERT INTO [Departments].[Departments] ([DepartmentID], [DepartmentName], [DepartmentLocation], [LocationID], [DepartmentBudget]) 
VALUES (26, 'Business Intelligence', 'Dhaka', 26, 26000.00);
INSERT INTO [Departments].[Departments] ([DepartmentID], [DepartmentName], [DepartmentLocation], [LocationID], [DepartmentBudget]) 
VALUES (27, 'User Experience', 'Bangkok', 27, 20000.00);
INSERT INTO [Departments].[Departments] ([DepartmentID], [DepartmentName], [DepartmentLocation], [LocationID], [DepartmentBudget]) 
VALUES (28, 'Cybersecurity', 'Munich', 28, 28000.00);
INSERT INTO [Departments].[Departments] ([DepartmentID], [DepartmentName], [DepartmentLocation], [LocationID], [DepartmentBudget]) 
VALUES (29, 'Data Science', 'Singapore', 29, 29000.00);
INSERT INTO [Departments].[Departments] ([DepartmentID], [DepartmentName], [DepartmentLocation], [LocationID], [DepartmentBudget]) 
VALUES (30, 'System Administration', 'Beijing', 30, 30000.00);
COMMIT TRANSACTION
SELECT * FROM [Departments].[Departments];
SELECT * FROM [Departments].[DepartmentsLog];
END
IF @OptionNumber = 2
BEGIN
BEGIN TRANSACTION
UPDATE [Departments].[Departments] SET [DepartmentID] = 31, [DepartmentBudget] = [DepartmentBudget] * 1.5
FROM [Departments].[Departments] WHERE [DepartmentID] = 1;
COMMIT TRANSACTION
SELECT * FROM [Departments].[Departments];
SELECT * FROM [Departments].[DepartmentsLog];
END
IF @OptionNumber = 3
BEGIN
BEGIN TRANSACTION
DELETE [Departments].[Departments] FROM [Departments].[Departments] WHERE [DepartmentID] = 31;
COMMIT TRANSACTION
SELECT * FROM [Departments].[Departments];
SELECT * FROM [Departments].[DepartmentsLog];
END
END
------------------------------
USE [Company_Project_T_SQL];
GO
CREATE SCHEMA [Projects];
GO
CREATE OR ALTER PROCEDURE [Projects].[CreationOfTablesProjects] AS
BEGIN
CREATE TABLE [Projects].[Projects]
(
[ProjectID] INTEGER NOT NULL,--IDENTITY(1,1), 
[ProjectName] VARCHAR(50) NOT NULL,
[ProjectBudget] DECIMAL(7,2) MASKED WITH (FUNCTION = 'Default()') NOT NULL,
[ProjectStartDate] DATE MASKED WITH (FUNCTION = 'Default()') NOT NULL,
[ProjectEndDate] DATE MASKED WITH (FUNCTION = 'Default()') NOT NULL,
CONSTRAINT [ProjectID_PK] PRIMARY KEY CLUSTERED ([ProjectID] ASC),
CONSTRAINT [ProjectName_UNQ] UNIQUE ([ProjectName]),
CONSTRAINT [ProjectBudget_CHK] CHECK ([ProjectBudget] BETWEEN 5000.00 AND 15000.00),
CONSTRAINT [ProjectStartDate_ProjectEndDate_CHK] CHECK ([ProjectStartDate] >= '2015-01-01' AND [ProjectEndDate] <= '2030-12-31')
);

CREATE TABLE [Projects].[ProjectsLog]
(
[ProjectID] INTEGER NOT NULL,--IDENTITY(1,1), 
[ProjectName] VARCHAR(50) NOT NULL,
[ProjectOldBudget] DECIMAL(7,2) MASKED WITH (FUNCTION = 'Default()') NULL,
[ProjectNewBudget] DECIMAL(7,2) MASKED WITH (FUNCTION = 'Default()') NULL,
[DataManipulationLanguageStatement] VARCHAR(50) NOT NULL,
[TrackOfTransactions] DATETIMEOFFSET MASKED WITH (FUNCTION = 'Default()') NULL DEFAULT GETDATE(),
CONSTRAINT [DataManipulationLanguageStatement_CHK_Project] CHECK ([DataManipulationLanguageStatement] IN ('Insert Statement', 'Update Statement', 'Delete Statement'))
);
END
GO
CREATE OR ALTER PROCEDURE [Projects].[DeletionOfTablesProjects] AS
BEGIN
DROP TABLE IF EXISTS [Projects].[ProjectsLog];
DROP TABLE IF EXISTS [Projects].[Projects];
END
------------------------------
USE [Company_Project_T_SQL];
GO
EXECUTE [Projects].[CreationOfTablesProjects];
------------------------------
USE [Company_Project_T_SQL];
GO
CREATE OR ALTER TRIGGER [Projects].[ProjectsDMLStatements] ON [Projects].[Projects]
AFTER INSERT, UPDATE, DELETE AS
DECLARE
@ProjectID AS INTEGER, @ProjectName AS VARCHAR(50), @ProjectOldBudget AS DECIMAL(7,2), @ProjectNewBudget AS DECIMAL(7,2);
BEGIN
IF EXISTS (SELECT * FROM [Inserted]) AND NOT EXISTS (SELECT * FROM [Deleted]) 
BEGIN
SELECT  @ProjectID = [ProjectID], @ProjectName = [ProjectName], @ProjectNewBudget = [ProjectBudget] FROM [Inserted];
BEGIN TRANSACTION
INSERT INTO [Projects].[ProjectsLog]([ProjectID], [ProjectName], [ProjectNewBudget], [DataManipulationLanguageStatement])
VALUES(@ProjectID, @ProjectName, @ProjectNewBudget, 'Insert Statement');
COMMIT TRANSACTION
END
IF EXISTS (SELECT * FROM [Inserted]) AND EXISTS (SELECT * FROM [Deleted])
BEGIN
SELECT  @ProjectID = [Deleted].[ProjectID], @ProjectName = [Deleted].[ProjectName], @ProjectOldBudget = [Deleted].[ProjectBudget], @ProjectNewBudget = [Inserted].[ProjectBudget] FROM [Inserted], [Deleted];
BEGIN TRANSACTION
INSERT INTO [Projects].[ProjectsLog]([ProjectID], [ProjectName], [ProjectOldBudget], [ProjectNewBudget], [DataManipulationLanguageStatement])
VALUES(@ProjectID, @ProjectName, @ProjectOldBudget, @ProjectNewBudget, 'Update Statement');
COMMIT TRANSACTION
END
IF NOT EXISTS (SELECT * FROM [Inserted]) AND EXISTS (SELECT * FROM [Deleted]) 
BEGIN
SELECT  @ProjectID = [ProjectID], @ProjectName = [ProjectName] FROM [Deleted];
BEGIN TRANSACTION
INSERT INTO [Projects].[ProjectsLog]([ProjectID], [ProjectName], [DataManipulationLanguageStatement])
VALUES(@ProjectID, @ProjectName, 'Delete Statement');
COMMIT TRANSACTION
END
END
------------------------------
USE [Company_Project_T_SQL];
GO
CREATE OR ALTER PROCEDURE [Projects].[InsertUpdateDeleteOfProjects](@OptionNumber AS INTEGER) AS
BEGIN
IF @OptionNumber = 1
BEGIN
BEGIN TRANSACTION
INSERT INTO [Projects].[Projects] ([ProjectID], [ProjectName], [ProjectBudget], [ProjectStartDate], [ProjectEndDate]) VALUES (1, 'Project Alpha', 10000.00, '2023-01-01', '2023-12-31');
INSERT INTO [Projects].[Projects] ([ProjectID], [ProjectName], [ProjectBudget], [ProjectStartDate], [ProjectEndDate]) VALUES (2, 'Project Beta', 15000.00, '2023-02-01', '2023-11-30');
INSERT INTO [Projects].[Projects] ([ProjectID], [ProjectName], [ProjectBudget], [ProjectStartDate], [ProjectEndDate]) VALUES (3, 'Project Gamma', 13000.00, '2023-01-15', '2023-11-15');
INSERT INTO [Projects].[Projects] ([ProjectID], [ProjectName], [ProjectBudget], [ProjectStartDate], [ProjectEndDate]) VALUES (4, 'Project Delta', 12000.00, '2023-03-01', '2023-10-01');
INSERT INTO [Projects].[Projects] ([ProjectID], [ProjectName], [ProjectBudget], [ProjectStartDate], [ProjectEndDate]) VALUES (5, 'Project Epsilon', 14000.00, '2023-04-01', '2023-09-01');
INSERT INTO [Projects].[Projects] ([ProjectID], [ProjectName], [ProjectBudget], [ProjectStartDate], [ProjectEndDate]) VALUES (6, 'Project Zeta', 11000.00, '2023-05-01', '2023-10-15');
INSERT INTO [Projects].[Projects] ([ProjectID], [ProjectName], [ProjectBudget], [ProjectStartDate], [ProjectEndDate]) VALUES (7, 'Project Eta', 15000.00, '2023-06-01', '2023-08-15');
INSERT INTO [Projects].[Projects] ([ProjectID], [ProjectName], [ProjectBudget], [ProjectStartDate], [ProjectEndDate]) VALUES (8, 'Project Theta', 8000.00, '2023-07-01', '2023-12-01');
INSERT INTO [Projects].[Projects] ([ProjectID], [ProjectName], [ProjectBudget], [ProjectStartDate], [ProjectEndDate]) VALUES (9, 'Project Iota', 9000.00, '2023-08-01', '2023-10-30');
INSERT INTO [Projects].[Projects] ([ProjectID], [ProjectName], [ProjectBudget], [ProjectStartDate], [ProjectEndDate]) VALUES (10, 'Project Kappa', 7500.00, '2023-09-01', '2023-12-31');
INSERT INTO [Projects].[Projects] ([ProjectID], [ProjectName], [ProjectBudget], [ProjectStartDate], [ProjectEndDate]) VALUES (11, 'Project Lambda', 7000.00, '2023-10-01', '2023-11-15');
INSERT INTO [Projects].[Projects] ([ProjectID], [ProjectName], [ProjectBudget], [ProjectStartDate], [ProjectEndDate]) VALUES (12, 'Project Mu', 6800.00, '2023-01-10', '2023-05-05');
INSERT INTO [Projects].[Projects] ([ProjectID], [ProjectName], [ProjectBudget], [ProjectStartDate], [ProjectEndDate]) VALUES (13, 'Project Nu', 13000.00, '2023-11-01', '2023-12-31');
INSERT INTO [Projects].[Projects] ([ProjectID], [ProjectName], [ProjectBudget], [ProjectStartDate], [ProjectEndDate]) VALUES (14, 'Project Xi', 5000.00, '2023-03-15', '2023-06-30');
INSERT INTO [Projects].[Projects] ([ProjectID], [ProjectName], [ProjectBudget], [ProjectStartDate], [ProjectEndDate]) VALUES (15, 'Project Omicron', 8500.00, '2023-06-15', '2023-12-15');
INSERT INTO [Projects].[Projects] ([ProjectID], [ProjectName], [ProjectBudget], [ProjectStartDate], [ProjectEndDate]) VALUES (16, 'Project Pi', 12500.00, '2023-07-10', '2023-11-01');
INSERT INTO [Projects].[Projects] ([ProjectID], [ProjectName], [ProjectBudget], [ProjectStartDate], [ProjectEndDate]) VALUES (17, 'Project Rho', 6000.00, '2023-08-01', '2023-09-01');
INSERT INTO [Projects].[Projects] ([ProjectID], [ProjectName], [ProjectBudget], [ProjectStartDate], [ProjectEndDate]) VALUES (18, 'Project Sigma', 15000.00, '2023-09-10', '2023-12-20');
INSERT INTO [Projects].[Projects] ([ProjectID], [ProjectName], [ProjectBudget], [ProjectStartDate], [ProjectEndDate]) VALUES (19, 'Project Tau', 9200.00, '2023-01-20', '2023-06-20');
INSERT INTO [Projects].[Projects] ([ProjectID], [ProjectName], [ProjectBudget], [ProjectStartDate], [ProjectEndDate]) VALUES (20, 'Project Upsilon', 11900.00, '2023-02-15', '2023-10-15');
INSERT INTO [Projects].[Projects] ([ProjectID], [ProjectName], [ProjectBudget], [ProjectStartDate], [ProjectEndDate]) VALUES (21, 'Project Phi', 14000.00, '2023-03-30', '2023-10-30');
INSERT INTO [Projects].[Projects] ([ProjectID], [ProjectName], [ProjectBudget], [ProjectStartDate], [ProjectEndDate]) VALUES (22, 'Project Chi', 12000.00, '2023-04-22', '2023-09-15');
INSERT INTO [Projects].[Projects] ([ProjectID], [ProjectName], [ProjectBudget], [ProjectStartDate], [ProjectEndDate]) VALUES (23, 'Project Psi', 7500.00, '2023-05-17', '2023-11-05');
INSERT INTO [Projects].[Projects] ([ProjectID], [ProjectName], [ProjectBudget], [ProjectStartDate], [ProjectEndDate]) VALUES (24, 'Project Omega', 11000.00, '2023-06-10', '2023-12-31');
INSERT INTO [Projects].[Projects] ([ProjectID], [ProjectName], [ProjectBudget], [ProjectStartDate], [ProjectEndDate]) VALUES (25, 'Project A1', 13500.00, '2023-07-15', '2023-12-01');
INSERT INTO [Projects].[Projects] ([ProjectID], [ProjectName], [ProjectBudget], [ProjectStartDate], [ProjectEndDate]) VALUES (26, 'Project B1', 9500.00, '2023-08-08', '2023-10-20');
INSERT INTO [Projects].[Projects] ([ProjectID], [ProjectName], [ProjectBudget], [ProjectStartDate], [ProjectEndDate]) VALUES (27, 'Project C1', 8300.00, '2023-09-12', '2023-12-10');
INSERT INTO [Projects].[Projects] ([ProjectID], [ProjectName], [ProjectBudget], [ProjectStartDate], [ProjectEndDate]) VALUES (28, 'Project D1', 10200.00, '2023-10-02', '2023-11-30');
INSERT INTO [Projects].[Projects] ([ProjectID], [ProjectName], [ProjectBudget], [ProjectStartDate], [ProjectEndDate]) VALUES (29, 'Project E1', 8900.00, '2023-11-25', '2023-12-31');
INSERT INTO [Projects].[Projects] ([ProjectID], [ProjectName], [ProjectBudget], [ProjectStartDate], [ProjectEndDate]) VALUES (30, 'Project F1', 12000.00, '2023-12-01', '2023-12-31');
COMMIT TRANSACTION
SELECT * FROM [Projects].[Projects];
SELECT * FROM [Projects].[ProjectsLog];
END
IF @OptionNumber = 2
BEGIN
BEGIN TRANSACTION
UPDATE [Projects].[Projects] SET [ProjectID] = 31, [ProjectBudget] = [ProjectBudget] - 5000.00
FROM [Projects].[Projects] WHERE [ProjectID] = 1;
COMMIT TRANSACTION
SELECT * FROM [Projects].[Projects];
SELECT * FROM [Projects].[ProjectsLog];
END
IF @OptionNumber = 3
BEGIN
BEGIN TRANSACTION
DELETE [Projects].[Projects] FROM [Projects].[Projects] WHERE [ProjectID] = 31;
COMMIT TRANSACTION
SELECT * FROM [Projects].[Projects];
SELECT * FROM [Projects].[ProjectsLog];
END
END
------------------------------
USE [Company_Project_T_SQL];
GO
CREATE SCHEMA [Employees];
GO
CREATE OR ALTER PROCEDURE [Employees].[CreationOfTablesEmployees] AS
BEGIN
CREATE TABLE [Employees].[Employees]
(
[EmployeeID] INTEGER NOT NULL,--IDENTITY(1,1), 
[EmployeeFirstName] VARCHAR(50) NOT NULL,
[EmployeeMiddleName] VARCHAR(50) NULL DEFAULT '',
[EmployeeLastName] VARCHAR(50) NOT NULL,
[EmployeeSex] VARCHAR(50) NOT NULL,
[EmployeeSalary] DECIMAL(7,2) MASKED WITH (FUNCTION = 'Default()') NOT NULL,
[EmployeeYearOfRecruitment] DATE NOT NULL,
[EmployeeLevelOfEducation] VARCHAR(50) NOT NULL,
[EmployeeSpeciality] VARCHAR(50) NOT NULL,
[EmployeeExperience] VARCHAR(50) NOT NULL,
[EmployeeCountry] VARCHAR(50) MASKED WITH (FUNCTION = 'Default()') NOT NULL,
[EmployeeTown] VARCHAR(50) MASKED WITH (FUNCTION = 'Default()') NOT NULL,
[EmployeeAddress] VARCHAR(50) MASKED WITH (FUNCTION = 'Default()') NOT NULL,
[EmployeePhoneNumber] VARCHAR(50) MASKED WITH (FUNCTION = 'Default()') NOT NULL,
[EmployeeFamilySituation] VARCHAR(50) MASKED WITH (FUNCTION = 'Default()') NOT NULL,
[EmployeeNumberOfChildren] INTEGER MASKED WITH (FUNCTION = 'Default()') NULL DEFAULT 0,
[DepartmentID] INTEGER NOT NULL,
[ProjectID] INTEGER NOT NULL,
CONSTRAINT [EmployeeID_PK] PRIMARY KEY CLUSTERED ([EmployeeID] ASC),
CONSTRAINT [EmployeeFirstName_EmployeeLastName_UNQ] UNIQUE ([EmployeeFirstName], [EmployeeLastName]),
CONSTRAINT [EmployeeSex_CHK] CHECK ([EmployeeSex] IN ('Male', 'Female')),
CONSTRAINT [EmployeeSalary_CHK] CHECK ([EmployeeSalary] BETWEEN 1000.00 AND 10000.00),
CONSTRAINT [EmployeeYearOfRecruitment_CHK] CHECK ([EmployeeYearOfRecruitment] >= '2015-01-01' AND [EmployeeYearOfRecruitment] <= '2030-12-31'),
CONSTRAINT [EmployeeLevelOfEducation_CHK] CHECK ([EmployeeLevelOfEducation] IN ('Bachelor''s Degree', 'Master''s Degree', 'PhD')),
CONSTRAINT [EmployeeSpeciality_CHK] CHECK ([EmployeeSpeciality] IN ('Full Stack Developer', 'Front End Developer', 'Back End Developer', 'Data Analyst', 'Business Analyst', 'QA Engineer', 'HR Manager', 'DevOps Engineer', 'Data Engineer', 'Database Administrator', 'DevSecOps Engineer', 'Data Scientist', 'SQL Developer', 'PL/SQL Developer', 'Technical Support Engineer', 'Project Manager')),
CONSTRAINT [EmployeeExperience_CHK] CHECK ([EmployeeExperience] IN ('Intership', 'Entry Level', 'Associate', 'Mid-Senior Level','Director', 'Executive')),
CONSTRAINT [EmployeePhoneNumber_CHK] CHECK (LEN ([EmployeePhoneNumber]) = 10),
CONSTRAINT [EmployeeFamilySituation_CHK] CHECK ([EmployeeFamilySituation] IN ('UnMarried', 'Married')),
CONSTRAINT [DepartmentID_FK] FOREIGN KEY ([DepartmentID]) REFERENCES [Departments].[Departments] ([DepartmentID]) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT [ProjectID_FK] FOREIGN KEY ([ProjectID]) REFERENCES [Projects].[Projects] ([ProjectID]) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE [Employees].[EmployeesLog]
(
[EmployeeID] INTEGER NOT NULL,--IDENTITY(1,1), 
[EmployeeFirstName] VARCHAR(50) NOT NULL,
[EmployeeMiddleName] VARCHAR(50) NULL DEFAULT '',
[EmployeeLastName] VARCHAR(50) NOT NULL,
[EmployeeOldSalary] DECIMAL(7,2) MASKED WITH (FUNCTION = 'Default()') NULL,
[EmployeeNewSalary] DECIMAL(7,2) MASKED WITH (FUNCTION = 'Default()') NULL,
[DepartmentID] INTEGER NOT NULL,
[ProjectID] INTEGER NOT NULL,
[DataManipulationLanguageStatement] VARCHAR(50) NOT NULL,
[TrackOfTransactions] DATETIMEOFFSET MASKED WITH (FUNCTION = 'Default()') NULL DEFAULT GETDATE(),
CONSTRAINT [DataManipulationLanguageStatement_CHK_Employee] CHECK ([DataManipulationLanguageStatement] IN ('Insert Statement', 'Update Statement', 'Delete Statement'))
);
END
GO
CREATE OR ALTER PROCEDURE [Employees].[DeletionOfTablesEmployees] AS
BEGIN
DROP TABLE IF EXISTS [Employees].[EmployeesLog];
DROP TABLE IF EXISTS [Employees].[Employees];
END
------------------------------
USE [Company_Project_T_SQL];
GO
EXECUTE [Employees].[CreationOfTablesEmployees];
GO
ALTER TABLE [Employees].[Employees] ADD CONSTRAINT [EmployeeNumberOfChildren_CHK] CHECK ([EmployeeNumberOfChildren] >= 0);
GO
EXECUTE [Users].[AddPrivilegesToUsers];
GO
EXECUTE [Users].[GivePrivilegesToUsers];
------------------------------
USE [Company_Project_T_SQL];
GO
CREATE OR ALTER TRIGGER [Employees].[EmployeesDMLStatements] ON [Employees].[Employees]
AFTER INSERT, UPDATE, DELETE AS
DECLARE
@EmployeeID AS INTEGER, @EmployeeFirstName AS VARCHAR(50), @EmployeeMiddleName AS VARCHAR(50), @EmployeeLastName AS VARCHAR(50), @EmployeeOldSalary AS DECIMAL(7,2), @EmployeeNewSalary AS DECIMAL(7,2), @DepartmentID AS INTEGER, @ProjectID AS INTEGER;
BEGIN
IF EXISTS (SELECT * FROM [Inserted]) AND NOT EXISTS (SELECT * FROM [Deleted]) 
BEGIN
SELECT @EmployeeID = [EmployeeID], @EmployeeFirstName = [EmployeeFirstName], @EmployeeLastName = [EmployeeLastName], @EmployeeNewSalary = [EmployeeSalary], @DepartmentID = [DepartmentID], @ProjectID = [ProjectID] FROM [Inserted];
BEGIN TRANSACTION
INSERT INTO [Employees].[EmployeesLog]([EmployeeID], [EmployeeFirstName], [EmployeeLastName], [EmployeeNewSalary], [DepartmentID], [ProjectID], [DataManipulationLanguageStatement])
VALUES(@EmployeeID, @EmployeeFirstName, @EmployeeLastName, @EmployeeNewSalary, @DepartmentID, @ProjectID, 'Insert Statement');
COMMIT TRANSACTION
END
IF EXISTS (SELECT * FROM [Inserted]) AND EXISTS (SELECT * FROM [Deleted]) AND (NOT UPDATE([DepartmentID])) AND (NOT UPDATE([ProjectID]))
BEGIN
SELECT @EmployeeID = [Deleted].[EmployeeID], @EmployeeFirstName = [Deleted].[EmployeeFirstName], @EmployeeLastName = [Deleted].[EmployeeLastName], @EmployeeOldSalary = [Deleted].[EmployeeSalary], @EmployeeNewSalary = [Inserted].[EmployeeSalary], @DepartmentID = [Inserted].[DepartmentID], @ProjectID = [Inserted].[ProjectID] FROM [Inserted], [Deleted];
BEGIN TRANSACTION
INSERT INTO [Employees].[EmployeesLog]([EmployeeID], [EmployeeFirstName], [EmployeeLastName], [EmployeeOldSalary], [EmployeeNewSalary], [DepartmentID], [ProjectID], [DataManipulationLanguageStatement])
VALUES(@EmployeeID, @EmployeeFirstName, @EmployeeLastName, @EmployeeOldSalary, @EmployeeNewSalary, @DepartmentID, @ProjectID, 'Update Statement');
COMMIT TRANSACTION
END
IF NOT EXISTS (SELECT * FROM [Inserted]) AND EXISTS (SELECT * FROM [Deleted]) 
BEGIN
SELECT @EmployeeID = [EmployeeID], @EmployeeFirstName = [EmployeeFirstName], @EmployeeLastName = [EmployeeLastName], @DepartmentID = [DepartmentID], @ProjectID = [ProjectID] FROM [Deleted];
BEGIN TRANSACTION
INSERT INTO [Employees].[EmployeesLog]([EmployeeID], [EmployeeFirstName], [EmployeeLastName], [DepartmentID], [ProjectID], [DataManipulationLanguageStatement])
VALUES(@EmployeeID, @EmployeeFirstName, @EmployeeLastName, @DepartmentID, @ProjectID, 'Delete Statement');
COMMIT TRANSACTION
END
END
------------------------------
USE [Company_Project_T_SQL];
GO
CREATE OR ALTER PROCEDURE [Employees].[InsertUpdateDeleteOfEmployees](@OptionNumber AS INTEGER) AS
BEGIN
IF @OptionNumber = 1
BEGIN
BEGIN TRANSACTION
INSERT INTO [Employees].[Employees] ([EmployeeID], [EmployeeFirstName], [EmployeeMiddleName], [EmployeeLastName], [EmployeeSex], [EmployeeSalary], [EmployeeYearOfRecruitment], [EmployeeLevelOfEducation], [EmployeeSpeciality], [EmployeeExperience], [EmployeeCountry], [EmployeeTown], [EmployeeAddress], [EmployeePhoneNumber], [EmployeeFamilySituation], [EmployeeNumberOfChildren], [DepartmentID], [ProjectID]) VALUES (1, 'John', 'A.', 'Doe', 'Male', 5000.00, '2020-01-15', 'Bachelor''s Degree', 'Full Stack Developer', 'Entry Level', 'USA', 'Seattle', '123 Elm St', '1234567890', 'Married',0 , 1, 1);
INSERT INTO [Employees].[Employees] ([EmployeeID], [EmployeeFirstName], [EmployeeMiddleName], [EmployeeLastName], [EmployeeSex], [EmployeeSalary], [EmployeeYearOfRecruitment], [EmployeeLevelOfEducation], [EmployeeSpeciality], [EmployeeExperience], [EmployeeCountry], [EmployeeTown], [EmployeeAddress], [EmployeePhoneNumber], [EmployeeFamilySituation], [EmployeeNumberOfChildren], [DepartmentID], [ProjectID]) VALUES (2, 'Jane', 'B.', 'Smith', 'Female', 6000.00, '2019-02-16', 'Master''s Degree', 'Data Analyst', 'Associate', 'USA', 'San Francisco', '456 Oak St', '2345678901', 'Married', 0, 2, 2);
INSERT INTO [Employees].[Employees] ([EmployeeID], [EmployeeFirstName], [EmployeeMiddleName], [EmployeeLastName], [EmployeeSex], [EmployeeSalary], [EmployeeYearOfRecruitment], [EmployeeLevelOfEducation], [EmployeeSpeciality], [EmployeeExperience], [EmployeeCountry], [EmployeeTown], [EmployeeAddress], [EmployeePhoneNumber], [EmployeeFamilySituation], [EmployeeNumberOfChildren], [DepartmentID], [ProjectID]) VALUES (3, 'Chris', 'C.', 'Johnson', 'Male', 4000.00, '2021-03-14', 'Bachelor''s Degree', 'Business Analyst', 'Mid-Senior Level', 'USA', 'Los Angeles', '789 Pine St', '3456789012', 'UnMarried', 0, 3, 3);
INSERT INTO [Employees].[Employees] ([EmployeeID], [EmployeeFirstName], [EmployeeMiddleName], [EmployeeLastName], [EmployeeSex], [EmployeeSalary], [EmployeeYearOfRecruitment], [EmployeeLevelOfEducation], [EmployeeSpeciality], [EmployeeExperience], [EmployeeCountry], [EmployeeTown], [EmployeeAddress], [EmployeePhoneNumber], [EmployeeFamilySituation], [EmployeeNumberOfChildren], [DepartmentID], [ProjectID]) VALUES (4, 'Emily', 'D.', 'Williams', 'Female', 7000.00, '2018-04-18', 'PhD', 'Data Scientist', 'Director', 'USA', 'Cupertino', '321 Birch St', '4567890123', 'Married', 1, 2, 4);
INSERT INTO [Employees].[Employees] ([EmployeeID], [EmployeeFirstName], [EmployeeMiddleName], [EmployeeLastName], [EmployeeSex], [EmployeeSalary], [EmployeeYearOfRecruitment], [EmployeeLevelOfEducation], [EmployeeSpeciality], [EmployeeExperience], [EmployeeCountry], [EmployeeTown], [EmployeeAddress], [EmployeePhoneNumber], [EmployeeFamilySituation], [EmployeeNumberOfChildren], [DepartmentID], [ProjectID]) VALUES (5, 'Michael', 'E.', 'Brown', 'Male', 8500.00, '2020-07-01', 'Master''s Degree', 'Project Manager', 'Mid-Senior Level', 'USA', 'New York', '654 Cedar St', '5678901234', 'Married', 2, 3, 5);
INSERT INTO [Employees].[Employees] ([EmployeeID], [EmployeeFirstName], [EmployeeMiddleName], [EmployeeLastName], [EmployeeSex], [EmployeeSalary], [EmployeeYearOfRecruitment], [EmployeeLevelOfEducation], [EmployeeSpeciality], [EmployeeExperience], [EmployeeCountry], [EmployeeTown], [EmployeeAddress], [EmployeePhoneNumber], [EmployeeFamilySituation], [EmployeeNumberOfChildren], [DepartmentID], [ProjectID]) VALUES (6, 'Jessica', 'F.', 'Jones', 'Female', 7500.00, '2017-10-11', 'Master''s Degree', 'QA Engineer', 'Associate', 'USA', 'London', '987 Spruce St', '6789012345', 'UnMarried', 0, 6, 6);
INSERT INTO [Employees].[Employees] ([EmployeeID], [EmployeeFirstName], [EmployeeMiddleName], [EmployeeLastName], [EmployeeSex], [EmployeeSalary], [EmployeeYearOfRecruitment], [EmployeeLevelOfEducation], [EmployeeSpeciality], [EmployeeExperience], [EmployeeCountry], [EmployeeTown], [EmployeeAddress], [EmployeePhoneNumber], [EmployeeFamilySituation], [EmployeeNumberOfChildren], [DepartmentID], [ProjectID]) VALUES (7, 'Matthew', 'G.', 'Miller', 'Male', 9000.00, '2016-09-25', 'PhD', 'DevOps Engineer', 'Executive', 'USA', 'Tokyo', '135 Maple St', '7890123456', 'Married', 3, 4, 7);
INSERT INTO [Employees].[Employees] ([EmployeeID], [EmployeeFirstName], [EmployeeMiddleName], [EmployeeLastName], [EmployeeSex], [EmployeeSalary], [EmployeeYearOfRecruitment], [EmployeeLevelOfEducation], [EmployeeSpeciality], [EmployeeExperience], [EmployeeCountry], [EmployeeTown], [EmployeeAddress], [EmployeePhoneNumber], [EmployeeFamilySituation], [EmployeeNumberOfChildren], [DepartmentID], [ProjectID]) VALUES (8, 'Sarah', 'H.', 'Davis', 'Female', 5600.00, '2019-01-04', 'Bachelor''s Degree', 'Front End Developer', 'Entry Level', 'USA', 'Paris', '246 Fir St', '8901234567', 'UnMarried', 0, 8, 8);
INSERT INTO [Employees].[Employees] ([EmployeeID], [EmployeeFirstName], [EmployeeMiddleName], [EmployeeLastName], [EmployeeSex], [EmployeeSalary], [EmployeeYearOfRecruitment], [EmployeeLevelOfEducation], [EmployeeSpeciality], [EmployeeExperience], [EmployeeCountry], [EmployeeTown], [EmployeeAddress], [EmployeePhoneNumber], [EmployeeFamilySituation], [EmployeeNumberOfChildren], [DepartmentID], [ProjectID]) VALUES (9, 'David', 'I.', 'Garcia', 'Male', 4200.00, '2020-02-17', 'Bachelor''s Degree', 'Back End Developer', 'Mid-Senior Level', 'USA', 'Berlin', '357 Elm St', '9012345678', 'Married', 4, 1, 9);
INSERT INTO [Employees].[Employees] ([EmployeeID], [EmployeeFirstName], [EmployeeMiddleName], [EmployeeLastName], [EmployeeSex], [EmployeeSalary], [EmployeeYearOfRecruitment], [EmployeeLevelOfEducation], [EmployeeSpeciality], [EmployeeExperience], [EmployeeCountry], [EmployeeTown], [EmployeeAddress], [EmployeePhoneNumber], [EmployeeFamilySituation], [EmployeeNumberOfChildren], [DepartmentID], [ProjectID]) VALUES (10, 'Emily', 'J.', 'Martinez', 'Female', 7500.00, '2020-08-05', 'Bachelor''s Degree', 'Full Stack Developer', 'Mid-Senior Level', 'USA', 'Rome', '147 Walnut St', '0123456789', 'UnMarried', 0, 10, 10);
INSERT INTO [Employees].[Employees] ([EmployeeID], [EmployeeFirstName], [EmployeeMiddleName], [EmployeeLastName], [EmployeeSex], [EmployeeSalary], [EmployeeYearOfRecruitment], [EmployeeLevelOfEducation], [EmployeeSpeciality], [EmployeeExperience], [EmployeeCountry], [EmployeeTown], [EmployeeAddress], [EmployeePhoneNumber], [EmployeeFamilySituation], [EmployeeNumberOfChildren], [DepartmentID], [ProjectID]) VALUES (11, 'Kevin', 'K.', 'Hernandez', 'Male', 6800.00, '2021-10-09', 'PhD', 'Data Engineer', 'Associate', 'USA', 'Beijing', '258 Chestnut St', '2345678905', 'Married', 1, 1, 11);
INSERT INTO [Employees].[Employees] ([EmployeeID], [EmployeeFirstName], [EmployeeMiddleName], [EmployeeLastName], [EmployeeSex], [EmployeeSalary], [EmployeeYearOfRecruitment], [EmployeeLevelOfEducation], [EmployeeSpeciality], [EmployeeExperience], [EmployeeCountry], [EmployeeTown], [EmployeeAddress], [EmployeePhoneNumber], [EmployeeFamilySituation], [EmployeeNumberOfChildren], [DepartmentID], [ProjectID]) VALUES (12, 'Nancy', 'L.', 'Lee', 'Female', 5200.00, '2019-02-14', 'Master''s Degree', 'Database Administrator', 'Mid-Senior Level', 'Canada', 'Toronto', '369 Ash St', '3456789010', 'Married', 5, 3, 12);
INSERT INTO [Employees].[Employees] ([EmployeeID], [EmployeeFirstName], [EmployeeMiddleName], [EmployeeLastName], [EmployeeSex], [EmployeeSalary], [EmployeeYearOfRecruitment], [EmployeeLevelOfEducation], [EmployeeSpeciality], [EmployeeExperience], [EmployeeCountry], [EmployeeTown], [EmployeeAddress], [EmployeePhoneNumber], [EmployeeFamilySituation], [EmployeeNumberOfChildren], [DepartmentID], [ProjectID]) VALUES (13, 'George', 'M.', 'Wilson', 'Male', 9300.00, '2020-06-12', 'PhD', 'Technical Support Engineer', 'Director', 'UK', 'London', '987 Cypress St', '4321098765', 'Married', 1, 2, 13);
INSERT INTO [Employees].[Employees] ([EmployeeID], [EmployeeFirstName], [EmployeeMiddleName], [EmployeeLastName], [EmployeeSex], [EmployeeSalary], [EmployeeYearOfRecruitment], [EmployeeLevelOfEducation], [EmployeeSpeciality], [EmployeeExperience], [EmployeeCountry], [EmployeeTown], [EmployeeAddress], [EmployeePhoneNumber], [EmployeeFamilySituation], [EmployeeNumberOfChildren], [DepartmentID], [ProjectID]) VALUES (14, 'Betty', 'N.', 'Anderson', 'Female', 4600.00, '2021-07-30', 'Bachelor''s Degree', 'HR Manager', 'Entry Level', 'Canada', 'Montreal', '123 Spruce St', '5432109876', 'Married', 0, 1, 14);
INSERT INTO [Employees].[Employees] ([EmployeeID], [EmployeeFirstName], [EmployeeMiddleName], [EmployeeLastName], [EmployeeSex], [EmployeeSalary], [EmployeeYearOfRecruitment], [EmployeeLevelOfEducation], [EmployeeSpeciality], [EmployeeExperience], [EmployeeCountry], [EmployeeTown], [EmployeeAddress], [EmployeePhoneNumber], [EmployeeFamilySituation], [EmployeeNumberOfChildren], [DepartmentID], [ProjectID]) VALUES (15, 'Angela', 'O.', 'Thomas', 'Female', 4700.00, '2022-01-15', 'Master''s Degree', 'Data Scientist', 'Associate', 'USA', 'Chicago', '654 River St', '8642097531', 'Married', 0, 15, 15);
INSERT INTO [Employees].[Employees] ([EmployeeID], [EmployeeFirstName], [EmployeeMiddleName], [EmployeeLastName], [EmployeeSex], [EmployeeSalary], [EmployeeYearOfRecruitment], [EmployeeLevelOfEducation], [EmployeeSpeciality], [EmployeeExperience], [EmployeeCountry], [EmployeeTown], [EmployeeAddress], [EmployeePhoneNumber], [EmployeeFamilySituation], [EmployeeNumberOfChildren], [DepartmentID], [ProjectID]) VALUES (16, 'Austin', 'P.', 'Martin', 'Male', 5800.00, '2023-01-05', 'Bachelor''s Degree', 'DevSecOps Engineer', 'Entry Level', 'USA', 'San Diego', '456 Sunset Blvd', '6812465790', 'UnMarried', 0, 16, 16);
INSERT INTO [Employees].[Employees] ([EmployeeID], [EmployeeFirstName], [EmployeeMiddleName], [EmployeeLastName], [EmployeeSex], [EmployeeSalary], [EmployeeYearOfRecruitment], [EmployeeLevelOfEducation], [EmployeeSpeciality], [EmployeeExperience], [EmployeeCountry], [EmployeeTown], [EmployeeAddress], [EmployeePhoneNumber], [EmployeeFamilySituation], [EmployeeNumberOfChildren], [DepartmentID], [ProjectID]) VALUES (17, 'Laura', 'Q.', 'Young', 'Female', 4000.00, '2021-03-12', 'Master''s Degree', 'Database Administrator', 'Mid-Senior Level', 'Canada', 'Victoria', '129 Pacific St', '7984561230', 'Married', 2, 2, 17);
INSERT INTO [Employees].[Employees] ([EmployeeID], [EmployeeFirstName], [EmployeeMiddleName], [EmployeeLastName], [EmployeeSex], [EmployeeSalary], [EmployeeYearOfRecruitment], [EmployeeLevelOfEducation], [EmployeeSpeciality], [EmployeeExperience], [EmployeeCountry], [EmployeeTown], [EmployeeAddress], [EmployeePhoneNumber], [EmployeeFamilySituation], [EmployeeNumberOfChildren], [DepartmentID], [ProjectID]) VALUES (18, 'David', 'B.', 'Wright', 'Male', 8800.00, '2022-05-19', 'PhD', 'QA Engineer', 'Director', 'UK', 'Birmingham', '318 Queen St', '5672348910', 'UnMarried', 0, 18, 18);
INSERT INTO [Employees].[Employees] ([EmployeeID], [EmployeeFirstName], [EmployeeMiddleName], [EmployeeLastName], [EmployeeSex], [EmployeeSalary], [EmployeeYearOfRecruitment], [EmployeeLevelOfEducation], [EmployeeSpeciality], [EmployeeExperience], [EmployeeCountry], [EmployeeTown], [EmployeeAddress], [EmployeePhoneNumber], [EmployeeFamilySituation], [EmployeeNumberOfChildren], [DepartmentID], [ProjectID]) VALUES (19, 'Clara', 'C.', 'Scott', 'Female', 9600.00, '2021-10-30', 'Master''s Degree', 'HR Manager', 'Executive', 'Canada', 'Montreal', '113 Thames St', '8901234567', 'UnMarried', 0, 19, 19);
INSERT INTO [Employees].[Employees] ([EmployeeID], [EmployeeFirstName], [EmployeeMiddleName], [EmployeeLastName], [EmployeeSex], [EmployeeSalary], [EmployeeYearOfRecruitment], [EmployeeLevelOfEducation], [EmployeeSpeciality], [EmployeeExperience], [EmployeeCountry], [EmployeeTown], [EmployeeAddress], [EmployeePhoneNumber], [EmployeeFamilySituation], [EmployeeNumberOfChildren], [DepartmentID], [ProjectID]) VALUES (20, 'Robert', 'R.', 'Johnson', 'Male', 6300.00, '2021-11-22', 'Bachelor''s Degree', 'Front End Developer', 'Mid-Senior Level', 'USA', 'Seattle', '222 Sunset Rd', '2345678902', 'Married', 3, 2, 20);
INSERT INTO [Employees].[Employees] ([EmployeeID], [EmployeeFirstName], [EmployeeMiddleName], [EmployeeLastName], [EmployeeSex], [EmployeeSalary], [EmployeeYearOfRecruitment], [EmployeeLevelOfEducation], [EmployeeSpeciality], [EmployeeExperience], [EmployeeCountry], [EmployeeTown], [EmployeeAddress], [EmployeePhoneNumber], [EmployeeFamilySituation], [EmployeeNumberOfChildren], [DepartmentID], [ProjectID]) VALUES (21, 'Thomas', 'T.', 'Harris', 'Male', 7200.00, '2022-03-15', 'Master''s Degree', 'Data Analyst', 'Associate', 'UK', 'Manchester', '444 Oak St', '3456789019', 'UnMarried', 0, 21, 21);
INSERT INTO [Employees].[Employees] ([EmployeeID], [EmployeeFirstName], [EmployeeMiddleName], [EmployeeLastName], [EmployeeSex], [EmployeeSalary], [EmployeeYearOfRecruitment], [EmployeeLevelOfEducation], [EmployeeSpeciality], [EmployeeExperience], [EmployeeCountry], [EmployeeTown], [EmployeeAddress], [EmployeePhoneNumber], [EmployeeFamilySituation], [EmployeeNumberOfChildren], [DepartmentID], [ProjectID]) VALUES (22, 'Danielle', 'S.', 'Clark', 'Female', 7900.00, '2021-04-09', 'PhD', 'Technical Support Engineer', 'Mid-Senior Level', 'Canada', 'Toronto', '555 Maple St', '7896780654', 'Married', 1, 1, 22);
INSERT INTO [Employees].[Employees] ([EmployeeID], [EmployeeFirstName], [EmployeeMiddleName], [EmployeeLastName], [EmployeeSex], [EmployeeSalary], [EmployeeYearOfRecruitment], [EmployeeLevelOfEducation], [EmployeeSpeciality], [EmployeeExperience], [EmployeeCountry], [EmployeeTown], [EmployeeAddress], [EmployeePhoneNumber], [EmployeeFamilySituation], [EmployeeNumberOfChildren], [DepartmentID], [ProjectID]) VALUES (23, 'Steven', 'V.', 'Lee', 'Male', 6700.00, '2023-01-22', 'Master''s Degree', 'Database Administrator', 'Entry Level', 'USA', 'Philadelphia', '888 Pine St', '0123456788', 'UnMarried', 0, 23, 23);
INSERT INTO [Employees].[Employees] ([EmployeeID], [EmployeeFirstName], [EmployeeMiddleName], [EmployeeLastName], [EmployeeSex], [EmployeeSalary], [EmployeeYearOfRecruitment], [EmployeeLevelOfEducation], [EmployeeSpeciality], [EmployeeExperience], [EmployeeCountry], [EmployeeTown], [EmployeeAddress], [EmployeePhoneNumber], [EmployeeFamilySituation], [EmployeeNumberOfChildren], [DepartmentID], [ProjectID]) VALUES (24, 'Laura', 'T.', 'Miller', 'Female', 9000.00, '2021-12-14', 'Master''s Degree', 'Full Stack Developer', 'Mid-Senior Level', 'Canada', 'Vancouver', '555 Cedar St', '7895432106', 'Married', 2, 1, 24);
INSERT INTO [Employees].[Employees] ([EmployeeID], [EmployeeFirstName], [EmployeeMiddleName], [EmployeeLastName], [EmployeeSex], [EmployeeSalary], [EmployeeYearOfRecruitment], [EmployeeLevelOfEducation], [EmployeeSpeciality], [EmployeeExperience], [EmployeeCountry], [EmployeeTown], [EmployeeAddress], [EmployeePhoneNumber], [EmployeeFamilySituation], [EmployeeNumberOfChildren], [DepartmentID], [ProjectID]) VALUES (25, 'Adrian', 'U.', 'Walker', 'Male', 5100.00, '2022-02-10', 'Bachelor''s Degree', 'Front End Developer', 'Entry Level', 'USA', 'Austin', '666 Star St', '4567890123', 'UnMarried', 0, 25, 25);
INSERT INTO [Employees].[Employees] ([EmployeeID], [EmployeeFirstName], [EmployeeMiddleName], [EmployeeLastName], [EmployeeSex], [EmployeeSalary], [EmployeeYearOfRecruitment], [EmployeeLevelOfEducation], [EmployeeSpeciality], [EmployeeExperience], [EmployeeCountry], [EmployeeTown], [EmployeeAddress], [EmployeePhoneNumber], [EmployeeFamilySituation], [EmployeeNumberOfChildren], [DepartmentID], [ProjectID]) VALUES (26, 'Zoe', 'W.', 'Martin', 'Female', 6200.00, '2018-01-07', 'Bachelor''s Degree', 'Back End Developer', 'Mid-Senior Level', 'USA', 'Houston', '333 River Rd', '6780123456', 'Married', 6, 1, 26);
INSERT INTO [Employees].[Employees] ([EmployeeID], [EmployeeFirstName], [EmployeeMiddleName], [EmployeeLastName], [EmployeeSex], [EmployeeSalary], [EmployeeYearOfRecruitment], [EmployeeLevelOfEducation], [EmployeeSpeciality], [EmployeeExperience], [EmployeeCountry], [EmployeeTown], [EmployeeAddress], [EmployeePhoneNumber], [EmployeeFamilySituation], [EmployeeNumberOfChildren], [DepartmentID], [ProjectID]) VALUES (27, 'Henry', 'N.', 'Hall', 'Male', 6900.00, '2019-10-14', 'Master''s Degree', 'HR Manager', 'Executive', 'UK', 'Birmingham', '789 Mountain St', '6781234560', 'UnMarried', 0, 27, 27);
INSERT INTO [Employees].[Employees] ([EmployeeID], [EmployeeFirstName], [EmployeeMiddleName], [EmployeeLastName], [EmployeeSex], [EmployeeSalary], [EmployeeYearOfRecruitment], [EmployeeLevelOfEducation], [EmployeeSpeciality], [EmployeeExperience], [EmployeeCountry], [EmployeeTown], [EmployeeAddress], [EmployeePhoneNumber], [EmployeeFamilySituation], [EmployeeNumberOfChildren], [DepartmentID], [ProjectID]) VALUES (28, 'Ella', 'O.', 'Stewart', 'Female', 7500.00, '2020-03-11', 'PhD', 'Data Scientist', 'Mid-Senior Level', 'Canada', 'Ottawa', '147 Lagoon Ave', '1456781346', 'Married', 3, 1, 28);
INSERT INTO [Employees].[Employees] ([EmployeeID], [EmployeeFirstName], [EmployeeMiddleName], [EmployeeLastName], [EmployeeSex], [EmployeeSalary], [EmployeeYearOfRecruitment], [EmployeeLevelOfEducation], [EmployeeSpeciality], [EmployeeExperience], [EmployeeCountry], [EmployeeTown], [EmployeeAddress], [EmployeePhoneNumber], [EmployeeFamilySituation], [EmployeeNumberOfChildren], [DepartmentID], [ProjectID]) VALUES (29, 'Benjamin', 'Y.', 'James', 'Male', 9600.00, '2021-12-29', 'PhD', 'Project Manager', 'Director', 'USA', 'Phoenix', '222 Cascade Blvd', '7770912345', 'UnMarried', 0, 29, 29);
INSERT INTO [Employees].[Employees] ([EmployeeID], [EmployeeFirstName], [EmployeeMiddleName], [EmployeeLastName], [EmployeeSex], [EmployeeSalary], [EmployeeYearOfRecruitment], [EmployeeLevelOfEducation], [EmployeeSpeciality], [EmployeeExperience], [EmployeeCountry], [EmployeeTown], [EmployeeAddress], [EmployeePhoneNumber], [EmployeeFamilySituation], [EmployeeNumberOfChildren], [DepartmentID], [ProjectID]) VALUES (30, 'Cheryl', 'Y.', 'Bennett', 'Female', 5300.00, '2023-01-01', 'Bachelor''s Degree', 'Project Manager', 'Associate', 'USA', 'Dallas', '543 Oak Hill Ave', '2340912228', 'Married', 0, 3, 30);
COMMIT TRANSACTION
SELECT * FROM [Employees].[Employees];
SELECT * FROM [Employees].[EmployeesLog];
END
IF @OptionNumber = 2
BEGIN
BEGIN TRANSACTION
UPDATE [Employees].[Employees] SET [EmployeeSalary] = [EmployeeSalary] * 2
FROM [Employees].[Employees] WHERE [EmployeeID] = 1;
COMMIT TRANSACTION
SELECT * FROM [Employees].[Employees];
SELECT * FROM [Employees].[EmployeesLog];
END
IF @OptionNumber = 3
BEGIN
BEGIN TRANSACTION
DELETE [Employees].[Employees] FROM [Employees].[Employees] WHERE [EmployeeID] = 1;
COMMIT TRANSACTION
SELECT * FROM [Employees].[Employees];
SELECT * FROM [Employees].[EmployeesLog];
END
END
GO
EXECUTE [Companies].[InsertUpdateDeleteOfCompanies] 1;
GO
EXECUTE [Locations].[InsertUpdateDeleteOfLocations] 1;
GO
EXECUTE [Departments].[InsertUpdateDeleteOfDepartments] 1;
GO
EXECUTE [Projects].[InsertUpdateDeleteOfProjects] 1;
GO
EXECUTE [Employees].[InsertUpdateDeleteOfEmployees] 1;
GO
EXECUTE [Companies].[InsertUpdateDeleteOfCompanies] 2;
GO
EXECUTE [Locations].[InsertUpdateDeleteOfLocations] 2;
GO
EXECUTE [Departments].[InsertUpdateDeleteOfDepartments] 2;
GO
EXECUTE [Projects].[InsertUpdateDeleteOfProjects] 2;
GO
EXECUTE [Employees].[InsertUpdateDeleteOfEmployees] 2;
------------------------------
USE[Company_Project_T_SQL];
GO
EXECUTE [Users].[AddPrivilegesToUsers];
GO
EXECUTE AS USER = 'Panos_Chron';
GO
SELECT *, 'Panos_Chron' AS [User] FROM [Companies].[Companies];
GO
REVERT;
GO
EXECUTE AS USER = 'Panos_Chron';
GO
SELECT *, 'Panos_Chron' AS [User] FROM [Companies].[Companies];
GO
GRANT SELECT ON [Companies].[Companies] TO [Panos_Chron2];
GO
GRANT UNMASK ON [Companies].[Companies] TO [Panos_Chron2];
GO
REVERT;
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Companies].[Companies];
GO
REVERT;
GO
EXECUTE [Users].[BlockPrivilegesToUsers];
GO
EXECUTE AS USER = 'Panos_Chron';
GO
SELECT *, 'Panos_Chron' AS [User] FROM [Companies].[Companies];
GO
REVERT;
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Companies].[Companies];
GO
REVERT;
GO
EXECUTE [Users].[AddPrivilegesToUsers];
GO
EXECUTE AS USER = 'Panos_Chron';
GO
SELECT *, 'Panos_Chron' AS [User] FROM [Companies].[Companies];
GO
GRANT SELECT ON [Companies].[Companies] TO [Panos_Chron2];
GO
GRANT UNMASK ON [Companies].[Companies] TO [Panos_Chron2];
GO
REVERT;
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Companies].[Companies];
GO
REVERT;
GO
EXECUTE AS USER = 'Panos_Chron';
GO
REVOKE UNMASK ON [Companies].[Companies] TO [Panos_Chron2];
GO
REVERT;
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Companies].[Companies];
GO
REVERT;
GO
EXECUTE AS USER = 'Panos_Chron';
GO
REVOKE SELECT ON [Companies].[Companies] TO [Panos_Chron2];
GO
REVERT;
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Companies].[Companies];
GO
REVERT;
------------------------------
USE[Company_Project_T_SQL];
GO
EXECUTE [Users].[AddPrivilegesToUsers];
GO
EXECUTE AS USER = 'Panos_Chron';
GO
SELECT *, 'Panos_Chron' AS [User] FROM [Locations].[Locations];
GO
REVERT;
GO
EXECUTE AS USER = 'Panos_Chron';
GO
SELECT *, 'Panos_Chron' AS [User] FROM [Locations].[Locations];
GO
GRANT SELECT ON [Locations].[Locations] TO [Panos_Chron2];
GO
GRANT UNMASK ON [Locations].[Locations] TO [Panos_Chron2];
GO
REVERT;
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Locations].[Locations];
GO
REVERT;
GO
EXECUTE [Users].[RemovePrivilegesToUsers];
GO
EXECUTE AS USER = 'Panos_Chron';
GO
SELECT *, 'Panos_Chron' AS [User] FROM [Locations].[Locations];
GO
REVERT;
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Locations].[Locations];
GO
REVERT;
GO
EXECUTE [Users].[AddPrivilegesToUsers];
GO
EXECUTE AS USER = 'Panos_Chron';
GO
SELECT *, 'Panos_Chron' AS [User] FROM [Locations].[Locations];
GO
GRANT SELECT ON [Locations].[Locations] TO [Panos_Chron2];
GO
GRANT UNMASK ON [Locations].[Locations] TO [Panos_Chron2];
GO
REVERT;
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Locations].[Locations];
GO
REVERT;
GO
EXECUTE AS USER = 'Panos_Chron';
GO
REVOKE UNMASK ON [Locations].[Locations] TO [Panos_Chron2];
GO
REVERT;
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Locations].[Locations];
GO
REVERT;
GO
EXECUTE AS USER = 'Panos_Chron';
GO
REVOKE SELECT ON [Locations].[Locations] TO [Panos_Chron2];
GO
REVERT;
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Locations].[Locations];
GO
REVERT;
------------------------------
USE[Company_Project_T_SQL];
GO
EXECUTE [Users].[AddPrivilegesToUsers];
GO
EXECUTE AS USER = 'Panos_Chron';
GO
SELECT *, 'Panos_Chron' AS [User] FROM [Departments].[Departments];
GO
REVERT;
GO
EXECUTE AS USER = 'Panos_Chron';
GO
SELECT *, 'Panos_Chron' AS [User] FROM [Departments].[Departments];
GO
GRANT SELECT ON [Departments].[Departments] TO [Panos_Chron2];
GO
GRANT UNMASK ON [Departments].[Departments] TO [Panos_Chron2];
GO
REVERT;
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Departments].[Departments];
GO
REVERT;
GO
EXECUTE [Users].[BlockPrivilegesToUsers];
GO
EXECUTE AS USER = 'Panos_Chron';
GO
SELECT *, 'Panos_Chron' AS [User] FROM [Departments].[Departments];
GO
REVERT;
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Departments].[Departments];
GO
REVERT;
GO
EXECUTE [Users].[AddPrivilegesToUsers];
GO
EXECUTE AS USER = 'Panos_Chron';
GO
SELECT *, 'Panos_Chron' AS [User] FROM [Departments].[Departments];
GO
GRANT SELECT ON [Departments].[Departments] TO [Panos_Chron2];
GO
GRANT UNMASK ON [Departments].[Departments] TO [Panos_Chron2];
GO
REVERT;
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Departments].[Departments];
GO
REVERT;
GO
EXECUTE AS USER = 'Panos_Chron';
GO
REVOKE UNMASK ON [Departments].[Departments] TO [Panos_Chron2];
GO
REVERT;
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Departments].[Departments];
GO
REVERT;
GO
EXECUTE AS USER = 'Panos_Chron';
GO
REVOKE SELECT ON [Departments].[Departments] TO [Panos_Chron2];
GO
REVERT;
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Departments].[Departments];
GO
REVERT;
------------------------------
USE[Company_Project_T_SQL];
GO
EXECUTE [Users].[AddPrivilegesToUsers];
GO
EXECUTE AS USER = 'Panos_Chron';
GO
SELECT *, 'Panos_Chron' AS [User] FROM [Projects].[Projects];
GO
REVERT;
GO
EXECUTE AS USER = 'Panos_Chron';
GO
SELECT *, 'Panos_Chron' AS [User] FROM [Projects].[Projects];
GO
GRANT SELECT ON [Projects].[Projects] TO [Panos_Chron2];
GO
GRANT UNMASK ON [Projects].[Projects] TO [Panos_Chron2];
GO
REVERT;
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Projects].[Projects];
GO
REVERT;
GO
EXECUTE [Users].[RemovePrivilegesToUsers];
GO
EXECUTE AS USER = 'Panos_Chron';
GO
SELECT *, 'Panos_Chron' AS [User] FROM [Projects].[Projects];
GO
REVERT;
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Projects].[Projects];
GO
REVERT;
GO
EXECUTE [Users].[AddPrivilegesToUsers];
GO
EXECUTE AS USER = 'Panos_Chron';
GO
SELECT *, 'Panos_Chron' AS [User] FROM [Projects].[Projects];
GO
GRANT SELECT ON [Projects].[Projects] TO [Panos_Chron2];
GO
GRANT UNMASK ON [Projects].[Projects] TO [Panos_Chron2];
GO
REVERT;
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Projects].[Projects];
GO
REVERT;
GO
EXECUTE AS USER = 'Panos_Chron';
GO
REVOKE UNMASK ON [Projects].[Projects] TO [Panos_Chron2];
GO
REVERT;
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Projects].[Projects];
GO
REVERT;
GO
EXECUTE AS USER = 'Panos_Chron';
GO
REVOKE SELECT ON [Projects].[Projects] TO [Panos_Chron2];
GO
REVERT;
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Projects].[Projects];
GO
REVERT;
------------------------------
USE[Company_Project_T_SQL];
GO
EXECUTE [Users].[AddPrivilegesToUsers];
GO
EXECUTE AS USER = 'Panos_Chron';
GO
SELECT *, 'Panos_Chron' AS [User] FROM [Employees].[Employees];
GO
REVERT;
GO
EXECUTE AS USER = 'Panos_Chron';
GO
SELECT *, 'Panos_Chron' AS [User] FROM [Employees].[Employees];
GO
GRANT SELECT ON [Employees].[Employees] TO [Panos_Chron2];
GO
GRANT UNMASK ON [Employees].[Employees] TO [Panos_Chron2];
GO
REVERT;
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Employees].[Employees];
GO
REVERT;
GO
EXECUTE [Users].[BlockPrivilegesToUsers];
GO
EXECUTE AS USER = 'Panos_Chron';
GO
SELECT *, 'Panos_Chron' AS [User] FROM [Employees].[Employees];
GO
REVERT;
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Employees].[Employees];
GO
REVERT;
GO
EXECUTE [Users].[AddPrivilegesToUsers];
GO
EXECUTE AS USER = 'Panos_Chron';
GO
SELECT *, 'Panos_Chron' AS [User] FROM [Employees].[Employees];
GO
GRANT SELECT ON [Employees].[Employees] TO [Panos_Chron2];
GO
GRANT UNMASK ON [Employees].[Employees] TO [Panos_Chron2];
GO
REVERT;
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Employees].[Employees];
GO
REVERT;
GO
EXECUTE AS USER = 'Panos_Chron';
GO
REVOKE UNMASK ON [Employees].[Employees] TO [Panos_Chron2];
GO
REVERT;
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Employees].[Employees];
GO
REVERT;
GO
EXECUTE AS USER = 'Panos_Chron';
GO
REVOKE SELECT ON [Employees].[Employees] TO [Panos_Chron2];
GO
REVERT;
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Employees].[Employees];
GO
REVERT;
------------------------------
USE [Company_Project_T_SQL];
GO
ALTER ROLE [CompaniesRoles] ADD MEMBER [Panos_Chron2];
GO
REVOKE UNMASK ON [Companies].[Companies] TO [CompaniesRoles] CASCADE; 
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Companies].[Companies];
GO
REVERT;
GO
REVOKE SELECT ON [Companies].[Companies] TO [CompaniesRoles] CASCADE; 
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Companies].[Companies];
GO
REVERT;
GO
GRANT SELECT ON [Companies].[Companies] TO [CompaniesRoles] WITH GRANT OPTION; 
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Companies].[Companies];
GO
REVERT;
GO
GRANT UNMASK ON [Companies].[Companies] TO [CompaniesRoles] WITH GRANT OPTION; 
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Companies].[Companies];
GO
REVERT;
GO
ALTER ROLE [CompaniesRoles] DROP MEMBER [Panos_Chron2];
------------------------------
USE [Company_Project_T_SQL];
GO
ALTER ROLE [LocationsRoles] ADD MEMBER [Panos_Chron2];
GO
REVOKE UNMASK ON [Locations].[Locations] TO [LocationsRoles] CASCADE; 
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Locations].[Locations];
GO
REVERT;
GO
REVOKE SELECT ON [Locations].[Locations] TO [LocationsRoles] CASCADE; 
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Locations].[Locations];
GO
REVERT;
GO
GRANT SELECT ON [Locations].[Locations] TO [LocationsRoles] WITH GRANT OPTION; 
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Locations].[Locations];
GO
REVERT;
GO
GRANT UNMASK ON [Locations].[Locations] TO [LocationsRoles] WITH GRANT OPTION; 
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Locations].[Locations];
GO
REVERT;
GO
ALTER ROLE [LocationsRoles] DROP MEMBER [Panos_Chron2];
------------------------------
USE [Company_Project_T_SQL];
GO
ALTER ROLE [DepartmentsRoles] ADD MEMBER [Panos_Chron2];
GO
REVOKE UNMASK ON [Departments].[Departments] TO [DepartmentsRoles] CASCADE; 
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Departments].[Departments];
GO
REVERT;
GO
REVOKE SELECT ON [Departments].[Departments] TO [DepartmentsRoles] CASCADE; 
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Departments].[Departments];
GO
REVERT;
GO
GRANT SELECT ON [Departments].[Departments] TO [DepartmentsRoles] WITH GRANT OPTION; 
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Departments].[Departments];
GO
REVERT;
GO
GRANT UNMASK ON [Departments].[Departments] TO [DepartmentsRoles] WITH GRANT OPTION; 
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Departments].[Departments];
GO
REVERT;
GO
ALTER ROLE [DepartmentsRoles] DROP MEMBER [Panos_Chron2];
------------------------------
USE [Company_Project_T_SQL];
GO
ALTER ROLE [ProjectsRoles] ADD MEMBER [Panos_Chron2];
GO
REVOKE UNMASK ON [Projects].[Projects] TO [ProjectsRoles] CASCADE; 
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Projects].[Projects];
GO
REVERT;
GO
REVOKE SELECT ON [Projects].[Projects] TO [ProjectsRoles] CASCADE; 
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Projects].[Projects];
GO
REVERT;
GO
GRANT SELECT ON [Projects].[Projects] TO [ProjectsRoles] WITH GRANT OPTION; 
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Projects].[Projects];
GO
REVERT;
GO
GRANT UNMASK ON [Projects].[Projects] TO [ProjectsRoles] WITH GRANT OPTION; 
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Projects].[Projects];
GO
REVERT;
GO
ALTER ROLE [ProjectsRoles] DROP MEMBER [Panos_Chron2];
------------------------------
USE [Company_Project_T_SQL];
GO
ALTER ROLE [EmployeesRoles] ADD MEMBER [Panos_Chron2];
GO
REVOKE UNMASK ON [Employees].[Employees] TO [EmployeesRoles] CASCADE; 
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Employees].[Employees];
GO
REVERT;
GO
REVOKE SELECT ON [Employees].[Employees] TO [EmployeesRoles] CASCADE; 
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Employees].[Employees];
GO
REVERT;
GO
GRANT SELECT ON [Employees].[Employees] TO [EmployeesRoles] WITH GRANT OPTION; 
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Employees].[Employees];
GO
REVERT;
GO
GRANT UNMASK ON [Employees].[Employees] TO [EmployeesRoles] WITH GRANT OPTION; 
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Employees].[Employees];
GO
REVERT;
GO
ALTER ROLE [EmployeesRoles] DROP MEMBER [Panos_Chron2];
------------------------------
USE [Company_Project_T_SQL];
GO
ALTER ROLE [CompaniesRoles] ADD MEMBER [Panos_Chron2];
GO
DENY UNMASK ON [Companies].[Companies] TO [CompaniesRoles] CASCADE; 
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Companies].[Companies];
GO
REVERT;
GO
DENY SELECT ON [Companies].[Companies] TO [CompaniesRoles] CASCADE; 
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Companies].[Companies];
GO
REVERT;
GO
GRANT SELECT ON [Companies].[Companies] TO [CompaniesRoles] WITH GRANT OPTION; 
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Companies].[Companies];
GO
REVERT;
GO
GRANT UNMASK ON [Companies].[Companies] TO [CompaniesRoles] WITH GRANT OPTION; 
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Companies].[Companies];
GO
REVERT;
GO
ALTER ROLE [CompaniesRoles] DROP MEMBER [Panos_Chron2];
------------------------------
USE [Company_Project_T_SQL];
GO
ALTER ROLE [LocationsRoles] ADD MEMBER [Panos_Chron2];
GO
DENY UNMASK ON [Locations].[Locations] TO [LocationsRoles] CASCADE; 
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Locations].[Locations];
GO
REVERT;
GO
DENY SELECT ON [Locations].[Locations] TO [LocationsRoles] CASCADE; 
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Locations].[Locations];
GO
REVERT;
GO
GRANT SELECT ON [Locations].[Locations] TO [LocationsRoles] WITH GRANT OPTION; 
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Locations].[Locations];
GO
REVERT;
GO
GRANT UNMASK ON [Locations].[Locations] TO [LocationsRoles] WITH GRANT OPTION; 
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Locations].[Locations];
GO
REVERT;
GO
ALTER ROLE [LocationsRoles] DROP MEMBER [Panos_Chron2];
------------------------------
USE [Company_Project_T_SQL];
GO
ALTER ROLE [DepartmentsRoles] ADD MEMBER [Panos_Chron2];
GO
DENY UNMASK ON [Departments].[Departments] TO [DepartmentsRoles] CASCADE; 
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Departments].[Departments];
GO
REVERT;
GO
DENY SELECT ON [Departments].[Departments] TO [DepartmentsRoles] CASCADE; 
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Departments].[Departments];
GO
REVERT;
GO
GRANT SELECT ON [Departments].[Departments] TO [DepartmentsRoles] WITH GRANT OPTION; 
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Departments].[Departments];
GO
REVERT;
GO
GRANT UNMASK ON [Departments].[Departments] TO [DepartmentsRoles] WITH GRANT OPTION; 
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Departments].[Departments];
GO
REVERT;
GO
ALTER ROLE [DepartmentsRoles] DROP MEMBER [Panos_Chron2];
------------------------------
USE [Company_Project_T_SQL];
GO
ALTER ROLE [ProjectsRoles] ADD MEMBER [Panos_Chron2];
GO
DENY UNMASK ON [Projects].[Projects] TO [ProjectsRoles] CASCADE; 
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Projects].[Projects];
GO
REVERT;
GO
DENY SELECT ON [Projects].[Projects] TO [ProjectsRoles] CASCADE; 
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Projects].[Projects];
GO
REVERT;
GO
GRANT SELECT ON [Projects].[Projects] TO [ProjectsRoles] WITH GRANT OPTION; 
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Projects].[Projects];
GO
REVERT;
GO
GRANT UNMASK ON [Projects].[Projects] TO [ProjectsRoles] WITH GRANT OPTION; 
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Projects].[Projects];
GO
REVERT;
GO
ALTER ROLE [ProjectsRoles] DROP MEMBER [Panos_Chron2];
------------------------------
USE [Company_Project_T_SQL];
GO
ALTER ROLE [EmployeesRoles] ADD MEMBER [Panos_Chron2];
GO
DENY UNMASK ON [Employees].[Employees] TO [EmployeesRoles] CASCADE; 
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Employees].[Employees];
GO
REVERT;
GO
DENY SELECT ON [Employees].[Employees] TO [EmployeesRoles] CASCADE; 
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Employees].[Employees];
GO
REVERT;
GO
GRANT SELECT ON [Employees].[Employees] TO [EmployeesRoles] WITH GRANT OPTION; 
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Employees].[Employees];
GO
REVERT;
GO
GRANT UNMASK ON [Employees].[Employees] TO [EmployeesRoles] WITH GRANT OPTION; 
GO
EXECUTE AS USER = 'Panos_Chron2';
GO
SELECT *, 'Panos_Chron2' AS [User2] FROM [Employees].[Employees];
GO
REVERT;
GO
ALTER ROLE [EmployeesRoles] DROP MEMBER [Panos_Chron2];
------------------------------
USE [Company_Project_T_SQL];
GO
SELECT * FROM [Companies].[Companies];
SELECT * FROM [Companies].[CompaniesLog];
GO
SELECT * FROM [Locations].[Locations];
SELECT * FROM [Locations].[LocationsLog];
GO
SELECT * FROM [Departments].[Departments];
SELECT * FROM [Departments].[DepartmentsLog];
GO
SELECT * FROM [Projects].[Projects];
SELECT * FROM [Projects].[ProjectsLog];
GO
SELECT * FROM [Employees].[Employees];
SELECT * FROM [Employees].[EmployeesLog];
GO
EXECUTE [Companies].[InsertUpdateDeleteOfCompanies] 3;
GO
EXECUTE [Locations].[InsertUpdateDeleteOfLocations] 3;
GO
EXECUTE [Departments].[InsertUpdateDeleteOfDepartments] 3;
GO
EXECUTE [Projects].[InsertUpdateDeleteOfProjects] 3;
GO
EXECUTE [Employees].[InsertUpdateDeleteOfEmployees] 3;
------------------------------
USE [Company_Project_T_SQL];
GO
CREATE SCHEMA [Indexes];
GO
CREATE OR ALTER PROCEDURE [Indexes].[CreationOfIndexes] AS
BEGIN
--I CANT - CREATE CLUSTERED INDEX - UNIQUE CLUSTERED INDEX - CLUSTERED COLUMNSTORE INDEX - BECAUSE I HAVE PRIMARY KEYS TO EVERY TABLE
CREATE NONCLUSTERED COLUMNSTORE INDEX [CompanyName_INX] ON [Companies].[Companies]([CompanyName]);--SEARCH PER COLUMN, WE CANT USE ASC OR DESC 
CREATE SPATIAL INDEX [GeographicalLocation_INX] ON [Locations].[Locations]([GeographicalLocation]);-- WE CANT USE ASC OR DESC
CREATE INDEX [DepartmentName_DepartmentLocation_INX] ON [Departments].[Departments]([DepartmentName] ASC, [DepartmentLocation] DESC);--DEFAULT OF NONCLUSTERED INDEX, SEARCH PER ROW
CREATE NONCLUSTERED INDEX [ProjectName_ProjectBudget_INX] ON [Projects].[Projects]([ProjectName] DESC) INCLUDE ([ProjectBudget]);--THE COLUMNS THAT ARE INCLUDED IN INDEX CANT ASC OR DESC AND WE CAN ONLY PUT THEM TO THE SELECT STATEMENTS TO MAKE THIS INDEX EFFICIENT
CREATE UNIQUE NONCLUSTERED INDEX [EmployeeID_EmployeeFirstName_EmployeeLastName_INX] ON [Employees].[Employees]([EmployeeID] DESC, [EmployeeFirstName] ASC, [EmployeeLastName] DESC);
CREATE NONCLUSTERED INDEX [EmployeeSalary_INX] ON [Employees].[Employees]([EmployeeSalary] DESC) WHERE [EmployeeExperience] = 'Entry Level' AND [EmployeeSpeciality] = 'SQL Developer';--FILTERED INDEX
CREATE PRIMARY XML INDEX [CompanyNameXML_INX] ON [Companies].[Companies]([CompanyNameXML]);
CREATE XML INDEX [CompanyNameXML_INX_Value] ON [Companies].[Companies]([CompanyNameXML]) USING XML INDEX [CompanyNameXML_INX] FOR VALUE;--Secondary
CREATE XML INDEX [CompanyNameXML_INX_Path] ON [Companies].[Companies]([CompanyNameXML]) USING XML INDEX [CompanyNameXML_INX] FOR PATH;--Secondary
CREATE XML INDEX [CompanyNameXML_INX_Property] ON [Companies].[Companies]([CompanyNameXML]) USING XML INDEX [CompanyNameXML_INX] FOR PROPERTY;--Secondary
ALTER TABLE [Companies].[Companies] ADD [NAME] AS JSON_VALUE([CompanyNameJSON], '$.NAME');
CREATE INDEX [CompanyNameJSON_INX] ON [Companies].[Companies]([NAME]);
END
------------------------------
USE [Company_Project_T_SQL];
GO
EXECUTE [Indexes].[CreationOfIndexes];
------------------------------
USE [Company_Project_T_SQL];
GO
CREATE OR ALTER PROCEDURE [Indexes].[SelectionStatementsCursor](@FirstValue AS INTEGER, @LastValue AS INTEGER) AS 
DECLARE @EmployeeID AS INTEGER;
BEGIN
DECLARE [Csr] CURSOR FOR 
SELECT [EmployeeID] FROM [Employees].[Employees] WHERE [EmployeeID] BETWEEN @FirstValue AND @LastValue;
OPEN [Csr];
FETCH NEXT FROM [Csr] INTO @EmployeeID;
WHILE @@FETCH_STATUS = 0
BEGIN
SELECT [EmployeeID], [EmployeeFirstName], [EmployeeLastName], [EmployeeYearOfRecruitment] FROM [Employees].[Employees] WHERE [EmployeeID] = @EmployeeID
FETCH NEXT FROM [Csr] INTO @EmployeeID;
END
CLOSE [Csr];
DEALLOCATE [Csr];
END
GO
CREATE OR ALTER PROCEDURE [Indexes].[SelectionStatementsWhile](@FirstValue AS INTEGER, @LastValue AS INTEGER) AS 
BEGIN
WHILE @FirstValue < @LastValue
BEGIN
SELECT [EmployeeID], [EmployeeFirstName], [EmployeeLastName], [EmployeeSalary], 
CASE WHEN [EmployeeSalary] >= 7000.00 THEN 'High' WHEN [EmployeeSalary] < 7000.00 AND [EmployeeSalary] >= 5000.00 THEN 'Medium'
ELSE 'Low' END AS [EmployeeSalaryStatus]
FROM [Employees].[Employees] WHERE [EmployeeID] BETWEEN @FirstValue AND @LastValue ORDER BY 4;
SET @FirstValue = @FirstValue + 1;
END
END
GO
CREATE OR ALTER PROCEDURE [Indexes].[SelectionStatementsDynamic](@GivenValue AS INTEGER) AS 
DECLARE @DynamicQuery AS NVARCHAR(200);
BEGIN
SET @DynamicQuery = N'SELECT AVG([ProjectBudget]) AS [AverageProjectBudget] FROM [Projects].[Projects] WHERE [ProjectID] >= @GivenValueDynamic';
EXECUTE SYS.SP_EXECUTESQL @Statement = @DynamicQuery, @Parameters = N'@GivenValueDynamic AS INTEGER', @GivenValueDynamic = @GivenValue;
END
GO
CREATE OR ALTER FUNCTION [Indexes].[SelectionStatementsFunction](@GivenValue AS DECIMAL(7,2), @ReturnedValue AS DECIMAL(7,2))
RETURNS DECIMAL(7,2) AS
BEGIN
SELECT @ReturnedValue = AVG([DepartmentBudget]) FROM [Departments].[Departments] WHERE NOT [DepartmentBudget] <= @GivenValue;
RETURN @ReturnedValue;
END
GO
CREATE OR ALTER PROCEDURE [Indexes].[SelectionStatements](@OptionNumber AS INTEGER, @GivenValueDECIMAL AS DECIMAL(7,2), @GivenValueVARCHAR AS VARCHAR(50), @FirstValue AS INTEGER, @LastValue AS INTEGER) AS
BEGIN
IF @OptionNumber = 1
BEGIN
SELECT [AliasC].[CompanyName], [AliasL].[LocationLatitude], [AliasL].[LocationLongitude], [AliasL].[GeographicalLocation], [AliasL].[GeographicalLocation].STAsText() AS [GeographicalLocationText] FROM [Companies].[Companies] AS [AliasC]
INNER JOIN [Locations].[Locations] AS [AliasL] ON [AliasC].[CompanyID] = [AliasL].[CompanyID] WHERE [AliasC].[CompanyName] > @GivenValueVARCHAR ORDER BY [AliasC].[CompanyName] ASC;
END
IF @OptionNumber = 2
BEGIN
SELECT [GeographicalLocation].STAsText() AS [GeographicalLocationText] FROM [Locations].[Locations] WHERE [LocationLatitude] <= @GivenValueDECIMAL ORDER BY [GeographicalLocationText];
END
IF @OptionNumber = 3
BEGIN
SELECT [AliasL].[GeographicalLocation], [AliasL].[GeographicalLocation].STAsText() AS [GeographicalLocationText], [AliasD].[DepartmentName], [AliasD].[DepartmentLocation] FROM [Locations].[Locations] AS [AliasL]
INNER JOIN [Departments].[Departments] AS [AliasD] ON [AliasL].[LocationID] = [AliasD].[LocationID] WHERE [AliasD].[DepartmentLocation] <= @GivenValueVARCHAR ORDER BY 2 DESC, 3 ASC;
END
IF @OptionNumber = 4
BEGIN
SELECT SUM([DepartmentBudget]) AS [TotalDepartmentBudget] FROM [Departments].[Departments];
END
IF @OptionNumber = 5
BEGIN
SELECT [Indexes].[SelectionStatementsFunction](20000.00, NULL) AS [AverageDepartmentBudget];
PRINT [Indexes].[SelectionStatementsFunction](20000.00, NULL);
END
IF @OptionNumber = 6
BEGIN
SELECT SUM([ProjectBudget]) AS [TotalProjectBudget] FROM [Projects].[Projects];
END
IF @OptionNumber = 7
BEGIN
SELECT [EmployeeID], [EmployeeFirstName], [EmployeeLastName], [EmployeeSalary], IIF([EmployeeSalary] > 7000.00, 'High', 'Low/Medium') AS [EmployeeSalaryStatus]
FROM [Employees].[Employees] WHERE [EmployeeID] BETWEEN @FirstValue AND @LastValue ORDER BY 4;
END
IF @OptionNumber = 8
BEGIN
SELECT [EmployeeSpeciality], [EmployeeExperience], SUM([EmployeeSalary]) AS [EmployeeTotalSalary]
FROM [Employees].[Employees] GROUP BY [EmployeeSpeciality], [EmployeeExperience] HAVING SUM([EmployeeSalary]) >= @GivenValueDECIMAL ORDER BY 3;
END
IF @OptionNumber = 9
BEGIN
DECLARE @ProjectName AS VARCHAR(50);
SET @ProjectName = 'Panos_Chron_Project';
--SET @ProjectName = 'Wrong_Name_Project';
BEGIN TRANSACTION
SELECT * FROM [Projects].[Projects] WHERE [ProjectName] = 'Panos_Chron_Project';
INSERT INTO [Projects].[Projects] ([ProjectID], [ProjectName], [ProjectBudget], [ProjectStartDate], [ProjectEndDate]) VALUES (32, @ProjectName, 10000.00, '2023-01-01', '2023-12-31');
IF(@ProjectName = 'Panos_Chron_Project')
BEGIN
COMMIT TRANSACTION
SELECT * FROM [Projects].[Projects] WHERE [ProjectName] = 'Panos_Chron_Project';
IF EXISTS(SELECT * FROM [Projects].[Projects] WHERE [ProjectName] = 'Panos_Chron_Project')
BEGIN
BEGIN TRANSACTION
UPDATE [Projects].[Projects] SET [ProjectName] = 'Pakis_Chronis_Project' FROM [Projects].[Projects] WHERE [ProjectID] = 32;
SELECT * FROM [Projects].[Projects] WHERE [ProjectName] = 'Pakis_Chronis_Project';
ROLLBACK TRANSACTION
SELECT * FROM [Projects].[Projects] WHERE [ProjectName] = 'Pakis_Chronis_Project';
BEGIN TRANSACTION
SELECT * FROM [Projects].[Projects] WHERE [ProjectName] = 'Panos_Chron_Project';
DELETE [Projects].[Projects] FROM [Projects].[Projects] WHERE [ProjectName] = 'Panos_Chron_Project';
SELECT * FROM [Projects].[Projects] WHERE [ProjectName] = 'Panos_Chron_Project';
ROLLBACK TRANSACTION
SELECT * FROM [Projects].[Projects] WHERE [ProjectName] = 'Panos_Chron_Project';
BEGIN TRANSACTION
DELETE [Projects].[Projects] FROM [Projects].[Projects] WHERE [ProjectName] = 'Panos_Chron_Project';
COMMIT TRANSACTION
SELECT * FROM [Projects].[Projects] WHERE [ProjectName] = 'Panos_Chron_Project';
END
END
ELSE
BEGIN
SELECT * FROM [Projects].[Projects] WHERE [ProjectID] = 32;
ROLLBACK TRANSACTION
SELECT * FROM [Projects].[Projects] WHERE [ProjectID] = 32;
SELECT 'You typed wrong project name.' AS [WrongProjectName];
PRINT 'You typed wrong project name.';
END
END
IF @OptionNumber = 10
BEGIN
SELECT [CompanyNameXML], [CompanyNameJSON] FROM [Companies].[Companies];
SELECT JSON_VALUE([CompanyNameJSON], 'strict $."CompanyName"') AS [CompanyName] FROM [Companies].[Companies];
SELECT [CompanyNameXML], JSON_MODIFY([CompanyNameJSON], '$.CompanyName', 'Athens') AS [CompanyName] FROM [Companies].[Companies] WHERE [CompanyID] = @FirstValue;
END
END
------------------------------
USE [Company_Project_T_SQL];
GO
EXECUTE [Indexes].[SelectionStatements] 1, NULL, 'Microsoft', NULL, NULL;
GO
EXECUTE [Indexes].[SelectionStatements] 2, 40.0000, NULL, NULL, NULL;
GO
EXECUTE [Indexes].[SelectionStatements] 3, NULL, 'New York', NULL, NULL;
GO
EXECUTE [Indexes].[SelectionStatements] 4, NULL, NULL, NULL, NULL;
GO
EXECUTE [Indexes].[SelectionStatements] 5, NULL, NULL, NULL, NULL;
GO
EXECUTE [Indexes].[SelectionStatements] 6, NULL, NULL, NULL, NULL;
GO
EXECUTE [Indexes].[SelectionStatements] 7, NULL, NULL, 1, 15;
GO
EXECUTE [Indexes].[SelectionStatements] 8, 6000.00, NULL, NULL, NULL;
GO
EXECUTE [Indexes].[SelectionStatements] 9, NULL, NULL, NULL, NULL;
GO
EXECUTE [Indexes].[SelectionStatements] 10, NULL, NULL, 3, NULL;
GO
EXECUTE [Indexes].[SelectionStatementsDynamic] 1;
GO
EXECUTE [Indexes].[SelectionStatementsWhile] 1, 20;
GO
EXECUTE [Indexes].[SelectionStatementsCursor] 3, 6;
------------------------------
USE [Company_Project_T_SQL];
GO
DELETE [Companies].[Companies] FROM [Companies].[Companies];
GO
DELETE [Companies].[CompaniesLog] FROM [Companies].[CompaniesLog];
GO
ALTER TABLE [Locations].[Locations] DROP CONSTRAINT IF EXISTS [CompanyID_FK];
GO
TRUNCATE TABLE [Companies].[Companies];
GO
TRUNCATE TABLE [Companies].[CompaniesLog];
------------------------------
USE [Company_Project_T_SQL];
GO
DELETE [Locations].[Locations] FROM [Locations].[Locations];
GO
DELETE [Locations].[LocationsLog] FROM [Locations].[LocationsLog];
GO
ALTER TABLE [Departments].[Departments] DROP CONSTRAINT IF EXISTS [LocationID_FK];
GO
TRUNCATE TABLE [Locations].[Locations];
GO
TRUNCATE TABLE [Locations].[LocationsLog];
------------------------------
USE [Company_Project_T_SQL];
GO
DELETE [Departments].[Departments] FROM [Departments].[Departments];
GO
DELETE [Departments].[DepartmentsLog] FROM [Departments].[DepartmentsLog];
GO
ALTER TABLE [Employees].[Employees] DROP CONSTRAINT IF EXISTS [DepartmentID_FK];
GO
TRUNCATE TABLE [Departments].[Departments];
GO
TRUNCATE TABLE [Departments].[DepartmentsLog];
------------------------------
USE [Company_Project_T_SQL];
GO
DELETE [Projects].[Projects] FROM [Projects].[Projects];
GO
ALTER TABLE [Employees].[Employees] DROP CONSTRAINT IF EXISTS [ProjectID_FK];
GO
DELETE [Projects].[ProjectsLog] FROM [Projects].[ProjectsLog];
GO
TRUNCATE TABLE [Projects].[Projects];
GO
TRUNCATE TABLE [Projects].[ProjectsLog];
------------------------------
USE [Company_Project_T_SQL];
GO
DELETE [Employees].[Employees] FROM [Employees].[Employees];
GO
DELETE [Employees].[EmployeesLog] FROM [Employees].[EmployeesLog];
GO
TRUNCATE TABLE [Employees].[Employees];
GO
TRUNCATE TABLE [Employees].[EmployeesLog];
------------------------------
------------------------------
------------------------------
------------------------------
------------------------------
USE [Company_Project_T_SQL];
GO
ALTER INDEX [CompanyNameJSON_INX] ON [Companies].[Companies] DISABLE;
GO
ALTER INDEX [CompanyNameXML_INX_Property] ON [Companies].[Companies] DISABLE;
GO
ALTER INDEX [CompanyNameXML_INX_Path] ON [Companies].[Companies] DISABLE;
GO
ALTER INDEX [CompanyNameXML_INX_Value] ON [Companies].[Companies] DISABLE;
GO
ALTER INDEX [CompanyNameXML_INX] ON [Companies].[Companies] DISABLE;
GO
ALTER INDEX [EmployeeSalary_INX] ON [Employees].[Employees] DISABLE;
GO
ALTER INDEX [EmployeeID_EmployeeFirstName_EmployeeLastName_INX] ON [Employees].[Employees] DISABLE;
GO
ALTER INDEX [ProjectName_ProjectBudget_INX] ON [Projects].[Projects] DISABLE;
GO
ALTER INDEX [DepartmentName_DepartmentLocation_INX] ON [Departments].[Departments] DISABLE;
GO
ALTER INDEX [GeographicalLocation_INX] ON [Locations].[Locations] DISABLE;
GO
ALTER INDEX [CompanyName_INX] ON [Companies].[Companies] DISABLE;
GO
DROP INDEX IF EXISTS [CompanyNameJSON_INX] ON [Companies].[Companies];
GO
ALTER TABLE [Companies].[Companies] DROP COLUMN IF EXISTS [NAME];
GO
DROP INDEX [CompanyNameXML_INX_Property] ON [Companies].[Companies];
GO
DROP INDEX [CompanyNameXML_INX_Path] ON [Companies].[Companies];
GO
DROP INDEX [CompanyNameXML_INX_Value] ON [Companies].[Companies];
GO
DROP INDEX [CompanyNameXML_INX] ON [Companies].[Companies];
GO
DROP INDEX IF EXISTS [EmployeeSalary_INX] ON [Employees].[Employees];
GO
DROP INDEX IF EXISTS [EmployeeID_EmployeeFirstName_EmployeeLastName_INX] ON [Employees].[Employees];
GO
DROP INDEX IF EXISTS [ProjectName_ProjectBudget_INX] ON [Projects].[Projects];
GO
DROP INDEX IF EXISTS [DepartmentName_DepartmentLocation_INX] ON [Departments].[Departments];
GO
DROP INDEX IF EXISTS [GeographicalLocation_INX] ON [Locations].[Locations];
GO
DROP INDEX IF EXISTS [CompanyName_INX] ON [Companies].[Companies];
GO
DROP PROCEDURE IF EXISTS [Indexes].[SelectionStatements];
GO
DROP FUNCTION IF EXISTS [Indexes].[SelectionStatementsFunction];
GO
DROP PROCEDURE IF EXISTS [Indexes].[SelectionStatementsDynamic];
GO
DROP PROCEDURE IF EXISTS [Indexes].[SelectionStatementsWhile];
GO
DROP PROCEDURE IF EXISTS [Indexes].[SelectionStatementsCursor];
GO
DROP PROCEDURE IF EXISTS [Indexes].[CreationOfIndexes];
GO
DROP SCHEMA IF EXISTS [Indexes];
------------------------------
USE [Company_Project_T_SQL];
GO
ENABLE TRIGGER [Employees].[EmployeesDMLStatements] ON [Employees].[Employees];
GO
DISABLE TRIGGER [Employees].[EmployeesDMLStatements] ON [Employees].[Employees];
GO
DROP TRIGGER IF EXISTS [Employees].[EmployeesDMLStatements];
------------------------------
USE [Company_Project_T_SQL];
GO
ALTER TABLE [Employees].[EmployeesLog] DROP CONSTRAINT IF EXISTS [DataManipulationLanguageStatement_CHK_Employee];
GO
ALTER TABLE [Employees].[Employees] DROP CONSTRAINT IF EXISTS [EmployeeNumberOfChildren_CHK];
GO
ALTER TABLE [Employees].[Employees] DROP CONSTRAINT IF EXISTS [EmployeeFamilySituation_CHK];
GO
ALTER TABLE [Employees].[Employees] DROP CONSTRAINT IF EXISTS [EmployeePhoneNumber_CHK];
GO
ALTER TABLE [Employees].[Employees] DROP CONSTRAINT IF EXISTS [EmployeeExperience_CHK];
GO
ALTER TABLE [Employees].[Employees] DROP CONSTRAINT IF EXISTS [EmployeeSpeciality_CHK];
GO
ALTER TABLE [Employees].[Employees] DROP CONSTRAINT IF EXISTS [EmployeeLevelOfEducation_CHK];
GO
ALTER TABLE [Employees].[Employees] DROP CONSTRAINT IF EXISTS [EmployeeYearOfRecruitment_CHK];
GO
ALTER TABLE [Employees].[Employees] DROP CONSTRAINT IF EXISTS [EmployeeSalary_CHK];
GO
ALTER TABLE [Employees].[Employees] DROP CONSTRAINT IF EXISTS [EmployeeSex_CHK];
GO
ALTER TABLE [Employees].[Employees] DROP CONSTRAINT IF EXISTS [EmployeeFirstName_EmployeeLastName_UNQ];
GO
ALTER TABLE [Employees].[Employees] DROP CONSTRAINT IF EXISTS [EmployeeID_PK];
------------------------------
USE [Company_Project_T_SQL];
GO
EXECUTE [Employees].[DeletionOfTablesEmployees];
------------------------------
USE [Company_Project_T_SQL];
GO
DROP PROCEDURE IF EXISTS [Employees].[CreationOfTablesEmployees];
GO
DROP PROCEDURE IF EXISTS [Employees].[DeletionOfTablesEmployees];
GO
DROP PROCEDURE IF EXISTS [Employees].[InsertUpdateDeleteOfEmployees];
GO
DROP SCHEMA IF EXISTS [Employees];
------------------------------
USE [Company_Project_T_SQL];
GO
ENABLE TRIGGER [Projects].[ProjectsDMLStatements] ON [Projects].[Projects];
GO
DISABLE TRIGGER [Projects].[ProjectsDMLStatements] ON [Projects].[Projects];
GO
DROP TRIGGER IF EXISTS [Projects].[ProjectsDMLStatements];
------------------------------
USE [Company_Project_T_SQL];
GO
ALTER TABLE [Projects].[ProjectsLog] DROP CONSTRAINT IF EXISTS [DataManipulationLanguageStatement_CHK_Project];
GO
ALTER TABLE [Projects].[Projects] DROP CONSTRAINT IF EXISTS [ProjectStartDate_ProjectEndDate_CHK];
GO
ALTER TABLE [Projects].[Projects] DROP CONSTRAINT IF EXISTS [ProjectBudget_CHK];
GO
ALTER TABLE [Projects].[Projects] DROP CONSTRAINT IF EXISTS [ProjectName_UNQ]; 
GO
ALTER TABLE [Projects].[Projects] DROP CONSTRAINT IF EXISTS [ProjectID_PK];
------------------------------
USE [Company_Project_T_SQL];
GO
EXECUTE [Projects].[DeletionOfTablesProjects];
------------------------------
USE [Company_Project_T_SQL];
GO
DROP PROCEDURE IF EXISTS [Projects].[CreationOfTablesProjects];
GO
DROP PROCEDURE IF EXISTS [Projects].[DeletionOfTablesProjects];
GO
DROP PROCEDURE IF EXISTS [Projects].[InsertUpdateDeleteOfProjects];
GO
DROP SCHEMA IF EXISTS [Projects];
------------------------------
USE [Company_Project_T_SQL];
GO
ENABLE TRIGGER [Departments].[DepartmentsDMLStatements] ON [Departments].[Departments];
GO
DISABLE TRIGGER [Departments].[DepartmentsDMLStatements] ON [Departments].[Departments];
GO
DROP TRIGGER IF EXISTS [Departments].[DepartmentsDMLStatements];
------------------------------
USE [Company_Project_T_SQL];
GO
ALTER TABLE [Departments].[DepartmentsLog] DROP COLUMN IF EXISTS [DepartmentNewBudget];
GO
ALTER TABLE [Departments].[DepartmentsLog] DROP COLUMN IF EXISTS [DepartmentOldNewBudget];
GO
ALTER TABLE [Departments].[Departments] DROP CONSTRAINT IF EXISTS [DepartmentBudget_CHK];
GO
ALTER TABLE [Departments].[Departments]  ALTER COLUMN [DepartmentBudget] DROP MASKED;
GO
ALTER TABLE [Departments].[Departments] DROP COLUMN IF EXISTS [DepartmentBudget];
GO
ALTER TABLE [Departments].[DepartmentsLog] DROP CONSTRAINT IF EXISTS [DataManipulationLanguageStatement_CHK_Department];
GO
ALTER TABLE [Departments].[Departments] DROP CONSTRAINT IF EXISTS [DepartmentName_DepartmentLocation_UNQ];
GO
ALTER TABLE [Departments].[Departments] DROP CONSTRAINT IF EXISTS [DepartmentID_PK];
------------------------------
USE [Company_Project_T_SQL];
GO
EXECUTE [Departments].[DeletionOfTablesDepartments];
------------------------------
USE [Company_Project_T_SQL];
GO
DROP PROCEDURE IF EXISTS [Departments].[CreationOfTablesDepartments];
GO
DROP PROCEDURE IF EXISTS [Departments].[DeletionOfTablesDepartments];
GO
DROP PROCEDURE IF EXISTS [Departments].[InsertUpdateDeleteOfDepartments];
GO
DROP SCHEMA IF EXISTS [Departments];
------------------------------
USE [Company_Project_T_SQL];
GO
ENABLE TRIGGER [Locations].[LocationsDMLStatements] ON [Locations].[Locations];
GO
DISABLE TRIGGER [Locations].[LocationsDMLStatements] ON [Locations].[Locations];
GO
DROP TRIGGER IF EXISTS [Locations].[LocationsDMLStatements];
------------------------------
USE [Company_Project_T_SQL];
GO
ALTER TABLE [Locations].[LocationsLog] DROP CONSTRAINT IF EXISTS [DataManipulationLanguageStatement_CHK_Location];
GO
ALTER TABLE [Locations].[Locations] DROP CONSTRAINT IF EXISTS [LocationLatitude_LocationLongitude_UNQ];
GO
ALTER TABLE [Locations].[Locations] DROP CONSTRAINT IF EXISTS [LocationID_PK];
------------------------------
USE [Company_Project_T_SQL];
GO
EXECUTE [Locations].[DeletionOfTablesLocations];
------------------------------
USE [Company_Project_T_SQL];
GO
DROP PROCEDURE IF EXISTS [Locations].[CreationOfTablesLocations];
GO
DROP PROCEDURE IF EXISTS [Locations].[DeletionOfTablesLocations];
GO
DROP PROCEDURE IF EXISTS [Locations].[InsertUpdateDeleteOfLocations];
GO
DROP SCHEMA IF EXISTS [Locations];
------------------------------
USE [Company_Project_T_SQL];
GO
ENABLE TRIGGER [Companies].[CompaniesDMLStatements] ON [Companies].[Companies];
GO
DISABLE TRIGGER [Companies].[CompaniesDMLStatements] ON [Companies].[Companies];
GO
DROP TRIGGER IF EXISTS [Companies].[CompaniesDMLStatements];
------------------------------
USE [Company_Project_T_SQL];
GO
ALTER TABLE [Companies].[CompaniesLog] DROP CONSTRAINT IF EXISTS [DataManipulationLanguageStatement_CHK_Company];
GO
ALTER TABLE [Companies].[Companies] DROP CONSTRAINT IF EXISTS [CompanyNameJSON_CHK];
GO
ALTER TABLE [Companies].[Companies] DROP CONSTRAINT IF EXISTS [CompanyNameXML_CHK];
GO
ALTER TABLE [Companies].[Companies] DROP CONSTRAINT IF EXISTS [CompanyName_UNQ];
GO
ALTER TABLE [Companies].[Companies] DROP CONSTRAINT IF EXISTS [CompanyID_PK];
------------------------------
USE [Company_Project_T_SQL];
GO
EXECUTE [Companies].[DeletionOfTablesCompanies];
------------------------------
USE [Company_Project_T_SQL];
GO
DROP PROCEDURE IF EXISTS [Companies].[CreationOfTablesCompanies];
GO
DROP PROCEDURE IF EXISTS [Companies].[DeletionOfTablesCompanies];
GO
DROP PROCEDURE IF EXISTS [Companies].[InsertUpdateDeleteOfCompanies];
GO
DROP SCHEMA IF EXISTS [Companies];
------------------------------
USE [Company_Project_T_SQL];
GO
EXECUTE [Users].[TakePrivilegesToUsers];
GO
EXECUTE [Users].[DeletionOfRoles];
GO
EXECUTE [Users].[DeletionOfUsers];
GO
EXECUTE [Users].[DeletionOfLogins];
------------------------------
USE [Company_Project_T_SQL];
GO
DROP PROCEDURE IF EXISTS [Users].[CreationOfLogins];
GO
DROP PROCEDURE IF EXISTS [Users].[CreationOfUsers];
GO
DROP PROCEDURE IF EXISTS [Users].[CreationOfRoles];
GO
DROP PROCEDURE IF EXISTS [Users].[DeletionOfRoles];
GO
DROP PROCEDURE IF EXISTS [Users].[DeletionOfUsers];
GO
DROP PROCEDURE IF EXISTS [Users].[DeletionOfLogins];
GO
DROP PROCEDURE IF EXISTS [Users].[BlockPrivilegesToUsers];
GO
DROP PROCEDURE IF EXISTS [Users].[RemovePrivilegesToUsers];
GO
DROP PROCEDURE IF EXISTS [Users].[TakePrivilegesToUsers];
GO
DROP PROCEDURE IF EXISTS [Users].[GivePrivilegesToUsers];
GO
DROP PROCEDURE IF EXISTS [Users].[AddPrivilegesToUsers];
GO
DROP SCHEMA IF EXISTS [Users];
------------------------------
USE [Master];
GO
EXECUTE [Database].[DeletionOfDatabase];
GO
DROP PROCEDURE IF EXISTS [Database].[CreationOfDatabase];
GO
DROP PROCEDURE IF EXISTS [Database].[DeletionOfDatabase];
GO
DROP SCHEMA IF EXISTS [Database];
GO
DROP LOGIN [Panos_Chron2];
GO
DROP LOGIN [Panos_Chron];
------------------------------







