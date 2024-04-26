CREATE PROCEDURE [dbo].[usp_AdminSaveUploadFile]
	@JobFiles JobFiletype READONLY,
	@JobId UNIQUEIDENTIFIER,
	@CreatedBy UNIQUEIDENTIFIER
AS
BEGIN
	
	BEGIN TRY

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