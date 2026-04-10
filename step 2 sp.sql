CREATE PROCEDURE [dbo].[usp_GetRestaurantCustomerSummaryByCity]
    @City VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        R.City,
        R.TypeOfResutrant,
        COUNT(DISTINCT R.Id) AS NumberOfRestaurants,
        COUNT(C.Id) AS NumberOfCustomers
    FROM [dbo].[Resturants] R
    LEFT JOIN [dbo].[Costomers] C
        ON C.RestaurantId = R.Id
    WHERE R.City = @City
    GROUP BY
        R.City,
        R.TypeOfResutrant
    ORDER BY
        R.City,
        R.TypeOfResutrant;
END
GO

/*
EXEC [dbo].[usp_GetRestaurantCustomerSummaryByCity]
    @City = 'London';
*/