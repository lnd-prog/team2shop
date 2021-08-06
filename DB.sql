CREATE DATABASE PRO1041
GO

USE PRO1041
GO

IF OBJECT_ID('OrderDetails') IS NOT NULL
DROP TABLE OrderDetails
GO

IF OBJECT_ID('Orders') IS NOT NULL
DROP TABLE Orders
GO

IF OBJECT_ID('Products') IS NOT NULL
DROP TABLE Products
GO

IF OBJECT_ID('Categories') IS NOT NULL
DROP TABLE Categories
GO

IF OBJECT_ID('Accounts') IS NOT NULL
DROP TABLE Accounts
GO

CREATE TABLE Accounts(
	Username nvarchar(50) NOT NULL primary key,
	Password nvarchar(50) NOT NULL,
	Fullname nvarchar(50) NOT NULL,
	Email nvarchar(50) NOT NULL,
	Photo nvarchar(255) NULL,
	Activated bit,
	Role bit
)

GO
CREATE TABLE Categories(
	ID int IDENTITY primary key,
	Name nvarchar(50) NOT NULL,
)

GO
CREATE TABLE Products(
	ID int IDENTITY primary key,
	Name nvarchar(50) NOT NULL,
	Image nvarchar(255) NULL,
	Price float,
	CreateDate date DEFAULT getdate(),
	Available bit,
	CategoryID int,

	FOREIGN KEY (CategoryID) REFERENCES Categories(ID),
)

GO
CREATE TABLE Orders(
	ID bigint IDENTITY primary key,
	Username nvarchar(50) NOT NULL,
	Phone char(10) NOT NULL,
	CreateDate datetime DEFAULT getdate(),
	Address nvarchar(100) NOT NULL,
	Note nvarchar(200) NULL,
	Status Integer default 0

	FOREIGN KEY (Username) REFERENCES Accounts(Username),
)

GO
CREATE TABLE OrderDetails(
	ID bigint IDENTITY primary key,
	OrderID bigint,
	ProductID int,
	Price float,
	Quantity int,

	FOREIGN KEY (OrderID) REFERENCES Orders(ID),
	FOREIGN KEY (ProductID) REFERENCES Products(ID),
)
--Them thong tin cho bang Accounts
INSERT INTO Accounts(Username, Password, Fullname, Email, Photo, Activated, Role)
			VALUES (N'lnd', N'abc', N'LND', N'luannnguyenduc@gmail.com', N'admin.png', 1, 1);
INSERT INTO Accounts(Username, Password, Fullname, Email, Photo, Activated, Role)
			VALUES (N'namnd', N'abc', N'NAMND', N'namndph10091@fpt.edu.vn', N'user.png', 1, 0);
INSERT INTO Accounts(Username, Password, Fullname, Email, Photo, Activated, Role)
			VALUES (N'datvt', N'abc', N'DATVT', N'datvtph10906@fpt.edu.vn', N'userFake.png', 0, 0);
--Them thong tin cho bang Categories
INSERT INTO Categories VALUES (N'Chuột');
INSERT INTO Categories VALUES (N'Bàn phím');
INSERT INTO Categories VALUES (N'Tai nghe');
--Them thong tin cho bang Products
INSERT INTO Products(Name, Image, Price, Available, CategoryID)
			VALUES (N'Chuột Razer Deathadder V2', N'chuotRazerDeathadderV2.jpg', 999000, 1, 1);
INSERT INTO Products(Name, Image, Price, Available, CategoryID)
			VALUES (N'Tai nghe gaming Logitech G231', N'taiNgheGamingLogitechG231.jpg', 499000, 1, 3);
INSERT INTO Products(Name, Image, Price, Available, CategoryID)
			VALUES (N'Bàn phím Dareu DK880 RGB', N'banPhimDareuDK880RGB.jpg', 699000, 1, 2);
