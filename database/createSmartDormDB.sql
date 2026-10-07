USE master;
GO

-- Ескі базаны ?шіру
IF DB_ID('SmartDormDB') IS NOT NULL
BEGIN
    ALTER DATABASE SmartDormDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE SmartDormDB;
END
GO

-- Жа?а база ??ру
CREATE DATABASE SmartDormDB;
GO

USE SmartDormDB;
GO


/* =====================================================
   1. Р?ЛДЕР
   ===================================================== */
CREATE TABLE Roles (
    RoleID INT IDENTITY(1,1) PRIMARY KEY,
    RoleName NVARCHAR(50) NOT NULL UNIQUE
);
GO


/* =====================================================
   2. ПАЙДАЛАНУШЫЛАР
   ===================================================== */
CREATE TABLE Users (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    FullName NVARCHAR(100) NOT NULL,
    Login NVARCHAR(50) NOT NULL UNIQUE,
    PasswordHash NVARCHAR(255) NOT NULL,
    Phone NVARCHAR(20),
    Email NVARCHAR(100),
    RoleID INT NOT NULL,
    IsActive BIT NOT NULL DEFAULT 1,

    CONSTRAINT FK_Users_Roles
        FOREIGN KEY (RoleID) REFERENCES Roles(RoleID)
);
GO


/* =====================================================
   3. Б?ЛМЕЛЕР
   ===================================================== */
CREATE TABLE Rooms (
    RoomID INT IDENTITY(1,1) PRIMARY KEY,
    RoomNumber NVARCHAR(10) NOT NULL UNIQUE,
    Floor INT NOT NULL,
    Capacity INT NOT NULL CHECK (Capacity > 0),
    Status NVARCHAR(30) NOT NULL DEFAULT N'Бос'
);
GO


/* =====================================================
   4. СТУДЕНТТЕРДІ ОРНАЛАСТЫРУ
   ===================================================== */
CREATE TABLE Accommodations (
    AccommodationID INT IDENTITY(1,1) PRIMARY KEY,
    StudentID INT NOT NULL,
    RoomID INT NOT NULL,
    CheckInDate DATE NOT NULL DEFAULT GETDATE(),
    CheckOutDate DATE NULL,
    Status NVARCHAR(30) NOT NULL DEFAULT N'Т?рып жатыр',

    CONSTRAINT FK_Accommodations_Users
        FOREIGN KEY (StudentID) REFERENCES Users(UserID),

    CONSTRAINT FK_Accommodations_Rooms
        FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID)
);
GO


/* =====================================================
   5. КІР ЖУАТЫН МАШИНАЛАР
   ===================================================== */
CREATE TABLE WashingMachines (
    MachineID INT IDENTITY(1,1) PRIMARY KEY,
    MachineNumber NVARCHAR(20) NOT NULL UNIQUE,
    Floor INT NOT NULL,
    Status NVARCHAR(30) NOT NULL DEFAULT N'Бос',
    LastServiceDate DATE NULL
);
GO


/* =====================================================
   6. Ж?НДЕУ ?ТІНІМДЕРІ
   ===================================================== */
CREATE TABLE RepairRequests (
    RequestID INT IDENTITY(1,1) PRIMARY KEY,

    CreatedBy INT NOT NULL,
    RoomID INT NULL,
    MachineID INT NULL,

    ProblemType NVARCHAR(50) NOT NULL,
    Description NVARCHAR(500) NOT NULL,

    Status NVARCHAR(30) NOT NULL DEFAULT N'Жа?а',

    CreatedDate DATETIME NOT NULL DEFAULT GETDATE(),
    CompletedDate DATETIME NULL,

    CONSTRAINT FK_RepairRequests_User
        FOREIGN KEY (CreatedBy) REFERENCES Users(UserID),

    CONSTRAINT FK_RepairRequests_Room
        FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID),

    CONSTRAINT FK_RepairRequests_Machine
        FOREIGN KEY (MachineID) REFERENCES WashingMachines(MachineID)
);
GO


