{{ config(materialized ='table')}}


WITH Orders AS (
  SELECT * FROM {{ ref('stg_orders') }}
),
Employees AS (
  SELECT * FROM {{ ref('stg_employees') }}
),
Departments AS (
  SELECT * FROM {{ ref('stg_departments') }}
)

SELECT Employees.FirstName, 
    Employees.LastName, 
    Departments.DepartmentName, 
    orders.orderDate, 
    orders.totalAmount

FROM Employees
JOIN Departments ON Departments.DepartmentID = Employees.DepartmentID
JOIN Orders ON Orders.employeeID = Employees.employeeID