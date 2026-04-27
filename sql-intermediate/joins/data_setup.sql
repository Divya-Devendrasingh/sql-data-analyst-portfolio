-- Drop tables if they already exist (optional)
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customers;

-- =========================
-- Create Customers Table
-- =========================
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);

-- Insert data into Customers
INSERT INTO Customers (customer_id, name, city) VALUES
(1, 'Anita', 'Hyderabad'),
(2, 'Ravi', 'Bangalore'),
(3, 'Sita', 'Chennai'),
(4, 'Kiran', 'Mumbai'),
(5, 'Arjun', 'Delhi');

-- =========================
-- Create Orders Table
-- =========================
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(10,2),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Insert data into Orders
INSERT INTO Orders (order_id, customer_id, amount, order_date) VALUES
(101, 1, 5000.00, '2024-01-10'),
(102, 2, 7000.00, '2024-01-12'),
(103, 1, 3000.00, '2024-02-05'),
(104, 3, 8000.00, '2024-02-20');
