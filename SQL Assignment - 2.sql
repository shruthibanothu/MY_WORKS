--DATA IMPORTED SUCCESSFULLY FROM CSV FILE
SELECT * FROM Jomato;

--1. Create a user-defined functions to stuff the Chicken into ‘Quick Bites’. Eg: ‘QuickChicken Bites'.
CREATE OR ALTER FUNCTION StuffChicken
(
    @restaurantType NVARCHAR(100)
)
RETURNS NVARCHAR(100)
AS
BEGIN
    DECLARE @newType NVARCHAR(100)
    
    IF @restaurantType = 'Quick Bites'
        SET @newType = STUFF(@restaurantType, 7, 0, 'Chicken ')
    RETURN @newType
END

SELECT dbo.StuffChicken('Quick Bites') AS ModifiedType; --Execution

--2. Use the function to display the restaurant name and cuisine type which has the maximum number of rating
CREATE OR ALTER FUNCTION DisplayNameAndCuisine()
RETURNS TABLE
AS
RETURN 
  SELECT TOP(1) RestaurantName, CuisinesType FROM Jomato
  ORDER BY No_of_Rating DESC;

SELECT * FROM dbo.DisplayNameAndCuisine(); --Execution

--3. Create a Rating Status column to display the rating as ‘Excellent’ if it has more the 4
--start rating, ‘Good’ if it has above 3.5 and below 5 star rating, ‘Average’ if it is above 3
--and below 3.5 and ‘Bad’ if it is below 3 star rating.
 SELECT RestaurantName,Rating, Area, LocalAddress,
 CASE
	WHEN Rating > 4 THEN 'Excellent'
	WHEN Rating > 3.5 AND rating <= 4 THEN 'Good'
	WHEN Rating > 3 AND rating <= 3.5 THEN 'Average'
	WHEN Rating <= 3 THEN 'Bad'
	ELSE 'Unranked' 
END AS RatingStatus FROM Jomato
ORDER BY Rating DESC;

--4. Find the Ceil, floor and absolute values of the rating column and display the current date
--and separately display the year, month_name and day.
SELECT 
RestaurantName, Rating, CEILING(Rating) AS CeilRate, 
FLOOR(Rating) AS FloorRating, ABS(Rating) AS AbsoluteRating,
GETDATE() AS CurrentDate, DATENAME(YEAR, GETDATE()) AS CurrentYear, 
DATENAME(MONTH, GETDATE()) AS CurrentMonth, DATENAME(DAY, GETDATE()) AS CurrentDay
FROM Jomato

--5. Display the restaurant type and total average cost using rollup.
SELECT RestaurantType, AVG(AverageCost) AS TotalAverageCost FROM Jomato
GROUP BY RestaurantType WITH ROLLUP;