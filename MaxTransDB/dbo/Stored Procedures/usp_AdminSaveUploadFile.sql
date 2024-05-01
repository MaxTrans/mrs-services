
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
				[FileName], FileExtension, SourceFilePath, JobId, CreatedBy
				,CreatedDateTime,IsUploadFile
			)
		SELECT [FileName], FileExtension, SourceFilePath, @JobId, CreatedBy, GETUTCDATE(),1
		FROM @JobFiles

		DECLARE @JobStatus UNIQUEIDENTIFIER 
		SELECT @JobStatus = Id FROM JobStatus WHERE Description = 'Completed'

		UPDATE Jobs SET Status = @JobStatus 
		WHERE Id = @JobId
	END
	ELSE
	BEGIN 
		UPDATE JobFiles SET FileName = TJF.FileName, FileExtension = TJF.FileExtension, SourceFilePath = TJF.SourceFilePath,
							ModifyedBy = @CreatedBy, ModifiedDateTime = GETUTCDATE(), IsUploadFile = 1
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
