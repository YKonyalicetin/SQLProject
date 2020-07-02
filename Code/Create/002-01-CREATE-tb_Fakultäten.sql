USE [Projekt_Univerwaltung]
GO

/****** Object:  Table [dbo].[tb_Fakult�ten]    Script Date: 31.03.2020 20:13:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tb_Fakult�ten](
	[Fakult�tID] [bigint] IDENTITY(1,1) NOT NULL,
	[Fakult�t] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tb_Fakult�ten] PRIMARY KEY CLUSTERED 
(
	[Fakult�tID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


