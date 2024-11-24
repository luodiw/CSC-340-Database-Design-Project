-- Query 1: Employee Salary Analysis
-- Description: Identifies higher-paid employees making over $20/hour, useful for payroll analysis and budget planning
-- Types: Selection (WHERE), Projection (SELECT)
SELECT FirstName, LastName, HourlyRate
FROM Employee
WHERE HourlyRate > 20.00;

-- Query 2: Vehicle Maintenance Tracking
-- Description: Shows the maintenance history for all vehicles, helping fleet managers monitor service schedules and maintenance patterns
-- Types: Joins
SELECT v.LicensePlate, v.VehicleType, m.ServiceDate
FROM Vehicle v, Maintenance m
WHERE v.LicensePlate = m.LicensePlate;

-- Query 3: Product Category Overview
-- Description: Provides a summary of product categories based on the total item count and average retail pricing for each type of item category,
-- useful to gain insight on better inventory management and pricing strategy
-- Types: Aggregate Functions, Grouping
SELECT CategoryType, COUNT(*) as ItemCount, AVG(RetailPrice) as AvgRetailPrice
FROM Item
GROUP BY CategoryType;

-- Query 4: Beef Product Inventory
-- Description: Lists all beef-related products in inventory, helping meat department managers track beef product offerings
-- Types: Pattern Matching
SELECT ItemName, CategoryType
FROM Item
WHERE CategoryType LIKE '%BEEF%';

-- Query 5: Business Type Distribution
-- Description: Shows the distribution of client business types, highlighting which business
-- categories have significant representation to better align product needs
-- Types: Grouping, Having Clause
SELECT BusinessType, COUNT(*) as ClientCount
FROM Client
GROUP BY BusinessType
HAVING ClientCount > 2;

-- Query 6: Employee Sales Performance Measurement
-- Description: An analysis on employee sales performance, demonstrating total sales,
-- average order values, and customer reach per employee. Demonstrate top performers first following by other employee performances
-- Types: Nested Query, Joins, Aggregate Functions, Calculations, Sorting
SELECT 
    e.EmployeeID,
    e.FirstName,
    e.LastName,
    er.Role,
    COUNT(DISTINCT o.OrderID) AS TotalOrders,
    ROUND(SUM(o.TotalAmount), 2) AS TotalSales,
    ROUND(AVG(o.TotalAmount), 2) AS AvgOrderValue,
    (SELECT COUNT(DISTINCT ClientID) 
     FROM OrderTable 
     WHERE EmployeeID = e.EmployeeID) AS UniqueClients
FROM Employee e
JOIN EmployeeRole er ON e.EmployeeID = er.EmployeeID
LEFT JOIN OrderTable o ON e.EmployeeID = o.EmployeeID
GROUP BY e.EmployeeID, e.FirstName, e.LastName, er.Role
ORDER BY TotalSales DESC;

-- Query 7: Payment Terms Impact
-- Description: Analyzes how different payment terms affect customer ordering patterns and 
-- order values, This can be useful in building financial policy decisions with current and future clients
-- Types: Self-Join, Aggregate Functions, Grouping, Calculations, Sorting
SELECT 
    a.PaymentTerm,
    COUNT(DISTINCT c.ClientID) as NumberOfClients,
    ROUND(AVG(o.TotalAmount), 2) as AvgOrderValue,
    (SELECT COUNT(*) 
     FROM OrderTable o2 
     WHERE o2.ClientID = c.ClientID 
     AND o2.OrderDate >= DATE_SUB('2024-11-07', INTERVAL 30 DAY)
    ) as OrdersLastMonth
FROM Account a
JOIN Client c ON a.ClientID = c.ClientID
JOIN OrderTable o ON c.ClientID = o.ClientID
GROUP BY a.PaymentTerm
ORDER BY AvgOrderValue DESC;

-- Query 8: Product Pricing Variance
-- Description: Identifies products with significant price markup variations compared to their
-- category averages. This can be used to help and identify new optimizable pricing strategies
-- Types: Nested Query, Calculations, Selection, Joins, Pattern Matching
SELECT 
    i.ItemID,
    i.ItemName,
    i.CategoryType,
    i.RetailPrice,
    i.WholesalePrice,
    ROUND(i.RetailPrice - i.WholesalePrice, 2) as Markup,
    ROUND((
        SELECT AVG(RetailPrice - WholesalePrice)
        FROM Item i2
        WHERE i2.CategoryType = i.CategoryType
    ), 2) as AvgCategoryMarkup,
    ROUND(((i.RetailPrice - i.WholesalePrice) / (
        SELECT AVG(RetailPrice - WholesalePrice)
        FROM Item i2
        WHERE i2.CategoryType = i.CategoryType
    ) - 1) * 100, 2) as MarkupVariancePercent
