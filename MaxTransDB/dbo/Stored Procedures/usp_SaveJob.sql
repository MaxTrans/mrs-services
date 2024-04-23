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
			   'fab98251-70c2-410b-bc09-9b66f9234e30',@CompanyId, @CreatedBy,
		   GETUTCDATE())

		   INSERT INTO [dbo].[JobFiles]
			  (
				[FileName], FileExtension, SourceFilePath, JobId, CreatedBy
				,CreatedDateTime
			  )
			SELECT [FileName], FileExtension, SourceFilePath, @JobID, CreatedBy, GETUTCDATE()
			FROM @JobFiles

			IF(ISNULL(@Notes,'') != '')
			BEGIN
				INSERT INTO JobNotifications(JobId,Comments,CreatedBy,CreatedDateTime)
				VALUES(@JobID,@Notes,@CreatedBy,GETUTCDATE())
			END
			
		END
		ELSE
		BEGIN
			
			DECLARE @FileName varchar(100), @FileExtension varchar(50), @SourceFilePath varchar(1000)

			DECLARE files_cursor CURSOR FOR
			SELECT FileName, FileExtension, SourceFilePath
			FROM @JobFiles

			OPEN files_cursor

			FETCH NEXT FROM files_cursor
			INTO @FileName, @FileExtension, @SourceFilePath

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
				   'fab98251-70c2-410b-bc09-9b66f9234e30',@CompanyId, @CreatedBy,
			   GETUTCDATE())

			   INSERT INTO [dbo].[JobFiles]
				  (
					[FileName], FileExtension, SourceFilePath, JobId, CreatedBy
					,CreatedDateTime
				  )
				  VALUES(@FileName, @FileExtension, @SourceFilePath, @NewJobID, @CreatedBy, GETUTCDATE())

				  IF(ISNULL(@Notes,'') != '')
					BEGIN
						INSERT INTO JobNotifications(JobId,Comments,CreatedBy,CreatedDateTime)
						VALUES(@NewJobID,@Notes,@CreatedBy,GETUTCDATE())
					END
			
				FETCH NEXT FROM files_cursor
				INTO @FileName, @FileExtension, @SourceFilePath
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