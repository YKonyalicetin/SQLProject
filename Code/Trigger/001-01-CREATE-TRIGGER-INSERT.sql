USE [Projekt_Univerwaltung]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gruppe C
-- Create date: 01.04.2020
-- Description:	Sorgt dafür, dass beim einfügen neuer Leistungen in die Leistungstabelle auch die betreffende Notenspiegeltabelle ergänzt wird,
--              falls diese nicht vorhanden sein sollte, wird sie mit geeignetem Namen angelegt.
-- =============================================

DROP TRIGGER IF EXISTS [dbo].[trLeistungenINSERT]
GO

CREATE TRIGGER [dbo].[trLeistungenINSERT]
   ON  dbo.tb_Leistungen
   FOR INSERT
AS 
BEGIN
    DECLARE @Tabellenname NVARCHAR(256);
	DECLARE @OjektnameID NVARCHAR(258);
	DECLARE @ModulID BIGINT;
	DECLARE @PruefID BIGINT;
	DECLARE @Erfolg  BIT; -- geklappt oder nicht
	DECLARE @Meldung NVARCHAR(MAX); -- Fehlermeldungen etc.
	DECLARE @Note VARCHAR(5);
	DECLARE @NoteIns VARCHAR(5);
	DECLARE @Anzahl INT;
	DECLARE @BefehlFuerCursor NVARCHAR(256);
	DECLARE @BefehlFuerEinfuegen NVARCHAR(512);
	DECLARE @BefehlFuerUpdate NVARCHAR(512);
	DECLARE @Notegefunden BIT;

	SELECT  @ModulID = ModulID, @PruefID=PruefungID
	FROM INSERTED
	SET @Tabellenname=[dbo].[sf_Tabellenname_NS](@ModulID,@PruefID);
    SET @OjektnameID='N'''+@Tabellenname; --String der es ermöglicht die ObjektID der Tabelle des entsprechenden Names in der Systemdatenbank zu finden 
	IF EXISTS (SELECT * FROM SYS.OBJECTS WHERE OBJECT_ID = OBJECT_ID(@OjektnameID)) --Nachschauen ob Tabelle vorhanden
	BEGIN --falls vorhanden Note einfügen oder Anzahl um 1 erhöhen
	  SET @Notegefunden=0;
	  SELECT @NoteIns = dbo.tb_Noten.Note --neu eingefügte Note auslesen
	  FROM INSERTED
	  JOIN dbo.tb_Noten ON inserted.NoteID=dbo.tb_Noten.NoteID;
	  -- Cursor um Daten aus der Notentabelle mit variablem Namen auszulesen und zu prüfen ob die entsprechende Note bereits Vorhanden ist oder neu eingefügt werden muss
	  SET @BefehlFuerCursor ='DECLARE NotentabellenCursor CURSOR FOR SELECT Note, Anzahl FROM ['+ @Tabellenname+'];'
	  EXEC(@BefehlFuerCursor)
      OPEN db_cursor
	  FETCH NEXT FROM NotentabellenCursor
	    INTO @Note, @Anzahl; 
	  WHILE @@FETCH_STATUS = 0 AND @Notegefunden=0 --Auslesen der Daten aus dem Cursor solange noch welche da sind oder die Note noch nicht gefunden wurde
	  BEGIN
		FETCH NEXT FROM NotentabellenCursor
	    INTO @Note, @Anzahl;
		IF @Note LIKE @NoteIns
		BEGIN
		  SET @Notegefunden=1
		  SET @BefehlFuerUpdate = 'UPDATE [' +@Tabellenname+'] SET ['+@Tabellenname+'].Anzahl ='+Convert(VARCHAR(20),@Anzahl+1)+' WHERE ['+@Tabellenname+'] LIKE '+@Note;
		  --UPDATE @Tabellenname SET @Tabellenname.Anzahl = @Anzahl+1 WHERE (@Tabellenname.Note LIKE @Note)
		  EXEC( @BefehlFuerUpdate);		  
		END
	  END
	  IF @Notegefunden=0
	  BEGIN
	    SET @BefehlFuerEinfuegen='INSERT INTO ['+@Tabellenname+'] VALUES('+ @Note+', 1)';
		EXEC(@BefehlFuerEinfuegen);
	  END
	  CLOSE NotentabellenCursor;
	  DEALLOCATE NotentabellenCursor;
	END
	ELSE
	BEGIN
	  EXEC [dbo].[sp_Notentabelle_Modul_Pruefung]
             @ModulID,
	         @PruefID,
             @Erfolg OUTPUT,
	         @Meldung OUTPUT;
	END 


END
GO
