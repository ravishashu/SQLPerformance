CREATE PROCEDURE [dbo].[usp_AddRestaurantsByCity]
    @City VARCHAR(50),
    @County VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Counter INT = 1;
    DECLARE @TypeOfResutrant VARCHAR(50);
    DECLARE @Name VARCHAR(50);
    DECLARE @Address VARCHAR(50);
    DECLARE @Postcode CHAR(10);

    WHILE @Counter <= 30
    BEGIN
        SET @TypeOfResutrant =
            CASE ((@Counter - 1) % 4)
                WHEN 0 THEN 'Pub'
                WHEN 1 THEN 'Indian'
                WHEN 2 THEN 'Chinese'
                WHEN 3 THEN 'Italian'
            END;

        SET @Name =
            CASE @TypeOfResutrant
                WHEN 'Pub' THEN CONCAT(@City, ' Pub ', @Counter)
                WHEN 'Indian' THEN CONCAT(@City, ' Indian ', @Counter)
                WHEN 'Chinese' THEN CONCAT(@City, ' Chinese ', @Counter)
                WHEN 'Italian' THEN CONCAT(@City, ' Italian ', @Counter)
            END;

        SET @Address = CONCAT(@Counter, ' High Street');

        SET @Postcode =
            LEFT(UPPER(@City), 2)
            + RIGHT('00' + CAST(((@Counter - 1) / 10) + 1 AS VARCHAR(2)), 2)
            + ' '
            + RIGHT('0' + CAST((@Counter - 1) % 10 AS VARCHAR(1)), 1)
            + 'AA';

        INSERT INTO [dbo].[Resturants]
        (
            [Name],
            [Address],
            [Postcode],
            [City],
            [County],
            [TypeOfResutrant]
        )
        VALUES
        (
            @Name,
            @Address,
            @Postcode,
            @City,
            @County,
            @TypeOfResutrant
        );

        SET @Counter = @Counter + 1;
    END
END
GO
/*
EXEC [dbo].[usp_AddRestaurantsByCity]
    @City = 'London',
    @County = 'Greater London';

	EXEC [dbo].[usp_AddRestaurantsByCity]
    @City = 'Cambridge',
    @County = 'Cambridgeshire';

		EXEC [dbo].[usp_AddRestaurantsByCity]
    @City = 'York',
    @County = 'Yorkshire';

	*/