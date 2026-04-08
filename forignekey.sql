ALTER TABLE [dbo].[Costomers]
ADD [RestaurantId] INT NULL;
GO

ALTER TABLE [dbo].[Costomers]
ADD CONSTRAINT FK_Costomers_Resturants
FOREIGN KEY ([RestaurantId]) REFERENCES [dbo].[Resturants]([Id]);
GO