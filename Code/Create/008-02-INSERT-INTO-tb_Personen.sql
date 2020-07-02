USE [Projekt_Univerwaltung]
GO

INSERT INTO [dbo].[tb_Personen]
           ([Nachname]
           ,[Vorname]
           ,[Geburtsdatum]
           ,[OrtID]
           ,[Strasse]
           ,[Hausnr]
           ,[Telefonnr])
     VALUES
           (<Nachname, nvarchar(50),>
           ,<Vorname, nvarchar(50),>
           ,<Geburtsdatum, date,>
           ,<OrtID, bigint,>
           ,<Strasse, nvarchar(50),>
           ,<Hausnr, varchar(5),>
           ,<Telefonnr, varchar(15),>)
GO


