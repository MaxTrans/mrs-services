USE [Maxtra_Dev]
GO

/****** Object:  StoredProcedure [dbo].[usp_AdminSaveUploadFile]    Script Date: 24-04-2024 23:29:22 ******/
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

		INSERT INTO [dbo].[JobFiles]
			(
			[FileName], FileExtension, SourceFilePath, JobId, CreatedBy
			,CreatedDateTime
			)
		SELECT [FileName], FileExtension, SourceFilePath, @JobId, CreatedBy, GETUTCDATE()
		FROM @JobFiles
		
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


