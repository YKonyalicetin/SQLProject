USE [Projekt_Univerwaltung]
GO

/****** Object:  Table [dbo].[tb_Studiengang_Kurs]    Script Date: 31.03.2020 20:41:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tb_Studiengang_Kurs](
	[StudiengangKursID] [bigint] IDENTITY(1,1) NOT NULL,
	[KursID] [bigint] NOT NULL,
	[StudiengangID] [bigint] NOT NULL,
 CONSTRAINT [PK_tb_Studengang_Kurs] PRIMARY KEY CLUSTERED 
(
	[StudiengangKursID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tb_Studiengang_Kurs]  WITH CHECK ADD  CONSTRAINT [FK_tb_Studiengang_Kurs_tb_Kurse] FOREIGN KEY([KursID])
REFERENCES [dbo].[tb_Kurse] ([KursID])
GO

ALTER TABLE [dbo].[tb_Studiengang_Kurs] CHECK CONSTRAINT [FK_tb_Studiengang_Kurs_tb_Kurse]
GO

ALTER TABLE [dbo].[tb_Studiengang_Kurs]  WITH CHECK ADD  CONSTRAINT [FK_tb_Studiengang_Kurs_tb_Studiengaenge] FOREIGN KEY([StudiengangID])
REFERENCES [dbo].[tb_Studiengaenge] ([StudiengangID])
GO

ALTER TABLE [dbo].[tb_Studiengang_Kurs] CHECK CONSTRAINT [FK_tb_Studiengang_Kurs_tb_Studiengaenge]
GO


