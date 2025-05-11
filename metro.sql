USE master
GO

IF EXISTS (SELECT 1 FROM sys.sysdatabases WHERE [name] = 'Metro')
   BEGIN
		ALTER DATABASE [Metro] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
		DROP DATABASE [Metro];
   END
GO

CREATE DATABASE Metro;
GO

USE Metro;
GO

CREATE TABLE Train (
	id INT IDENTITY(1,1) PRIMARY KEY,
	[Model] NVARCHAR(30) NOT NULL
) AS NODE;

CREATE TABLE Station (
	id INT IDENTITY(1,1) PRIMARY KEY,
	[Name] NVARCHAR(50) NOT NULL UNIQUE
) AS NODE;

CREATE TABLE Branch (
	id INT IDENTITY(1,1) PRIMARY KEY,
	[Name] NVARCHAR(50) NOT NULL
) AS NODE

INSERT INTO Train ([Model]) 
VALUES	('81-717/714'),
		('81-717/714'),
		('81-717/714'),
		('81-717/714'),
		('81-717/714'),
		('81-717/714'),
		('Stadler'),
		('Stadler'),
		('Stadler'),
		('Stadler')
GO

INSERT INTO Branch ([Name])
VALUES ('Автозаводская'),
	   ('Московская'),
	   ('Зеленолужская')
GO

INSERT INTO Station ([Name])
VALUES  ('Каменная горка'),
		('Кунцевщина'),
		('Спортивная'),
		('Пушкинская'),
		('Молодёжная'),
		('Фрунзенская'),
		('Немига'),
		('Первомайская'),
		('Пролетарская'),
		('Тракторный завод'),
		('Партизанская'),
		('Автозаводская'),
		('Могилёвская'),
		('Малиновка'),
		('Петровщина'),
		('Михалово'),
		('Грушевка'),
		('Институт культуры'),
		('Площадь Ленина'),
		('Октябрьская'),
		('Площадь Победы'),
		('Площадь Якубы Коласа'),
		('Академия Наук'),
		('Парк Челюскинцев'),
		('Московская'),
		('Восток'),
		('Борисовский тракт'),
		('Юбилейная площадь'),
		('Площадь Франтишка Багушевича'),
		('Вокзальная'),
		('Ковальская Слобода'),
		('Аэродромная'),
		('Неморшанский Сад'),
		('Слуцкий Гостинец'),
		('Купаловская'),
		('Уручье')
GO

CREATE TABLE AdjacentTo (
	 distance INT NOT NULL
) AS EDGE;
GO
CREATE TABLE ServesLine AS EDGE;
GO
CREATE TABLE OperatesOn AS EDGE;
GO

