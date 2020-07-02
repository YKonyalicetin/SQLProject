USE [Projekt_Univerwaltung]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gruppe C
-- Create date: 30.03.2020
-- Description:	Liefert die Anzahl der Teilnehmer einer Prüfung, welche durch ein übergebenes Datum, übergebene Prüfungsart
--				und ein übergebenes Modul bestimmt ist
-- =============================================
DROP FUNCTION IF EXISTS [dbo].[sf_Teilnehmeranzahl]
GO
CREATE FUNCTION [dbo].[sf_Teilnehmeranzahl]
(
	-- Add the parameters for the function here
	@Datum DATE,
	@PruefungID BIGINT,
	@ModulID BIGINT
)
RETURNS  INT
AS
BEGIN
	DECLARE @Teilnehmer int;
	SELECT @Teilnehmer = COUNT(StudentID)
	FROM dbo.tb_Leistungen
	WHERE (@Datum = Datum AND @PruefungID = PruefungID AND @ModulID=ModulID)
	RETURN @Teilnehmer

END
GO