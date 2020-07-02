USE [Projekt_Univerwaltung]
GO

/****** Object:  Table [dbo].[tb_Noten]    Script Date: 31.03.2020 20:27:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tb_Noten](
	[NoteID] [bigint] IDENTITY(1,1) NOT NULL,
	[Note] [varchar](5) NOT NULL,
	[Notenbezeichnung] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tb_Noten] PRIMARY KEY CLUSTERED 
(
	[NoteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