FROM Item i
WHERE i.CategoryType IN ('BEEF OFFALS', 'POULTRY', 'PORK', 'LAMB PRODUCTS')
HAVING ABS(MarkupVariancePercent) > 25
ORDER BY ABS(MarkupVariancePercent) DESC;

-- Query 9: Fleet Maintenance Cost
-- Description: Analyzes maintenance costs and frequency by vehicle type, The goal is to help optimize
-- fleet management and maintenance scheduling in case a vehicle needs repairs
-- Types: Joins, Grouping, Aggregate Functions, Calculations, Sorting
SELECT 
    v.VehicleType,
    COUNT(DISTINCT v.LicensePlate) as VehicleCount,
    COUNT(m.MaintenanceID) as TotalMaintenances,
    ROUND(AVG(m.Cost), 2) as AvgMaintenanceCost,
    ROUND(SUM(m.Cost), 2) as TotalMaintenanceCost,
    ROUND(AVG(m.LaborHours), 1) as AvgLaborHours,
    ROUND(COUNT(m.MaintenanceID) / COUNT(DISTINCT v.LicensePlate), 1) as MaintenancesPerVehicle
FROM Vehicle v
LEFT JOIN Maintenance m ON v.LicensePlate = m.LicensePlate
GROUP BY v.VehicleType
ORDER BY TotalMaintenanceCost DESC;

-- Query 10: Supply Chain Risk
-- Description: Identifies potential supply chain issues by analyzing stock changes and 
-- damage patterns across products. This can lead to potential changes of vendors if a stock is continously reported to have
-- damage or a decrease in quality.
-- Types: Joins (multiple), Nested Query, Aggregate Functions, Pattern Matching
SELECT 
    i.ItemID,
    i.ItemName,
    i.CategoryType,
    COUNT(sc.StockChangeID) as StockChangeCount,
    SUM(CASE WHEN sc.Reason LIKE 'Damaged%' THEN 1 ELSE 0 END) as DamageCount,
    ROUND(AVG(sc.QuantityChange), 2) as AvgQuantityChange,
    (SELECT COUNT(DISTINCT SupplierID) 
     FROM SupplierItem si 
     WHERE si.ItemID = i.ItemID) as SupplierCount
FROM Item i
LEFT JOIN StockChange sc ON i.ItemID = sc.ItemID
WHERE sc.StockChangeDate >= DATE_SUB('2024-11-07', INTERVAL 365 DAY)
GROUP BY i.ItemID, i.ItemName, i.CategoryType
HAVING StockChangeCount > 2
ORDER BY StockChangeCount DESC;

-- Query 11: Return on Investment analysis on Employee Compensation
-- Description: This analyzes the relationship between employee compensation and sales performance, this can aid
-- in evaluating potential additions of compensations to staff based on higher or lower return on investment for more engagement.
-- Types: Joins (multiple), Calculations, Aggregate Functions, Nested Query
SELECT 
    e.EmployeeID,
    CONCAT(e.FirstName, ' ', e.LastName) as EmployeeName,
    er.Role,
    ROUND(SUM(p.GrossPay), 2) as TotalCompensation,
    COUNT(DISTINCT o.OrderID) as OrdersProcessed,
    ROUND(SUM(o.TotalAmount), 2) as TotalSales,
    ROUND(SUM(o.TotalAmount) / NULLIF(SUM(p.GrossPay), 0), 2) as SalesPerCompensationDollar
FROM Employee e
JOIN EmployeeRole er ON e.EmployeeID = er.EmployeeID
LEFT JOIN Paycheck p ON e.EmployeeID = p.EmployeeID
LEFT JOIN OrderTable o ON e.EmployeeID = o.EmployeeID
WHERE p.PayPeriodStart >= DATE_SUB('2024-11-07', INTERVAL 90 DAY)
GROUP BY e.EmployeeID, EmployeeName, er.Role
HAVING OrdersProcessed > 0
ORDER BY SalesPerCompensationDollar DESC;

-- Query 12: Delivery Route Efficiency 
-- Description: Evaluates delivery route performance by analyzing speed, stops, and order 
-- completion metrics 
-- Types: Joins, Aggregate Functions, Calculations, Selection, Sorting
SELECT 
    r.RouteID,
    r.EmployeeID,
    COUNT(o.OrderID) as OrdersDelivered,
    r.TotalStops,
    r.EstimatedMileage,
    TIME_FORMAT(TIMEDIFF(r.EndTime, r.StartTime), '%H:%i') as RouteDuration,
    ROUND(r.EstimatedMileage / TIME_TO_SEC(TIMEDIFF(r.EndTime, r.StartTime)) * 3600, 2) as AvgSpeedMPH,
    ROUND(COUNT(o.OrderID) / TIME_TO_SEC(TIMEDIFF(r.EndTime, r.StartTime)) * 3600, 2) as OrdersPerHour
