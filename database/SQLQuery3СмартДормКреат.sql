CREATE DATABASE SmartDormNew;
GO

USE SmartDormNew;
GO

USE SmartDormNew;
GO

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    birthday DATE,
    phone VARCHAR(20),
    rooms int,
    curs int,
    city nvarchar(50),
    email nvarchar(50)
);

CREATE TABLE Rooms (
    room_id INT PRIMARY KEY,
    room_number INT,
    capacity INT
);

CREATE TABLE Accommodations (
    id INT PRIMARY KEY,
    student_id INT,
    room_id INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id)
);

CREATE TABLE RepairRequests (
    request_id INT PRIMARY KEY,
    student_id INT,
    problem VARCHAR(100),
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    student_id INT,
    amount DECIMAL(10,2),
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);
