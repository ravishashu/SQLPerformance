CREATE PROCEDURE [dbo].[usp_AddCustomersForRestaurantsByCity]
    @City VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @RestaurantId INT;
    DECLARE @RestaurantName VARCHAR(50);
    DECLARE @RestaurantCity VARCHAR(50);
    DECLARE @RestaurantCounty VARCHAR(50);
    DECLARE @Counter INT;

    DECLARE RestaurantCursor CURSOR FOR
    SELECT Id, Name, City, County
    FROM [dbo].[Resturants]
    WHERE City = @City;

    OPEN RestaurantCursor;

    FETCH NEXT FROM RestaurantCursor
    INTO @RestaurantId, @RestaurantName, @RestaurantCity, @RestaurantCounty;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @Counter = 1;

        WHILE @Counter <= 30
        BEGIN
            INSERT INTO [dbo].[Costomers]
            (
                [Name],
                [Address],
                [Postcode],
                [City],
                [County],
                [RestaurantId]
            )
            VALUES
            (
                CONCAT('Customer ', @RestaurantId, '-', @Counter),
                CONCAT(@Counter, ' Customer Road'),
                CONCAT(LEFT(UPPER(@RestaurantCity), 2),
                       RIGHT('00' + CAST(@Counter AS VARCHAR(2)), 2),
                       ' ',
                       '1AA'),
                @RestaurantCity,
                @RestaurantCounty,
                @RestaurantId
            );

            SET @Counter = @Counter + 1;
        END

        FETCH NEXT FROM RestaurantCursor
        INTO @RestaurantId, @RestaurantName, @RestaurantCity, @RestaurantCounty;
    END

    CLOSE RestaurantCursor;
    DEALLOCATE RestaurantCursor;
END
GO

/*
EXEC [dbo].[usp_AddCustomersForRestaurantsByCity]
    @City = 'London';

EXEC [dbo].[usp_AddCustomersForRestaurantsByCity]
    @City = 'Cambridge';

EXEC [dbo].[usp_AddCustomersForRestaurantsByCity]
    @City = 'York';
	*/