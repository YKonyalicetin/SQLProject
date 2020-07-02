USE [Projekt_Univerwaltung]
GO

/****** Object:  Table [dbo].[tb_Pruefung]    Script Date: 31.03.2020 20:33:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tb_Pruefung](
	[PruefungID] [bigint] IDENTITY(1,1) NOT NULL,
	[Prüfungsart] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tb_Pruefung] PRIMARY KEY CLUSTERED 
(
	[PruefungID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


