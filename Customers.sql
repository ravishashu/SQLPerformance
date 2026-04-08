USE [Test]
GO

/****** Object:  Table [dbo].[Costomers]    Script Date: 07-04-2026 08:34:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Costomers](
	[Id] [int] IDENTITY(1,1) PRIMARY KEY,
	[Name] [varchar](50) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[Postcode] [char](10) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[County] [varchar](50) NOT NULL
) ON [PRIMARY]
GO


