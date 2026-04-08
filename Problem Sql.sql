SELECT
    R.City,
    R.TypeOfResutrant,
    COUNT(DISTINCT R.Id) AS NumberOfRestaurants,
    COUNT(C.Id) AS NumberOfCustomers
FROM [dbo].[Resturants] R
LEFT JOIN [dbo].[Costomers] C
    ON C.RestaurantId = R.Id
	WHERE R.City = 'London'
GROUP BY
    R.City,
    R.TypeOfResutrant
ORDER BY
    R.City,
    R.TypeOfResutrant;