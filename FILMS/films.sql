CREATE DATABASE Cinema
use Cinema
create table Tickets
(
Id int identity(1,1) primary key,
SoldDate date ,
Price float,
Place decimal,
CustometId int references Customers(Id),
HallId int references Hall(Id),
FilmId int references Films(Id),
SeansId int references Seans(Id)
)
INSERT INTO Tickets(SoldDate,Price,Place,CustometId,FilmId,HallId,SeansId)
values('2022-04-13',4.50,07,1,1,1,1),
('2022-04-13',7.50,15,2,2,2,2),
('2022-04-13',5.00,31,3,3,3,3),
('2022-04-13',15.00,19,4,5,4,1),
('2022-04-13',7.50,09,5,3,5,4)
SELECT*FROM Tickets

create table Customers
(
Id int identity(1,1) primary key, 
Name nvarchar(50),
SurName nvarchar(60),
Age int
)
INSERT INTO Customers(Name,SurName,Age)
values('Anar','Qandayev',21),
('Oktay','Qandayev',21),
(N'Şirin','Qandayev',21),
(N'Lalə','Qandayeva',21),
(N'Fatimə','Qandayeva',21),
(N'Mənsurə','Qandayeva',21)
SELECT*FROM Customers
 

create table Hall
(
Id int identity(1,1) primary key, 
Name nvarchar(255),
SeatCount int
)
INSERT INTO Hall(Name,SeatCount)
values('InvestAZ',60),
('Platinum',70),
('Hall 1',50),
('VIP 10 (Diamond)',55),
('Coffee `Njoy',65)
SELECT*FROM Hall

create table Seans
(
Id int identity(1,1) primary key, 
Time time
)
INSERT INTO Seans(Time)
values('11:55'),
('19:35'),
('16:40'),
('21:00')
SELECT*FROM Seans

create table Films
(
Id int identity(1,1) primary key,
Name nvarchar(255) not null,
[Format] nvarchar(50), 
ReleaseDate date,
--FilmId int references Films(Id)
)
INSERT INTO Films(Name,[Format],ReleaseDate)
values(N'İtirilmiş Şəhər','2D','2021-12-01'),
(N'Morbius','2D','2019-02-06'),
(N'Təcili yardım','2D','2020-12-01'),
(N'Kendinden Kaçak','2D','2018-08-01'),
(N'9 güllə','2D','2021-10-01')
SELECT*FROM Films

create table Actors
(
Id int identity(1,1) primary key, 
Name nvarchar(50),
Surname nvarchar(60),
Age int
)
INSERT INTO Actors(Name,Surname,Age)
values('Hesen','Memmedov',61),
('Afaq ',N'Bəşirqızı',67),
(N'İlham ',N'Namiq Kamal',76),
('Fatma ','Mahmudova',68),
(N'Ülviyyə',N'Əliyeva',31)
SELECT*FROM Actors

create table Genres
(
Id int identity(1,1) primary key, 
Name  nvarchar(255)
)
INSERT INTO Genres(Name)
values('Dram '),
('Cartoon'),
('Fiction'),
('Fight'),
('Romantic')
SELECT*FROM Genres

create table FilimGenre
(
Id int identity(1,1) primary key, 
FilmId int references Films(Id),
GenreId int references Genres(Id)
)
INSERT INTO FilimGenre(FilmId,GenreId)
values(1,1),
(2,2),
(3,3),
(4,4)
SELECT*FROM FilimGenre

create table FilimActors
(
Id int identity(1,1) primary key, 
FilmId int references Films(Id),
ActorId int references Actors(Id)
)
INSERT INTO FilimActors(FilmId,ActorId)
values(1,1),
(2,2),
(3,3),
(4,4)
SELECT*FROM FilimActors


CREATE PROCEDURE usp_BuyTicket 
as
SELECT Films.Name,Films.[Format],Films.ReleaseDate
FROM Films
JOIN Tickets
ON
Films.Id=Tickets.Id
exec usp_BuyTicket

SELECT*FROM Tickets

