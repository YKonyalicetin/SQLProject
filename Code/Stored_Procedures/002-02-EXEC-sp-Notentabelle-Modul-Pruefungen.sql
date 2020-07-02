USE Projekt_Univerwaltung
GO

DECLARE @ModulID BIGINT;
DECLARE @PruefID BIGINT;
DECLARE @Erfolg BIT;
DECLARE @Meldung NVARCHAR(MAX);


SET @ModulID = 1;
SET @PruefID = 1;

EXEC[dbo].[sp_Notentabelle_Modul_Pruefung]
      @ModulID,
	  @PruefID,
      @Erfolg OUTPUT,
	  @Meldung OUTPUT;

