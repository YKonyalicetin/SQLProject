USE[Firma-2020-03]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

DROP PROCEDURE IF EXISTS [dbo].[sp_backup_mit_pfad]
GO

CREATE PROCEDURE [dbo].[sp_backup_mit_pfad] 

	@path VARCHAR(256)

AS
BEGIN


DECLARE @backupFile VARCHAR(MAX) -- file name
DECLARE @fullDBBackupName VARCHAR(MAX);
DECLARE @dbname VARCHAR(MAX)
DECLARE @fileDate VARCHAR(8);
DECLARE @fileTime VARCHAR(9);
DECLARE @fileDateTime VARCHAR(18);
DECLARE @t TABLE (FileExists int, FileIsDir int, ParentDirExists int); 

--SET @path = 'D:\DB\BackupCursorScript\'

INSERT INTO @t EXEC master.dbo.xp_fileexist @path

IF NOT (SELECT FileIsDir FROM @t) = 1 -- Ordner existiert nicht
	EXEC master.dbo.xp_create_subdir @path -- Ordner erstellen


DECLARE db_cursor CURSOR FOR 
	SELECT name 
	FROM MASTER.dbo.sysdatabases 
	WHERE name NOT IN ('master','model','msdb','tempdb', 'DWConfiguration', 'DWDiagnostics', 'DWQueue');

OPEN db_cursor	
	FETCH NEXT FROM db_cursor INTO @dbname; -- go to record 1
	WHILE @@FETCH_STATUS = 0  -- Die FETCH-Anweisung war erfolgreich..
	BEGIN

SET @fileDate = CONVERT(VARCHAR(20), GETDATE(),112); -- 20200226
SET @fileTime = REPLACE(CONVERT(VARCHAR(40), GETDATE(),114),':',''); --114336113
SET @fileDateTime = @fileDate + '-' + @fileTime;--
SET @backupFile = @dbname + '-' + @fileDateTime + '.bak' -- mit DatumZeit
SET @fullDBBackupName = @path + @backupFile;

BACKUP DATABASE @dbname TO DISK = @fullDBBackupName; -- DB sichern

		FETCH NEXT FROM db_cursor INTO @dbname;  -- go to next record
	END 
CLOSE db_cursor
DEALLOCATE db_cursor -- CURSOR vernichten (aus Arbeitsspeicher)



END
GO