INSERT INTO ServesLine ($from_id, $to_id)
VALUES 
((SELECT $node_id FROM Station WHERE id = 1),
(SELECT $node_id FROM Branch WHERE id = 1)),
((SELECT $node_id FROM Station WHERE id = 2),
(SELECT $node_id FROM Branch WHERE id = 1)),
((SELECT $node_id FROM Station WHERE id = 3),
(SELECT $node_id FROM Branch WHERE id = 1)),
((SELECT $node_id FROM Station WHERE id = 4),
(SELECT $node_id FROM Branch WHERE id = 1)),
((SELECT $node_id FROM Station WHERE id = 5),
(SELECT $node_id FROM Branch WHERE id = 1)),
((SELECT $node_id FROM Station WHERE id = 6),
(SELECT $node_id FROM Branch WHERE id = 1)),
((SELECT $node_id FROM Station WHERE id = 7),
(SELECT $node_id FROM Branch WHERE id = 1)),
((SELECT $node_id FROM Station WHERE id = 8),
(SELECT $node_id FROM Branch WHERE id = 1)),
((SELECT $node_id FROM Station WHERE id = 9),
(SELECT $node_id FROM Branch WHERE id = 1)),
((SELECT $node_id FROM Station WHERE id = 10),
(SELECT $node_id FROM Branch WHERE id = 1)),
((SELECT $node_id FROM Station WHERE id = 11),
(SELECT $node_id FROM Branch WHERE id = 1)),
((SELECT $node_id FROM Station WHERE id = 12),
(SELECT $node_id FROM Branch WHERE id = 1)),
((SELECT $node_id FROM Station WHERE id = 13),
(SELECT $node_id FROM Branch WHERE id = 1)),
((SELECT $node_id FROM Station WHERE id = 14),
(SELECT $node_id FROM Branch WHERE id = 2)),
((SELECT $node_id FROM Station WHERE id = 15),
(SELECT $node_id FROM Branch WHERE id = 2)),
((SELECT $node_id FROM Station WHERE id = 16),
(SELECT $node_id FROM Branch WHERE id = 2)),
((SELECT $node_id FROM Station WHERE id = 17),
(SELECT $node_id FROM Branch WHERE id = 2)),
((SELECT $node_id FROM Station WHERE id = 18),
(SELECT $node_id FROM Branch WHERE id = 2)),
((SELECT $node_id FROM Station WHERE id = 19),
(SELECT $node_id FROM Branch WHERE id = 2)),
((SELECT $node_id FROM Station WHERE id = 20),
(SELECT $node_id FROM Branch WHERE id = 2)),
((SELECT $node_id FROM Station WHERE id = 21),
(SELECT $node_id FROM Branch WHERE id = 2)),
((SELECT $node_id FROM Station WHERE id = 22),
(SELECT $node_id FROM Branch WHERE id = 2)),
((SELECT $node_id FROM Station WHERE id = 23),
(SELECT $node_id FROM Branch WHERE id = 2)),
((SELECT $node_id FROM Station WHERE id = 24),
(SELECT $node_id FROM Branch WHERE id = 2)),
((SELECT $node_id FROM Station WHERE id = 25),
(SELECT $node_id FROM Branch WHERE id = 2)),
((SELECT $node_id FROM Station WHERE id = 26),
(SELECT $node_id FROM Branch WHERE id = 2)),
((SELECT $node_id FROM Station WHERE id = 27),
(SELECT $node_id FROM Branch WHERE id = 2)),
((SELECT $node_id FROM Station WHERE id = 36),
(SELECT $node_id FROM Branch WHERE id = 2)),
((SELECT $node_id FROM Station WHERE id = 28),
(SELECT $node_id FROM Branch WHERE id = 3)),
((SELECT $node_id FROM Station WHERE id = 29),
(SELECT $node_id FROM Branch WHERE id = 3)),
((SELECT $node_id FROM Station WHERE id = 30),
(SELECT $node_id FROM Branch WHERE id = 3)),
((SELECT $node_id FROM Station WHERE id = 31),
(SELECT $node_id FROM Branch WHERE id = 3)),
((SELECT $node_id FROM Station WHERE id = 32),
(SELECT $node_id FROM Branch WHERE id = 3)),
((SELECT $node_id FROM Station WHERE id = 33),
(SELECT $node_id FROM Branch WHERE id = 3)),
((SELECT $node_id FROM Station WHERE id = 34),
(SELECT $node_id FROM Branch WHERE id = 3)),
((SELECT $node_id FROM Station WHERE id = 35),
(SELECT $node_id FROM Branch WHERE id = 1))
GO

INSERT INTO OperatesOn ($from_id, $to_id)
VALUES
((SELECT $node_id FROM Train WHERE id = 1),
(SELECT $node_id FROM Branch WHERE id = 1)),
((SELECT $node_id FROM Train WHERE id = 2),
(SELECT $node_id FROM Branch WHERE id = 1)),
((SELECT $node_id FROM Train WHERE id = 3),
(SELECT $node_id FROM Branch WHERE id = 1)),
((SELECT $node_id FROM Train WHERE id = 7),
(SELECT $node_id FROM Branch WHERE id = 1)),
((SELECT $node_id FROM Train WHERE id = 4),
(SELECT $node_id FROM Branch WHERE id = 2)),
((SELECT $node_id FROM Train WHERE id = 5),
(SELECT $node_id FROM Branch WHERE id = 2)),
((SELECT $node_id FROM Train WHERE id = 6),
(SELECT $node_id FROM Branch WHERE id = 2)),
((SELECT $node_id FROM Train WHERE id = 8),
(SELECT $node_id FROM Branch WHERE id = 2)),
((SELECT $node_id FROM Train WHERE id = 9),
(SELECT $node_id FROM Branch WHERE id = 3)),
((SELECT $node_id FROM Train WHERE id = 10),
(SELECT $node_id FROM Branch WHERE id = 3))
GO

