USE [Projekt_Univerwaltung]
GO

/****** Object:  Table [dbo].[tb_Kurse]    Script Date: 31.03.2020 20:21:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tb_Kurse](
	[KursID] [bigint] IDENTITY(1,1) NOT NULL,
	[Kursbezeichnung] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tb_Kurse] PRIMARY KEY CLUSTERED 
(
	[KursID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


