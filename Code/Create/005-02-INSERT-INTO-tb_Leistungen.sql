USE [Projekt_Univerwaltung]
GO

INSERT INTO [dbo].[tb_Leistungen]
           ([Datum]
           ,[StudentID]
           ,[PruefungID]
           ,[NoteID]
           ,[ModulID])
     VALUES
           (<Datum, date,>
           ,<StudentID, bigint,>
           ,<PruefungID, bigint,>
           ,<NoteID, bigint,>
           ,<ModulID, bigint,>)
GO


