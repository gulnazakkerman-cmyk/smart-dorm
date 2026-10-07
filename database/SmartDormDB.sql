-- INSERT: жаңа бөлме қосу
INSERT INTO Rooms (RoomNumber, Floor, Capacity, Status)
VALUES (N'401', 4, 4, N'Бос');

-- Нәтижені тексеру
SELECT * FROM Rooms;

-- UPDATE: 401 бөлменің статусын өзгерту
UPDATE Rooms
SET Status = N'Бос емес'
WHERE RoomNumber = N'401';

-- Нәтижені тексеру
SELECT * FROM Rooms
WHERE RoomNumber = N'401';

-- DELETE: 401 бөлмесін өшіру
DELETE FROM Rooms
WHERE RoomNumber = N'401';

-- Өшірілгенін тексеру
SELECT * FROM Rooms;