-- ===================================
-- PROJECT 3: SQL DATA ANALYSIS
-- Dataset: Retail Analysis (E-Commerce Orders)
-- Analyst: Wisdom Okpala | DecodeLabs
-- ===================================

CREATE DATABASE [Retail Analysis]

-- PREVIEW RAW DATA
SELECT * FROM Retail_Analysis;

-- CONVERT UNIT PRICE TO DECIMAL
SELECT CONVERT(DECIMAL(10,2), ROUND(UnitPrice,2)) AS [Unit Price]
FROM Retail_Analysis;

ALTER TABLE Retail_Analysis
ALTER COLUMN [UnitPrice] DECIMAL(10,2);

-- CONVERT TOTAL PRICE TO DECIMAL
SELECT CONVERT(DECIMAL(10,2), ROUND(TotalPrice,2)) AS Total_Price
FROM Retail_Analysis;

ALTER TABLE Retail_Analysis
ALTER COLUMN TotalPrice DECIMAL(10,2);

-- REPLACE BLANK COUPON CODES WITH 'No Coupon Code'
SELECT * 
FROM Retail_Analysis
WHERE CouponCode IS NULL OR CouponCode = '';

UPDATE Retail_Analysis
SET CouponCode = 'No Coupon Code'
WHERE CouponCode IS NULL OR CouponCode = '';

-- DISPLAY ALL RECORDS
SELECT * 
FROM Retail_Analysis;

-- =============================================
-- FILTERING RECORDS
-- =============================================

-- CANCELLED ORDERS
SELECT OrderID,Product, OrderStatus, TotalPrice
FROM Retail_Analysis
WHERE OrderStatus = 'Cancelled';

-- ONLINE PAYMENT METHOD
SELECT OrderID, Product, PaymentMethod, OrderStatus, TotalPrice
FROM Retail_Analysis
WHERE PaymentMethod = 'Online';

-- INSTAGRAM REFERRAL SOURCE
SELECT OrderID, Product, PaymentMethod, OrderStatus, ReferralSource, TotalPrice
FROM Retail_Analysis
WHERE ReferralSource = 'Instagram';

-- =============================================
-- SORTING RECORDS
-- =============================================

-- PRODUCTS BY HIGHEST TOTAL PRICE
SELECT Product, CouponCode, TotalPrice
FROM Retail_Analysis
ORDER BY TotalPrice DESC;

-- PRODUCTS BY LOWEST TOTAL PRICE
SELECT Product, ReferralSource, TotalPrice
FROM Retail_Analysis
ORDER BY TotalPrice ASC;

-- =============================================
-- AGGREGATE FUNCTIONS
-- =============================================

-- TOTAL NUMBER OF ORDERS
SELECT COUNT(OrderID) AS TotalOrders
FROM Retail_Analysis;

-- TOTAL REVENUE
SELECT SUM(TotalPrice) AS TotalRevenue
FROM Retail_Analysis;

-- AVERAGE ORDER VALUE
SELECT AVG(TotalPrice) AS Average_Order_Value
FROM Retail_Analysis;

-- AVERAGE QUANTITY ORDERED
SELECT AVG(Quantity) AS AverageQuantity
FROM Retail_Analysis;

-- =============================================
-- GROUP BY AND HAVING
-- =============================================

-- TOTAL REVENUE BY PAYMENT METHOD
SELECT PaymentMethod, SUM(TotalPrice) AS Total_Revenue
FROM Retail_Analysis
GROUP BY PaymentMethod
ORDER BY Total_Revenue DESC;

-- TOTAL REVENUE BY REFERRAL SOURCE
SELECT ReferralSource, SUM(TotalPrice) AS Total_Revenue
FROM Retail_Analysis
GROUP BY ReferralSource
ORDER BY Total_Revenue DESC;

-- PRODUCTS WITH MORE THAN 100 ORDERS
SELECT Product, COUNT(OrderID) AS Total_Orders
FROM Retail_Analysis
GROUP BY Product
HAVING COUNT(OrderID) > 100
ORDER BY Total_Orders DESC;

-- TOP 3 PRODUCTS BY REVENUE
SELECT TOP 3 Product, SUM(TotalPrice) AS Total_Revenue
FROM Retail_Analysis
GROUP BY Product
ORDER BY Total_Revenue DESC;

