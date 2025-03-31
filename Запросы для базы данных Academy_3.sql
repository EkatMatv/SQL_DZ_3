USE Academy_3;

--1. ������� ������� ������, �� ����������� �� ���� � �������� �������
SELECT Name, Financing, Id
FROM Departments;

--2. ������� �������� ����� � �� �������� � ���������� ����
--����� ������ �������.
SELECT Name AS '������������ ������', Rating AS '�������'
FROM Groups;

--3. ������� ��� �������������� �� �������, ������� ������
--�� ��������� � �������� � ������� ������ �� ���������
--� �������� (����� ������ � ��������).
SELECT 
	Name AS '���',
	Surname AS '�������', 
	Premium/Salary*100 AS '������ � �������� � %',
	Salary/(Salary + Premium)*100 AS '������ � �������� � %'
FROM Teachers
WHERE Position = '�������������'

--4. ������� ������� ����������� � ���� ������ ���� � ��������� 
--�������: �The dean of faculty [faculty] is [dean].�
SELECT 'The dean of faculty ' + Name + ' is ' + Dean
FROM Faculties

--5. ������� ������� ��������������, ������� �������� ������������ � ������ ������� ��������� 1050(100000).
SELECT Surname
FROM Teachers
WHERE Position = '�������������' AND IsProfessor = 1 AND Salary > 100000 

--6. ������� �������� ������, ���� �������������� �������
--������ 11000(1100000) ��� ������ 25000(2500000).
SELECT Name
FROM Departments
WHERE Financing < 1100000 OR  Financing > 2500000

--7. ������� �������� ����������� ����� ���������� �Computer Science� ('�����������') 
SELECT Name
FROM Faculties
WHERE NOT Name = '�����������'

--8. ������� ������� � ��������� ��������������, ������� �� �������� ������������.
SELECT Surname
FROM Teachers
WHERE IsProfessor = 0

--9. ������� �������, ���������, ������ � �������� �����������, � ������� �������� � ��������� 
--�� 160(20000) �� 550(29000). 
SELECT Surname, Position, Salary, Premium
FROM Teachers
WHERE IsAssistant = 1 AND Premium > 20000 AND Premium < 29000 

--10.������� ������� � ������ �����������.
SELECT Surname, Salary
FROM Teachers
WHERE IsAssistant = 1

--11.������� ������� � ��������� ��������������, �������
--���� ������� �� ������ �� 01.01.2000 (01.01.2020).
SELECT Surname, Position
FROM Teachers
WHERE EmploymentDate < '2020-01-01'

--12.������� �������� ������, ������� � ���������� ������� ������������� �� ������� 
--�Software Development�('���������� �������'). ��������� ���� ������ ����� �������� �Name of Department�
SELECT Name AS 'Name of Department'
FROM Departments 
WHERE Id < (SELECT Id FROM Departments WHERE Name = '���������� �������')
ORDER BY Name

--13.������� ������� �����������, ������� �������� (����� ������ � ��������) �� ����� 1200 (110000).
SELECT Surname
FROM Teachers
WHERE IsAssistant = 1 AND  (Salary + Premium) < 110000

--14.������� �������� ����� 5-�� �����(4), ������� ������� � ��������� �� 2 �� 4
SELECT Name
FROM Groups
WHERE Year = 4 AND Rating BETWEEN 2 AND 4

--15.������� ������� ����������� �� ������� ������ 550(92000) ��� ��������� ������ 200(28000).
SELECT Surname
FROM Teachers
WHERE IsAssistant = 1 AND Salary < 92000 AND Premium < 28000