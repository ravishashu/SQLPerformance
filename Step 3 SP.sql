Alter PROCEDURE [dbo].[usp_GetRestaurantCustomerSummaryByCity]
    @City VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    ;WITH RestaurantBase AS
    (
        SELECT
            R.Id,
            R.City,
            R.TypeOfResutrant
        FROM [dbo].[Resturants] R
        WHERE R.City = @City
    ),
    CustomerCountByRestaurant AS
    (
        SELECT
            C.RestaurantId,
            COUNT(*) AS CustomerCount
        FROM [dbo].[Costomers] C
		WHERE C.City = @City
        GROUP BY C.RestaurantId
    )
    SELECT
        RB.City,
        RB.TypeOfResutrant,
        COUNT(RB.Id) AS NumberOfRestaurants,
        SUM(ISNULL(CCR.CustomerCount, 0)) AS NumberOfCustomers
    FROM RestaurantBase RB
    LEFT JOIN CustomerCountByRestaurant CCR
        ON CCR.RestaurantId = RB.Id
    GROUP BY
        RB.City,
        RB.TypeOfResutrant
    ORDER BY
        RB.City,
        RB.TypeOfResutrant;
END
GO

/*
EXEC [dbo].[usp_GetRestaurantCustomerSummaryByCity]
    @City = 'London';
*/