INSERT INTO AdjacentTo ($from_id, $to_id, distance)
VALUES
((SELECT $node_id FROM Station WHERE id = 1),
(SELECT $node_id FROM Station WHERE id = 2), 1050),
((SELECT $node_id FROM Station WHERE id = 2),
(SELECT $node_id FROM Station WHERE id = 3), 1700),
((SELECT $node_id FROM Station WHERE id = 3),
(SELECT $node_id FROM Station WHERE id = 4), 900),
((SELECT $node_id FROM Station WHERE id = 4),
(SELECT $node_id FROM Station WHERE id = 5), 1590),
((SELECT $node_id FROM Station WHERE id = 5),
(SELECT $node_id FROM Station WHERE id = 6), 810),
((SELECT $node_id FROM Station WHERE id = 6),
(SELECT $node_id FROM Station WHERE id = 7), 1080),
((SELECT $node_id FROM Station WHERE id = 7),
(SELECT $node_id FROM Station WHERE id = 35), 900),
((SELECT $node_id FROM Station WHERE id = 35),
(SELECT $node_id FROM Station WHERE id = 8), 990),
((SELECT $node_id FROM Station WHERE id = 8),
(SELECT $node_id FROM Station WHERE id = 9), 1200),
((SELECT $node_id FROM Station WHERE id = 9),
(SELECT $node_id FROM Station WHERE id = 10), 2000),
((SELECT $node_id FROM Station WHERE id = 10),
(SELECT $node_id FROM Station WHERE id = 11), 1660),
((SELECT $node_id FROM Station WHERE id = 11),
(SELECT $node_id FROM Station WHERE id = 12), 1230),
((SELECT $node_id FROM Station WHERE id = 12),
(SELECT $node_id FROM Station WHERE id = 13), 1670),
((SELECT $node_id FROM Station WHERE id = 6),
(SELECT $node_id FROM Station WHERE id = 28), 0),
((SELECT $node_id FROM Station WHERE id = 28),
(SELECT $node_id FROM Station WHERE id = 29), 1130),
((SELECT $node_id FROM Station WHERE id = 29),
(SELECT $node_id FROM Station WHERE id = 30), 1270),
((SELECT $node_id FROM Station WHERE id = 30),
(SELECT $node_id FROM Station WHERE id = 31), 1470),
((SELECT $node_id FROM Station WHERE id = 31),
(SELECT $node_id FROM Station WHERE id = 32), 950),
((SELECT $node_id FROM Station WHERE id = 32),
(SELECT $node_id FROM Station WHERE id = 33), 2050),
((SELECT $node_id FROM Station WHERE id = 33),
(SELECT $node_id FROM Station WHERE id = 34), 830),
((SELECT $node_id FROM Station WHERE id = 35),
(SELECT $node_id FROM Station WHERE id = 20), 0),
((SELECT $node_id FROM Station WHERE id = 20),
(SELECT $node_id FROM Station WHERE id = 19), 1140),
((SELECT $node_id FROM Station WHERE id = 19),
(SELECT $node_id FROM Station WHERE id = 18), 940),
((SELECT $node_id FROM Station WHERE id = 18),
(SELECT $node_id FROM Station WHERE id = 17), 1910),
((SELECT $node_id FROM Station WHERE id = 17),
(SELECT $node_id FROM Station WHERE id = 16), 1600),
((SELECT $node_id FROM Station WHERE id = 16),
(SELECT $node_id FROM Station WHERE id = 15), 1370),
((SELECT $node_id FROM Station WHERE id = 15),
(SELECT $node_id FROM Station WHERE id = 14), 1610),
((SELECT $node_id FROM Station WHERE id = 20),
(SELECT $node_id FROM Station WHERE id = 21), 1010),
((SELECT $node_id FROM Station WHERE id = 21),
(SELECT $node_id FROM Station WHERE id = 22), 710),
((SELECT $node_id FROM Station WHERE id = 22),
(SELECT $node_id FROM Station WHERE id = 23), 1010),
((SELECT $node_id FROM Station WHERE id = 23),
(SELECT $node_id FROM Station WHERE id = 24), 790),
((SELECT $node_id FROM Station WHERE id = 24),
(SELECT $node_id FROM Station WHERE id = 25), 800),
((SELECT $node_id FROM Station WHERE id = 25),
(SELECT $node_id FROM Station WHERE id = 26), 1540),
((SELECT $node_id FROM Station WHERE id = 26),
(SELECT $node_id FROM Station WHERE id = 27), 1030),
((SELECT $node_id FROM Station WHERE id = 27),
(SELECT $node_id FROM Station WHERE id = 36), 1610),
((SELECT $node_id FROM Station WHERE id = 2),
(SELECT $node_id FROM Station WHERE id = 1), 1050),
((SELECT $node_id FROM Station WHERE id = 3),
(SELECT $node_id FROM Station WHERE id = 2), 1700),
((SELECT $node_id FROM Station WHERE id = 4),
(SELECT $node_id FROM Station WHERE id = 3), 900),
((SELECT $node_id FROM Station WHERE id = 5),
(SELECT $node_id FROM Station WHERE id = 4), 1590),
((SELECT $node_id FROM Station WHERE id = 6),
(SELECT $node_id FROM Station WHERE id = 5), 810),
((SELECT $node_id FROM Station WHERE id = 7),
(SELECT $node_id FROM Station WHERE id = 6), 1080),
((SELECT $node_id FROM Station WHERE id = 35),
(SELECT $node_id FROM Station WHERE id = 7), 900),
((SELECT $node_id FROM Station WHERE id = 8),
(SELECT $node_id FROM Station WHERE id = 35), 990),
((SELECT $node_id FROM Station WHERE id = 9),
(SELECT $node_id FROM Station WHERE id = 8), 1200),
((SELECT $node_id FROM Station WHERE id = 10),
(SELECT $node_id FROM Station WHERE id = 9), 2000),
((SELECT $node_id FROM Station WHERE id = 11),
(SELECT $node_id FROM Station WHERE id = 10), 1660),
((SELECT $node_id FROM Station WHERE id = 12),
(SELECT $node_id FROM Station WHERE id = 11), 1230),
((SELECT $node_id FROM Station WHERE id = 13),
(SELECT $node_id FROM Station WHERE id = 12), 1670),
((SELECT $node_id FROM Station WHERE id = 28),
(SELECT $node_id FROM Station WHERE id = 6), 0),
((SELECT $node_id FROM Station WHERE id = 29),
(SELECT $node_id FROM Station WHERE id = 28), 1130),
((SELECT $node_id FROM Station WHERE id = 30),
(SELECT $node_id FROM Station WHERE id = 29), 1270),
((SELECT $node_id FROM Station WHERE id = 31),
(SELECT $node_id FROM Station WHERE id = 30), 1470),
((SELECT $node_id FROM Station WHERE id = 32),
(SELECT $node_id FROM Station WHERE id = 31), 950),
((SELECT $node_id FROM Station WHERE id = 33),
(SELECT $node_id FROM Station WHERE id = 32), 2050),
((SELECT $node_id FROM Station WHERE id = 34),
(SELECT $node_id FROM Station WHERE id = 33), 830),
((SELECT $node_id FROM Station WHERE id = 20),
(SELECT $node_id FROM Station WHERE id = 35), 0),
((SELECT $node_id FROM Station WHERE id = 19),
(SELECT $node_id FROM Station WHERE id = 20), 1140),
((SELECT $node_id FROM Station WHERE id = 18),
(SELECT $node_id FROM Station WHERE id = 19), 940),
((SELECT $node_id FROM Station WHERE id = 17),
(SELECT $node_id FROM Station WHERE id = 18), 1910),
((SELECT $node_id FROM Station WHERE id = 16),
(SELECT $node_id FROM Station WHERE id = 17), 1600),
((SELECT $node_id FROM Station WHERE id = 15),
(SELECT $node_id FROM Station WHERE id = 16), 1370),
((SELECT $node_id FROM Station WHERE id = 14),
(SELECT $node_id FROM Station WHERE id = 15), 1610),
((SELECT $node_id FROM Station WHERE id = 21),
(SELECT $node_id FROM Station WHERE id = 20), 1010),
((SELECT $node_id FROM Station WHERE id = 22),
(SELECT $node_id FROM Station WHERE id = 21), 710),
((SELECT $node_id FROM Station WHERE id = 23),
(SELECT $node_id FROM Station WHERE id = 22), 1010),
((SELECT $node_id FROM Station WHERE id = 24),
(SELECT $node_id FROM Station WHERE id = 23), 790),
((SELECT $node_id FROM Station WHERE id = 25),
(SELECT $node_id FROM Station WHERE id = 24), 800),
((SELECT $node_id FROM Station WHERE id = 26),
(SELECT $node_id FROM Station WHERE id = 25), 1540),
((SELECT $node_id FROM Station WHERE id = 27),
(SELECT $node_id FROM Station WHERE id = 26), 1030),
((SELECT $node_id FROM Station WHERE id = 36),
(SELECT $node_id FROM Station WHERE id = 27), 1610),
((SELECT $node_id FROM Station WHERE id = 30),
(SELECT $node_id FROM Station WHERE id = 19), 430),
((SELECT $node_id FROM Station WHERE id = 19),
(SELECT $node_id FROM Station WHERE id = 30), 430)
GO

