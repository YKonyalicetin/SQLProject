USE [Projekt_Univerwaltung]
GO

/****** Object:  Table [dbo].[tb_Semester]    Script Date: 31.03.2020 20:36:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tb_Semester](
	[SemesterID] [bigint] IDENTITY(1,1) NOT NULL,
	[Semester] [nvarchar](20) NOT NULL,
	[Beginn] [date] NULL,
	[Ende] [date] NULL,
 CONSTRAINT [PK_tb_Semester] PRIMARY KEY CLUSTERED 
(
	[SemesterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


