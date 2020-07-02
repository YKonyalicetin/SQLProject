USE [Projekt_Univerwaltung]
GO

/****** Object:  Table [dbo].[tb_Fakultäten]    Script Date: 31.03.2020 20:13:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tb_Fakultäten](
	[FakultätID] [bigint] IDENTITY(1,1) NOT NULL,
	[Fakultät] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tb_Fakultäten] PRIMARY KEY CLUSTERED 
(
	[FakultätID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