FROM Route r
LEFT JOIN OrderTable o ON r.RouteID = o.RouteID
WHERE r.RouteStatus = 'Completed'
GROUP BY r.RouteID, r.EmployeeID, r.TotalStops, r.EstimatedMileage, r.EndTime, r.StartTime
ORDER BY OrdersPerHour DESC;

-- Query 13: Customer Credit Risk Evaluation
-- Description: Assesses credit risk patterns across different business types, helping
-- manage credit exposure and payment terms
-- Types: Joins (multiple), Calculations, Aggregate Functions, Pattern Matching
SELECT 
    c.BusinessType,
    COUNT(DISTINCT c.ClientID) as ClientCount,
    ROUND(AVG(a.CreditLimit), 2) as AvgCreditLimit,
    ROUND(AVG(a.CurrentBalance / NULLIF(a.CreditLimit, 0) * 100), 2) as AvgCreditUtilization,
    ROUND(AVG(DATEDIFF('2024-11-07', a.LastPaymentDate)), 0) as AvgDaysSinceLastPayment,
    COUNT(CASE WHEN a.CurrentBalance > a.CreditLimit THEN 1 END) as OverLimitCount
FROM Client c
JOIN Account a ON c.ClientID = a.ClientID
WHERE c.AccountStatus = 'Active'
GROUP BY c.BusinessType
HAVING ClientCount > 2
ORDER BY AvgCreditUtilization DESC;

-- Query 14: Seasonal Sales Pattern Measurement
-- Description: Identifies seasonal trends in product category sales, This will optimize
-- inventory and staffing levels when there is higher demand for certain products in particular categories that they need.
-- Types: Joins (multiple), Aggregate Functions, Temporal Analysis, Grouping
SELECT 
    i.CategoryType,
    MONTH(o.OrderDate) as OrderMonth,
    COUNT(DISTINCT o.OrderID) as OrderCount,
    SUM(oi.Quantity) as TotalQuantity,
    ROUND(SUM(oi.TotalAmount), 2) as TotalRevenue,
    ROUND(AVG(oi.TotalAmount), 2) as AvgOrderValue
FROM Item i
JOIN OrderItem oi ON i.ItemID = oi.ItemID
JOIN OrderTable o ON oi.OrderID = o.OrderID
WHERE o.OrderDate >= DATE_SUB('2024-11-07', INTERVAL 365 DAY)
GROUP BY i.CategoryType, OrderMonth
ORDER BY i.CategoryType, OrderMonth;

-- Query 15: Assessing Supplier Quality and Reliability
-- Description: Evaluates supplier performance based on product range, pricing, and
-- quality issues reported for the products they have supplied.
-- Types: Joins (multiple), Nested Query, Calculations, Pattern Matching
SELECT 
    s.CompanyName,
    s.PaymentTerm,
    COUNT(DISTINCT si.ItemID) as ItemsSupplied,
    ROUND(AVG(i.WholesalePrice), 2) as AvgWholesalePrice,
    (SELECT COUNT(DISTINCT sc.StockChangeID)
     FROM StockChange sc
     JOIN SupplierItem si2 ON sc.ItemID = si2.ItemID
     WHERE si2.SupplierID = s.SupplierID
     AND sc.Reason LIKE '%Damaged%') as DamagedItemReports
FROM Supplier s
JOIN SupplierItem si ON s.SupplierID = si.SupplierID
JOIN Item i ON si.ItemID = i.ItemID
WHERE s.ActiveStatus = 'Active'
GROUP BY s.CompanyName, s.PaymentTerm
HAVING ItemsSupplied > 5
ORDER BY ItemsSupplied DESC;

-- Query 16: Weekly Order Distribution
-- Description: Analyze order patterns across different days of the week, this will help
-- optimize staffing and delivery schedules to fulfill the orders being made more effectively and efficiently.
-- Types: Joins (multiple), Temporal Analysis, Calculations, Pattern Matching
SELECT 
    DAYNAME(o.OrderDate) as OrderDay,
    COUNT(DISTINCT o.OrderID) as TotalOrders,
    ROUND(AVG(DATEDIFF(o.DeliveryDate, o.OrderDate)), 1) as AvgDeliveryDays,
    COUNT(DISTINCT c.ClientID) as UniqueCustomers,
    ROUND(SUM(o.TotalAmount), 2) as TotalRevenue,
    COUNT(CASE WHEN o.OrderStatus = 'Completed' THEN 1 END) as CompletedOrders
