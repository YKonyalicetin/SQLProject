USE [Projekt_Univerwaltung]
GO

/****** Object:  Table [dbo].[tb_Studenten]    Script Date: 31.03.2020 20:38:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tb_Studenten](
	[StudentID] [bigint] IDENTITY(1,1) NOT NULL,
	[Matrikelnummer] [nvarchar](10) NOT NULL,
	[PersonenID] [bigint] NOT NULL,
	[StudiengangID] [bigint] NOT NULL,
 CONSTRAINT [PK_tb_Studenten] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tb_Studenten]  WITH CHECK ADD  CONSTRAINT [FK_tb_Studenten_tb_Personen1] FOREIGN KEY([PersonenID])
REFERENCES [dbo].[tb_Personen] ([PersonenID])
GO

ALTER TABLE [dbo].[tb_Studenten] CHECK CONSTRAINT [FK_tb_Studenten_tb_Personen1]
GO

ALTER TABLE [dbo].[tb_Studenten]  WITH CHECK ADD  CONSTRAINT [FK_tb_Studenten_tb_Studiengaenge] FOREIGN KEY([StudiengangID])
REFERENCES [dbo].[tb_Studiengaenge] ([StudiengangID])
GO

ALTER TABLE [dbo].[tb_Studenten] CHECK CONSTRAINT [FK_tb_Studenten_tb_Studiengaenge]
GO


