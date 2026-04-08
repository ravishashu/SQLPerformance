--For your query, the best starting point is this on Resturants:

CREATE NONCLUSTERED INDEX IX_Resturants_City
ON [dbo].[Resturants] ([City]);
GO

-- Because your query also groups by TypeOfResutrant and joins on Id, a better index is:

CREATE NONCLUSTERED INDEX IX_Resturants_City_TypeOfResutrant
ON [dbo].[Resturants] ([City], [TypeOfResutrant])
INCLUDE ([Id]);
GO
/*
That helps with:

WHERE R.City = 'London'
GROUP BY R.City, R.TypeOfResutrant
join to Costomers using R.Id

You should also create an index on Costomers.RestaurantId for the join:
*/

CREATE NONCLUSTERED INDEX IX_Costomers_RestaurantId
ON [dbo].[Costomers] ([RestaurantId]);

-- To check existing indexes first:
SELECT
    i.name AS IndexName,
    t.name AS TableName
FROM sys.indexes i
INNER JOIN sys.tables t
    ON i.object_id = t.object_id
WHERE t.name IN ('Resturants', 'Costomers')
  AND i.name IS NOT NULL;