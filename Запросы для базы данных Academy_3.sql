USE Academy_3;

--1. Вывести таблицу кафедр, но расположить ее поля в обратном порядке
SELECT Name, Financing, Id
FROM Departments;

--2. Вывести названия групп и их рейтинги с уточнением имен
--полей именем таблицы.
SELECT Name AS 'Наименование группы', Rating AS 'Рейтинг'
FROM Groups;

--3. Вывести для преподавателей их фамилию, процент ставки
--по отношению к надбавке и процент ставки по отношению
--к зарплате (сумма ставки и надбавки).
SELECT 
	Name AS 'Имя',
	Surname AS 'Фамилия', 
	Premium/Salary*100 AS 'Ставка к надбавке в %',
	Salary/(Salary + Premium)*100 AS 'Ставка к зарплате в %'
FROM Teachers
WHERE Position = 'Преподаватель'

--4. Вывести таблицу факультетов в виде одного поля в следующем 
--формате: “The dean of faculty [faculty] is [dean].”
SELECT 'The dean of faculty ' + Name + ' is ' + Dean
FROM Faculties

--5. Вывести фамилии преподавателей, которые являются профессорами и ставка которых превышает 1050(100000).
SELECT Surname
FROM Teachers
WHERE Position = 'Преподаватель' AND IsProfessor = 1 AND Salary > 100000 

--6. Вывести названия кафедр, фонд финансирования которых
--меньше 11000(1100000) или больше 25000(2500000).
SELECT Name
FROM Departments
WHERE Financing < 1100000 OR  Financing > 2500000

--7. Вывести названия факультетов кроме факультета “Computer Science” ('Лингвистика') 
SELECT Name
FROM Faculties
WHERE NOT Name = 'Лингвистика'

--8. Вывести фамилии и должности преподавателей, которые не являются профессорами.
SELECT Surname
FROM Teachers
WHERE IsProfessor = 0

--9. Вывести фамилии, должности, ставки и надбавки ассистентов, у которых надбавка в диапазоне 
--от 160(20000) до 550(29000). 
SELECT Surname, Position, Salary, Premium
FROM Teachers
WHERE IsAssistant = 1 AND Premium > 20000 AND Premium < 29000 

--10.Вывести фамилии и ставки ассистентов.
SELECT Surname, Salary
FROM Teachers
WHERE IsAssistant = 1

--11.Вывести фамилии и должности преподавателей, которые
--были приняты на работу до 01.01.2000 (01.01.2020).
SELECT Surname, Position
FROM Teachers
WHERE EmploymentDate < '2020-01-01'

--12.Вывести названия кафедр, которые в алфавитном порядке располагаются до кафедры 
--“Software Development”('Инженерная графика'). Выводимое поле должно иметь название “Name of Department”
SELECT Name AS 'Name of Department'
FROM Departments 
WHERE Id < (SELECT Id FROM Departments WHERE Name = 'Инженерная графика')
ORDER BY Name

--13.Вывести фамилии ассистентов, имеющих зарплату (сумма ставки и надбавки) не более 1200 (110000).
SELECT Surname
FROM Teachers
WHERE IsAssistant = 1 AND  (Salary + Premium) < 110000

--14.Вывести названия групп 5-го курса(4), имеющих рейтинг в диапазоне от 2 до 4
SELECT Name
FROM Groups
WHERE Year = 4 AND Rating BETWEEN 2 AND 4

--15.Вывести фамилии ассистентов со ставкой меньше 550(92000) или надбавкой меньше 200(28000).
SELECT Surname
FROM Teachers
WHERE IsAssistant = 1 AND Salary < 92000 AND Premium < 28000