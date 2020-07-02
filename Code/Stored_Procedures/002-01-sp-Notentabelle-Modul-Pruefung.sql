USE [Projekt_Univerwaltung]
GO

-- =============================================
-- Author:		Gruppe C
-- Create date: 01.04.2020
-- Description:	Erstellt zu einem übergebenen Modul und einer übergebenen Prüfungsart eine Tabelle mit entsprechendem Namen für den Notenspiegel
--              sofern bereits Noten vorhanden sind. Gegebenenfalls wird eine schon vorhandene Tabelle ersetzt.
-- =============================================

DROP PROCEDURE IF EXISTS [dbo].[sp_Notentabelle_Modul_Pruefung]
GO

CREATE PROCEDURE [dbo].[sp_Notentabelle_Modul_Pruefung] 
	@ModulID BIGINT,
    @PruefID BIGINT,
	@Erfolg BIT OUTPUT, -- geklappt oder nicht
	@Feedback NVARCHAR(MAX) OUTPUT -- Fehlermeldungen etc.
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @Tabellenname NVARCHAR(256);
	DECLARE @Semester NVARCHAR(20);
	DECLARE @Kurs NVARCHAR(50);
	DECLARE @Dozentname NVARCHAR(50);
	DECLARE @Pruefungsname NVARCHAR(50);
	DECLARE @BefehlzumPruefen NVARCHAR(512);
	DECLARE @BefehlZumEinfuegen NVARCHAR(512);

	SET @Erfolg = 1;
	SET @Feedback = 'Alles OK!';

	BEGIN TRY
	  IF @ModulID NOT IN (SELECT dbo.tb_Leistungen.ModulID
	                 FROM dbo.tb_Leistungen
					 WHERE (@PruefID=dbo.tb_Leistungen.PruefungID))
		THROW 50010,'Es gibt noch keine Noten', 1;

	  --Notenspiegel
	  SET @Tabellenname = [dbo].[sf_Tabellenname_NS](@PruefID,@ModulID)
	  -- Erstllen der Tabelle
	  SET @BefehlZumPruefen    = 'DROP TABLE IF EXISTS [' + @Tabellenname + ']'
	  --Einfuegen und Erstellen der Tabelle
	  SET  @BefehlZumEinfuegen = 'SELECT * INTO [' +@Tabellenname +'] FROM dbo.tf_Notenspiegel('+CONVERT(NVARCHAR(50),@PruefID)+','+CONVERT(NVARCHAR(50),@ModulID)+')'
	                              -- Wenn ein String als Befehl ausgeführt werden soll, darf er keine Variablen enthalten!
	  EXEC(@BefehlZumPruefen);
	    --EXEC(@BefehlZumErstellen);
	  EXEC(@BefehlZumEinfuegen);

    END TRY
	BEGIN CATCH
		SET @Erfolg = 0; -- nicht geklappt--
		SET @Feedback = 'Fehler Nr. ' + CONVERT(varchar, ERROR_NUMBER()) +  ' ' + ERROR_MESSAGE();
	 END CATCH
	
	
END
GO