-- Поезды работающие на ветке "Автозаводская"
SELECT Train.id, Train.Model
FROM 
	Train,
	OperatesOn,
	Branch
WHERE MATCH(Train-(OperatesOn)->Branch) AND Branch.Name = 'Автозаводская'

-- Все станции на ветке "Московская"
SELECT Station.Name
FROM Station,
	ServesLine,
	Branch
WHERE MATCH(Station-(ServesLine)->Branch) AND Branch.Name = 'Московская'

-- Соседние станции от станции Октябрьская
SELECT S1.Name AS [Начальная станция], S2.Name AS [Соседние станции]
FROM Station AS S1,
	AdjacentTo,
	Station AS S2
WHERE MATCH(S1-(AdjacentTo)->S2) AND S1.Name = 'Октябрьская'

-- Станции которые можно посетить проехав до двух станций от станции Фрунзенская 
SELECT DISTINCT S3.Name
FROM Station AS S1,
	AdjacentTo AS A1,
	Station AS S2,
	AdjacentTo AS A2,
	Station AS S3
WHERE MATCH (S1-(A1)->S2-(A2)->S3) AND S1.Name = 'Фрунзенская'

-- Станции которые можно посетить проехав до трёх станций от станции Купаловская 
SELECT DISTINCT S4.Name
FROM Station AS S1,
	AdjacentTo AS A1,
	Station AS S2,
	AdjacentTo AS A2,
	Station AS S3,
	AdjacentTo AS A3,
	Station AS S4