/* =====================================================
   7. ?ТІНІМДІ ?ЫЗМЕТКЕРГЕ ТА?АЙЫНДАУ
   ===================================================== */
CREATE TABLE RepairAssignments (
    AssignmentID INT IDENTITY(1,1) PRIMARY KEY,
    RequestID INT NOT NULL,
    WorkerID INT NOT NULL,
    AssignedDate DATETIME NOT NULL DEFAULT GETDATE(),

    CONSTRAINT FK_Assignment_Request
        FOREIGN KEY (RequestID) REFERENCES RepairRequests(RequestID),

    CONSTRAINT FK_Assignment_Worker
        FOREIGN KEY (WorkerID) REFERENCES Users(UserID)
);
GO


/* =====================================================
   8. Ж?НДЕУ СТАТУСЫНЫ? ТАРИХЫ
   ===================================================== */
CREATE TABLE RepairHistory (
    HistoryID INT IDENTITY(1,1) PRIMARY KEY,
    RequestID INT NOT NULL,
    ChangedBy INT NOT NULL,

    OldStatus NVARCHAR(30),
    NewStatus NVARCHAR(30) NOT NULL,

    Comment NVARCHAR(500),
    ChangedDate DATETIME NOT NULL DEFAULT GETDATE(),

    CONSTRAINT FK_History_Request
        FOREIGN KEY (RequestID) REFERENCES RepairRequests(RequestID),

    CONSTRAINT FK_History_User
        FOREIGN KEY (ChangedBy) REFERENCES Users(UserID)
);
GO


/* =====================================================
   9. Т?ЛЕМДЕР / DORMWALLET
   ===================================================== */
CREATE TABLE Payments (
    PaymentID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT NOT NULL,

    Amount DECIMAL(10,2) NOT NULL CHECK (Amount > 0),
    PaymentType NVARCHAR(50) NOT NULL,
    PaymentDate DATETIME NOT NULL DEFAULT GETDATE(),
    Status NVARCHAR(30) NOT NULL DEFAULT N'Т?ленді',

    CONSTRAINT FK_Payments_User
        FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
GO


/* =====================================================
   10. ХАБАРЛАМАЛАР
   ===================================================== */
CREATE TABLE Notifications (
    NotificationID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT NOT NULL,

    Title NVARCHAR(100) NOT NULL,
    Message NVARCHAR(500) NOT NULL,

    IsRead BIT NOT NULL DEFAULT 0,
    CreatedDate DATETIME NOT NULL DEFAULT GETDATE(),

    CONSTRAINT FK_Notifications_User
        FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
GO


/* =====================================================
   БАСТАП?Ы Р?ЛДЕР
   ===================================================== */

INSERT INTO Roles (RoleName)
VALUES
(N'Студент'),
(N'?абат старостасы'),
(N'Комендант'),
(N'Сантехник'),
(N'Электрик'),
(N'Плотник'),
(N'Программист');
GO


/* =====================================================
   ТЕСТ Б?ЛМЕЛЕР
   ===================================================== */

INSERT INTO Rooms (RoomNumber, Floor, Capacity, Status)
VALUES
(N'101', 1, 4, N'Бос'),
(N'102', 1, 4, N'Бос'),
(N'201', 2, 4, N'Бос'),
(N'202', 2, 4, N'Бос'),
(N'301', 3, 3, N'Бос');
GO


/* =====================================================
   КІР ЖУАТЫН МАШИНАЛАР
   ===================================================== */

INSERT INTO WashingMachines (MachineNumber, Floor, Status)
VALUES
(N'WM-01', 1, N'Бос'),
(N'WM-02', 1, N'Бос'),
(N'WM-03', 2, N'Бос'),
(N'WM-04', 3, N'Ж?ндеуде');
GO


/* =====================================================
   ТЕКСЕРУ
   ===================================================== */

SELECT * FROM Roles;
SELECT * FROM Rooms;
SELECT * FROM WashingMachines;
GO