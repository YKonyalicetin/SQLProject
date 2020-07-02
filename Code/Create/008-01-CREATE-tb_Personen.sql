USE [Projekt_Univerwaltung]
GO

/****** Object:  Table [dbo].[tb_Personen]    Script Date: 31.03.2020 20:30:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tb_Personen](
	[PersonenID] [bigint] IDENTITY(1,1) NOT NULL,
	[Nachname] [nvarchar](50) NOT NULL,
	[Vorname] [nvarchar](50) NOT NULL,
	[Geburtsdatum] [date] NOT NULL,
	[OrtID] [bigint] NOT NULL,
	[Strasse] [nvarchar](50) NOT NULL,
	[Hausnr] [varchar](5) NOT NULL,
	[Telefonnr] [varchar](15) NULL,
 CONSTRAINT [PK_tb_Personen] PRIMARY KEY CLUSTERED 
(
	[PersonenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tb_Personen]  WITH CHECK ADD  CONSTRAINT [FK_tb_Personen_tb_Ort] FOREIGN KEY([OrtID])
REFERENCES [dbo].[tb_Ort] ([OrtID])
GO

ALTER TABLE [dbo].[tb_Personen] CHECK CONSTRAINT [FK_tb_Personen_tb_Ort]
GO


