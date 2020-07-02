USE [Projekt_Univerwaltung]
GO

/****** Object:  Table [dbo].[tb_Studiengaenge]    Script Date: 31.03.2020 20:39:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tb_Studiengaenge](
	[StudiengangID] [bigint] IDENTITY(1,1) NOT NULL,
	[Studiengang] [nvarchar](50) NOT NULL,
	[FakultätID] [bigint] NOT NULL,
 CONSTRAINT [PK_tb_Studiengaenge] PRIMARY KEY CLUSTERED 
(
	[StudiengangID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tb_Studiengaenge]  WITH CHECK ADD  CONSTRAINT [FK_tb_Studiengaenge_tb_Fakultäten] FOREIGN KEY([FakultätID])
REFERENCES [dbo].[tb_Fakultäten] ([FakultätID])
GO

ALTER TABLE [dbo].[tb_Studiengaenge] CHECK CONSTRAINT [FK_tb_Studiengaenge_tb_Fakultäten]
GO


