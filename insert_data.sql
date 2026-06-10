INSERT INTO Customers VALUES
(1,'Neel','Lucknow','India'),
(2,'Rahul','Delhi','India'),
(3,'Priya','Mumbai','India'),
(4,'Aman','Pune','India'),
(5,'Sneha','Bangalore','India');  

INSERT INTO Products VALUES
(101,'Laptop','Electronics',60000),
(102,'Mouse','Electronics',500),
(103,'Keyboard','Electronics',1500),
(104,'Chair','Furniture',4000),
(105,'Table','Furniture',7000);

INSERT INTO Orders VALUES
(1001,1,'2025-01-10'),
(1002,2,'2025-01-15'),
(1003,3,'2025-02-05'),
(1004,1,'2025-02-20'),
(1005,5,'2025-03-01');

INSERT INTO Order_Details VALUES
(1,1001,101,1),
(2,1001,102,2),
(3,1002,103,1),
(4,1003,104,3),
(5,1004,101,1),
(6,1005,105,2);
