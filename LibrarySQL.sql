CREATE DATABASE Library;
Use Library;
GO
CREATE TABLE Status (
	Status_id int IDENTITY(1,1),
	NameStatus varchar(255),
	PRIMARY KEY(Status_id)
	);

	CREATE TABLE Book (
	Book_id int IDENTITY(1,1),
	Title varchar(255),
	Author varchar(255),
	PRIMARY KEY(Book_id)
);

CREATE TABLE UserBilet (
	Bilet_Id int IDENTITY(1,1),
	Book_id int FOREIGN KEY REFERENCES Book(Book_id),
	Status_id int FOREIGN KEY REFERENCES Status(Status_id),
	User_id int FOREIGN KEY REFERENCES Users(User_id),
	StartDate date,
	FinishDate date,
	CountDebtDay varchar(255),
	PRIMARY KEY(Bilet_Id)
);

CREATE TABLE Users (
	User_id int IDENTITY(1,1),
	Name varchar(255),
	PRIMARY KEY(User_id)
);

INSERT INTO Status(NameStatus) values('Просрочен');
INSERT INTO Status(NameStatus) values('Действителен');

INSERT INTO Book(Title,Author) values('«Властелин колец»','Джон Р. Р. Толкин');
INSERT INTO Book(Title,Author) values('«Война и мир»','Лев Толстой');
INSERT INTO Book(Title,Author) values('«Человек-невидимка»','Ральф Эллисон');
INSERT INTO Book(Title,Author) values('«Распад»','Чинуа Ачебе');
INSERT INTO Book(Title,Author) values('«Мёртвые души»','Николай Гоголь');
INSERT INTO Book(Title,Author) values('«Граф Монте-Кристо»','Александр Дюма');
INSERT INTO Book(Title,Author) values('«Палата № 6»','Антон Чехов');
INSERT INTO Book(Title,Author) values('«Три мушкетера»','Александр Дюма');
INSERT INTO Book(Title,Author) values('«Идиот»','Федор Достоевский');
INSERT INTO Book(Title,Author) values('«Горе от ума»','Александр Грибоедов');
INSERT INTO Book(Title,Author) values('«Униженные и оскорблённые»','Федор Достоевский');
INSERT INTO Book(Title,Author) values('«Обломов»','Иван Гончаров');
INSERT INTO Book(Title,Author) values('«Алые паруса»','Александр Грин');
INSERT INTO Book(Title,Author) values('«Морфий»','Михаил Булгаков');
INSERT INTO Book(Title,Author) values('«Приключения Тома Сойера»','Марк Твен');

select * from Book;

INSERT INTO UserBilet(Book_id, Status_id, User_id, StartDate, FinishDate, CountDebtDay) values(1, 1, 6,'2022-09-02','2022-11-02', 53);
INSERT INTO UserBilet(Book_id, Status_id, User_id, StartDate, FinishDate, CountDebtDay) values(14, 2, 2,'2022-11-21','2023-01-21', 0);
INSERT INTO UserBilet(Book_id, Status_id, User_id, StartDate, FinishDate, CountDebtDay) values(10, 2, 1,'2022-12-22','2023-01-22', 0);
INSERT INTO UserBilet(Book_id, Status_id, User_id, StartDate, FinishDate, CountDebtDay) values(15, 1, 4,'2022-11-20','2022-12-20', 5);
INSERT INTO UserBilet(Book_id, Status_id, User_id, StartDate, FinishDate, CountDebtDay) values(9, 1, 5,'2022-01-09','2022-03-09', 271);
INSERT INTO UserBilet(Book_id, Status_id, User_id, StartDate, FinishDate, CountDebtDay) values(7, 2, 3,'2022-12-23','2023-01-23', 0);

select * from UserBilet;

INSERT INTO Users(Name) values('Ваня');
INSERT INTO Users(Name) values('Соня');
INSERT INTO Users(Name) values('Лена');
INSERT INTO Users(Name) values('Маша');
INSERT INTO Users(Name) values('Егор');
INSERT INTO Users(Name) values('Дима');


select Name, Title, CountDebtDay from Users, UserBilet, Book
where Book.Book_id = UserBilet.Book_id
and UserBilet.User_id = Users.User_id
and CountDebtDay > 0;

select Name, Title, CountDebtDay from Users, UserBilet, Book
where Book.Book_id = UserBilet.Book_id
and UserBilet.User_id = Users.User_id
order by Name asc;

select Name, Title, CountDebtDay from Users, UserBilet, Book
where Book.Book_id = UserBilet.Book_id
and UserBilet.User_id = Users.User_id
and StartDate > '2022-12-01';

select Name, Title, CountDebtDay from Users, UserBilet, Book
where Book.Book_id = UserBilet.Book_id
and UserBilet.User_id = Users.User_id
and FinishDate > '2023-01-01';

select Name, Title, NameStatus from Users, UserBilet, Status, Book
where Book.Book_id = UserBilet.Book_id
and UserBilet.User_id = Users.User_id
and UserBilet.Status_id = Status.Status_id
and NameStatus = 'Просрочен'
order by Title desc;

select Title, Author from Book
where CHARINDEX('В', Title) > 0;

UPDATE UserBilet SET Status_id = 2 
where User_id = 4;
UPDATE UserBilet SET CountDebtDay = 0
where User_id = 4;
