USE [Projekt_Univerwaltung]
GO

/****** Object:  Table [dbo].[tb_Dozenten]    Script Date: 31.03.2020 20:11:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tb_Dozenten](
	[DozentID] [bigint] IDENTITY(1,1) NOT NULL,
	[FakultätID] [bigint] NOT NULL,
	[PersonenID] [bigint] NOT NULL,
 CONSTRAINT [PK_tb_Dozenten] PRIMARY KEY CLUSTERED 
(
	[DozentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tb_Dozenten]  WITH CHECK ADD  CONSTRAINT [FK_tb_Dozenten_tb_Fakultäten] FOREIGN KEY([FakultätID])
REFERENCES [dbo].[tb_Fakultäten] ([FakultätID])
GO

ALTER TABLE [dbo].[tb_Dozenten] CHECK CONSTRAINT [FK_tb_Dozenten_tb_Fakultäten]
GO

ALTER TABLE [dbo].[tb_Dozenten]  WITH CHECK ADD  CONSTRAINT [FK_tb_Dozenten_tb_Personen1] FOREIGN KEY([PersonenID])
REFERENCES [dbo].[tb_Personen] ([PersonenID])
GO

ALTER TABLE [dbo].[tb_Dozenten] CHECK CONSTRAINT [FK_tb_Dozenten_tb_Personen1]
GO


