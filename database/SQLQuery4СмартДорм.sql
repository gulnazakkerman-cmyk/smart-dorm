
USE SmartDormNew;
GO

INSERT INTO Students VALUES
(1, 'Aidana', '2009-05-15', '87011111111', '101', '1', 'Almaty', 'aidon@mail.ru'),
(2, 'Aruzhan', '2007-08-20', '87022222222', '102', '2', 'Taraz', 'aru_07@mail.ru'),
(3, 'Dana', '2006-03-10', '87033333333', '101', '4', 'Shymkent', 'dana_k@mail.ru'),
(4, 'Batyr', '2008-06-15', '87770231232', '201', '2', 'KZO', 'B_Batyr08@mail.ru'),
(5, 'Merei', '2007-04-12', '87055551111', '103', '1', 'Astana', 'merei@mail.ru'),
(6, 'Aigerim', '2008-09-25', '87055552222', '104', '2', 'Almaty', 'aigerim@mail.ru'),
(7, 'Sayan', '2006-11-08', '87055553333', '105', '3', 'Taraz', 'sayan@mail.ru'),
(8, 'Madina', '2007-02-17', '87055554444', '106', '1', 'Shymkent', 'madina@mail.ru'),
(9, 'Alibek', '2008-07-30', '87055555555', '107', '2', 'Aktobe', 'alibek@mail.ru'),
(10, 'Aruzhan2', '2006-12-05', '87055556666', '108', '4', 'Kyzylorda', 'aruzhan2@mail.ru'),
(11, 'Dias', '2007-03-21', '87055557777', '203', '3', 'Atyrau', 'dias@mail.ru'),
(12, 'Amina', '2008-10-14', '87055558888', '104', '1', 'Semey', 'amina@mail.ru'),
(13, 'Nursultan', '2006-06-09', '87055559999', '111', '2', 'Pavlodar', 'nursultan@mail.ru'),
(14, 'Kamila', '2007-01-28', '87055550001', '112', '3', 'Aktau', 'kamila@mail.ru'),
(15, 'Erasyl', '2008-08-19', '87055550002', '502', '4', 'Kostanay', 'erasyl@mail.ru'),
(16, 'Emir', '2007-04-18', '87055550016', '403', '2', 'Turkey', 'emir@mail.ru'),
(17, 'Li Wei', '2006-09-12', '87055550017', '401', '3', 'China', 'liwei@mail.ru');


-- Бөлмелер
INSERT INTO Rooms VALUES
(1, 101, 2),
(2, 102, 1),
(3, 201, 3),
(4, 103, 3),
(5, 203, 3),
(6, 104, 2),
(7, 301, 4),
(8, 302, 3),
(9, 303, 4),
(10, 304, 4),
(11, 401, 3),
(12, 402, 4),
(13, 403, 3),
(14, 404, 4),
(15, 501, 4),
(16, 502, 3),
(17, 503, 4);
-- Орналастыру
INSERT INTO Accommodations VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 1),
(4, 4, 3),
(5, 5, 4),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10),
(11, 11, 5),
(12, 12, 6),
(13, 13, 12),
(14, 14, 14),
(15, 15, 16),
(16, 16, 13),
(17, 17, 11);

-- Жөндеу өтінімдері
INSERT INTO RepairRequests VALUES
(1, 1, 'Broken tap'),
(2, 2, 'No light'),
(3, 4, 'Broken door'),
(4, 5, 'No hot water'),
(5, 7, 'Broken window'),
(6, 8, 'Heating problem'),
(7, 10, 'Broken chair'),
(8, 11, 'Water leak'),
(9, 15, 'Broken socket'),
(10, 17, 'Internet problem');

-- Төлемдер
INSERT INTO Payments VALUES
(1, 1, 15000),
(2, 2, 15000),
(3, 3, 15000),
(4, 4, 15000),
(5, 5, 15000),
(6, 6, 15000),
(7, 7, 15000),
(8, 8, 15000),
(9, 9, 15000),
(10, 10, 15000),
(11, 11, 15000),
(12, 12, 15000),
(13, 13, 15000),
(14, 14, 15000),
(15, 15, 15000),
(16, 16, 25000),
(17, 17, 25000);

-- UPDATE: төлемді өзгерту
UPDATE Payments
SET amount = 20000
WHERE payment_id = 1;

-- DELETE: өтінімді өшіру
DELETE FROM RepairRequests
WHERE request_id = 2;

-- Нәтижелерді көрсету
SELECT * FROM Students;
SELECT * FROM Rooms;
SELECT * FROM Accommodations;
SELECT * FROM RepairRequests;
SELECT * FROM Payments;

UPDATE Payments
SET amount = 20000
WHERE payment_id = 1;

DELETE FROM RepairRequests
WHERE request_id = 2;

