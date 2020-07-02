USE [Projekt_Univerwaltung]
GO

/****** Object:  Table [dbo].[tb_Ort]    Script Date: 31.03.2020 20:28:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tb_Ort](
	[OrtID] [bigint] IDENTITY(1,1) NOT NULL,
	[PLZ] [varchar](10) NOT NULL,
	[Ort] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tb_Ort] PRIMARY KEY CLUSTERED 
(
	[OrtID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


