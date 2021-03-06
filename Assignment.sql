CREATE TABLE Products (
	ID INT IDENTITY,
	Name NVARCHAR(80) NOT NULL,
	Price DECIMAL(10, 2) NOT NULL
	CONSTRAINT PK_prod PRIMARY KEY (ID)
);

CREATE TABLE Customers (
	ID INT IDENTITY,
	Firstname NVARCHAR(80) NOT NULL,
	Lastname NVARCHAR(80) NOT NULL,
	CardNumber BIGINT NOT NULL
	CONSTRAINT PK_cust PRIMARY KEY (ID)
);

CREATE TABLE Orders (
	ID INT IDENTITY,
	ProductID INT NOT NULL,
	CustomerID INT NOT NULL
	CONSTRAINT PK_ord PRIMARY KEY (ID)
);

ALTER TABLE Orders ADD CONSTRAINT
	FK_ord1 FOREIGN KEY (ProductID) REFERENCES Products (ID);

ALTER TABLE Orders ADD CONSTRAINT
	FK_ord2 FOREIGN KEY (CustomerID) REFERENCES Customers (ID);

-- Add at least 3 records into each table
INSERT INTO Products (Name, Price) VALUES
	('Cactus', 180.00),
	('Hydrangeas', 18.00),
	('Daisies', 15.00);

INSERT INTO Customers (Firstname, Lastname, CardNumber) VALUES
	('John', 'Deere', 1515313158589898),
	('J.B.', 'Hunt', 7897897894564564),
	('Sam', 'Gardener', 1111222233334444);

INSERT INTO Orders (ProductID, CustomerID) VALUES
	(1, 3),
	(2, 2),
	(3, 1);

-- Add product iPhone priced at $200.
INSERT INTO Products (Name, Price) VALUES ('iPhone', 200.00);

-- Add customer Tina Smith
INSERT INTO Customers (Firstname, Lastname, CardNumber) VALUES ('Tina', 'Smith', 5555666677778888);

--Create order for Tina Smith bought an iPhone
INSERT INTO Orders (ProductID, CustomerID) VALUES (4, 4);

INSERT INTO Orders (ProductID, CustomerID) VALUES (4, 2);
INSERT INTO Orders (ProductID, CustomerID) VALUES (4, 1);

-- Report all orders by Tina Smith
SELECT o.ID, c.Firstname, c.Lastname, p.Name 
	FROM Customers c INNER JOIN Orders o ON c.ID = o.CustomerID 
	INNER JOIN Products p ON o.ProductID = p.ID
	WHERE c.Firstname = 'Tina' AND c.Lastname = 'Smith';

-- Report all revenue generated by sales of iPhone
SELECT SUM(p.Price), p.Name
	FROM Orders o INNER JOIN Products p ON o.ProductID = p.ID
	WHERE p.Name = 'iPhone'
	GROUP BY p.Name;

-- Increase the price of iPhone to $250.
UPDATE Products 
SET Price = 250.00 
WHERE Name = 'iPhone';
