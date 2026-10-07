# smart-dorm
Smart Dorm – студенттер жатақханасын басқаруға арналған ақпараттық жүйе.
## Деректер қоры

Smart Dorm ақпараттық жүйесі Microsoft SQL Server деректер қорын қолданады.

Деректер қорының атауы: `SmartDormDB`

Негізгі кестелер:
- Roles
- Users
- Rooms
- Accommodations
- WashingMachines
- RepairRequests
- RepairAssignments
- RepairHistory
- Payments
- Notifications

Кестелер арасында Primary Key (PK) және Foreign Key (FK) арқылы байланыстар орнатылған.

Деректер қорын құруға арналған SQL скрипт:
`database/createSmartDormDB.sql`

SQL скриптте CREATE, INSERT, UPDATE және DELETE операциялары орындалған.
