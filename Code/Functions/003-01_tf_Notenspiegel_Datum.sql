USE [Projekt_Univerwaltung]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gruppe C
-- Create date: 31.03.2020
-- Description:	Inline Tabellenwertfunktion gibt als Tabelle den Notenspiegel einer
--              Prüfungseinheit an, die sich durch ein übergebenes Datum eine übergebene
--              Prüfungsart und ein übergebenes Modul definiert
-- =============================================
DROP FUNCTION IF EXISTS [dbo].[tf_Notenspiegel_Datum]
GO
CREATE FUNCTION [dbo].[tf_Notenspiegel_Datum]
(
	@Datum DATE,
	@PruefungID BIGINT,
	@ModulID BIGINT
)
RETURNS  TABLE
AS
  RETURN SELECT Note, COUNT(StudentID) AS 'Anzahl'
         FROM dbo.tb_Leistungen
		 INNER JOIN dbo.tb_Noten ON dbo.tb_Noten.NoteID=dbo.tb_Leistungen.NoteID
	     WHERE (@Datum = Datum AND @PruefungID = PruefungID AND @ModulID=ModulID)
		 GROUP by dbo.tb_Noten.Note
GO


