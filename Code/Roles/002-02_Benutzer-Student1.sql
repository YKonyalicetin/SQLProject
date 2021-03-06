USE [Projekt_Univerwaltung]
GO
CREATE USER [Student1] FOR LOGIN [Univerwaltung_Student1]
GO
use [Projekt_Univerwaltung]
GO
GRANT SELECT ON [dbo].[tb_Dozenten] TO [Student1]
GO
use [Projekt_Univerwaltung]
GO
GRANT SELECT ON [dbo].[tb_Studiengaenge] TO [Student1]
GO
use [Projekt_Univerwaltung]
GO
GRANT SELECT ON [dbo].[tb_Kurse] TO [Student1]
GO
use [Projekt_Univerwaltung]
GO
GRANT SELECT ON [dbo].[tb_Kurs_Dozent] TO [Student1]
GO
use [Projekt_Univerwaltung]
GO
DENY SELECT ON [dbo].[tb_Leistungen] ([LeistungID]) TO [Student1]
GO
use [Projekt_Univerwaltung]
GO
GRANT SELECT ON [dbo].[tb_Studenten] TO [Student1]
GO
use [Projekt_Univerwaltung]
GO
GRANT SELECT ON [dbo].[tb_Studiengang_Kurs] TO [Student1]
GO
use [Projekt_Univerwaltung]
GO
GRANT SELECT ON [dbo].[tb_Pruefung] TO [Student1]
GO
use [Projekt_Univerwaltung]
GO
GRANT SELECT ON [dbo].[tb_Semester] TO [Student1]
GO
