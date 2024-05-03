USE [Maxtra_Dev]
GO
ALTER TABLE JobFiles ADD [PageCount] INT NULL
GO
/****** Object:  StoredProcedure [dbo].[usp_SaveJob]    Script Date: 02-05-2024 22:28:40 ******/
DROP PROCEDURE [dbo].[usp_SaveJob]
GO

/****** Object:  StoredProcedure [dbo].[usp_AdminSaveUploadFile]    Script Date: 02-05-2024 22:28:40 ******/
DROP PROCEDURE [dbo].[usp_AdminSaveUploadFile]
GO

DROP TYPE JobFileType
GO


/****** Object:  UserDefinedTableType [dbo].[JobFileType]    Script Date: 02-05-2024 22:29:22 ******/
CREATE TYPE [dbo].[JobFileType] AS TABLE(
	[FileName] [nvarchar](50) NULL,
	[FileExtension] [varchar](50) NULL,
	[SourceFilePath] [nvarchar](500) NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[FileId] [varchar](500) NULL,
	[PageCount] INT NULL
)
GO

/****** Object:  StoredProcedure [dbo].[usp_AdminSaveUploadFile]    Script Date: 02-05-2024 22:28:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[usp_AdminSaveUploadFile]
	@JobFiles JobFiletype READONLY,
	@JobId UNIQUEIDENTIFIER,
	@CreatedBy UNIQUEIDENTIFIER
AS
BEGIN
	
	BEGIN TRY
	DECLARE @FileExtension VARCHAR(5)
	SELECT @FileExtension = FileExtension FROM @JobFiles 

	IF NOT EXISTS(SELECT * FROM JobFiles WHERE JobId = @JobId AND FileExtension = @FileExtension)
	BEGIN
		INSERT INTO [dbo].[JobFiles]
			(
				[FileName], FileExtension, SourceFilePath, JobId, CreatedBy, FileId, [PageCount]
				,CreatedDateTime,IsUploadFile
			)
		SELECT [FileName], FileExtension, SourceFilePath, @JobId, CreatedBy, FileId, [PageCount]
				,GETUTCDATE(),1
		FROM @JobFiles

		DECLARE @UserId UNIQUEIDENTIFIER
		DECLARE @Preference VARCHAR(200) 
		DECLARE @PreferenceCount INT
		DECLARE @FileCount INT

		SELECT @UserId = CreatedBy FROM Jobs WHERE Id = @JobId
		SELECT @Preference = FilePreference FROM Client WHERE UserId = @UserId
		SELECT @PreferenceCount = COUNT(1) FROM STRING_SPLIT( @Preference , ',')
		SELECT @FileCount = COUNT(1) FROM JobFiles WHERE JobId = @JobId AND IsUploadFile = 1

		IF @PreferenceCount <= @FileCount
		BEGIN
			DECLARE @JobStatus UNIQUEIDENTIFIER 
			SELECT @JobStatus = Id FROM JobStatus WHERE Description = 'Completed'

			UPDATE Jobs SET Status = @JobStatus 
			WHERE Id = @JobId
		END
	END
	ELSE
	BEGIN 
		UPDATE JobFiles SET FileName = TJF.FileName, FileExtension = TJF.FileExtension, SourceFilePath = TJF.SourceFilePath,
							ModifyedBy = @CreatedBy, ModifiedDateTime = GETUTCDATE(), IsUploadFile = 1, FileId = TJF.FileId,
							[PageCount] = TJF.[PageCount]
		FROM JobFiles JF 
		JOIN @JobFiles TJF ON JF.JobId = @JobId AND JF.FileExtension = @FileExtension
		WHERE JF.JobId = @JobId 
	END
		
		
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN
		DECLARE @ErrorMessage NVARCHAR(4000);
		DECLARE @ErrorSeverity INT;
		DECLARE @ErrorState INT;

		SELECT
			@ErrorMessage = ERROR_MESSAGE(),
			@ErrorSeverity = ERROR_SEVERITY(),
			@ErrorState = ERROR_STATE();

		-- Use RAISERROR inside the CATCH block to return error
		-- information about the original error that caused
		-- execution to jump to the CATCH block.
		RAISERROR (@ErrorMessage, -- Message text.
				   @ErrorSeverity, -- Severity.
				   @ErrorState -- State.
				   );
	END CATCH
END
GO

/****** Object:  StoredProcedure [dbo].[usp_SaveJob]    Script Date: 02-05-2024 22:28:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






CREATE PROCEDURE [dbo].[usp_SaveJob]
	@JobFiles JobFiletype READONLY,
	@JobName NVARCHAR(50),
	@Priority UNIQUEIDENTIFIER,
	@Notes NVARCHAR(50),
	@IsSingleJob BIT,
	@CompanyId UNIQUEIDENTIFIER,
	@CreatedBy UNIQUEIDENTIFIER
AS
BEGIN
	PRINT (@IsSingleJob)
	DECLARE @JobStatus UNIQUEIDENTIFIER
	SELECT @JobStatus = Id FROM JobStatus WHERE Description = 'Pending'
	BEGIN TRY
		BEGIN TRAN 

		IF(@IsSingleJob = 1)
		BEGIN

			DECLARE @InsertOutput TABLE (JobId UNIQUEIDENTIFIER)
			DECLARE @JobID UNIQUEIDENTIFIER = NEWID()

			INSERT INTO [dbo].[Jobs]
			   (Id,[Name],[Priority],[Notes],[IsSingleJob]
			   ,[Status],[CompanyId],[CreatedBy]
			   ,[CreatedDateTime])
			OUTPUT inserted.Id INTO @InsertOutput
			VALUES
			   (@JobID, @JobName, @Priority, @Notes, @IsSingleJob,
			   @JobStatus,@CompanyId, @CreatedBy,
		   GETUTCDATE())

		   INSERT INTO [dbo].[JobFiles]
			  (
				[FileName], FileExtension, SourceFilePath, JobId, CreatedBy, FileId, [PageCount]
				,CreatedDateTime
			  )
			SELECT [FileName], FileExtension, SourceFilePath, @JobID, CreatedBy, FileId, [PageCount]
				,GETUTCDATE()
			FROM @JobFiles

			IF(ISNULL(@Notes,'') != '')
			BEGIN
				INSERT INTO JobNotifications(JobId,Comments,CreatedBy,CreatedDateTime)
				VALUES(@JobID,@Notes,@CreatedBy,GETUTCDATE())
			END
			
		END
		ELSE
		BEGIN
			
			DECLARE @FileName varchar(100), @FileExtension varchar(50), @SourceFilePath varchar(1000), @FileId VARCHAR(500)
					,@PageCount INT

			DECLARE files_cursor CURSOR FOR
			SELECT FileName, FileExtension, SourceFilePath, FileId, [PageCount]
			FROM @JobFiles

			OPEN files_cursor

			FETCH NEXT FROM files_cursor
			INTO @FileName, @FileExtension, @SourceFilePath, @FileId, @PageCount

			WHILE @@FETCH_STATUS = 0
			BEGIN

				DECLARE @NewJobID UNIQUEIDENTIFIER = NEWID()

				INSERT INTO [dbo].[Jobs]
				   (Id,[Name],[Priority],[Notes],[IsSingleJob]
				   ,[Status],[CompanyId],[CreatedBy]
				   ,[CreatedDateTime])
				OUTPUT inserted.Id INTO @InsertOutput
				VALUES
				   (@NewJobID, @FileName, @Priority, @Notes, @IsSingleJob,
				   @JobStatus,@CompanyId, @CreatedBy,
			   GETUTCDATE())
			   
			   INSERT INTO [dbo].[JobFiles]
				  (
					[FileName], FileExtension, SourceFilePath, JobId, CreatedBy, FileId, [PageCount]
					,CreatedDateTime
				  )
				  VALUES(@FileName, @FileExtension, @SourceFilePath, @NewJobID, @CreatedBy, @FileId, @PageCount
							,GETUTCDATE())
				
				  IF(ISNULL(@Notes,'') != '')
					BEGIN
						INSERT INTO JobNotifications(JobId,Comments,CreatedBy,CreatedDateTime)
						VALUES(@NewJobID,@Notes,@CreatedBy,GETUTCDATE())
					END
				
				FETCH NEXT FROM files_cursor
				INTO @FileName, @FileExtension, @SourceFilePath, @FileId, @PageCount
			END
		
			CLOSE files_cursor;
			DEALLOCATE files_cursor;
		END

		

		COMMIT TRAN
	END TRY
	BEGIN CATCH
	
		ROLLBACK TRAN
		DECLARE @ErrorMessage NVARCHAR(4000);
		DECLARE @ErrorSeverity INT;
		DECLARE @ErrorState INT;

		SELECT
			@ErrorMessage = ERROR_MESSAGE(),
			@ErrorSeverity = ERROR_SEVERITY(),
			@ErrorState = ERROR_STATE();

		-- Use RAISERROR inside the CATCH block to return error
		-- information about the original error that caused
		-- execution to jump to the CATCH block.
		RAISERROR (@ErrorMessage, -- Message text.
				   @ErrorSeverity, -- Severity.
				   @ErrorState -- State.
				   );
	END CATCH
END
GO