WHERE MATCH (S1-(A1)->S2-(A2)->S3-(A3)->S4) AND 
	  S1.Name = 'Купаловская'

-- Один из возможных кратчайших путей от станции Немига до Ковальской Слободы
SELECT [Начальная станция], [Станции], [Кол-во станций]
FROM (
SELECT S1.Name AS [Начальная станция], STRING_AGG(S2.Name, '->') WITHIN GROUP (GRAPH PATH) AS [Станции], 
	   LAST_VALUE(S2.Name) WITHIN GROUP (GRAPH PATH) AS [Последняя станция], 
	   COUNT(S2.Name) WITHIN GROUP (GRAPH PATH) AS [Кол-во станций]
FROM Station AS S1,
	 AdjacentTo FOR PATH AS A1,
	 Station FOR PATH AS S2
WHERE MATCH(SHORTEST_PATH(S1(-(A1)->S2)+)) AND
	S1.Name = 'Немига'
) AS [Подзапрос]
WHERE [Последняя станция] = 'Ковальская Слобода'


-- Станции на расстоянии от 1-3 станций от станции Купаловская 
SELECT S1.Name AS [Начальная станция], STRING_AGG(S2.Name, '->') WITHIN GROUP (GRAPH PATH) AS [Станции]
FROM Station AS S1,
	 AdjacentTo FOR PATH AS A1,
	 Station FOR PATH AS S2
WHERE MATCH(SHORTEST_PATH(S1(-(A1)->S2){1,3})) AND
	S1.Name = 'Купаловская'
