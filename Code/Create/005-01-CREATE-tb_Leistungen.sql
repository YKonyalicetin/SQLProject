USE [Projekt_Univerwaltung]
GO

/****** Object:  Table [dbo].[tb_Leistungen]    Script Date: 31.03.2020 20:24:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tb_Leistungen](
	[LeistungID] [bigint] IDENTITY(1,1) NOT NULL,
	[Datum] [date] NOT NULL,
	[StudentID] [bigint] NOT NULL,
	[PruefungID] [bigint] NOT NULL,
	[NoteID] [bigint] NOT NULL,
	[ModulID] [bigint] NOT NULL,
 CONSTRAINT [PK_tb_Leistungen] PRIMARY KEY CLUSTERED 
(
	[LeistungID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tb_Leistungen] ADD  CONSTRAINT [DF_tb_Leistungen_Datum]  DEFAULT (getdate()) FOR [Datum]
GO

ALTER TABLE [dbo].[tb_Leistungen]  WITH CHECK ADD  CONSTRAINT [FK_tb_Leistungen_tb_Kurs_Dozent] FOREIGN KEY([ModulID])
REFERENCES [dbo].[tb_Kurs_Dozent] ([ModulID])
GO

ALTER TABLE [dbo].[tb_Leistungen] CHECK CONSTRAINT [FK_tb_Leistungen_tb_Kurs_Dozent]
GO

ALTER TABLE [dbo].[tb_Leistungen]  WITH CHECK ADD  CONSTRAINT [FK_tb_Leistungen_tb_Noten1] FOREIGN KEY([NoteID])
REFERENCES [dbo].[tb_Noten] ([NoteID])
GO

ALTER TABLE [dbo].[tb_Leistungen] CHECK CONSTRAINT [FK_tb_Leistungen_tb_Noten1]
GO

ALTER TABLE [dbo].[tb_Leistungen]  WITH CHECK ADD  CONSTRAINT [FK_tb_Leistungen_tb_Pruefung1] FOREIGN KEY([PruefungID])
REFERENCES [dbo].[tb_Pruefung] ([PruefungID])
GO

ALTER TABLE [dbo].[tb_Leistungen] CHECK CONSTRAINT [FK_tb_Leistungen_tb_Pruefung1]
GO

ALTER TABLE [dbo].[tb_Leistungen]  WITH CHECK ADD  CONSTRAINT [FK_tb_Leistungen_tb_Studenten] FOREIGN KEY([StudentID])
REFERENCES [dbo].[tb_Studenten] ([StudentID])
GO

ALTER TABLE [dbo].[tb_Leistungen] CHECK CONSTRAINT [FK_tb_Leistungen_tb_Studenten]
GO


