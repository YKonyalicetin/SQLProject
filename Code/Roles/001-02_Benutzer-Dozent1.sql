USE [Projekt_Univerwaltung]
GO
CREATE USER [Dozent1] FOR LOGIN [Univerwaltung_Dozent1]
GO
use [Projekt_Univerwaltung]
GO
GRANT SELECT ON [dbo].[tb_Kurse] TO [Dozent1]
GO
use [Projekt_Univerwaltung]
GO
GRANT EXECUTE ON [dbo].[sf_IstPflichtveranstaltung] TO [Dozent1]
GO
use [Projekt_Univerwaltung]
GO
GRANT SELECT ON [dbo].[tb_Kurs_Dozent] TO [Dozent1]
GO
use [Projekt_Univerwaltung]
GO
GRANT SELECT ON [dbo].[tb_Studiengaenge] TO [Dozent1]
GO
use [Projekt_Univerwaltung]
GO
GRANT EXECUTE ON [dbo].[sp_Notentabelle_Modul_Pruefung] TO [Dozent1]
GO
use [Projekt_Univerwaltung]
GO
GRANT EXECUTE ON [dbo].[sf_Teilnehmeranzahl] TO [Dozent1]
GO
use [Projekt_Univerwaltung]
GO
GRANT SELECT ON [dbo].[tb_Noten] TO [Dozent1]
GO
use [Projekt_Univerwaltung]
GO
GRANT SELECT ON [dbo].[tb_Dozenten] TO [Dozent1]
GO
use [Projekt_Univerwaltung]
GO
GRANT SELECT ON [dbo].[tb_Pruefung] TO [Dozent1]
GO
use [Projekt_Univerwaltung]
GO
GRANT SELECT ON [dbo].[tb_Semester] TO [Dozent1]
GO
use [Projekt_Univerwaltung]
GO
GRANT UPDATE ON [dbo].[tb_Leistungen] TO [Dozent1]
GO
use [Projekt_Univerwaltung]
GO
GRANT VIEW CHANGE TRACKING ON [dbo].[tb_Leistungen] TO [Dozent1]
GO
use [Projekt_Univerwaltung]
GO
GRANT SELECT ON [dbo].[tb_Leistungen] TO [Dozent1]
GO
use [Projekt_Univerwaltung]
GO
GRANT INSERT ON [dbo].[tb_Leistungen] TO [Dozent1]
GO
use [Projekt_Univerwaltung]
GO
GRANT DELETE ON [dbo].[tb_Leistungen] TO [Dozent1]
GO
use [Projekt_Univerwaltung]
GO
GRANT SELECT ON [dbo].[tb_Studenten] TO [Dozent1]
GO
