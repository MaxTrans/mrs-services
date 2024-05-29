CREATE PROCEDURE [dbo].[usp_UpdatePassword]
	@UserId UNIQUEIDENTIFIER,
	@Password VARCHAR(250)
AS
BEGIN
	
	BEGIN TRY
	
		UPDATE Users SET 
		Password = @Password, ModifiedDateTime = GETUTCDATE()
		WHERE Id = @UserId
	
		
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
