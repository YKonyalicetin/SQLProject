USE [Projekt_Univerwaltung]
GO

-- =============================================
-- Author:		Gruppe C
-- Create date: 31.03.2020
-- Description:	Fügt einen neuen Eintrag in die Tabelle tb_Leisungen ein. Dazu wird eine DozentenID ein Kurs, eine Prüfungsart, eine Matrikelnummer, eine Note, ein Semester und
--              ein Datum [optional] (Standardwert ist heute) übergeben. Es wird getestet ob die Eingabe sinnvoll ist. Ferener liefert die Prozedur zurück ob der Eintrag erfolgreich
--              war, sowie eine entsprechende Fehlermeldung im Falle des Misserfolgs.
-- =============================================

DROP PROCEDURE IF EXISTS [dbo].[sp_Noteneintrag]
GO

CREATE PROCEDURE [dbo].[sp_Noteneintrag] 
	@DozentID BIGINT,
	@Kurs nvarchar(50),
	@Pruefungsart nvarchar(50),
	@Matrikelnummer nvarchar(10),
	@Note varchar(5),
	@Semester nvarchar(20),
	@Datum date = NULL,
	@Erfolg bit OUTPUT, -- geklappt oder nicht
	@Feedback NVARCHAR(MAX) OUTPUT -- Fehlermeldungen etc.
AS
BEGIN
	SET NOCOUNT ON;

	SET @Erfolg = 1;
	SET @Feedback = 'Alles OK!';
	DECLARE @Semesterbeginn DATE;
	DECLARE @SemesterID BIGINT;
	DECLARE @KursID BIGINT;
	DECLARE @NoteID BIGINT;
	DECLARE @PruefID BIGINT;
	DECLARE @StudentID BIGINT;
	DECLARE @PersonIDStudent BIGINT;
	DECLARE @PersonIDDozent BIGINT;
	DECLARE @ModulID BIGINT;

	IF @Datum IS NULL
	  SET @Datum = GETDATE();

	SELECT @Semesterbeginn = dbo.tb_Semester.Beginn, @SemesterID = dbo.tb_Semester.SemesterID
	FROM dbo.tb_Semester
	WHERE @Semester LIKE dbo.tb_Semester.Semester;

	SELECT @KursID = dbo.tb_Kurse.KursID
	FROM dbo.tb_Kurse
	WHERE @Kurs LIKE dbo.tb_Kurse.Kursbezeichnung;

	SELECT @NoteID = dbo.tb_Noten.NoteID
	FROM dbo.tb_Noten
	WHERE @Note LIKE dbo.tb_Noten.Note;

	SELECT @PruefID = dbo.tb_Pruefung.PruefungID
	FROM dbo.tb_Pruefung
	WHERE @Pruefungsart LIKE dbo.tb_Pruefung.Prüfungsart;

	SELECT @StudentID = dbo.tb_Studenten.StudentID
	FROM dbo.tb_Studenten
	WHERE @Matrikelnummer LIKE dbo.tb_Studenten.Matrikelnummer;

	SELECT @ModulID= dbo.tb_Kurs_Dozent.ModulID
	FROM dbo.tb_Kurs_Dozent
	WHERE @DozentID=dbo.tb_Kurs_Dozent.DozentID AND @KursID  = dbo.tb_Kurs_Dozent.KursID AND @SemesterID=dbo.tb_Kurs_Dozent.SemesterID	

	-------------------------------------------------------------------
	BEGIN TRY
	  --Gültiges Datum
		IF @Datum > GETDATE()					
			THROW 50001, 'Datum darf nicht in der Zukunft liegen, die Leistung muss schon erbracht worden sein', 1;
	  --Semester muss existieren
	    IF @SemesterID NOT IN (SELECT dbo.tb_Semester.SemesterID FROM dbo.tb_Semester)
		  THROW 50002, 'Das Semester existieren. Das heißt es muss schon begonnen oder stattgefunden haben!', 1;
	  --Datum >= Beginn des übergebenen Semesters, erbrachte Leistungen können sich auf ein zurückliegendes aber kein zukünftiges Semester beziehen
		IF @Datum < @Semesterbeginn
		  THROW 50003, 'Das Semester in dem geprüft werden soll muss zumindest schon begonnen haben!', 1;
	  --Kurs muss existieren
	    IF @KursID IS NULL
		  THROW 50004, 'Die Kursbezeichnung ist wahrscheinlich flasch, bitte überprüfen!', 1;
  	  --Datensatz in Kurs_Dozent?
	    IF @ModulID IS NULL
          THROW 50005, 'Stellen Sie bitte sicher, dass Kurs Dozent und Semester übereinstimmen', 1;
		--Student muss existieren
		IF @StudentID IS NULL
		  THROW 50006,'keine zurzeit vergebene Matrikelnummer!', 1;
		--Note muss existieren
		IF @NoteID IS NULL
		  THROW 50007, 'keine gültige Note', 1;
		--Prüfungsart muss existieren
		IF @PruefID IS NULL
		  THROW 50008, 'keine zulässige Prüfungsart, eventuell Tippfehler', 1;
		--Dozent darf sich nicht selbst benoten
		SELECT @PersonIDStudent = dbo.tb_Personen.PersonenID
		FROM dbo.tb_Personen
		INNER JOIN dbo.tb_Studenten ON dbo.tb_Personen.PersonenID=dbo.tb_Studenten.PersonenID
		WHERE @Matrikelnummer = dbo.tb_Studenten.Matrikelnummer;
		SELECT @PersonIDDozent = dbo.tb_Personen.PersonenID
		FROM dbo.tb_Personen
		INNER JOIN dbo.tb_Dozenten ON dbo.tb_Dozenten.PersonenID=dbo.tb_Personen.PersonenID
		WHERE dbo.tb_Dozenten.DozentID=@DozentID;
		IF @PersonIDDozent=@PersonIDStudent
		  THROW 50009, 'Der Dozent darf sich nicht selbst bewerten!', 1;
		INSERT INTO dbo.tb_Leistungen
		SELECT @Datum, @StudentID, @PruefID, @NoteID, @ModulID;
		SET @Feedback = 'Datensatz erfolgreich eingefügt!';
	 END TRY
	 BEGIN CATCH
		SET @Feedback = 'Fehler Nr. ' + CONVERT(varchar, ERROR_NUMBER()) +  ' ' + ERROR_MESSAGE();
	 END CATCH
END
GO


