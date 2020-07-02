USE Projekt_Univerwaltung
GO

DECLARE @Erfolg bit
DECLARE @Meldung NVARCHAR(MAX)

EXEC dbo.sp_Noteneintrag
     1,           --DozentID
    'anorganische Chemie',   --Kurs
	'Praktikum',    --Prüfungsart
	'4522222',   --Matrikelnummer
	'1.3',        --Note
	'WS 2019',    --Semester
	'2020-03-30',--'2020-03-31',    
	--DEFAULT     -- Datum (optional)
	--DEFAULT,--ohne Datum, Standardwert heutiges Datum
    @Erfolg OUTPUT,
	@Meldung OUTPUT;

SELECT @Erfolg AS 'geklappt', @Meldung AS 'Meldung'

--SELECT dbo.tb_Personen.PersonenID
--		  FROM dbo.tb_Personen
--		  INNER JOIN dbo.tb_Dozenten ON dbo.tb_Dozenten.PersonenID=dbo.tb_Personen.PersonenID
--		  WHERE dbo.tb_Dozenten.DozentID=1

--SELECT dbo.tb_Personen.PersonenID
--		  FROM dbo.tb_Personen
--		  INNER JOIN dbo.tb_Studenten ON dbo.tb_Personen.PersonenID=dbo.tb_Studenten.PersonenID
--		  WHERE dbo.tb_Studenten.Matrikelnummer = 11111111;
