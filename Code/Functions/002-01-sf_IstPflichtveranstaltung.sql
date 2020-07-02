USE [Projekt_Univerwaltung]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gruppe C
-- Create date: 30.03.2020
-- Description:	Gibt an ob ein übergebenes Modul in einem übergebenen Studiengang Pflicht ist
-- =============================================
DROP FUNCTION IF EXISTS [dbo].[sf_IstPflichtveranstaltung]
GO
CREATE FUNCTION [dbo].[sf_IstPflichtveranstaltung]
(
    @ModulID BIGINT,
	@StudiengangID BIGINT
)
RETURNS  BIT
AS
BEGIN
    DECLARE @Pflicht BIT;
	DECLARE @anz INT;
	SELECT  @anz=COUNT(*)
    FROM dbo.tb_Kurs_Dozent INNER JOIN
         dbo.tb_Kurse ON dbo.tb_Kurs_Dozent.KursID = dbo.tb_Kurse.KursID INNER JOIN
         dbo.tb_Studiengang_Kurs ON dbo.tb_Kurse.KursID = dbo.tb_Studiengang_Kurs.KursID INNER JOIN
         dbo.tb_Studiengaenge ON dbo.tb_Studiengang_Kurs.StudiengangID = dbo.tb_Studiengaenge.StudiengangID
		 WHERE (dbo.tb_Studiengang_Kurs.StudiengangID =@StudiengangID AND dbo.tb_Kurs_Dozent.ModulID=@ModulID)
	IF @anz = 0
	  SET @Pflicht = 0
	ELSE
	  SET @Pflicht = 1;
    RETURN @Pflicht;
END
