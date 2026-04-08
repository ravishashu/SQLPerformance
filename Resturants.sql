CREATE TABLE [dbo].[Resturants](
	[Id] [int] IDENTITY(1,1) PRIMARY KEY,
	[Name] [varchar](50) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[Postcode] [char](10) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[County] [varchar](50) NOT NULL,
	[TypeOfResutrant]  [varchar](50) NOT NULL,
) ON [PRIMARY]
GO