FROM OrderTable o
JOIN Client c ON o.ClientID = c.ClientID
WHERE o.OrderDate >= DATE_SUB('2024-11-07', INTERVAL 90 DAY)
GROUP BY OrderDay
ORDER BY FIELD(OrderDay, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');

-- Query 17: Analyzing Custom Order Quality Control
-- Description: Evaluates the efficiency and quality of custom order processing, with the goal of
-- highlighting areas for improvement in handling custom orders
-- Types: Joins (multiple), Aggregate Functions, Pattern Matching, Calculations
SELECT 
    co.CompletionStatus,
    COUNT(*) as OrderCount,
    ROUND(AVG(co.Weight), 2) as AvgWeight,
    ROUND(AVG(DATEDIFF(co.ProcessingDate, o.OrderDate)), 1) as AvgProcessingDays,
    COUNT(CASE WHEN co.QualityCheck = 'Pass' THEN 1 END) as PassedQC,
    ROUND(COUNT(CASE WHEN co.QualityCheck = 'Pass' THEN 1 END) * 100.0 / COUNT(*), 2) as PassRate
FROM CustomOrder co
JOIN OrderTable o ON co.OrderID = o.OrderID
GROUP BY co.CompletionStatus
ORDER BY OrderCount DESC;

-- Query 18: Vehicle Fleet Usage 
-- Description: Analyzes fleet utilization patterns, stops, and mileages based on the vehicle in use to optimize
-- vehicle deployment for particular orders that require multiple stops and long trips vs. short quick trips.
-- Types: Joins (multiple), Temporal Analysis, Calculations, Pattern Matching
SELECT 
    v.VehicleType,
    COUNT(DISTINCT r.RouteID) as TotalRoutes,
    ROUND(AVG(r.EstimatedMileage), 2) as AvgMileagePerRoute,
    ROUND(SUM(r.EstimatedMileage), 2) as TotalMileage,
    COUNT(DISTINCT r.EmployeeID) as UniqueDrivers,
    ROUND(AVG(r.TotalStops), 1) as AvgStopsPerRoute
FROM Vehicle v
LEFT JOIN Route r ON v.LicensePlate = r.LicensePlate
WHERE r.RouteDate >= DATE_SUB('2024-11-07', INTERVAL 30 DAY)
GROUP BY v.VehicleType
ORDER BY TotalRoutes DESC;

-- Query 19: Analysis on Employee Payroll Distribution
-- Description: Analyzes payroll metrics across different employee roles, this is to understand
-- compensation patterns and overtime distribution across the different roles an employee is working in.
-- Types: Joins (multiple), Calculations, Aggregate Functions, Pattern Matching
SELECT 
    er.Role,
    COUNT(DISTINCT e.EmployeeID) as EmployeeCount,
    ROUND(AVG(p.GrossPay), 2) as AvgGrossPay,
    ROUND(AVG(p.Deductions), 2) as AvgDeductions,
    ROUND(AVG(p.NetPay), 2) as AvgNetPay,
    SUM(p.OvertimeHours) as TotalOvertimeHours,
    ROUND(AVG(p.OvertimeHours), 1) as AvgOvertimeHours
FROM Employee e
JOIN EmployeeRole er ON e.EmployeeID = er.EmployeeID
JOIN Paycheck p ON e.EmployeeID = p.EmployeeID
WHERE p.PayPeriodStart = '2024-10-01'
GROUP BY er.Role
ORDER BY AvgGrossPay DESC;

-- Query 20: Analysis on Product Category Profitability
-- Description: Provide detail analysis of product categories' financial performance,
-- including markup percentages and profit margins. This is to keep track of product categories that are bringing in the most
-- profit and the products that are in high demand.
-- Types: Joins (multiple), Calculations, Aggregate Functions, Pattern Matching
SELECT 
    i.CategoryType,
    COUNT(DISTINCT i.ItemID) as UniqueItems,
    ROUND(AVG(i.RetailPrice), 2) as AvgRetailPrice,
    ROUND(AVG(i.WholesalePrice), 2) as AvgWholesalePrice,
    ROUND(AVG((i.RetailPrice - i.WholesalePrice) / i.WholesalePrice * 100), 2) as AvgMarkupPercentage,
    ROUND(SUM(oi.Quantity * (oi.RetailPrice - oi.WholesalePrice)), 2) as TotalProfitLast30Days
FROM Item i
LEFT JOIN OrderItem oi ON i.ItemID = oi.ItemID
LEFT JOIN OrderTable o ON oi.OrderID = o.OrderID
WHERE o.OrderDate >= DATE_SUB('2024-11-07', INTERVAL 30 DAY)
GROUP BY i.CategoryType
HAVING UniqueItems > 0
ORDER BY TotalProfitLast30Days DESC;