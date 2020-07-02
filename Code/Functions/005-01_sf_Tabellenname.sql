USE [Projekt_Univerwaltung]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gruppe C
-- Create date: 01.04.2010
-- Description:	Skalarwertfunktion welche einen geeigneten Tabellennamen für eine Notenschlüsseltabelle zu einer übergebenen Prüfungsart und einem übergeben Modul
--              generiert
-- =============================================
DROP FUNCTION IF EXISTS [dbo].[sf_Tabellenname_NS]
GO
CREATE FUNCTION [dbo].[sf_Tabellenname_NS]
(
	@PruefID BIGINT,
	@ModulID BIGINT
)
RETURNS NVARCHAR(256)
AS
BEGIN
  DECLARE @Tabellenname NVARCHAR(256); 
  DECLARE @Semester NVARCHAR(20);
  DECLARE @Kurs NVARCHAR(50);
  DECLARE @Dozentname NVARCHAR(50);
  DECLARE @Pruefungsname NVARCHAR(50);
  
  SELECT @Semester=dbo.tb_Semester.Semester, @Kurs=dbo.tb_Kurse.Kursbezeichnung, @Dozentname = dbo.tb_Personen.Nachname, @Pruefungsname = dbo.tb_Pruefung.Prüfungsart
  FROM dbo.tb_Leistungen
     INNER JOIN
       dbo.tb_Kurs_Dozent ON dbo.tb_Leistungen.ModulID = dbo.tb_Kurs_Dozent.ModulID
	 INNER JOIN
       dbo.tb_Dozenten ON dbo.tb_Kurs_Dozent.DozentID = dbo.tb_Dozenten.DozentID
	 INNER JOIN
       dbo.tb_Personen ON dbo.tb_Dozenten.PersonenID = dbo.tb_Personen.PersonenID
	 INNER JOIN
       dbo.tb_Semester ON dbo.tb_Kurs_Dozent.SemesterID = dbo.tb_Semester.SemesterID
	 INNER JOIN
       dbo.tb_Kurse ON dbo.tb_Kurs_Dozent.KursID = dbo.tb_Kurse.KursID
	 INNER JOIN
       dbo.tb_Pruefung ON dbo.tb_Leistungen.PruefungID = dbo.tb_Pruefung.PruefungID
    WHERE (@ModulID=dbo.tb_Leistungen.ModulID AND @PruefID=dbo.tb_Leistungen.PruefungID);
	SET @Tabellenname = TRIM(@Semester)+TRIM(@Kurs)+TRIM(@Dozentname)+TRIM(@Pruefungsname)+'Notenspiegel';
	RETURN @Tabellenname;
END
GO