INSERT INTO Products(Name, Image, Price, Available, CategoryID)
			VALUES (N'Chuột Corsair Ironclaw RGB', N'chuotCorsairIronclawRGB.jpg', 988000, 1, 1);
INSERT INTO Products(Name, Image, Price, Available, CategoryID)
			VALUES (N'Chuột Fuhlen G90s', N'chuotFuhlenG90s.jpg', 299000, 1, 1);
INSERT INTO Products(Name, Image, Price, Available, CategoryID)
			VALUES (N'Tai nghe gaming HyperX Cloud', N'taiNgheGamingHyperXCloud.jpg', 549000, 1, 3);
INSERT INTO Products(Name, Image, Price, Available, CategoryID)
			VALUES (N'Tai nghe gaming New4all V2000', N'taiNgheGamingNew4allV2000.jpg', 299999, 0, 3);
INSERT INTO Products(Name, Image, Price, Available, CategoryID)
			VALUES (N'Chuột Razer Naga Trinity', N'chuotRazerNagaTrinity.jpg', 999001, 1, 1);
INSERT INTO Products(Name, Image, Price, Available, CategoryID)
			VALUES (N'Chuột Steelseries Sensei 310', N'chuotSteelseriesSensei310.jpg', 888888, 1, 1);
INSERT INTO Products(Name, Image, Price, Available, CategoryID)
			VALUES (N'Tai nghe gaming Razer Kraken Pro', N'taiNgheGamingRazerKrakenPro.jpg', 200002, 1, 3);
INSERT INTO Products(Name, Image, Price, Available, CategoryID)
			VALUES (N'Bàn phím Logitech G Pro Gaming', N'banPhimLogitechGProGaming.jpg', 111111, 1, 2);
			
--Them thong tin cho bang Orders
INSERT INTO Orders(Username, Phone, Address, Status)
			VALUES (N'user', '0123456789', N'Address User 111', 2);
INSERT INTO Orders(Username, Phone,Address, Status)
			VALUES (N'userFake', '0987654321', N'Address NamNT', 1);
--them thong tin cho bang OrderDetails
INSERT INTO OrderDetails(OrderID, ProductID, Price, Quantity)
			VALUES (1, 1, 99000, 2);
INSERT INTO OrderDetails(OrderID, ProductID, Price, Quantity)
			VALUES (2, 2, 49000, 2);
INSERT INTO OrderDetails(OrderID, ProductID, Price, Quantity)
			VALUES (1, 8, 99001, 1);
INSERT INTO OrderDetails(OrderID, ProductID, Price, Quantity)
			VALUES (2, 3, 69000, 1);
INSERT INTO OrderDetails(OrderID, ProductID, Price, Quantity)
			VALUES (2, 9, 10001, 1);
INSERT INTO OrderDetails(OrderID, ProductID, Price, Quantity)
			VALUES (1, 10, 20002, 1);
INSERT INTO OrderDetails(OrderID, ProductID, Price, Quantity)
			VALUES (1, 11, 11111, 1);

SELECT * FROM Accounts
SELECT * FROM Categories
SELECT * FROM Products
SELECT * FROM Orders
SELECT * FROM OrderDetails

Select o.ID, o.Username, p.Name, od.Price, od.Quantity, SUM(od.price * od.Quantity) as ThanhTien
from Orders o join OrderDetails od 
on o.ID = od.OrderID join Products p
on od.ProductID = p.ID
where OrderID = '1'
Group by o.ID, o.Username, p.Name, od.Price, od.Quantity

Select o.ID, o.Username, o.Address, SUM(od.Price) as Tong_Tien
From Orders o join OrderDetails od 
on o.ID = od.OrderID
group by o.ID, o.Username, o.Address

SELECT TOP 3 p.* , sum(od.Quantity)
FROM Products p JOIN OrderDetails od
ON p.ID = od.ProductID
GROUP BY p.ID, p.Name, p.Price, p.Image, p.CreateDate, p.Available, p.CategoryID
ORDER BY sum(od.Quantity) DESC

