USE [Projekt_Univerwaltung]
GO

/****** Object:  Table [dbo].[tb_Kurs_Dozent]    Script Date: 31.03.2020 20:19:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tb_Kurs_Dozent](
	[ModulID] [bigint] IDENTITY(1,1) NOT NULL,
	[DozentID] [bigint] NOT NULL,
	[KursID] [bigint] NOT NULL,
	[SemesterID] [bigint] NOT NULL,
 CONSTRAINT [PK_tb_Module] PRIMARY KEY CLUSTERED 
(
	[ModulID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tb_Kurs_Dozent]  WITH CHECK ADD  CONSTRAINT [FK_tb_Kurs_Dozent_tb_Dozenten] FOREIGN KEY([DozentID])
REFERENCES [dbo].[tb_Dozenten] ([DozentID])
GO

ALTER TABLE [dbo].[tb_Kurs_Dozent] CHECK CONSTRAINT [FK_tb_Kurs_Dozent_tb_Dozenten]
GO

ALTER TABLE [dbo].[tb_Kurs_Dozent]  WITH CHECK ADD  CONSTRAINT [FK_tb_Kurs_Dozent_tb_Kurse] FOREIGN KEY([KursID])
REFERENCES [dbo].[tb_Kurse] ([KursID])
GO

ALTER TABLE [dbo].[tb_Kurs_Dozent] CHECK CONSTRAINT [FK_tb_Kurs_Dozent_tb_Kurse]
GO

ALTER TABLE [dbo].[tb_Kurs_Dozent]  WITH CHECK ADD  CONSTRAINT [FK_tb_Kurs_Dozent_tb_Semester] FOREIGN KEY([SemesterID])
REFERENCES [dbo].[tb_Semester] ([SemesterID])
GO

ALTER TABLE [dbo].[tb_Kurs_Dozent] CHECK CONSTRAINT [FK_tb_Kurs_Dozent_tb_Semester]
GO


