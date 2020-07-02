USE [Projekt_Univerwaltung]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gruppe C
-- Create date: 31.03.2020
-- Description:	Multi-Statement artige Tabellenwertfunktion gibt als Tabelle den Notenspiegel einer
--              Prüfungseinheit an, die sich durch ein übergebenes Datum eine übergebene
--              Prüfungsart und ein übergebenes Modul definiert.
--				Im Unterschied zur anderen Funktionen tf_Notenspiegel_Datum werden diesmal auch Noten angezeigt,
--				die nicht vergeben wurden.
-- =============================================
DROP FUNCTION IF EXISTS [dbo].[tfms_Notenspiegel_Datum]
GO
CREATE FUNCTION [dbo].[tfms_Notenspiegel_Datum]
(
	@Datum DATE,
	@PruefungID BIGINT,
	@ModulID BIGINT
)
RETURNS @Notenspiegel TABLE
        ( Note varchar(5),
		  Anzahl int
		)
BEGIN
  INSERT INTO @Notenspiegel
  SELECT dbo.tb_Noten.Note, COUNT(*)
        FROM dbo.tb_Noten
		INNER JOIN dbo.tb_Leistungen ON dbo.tb_Leistungen.NoteID=dbo.tb_Noten.NoteID
		WHERE (dbo.tb_Leistungen.Datum=@Datum AND dbo.tb_Leistungen.PruefungID=@PruefungID AND dbo.tb_Leistungen.ModulID=@ModulID)
		GROUP BY Note
  UNION

SELECT dbo.tb_Noten.Note, 0
FROM dbo.tb_Noten
WHERE Note NOT IN
(
SELECT dbo.tb_Noten.Note
FROM dbo.tb_Leistungen
JOIN dbo.tb_Noten ON dbo.tb_Leistungen.NoteID=dbo.tb_Noten.NoteID
WHERE (dbo.tb_Leistungen.Datum=@Datum AND dbo.tb_Leistungen.PruefungID=@PruefungID AND dbo.tb_Leistungen.ModulID=@ModulID)
GROUP BY Note
)
ORDER BY Note
  RETURN
END
GO


