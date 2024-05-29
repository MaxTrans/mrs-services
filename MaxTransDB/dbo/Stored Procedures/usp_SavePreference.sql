
CREATE PROCEDURE [dbo].[usp_SavePreferences]
	@UserId UNIQUEIDENTIFIER,
	@Website VARCHAR(100),
	@DefaultTat INT,
	@IsPDFAllowed BIT,
	@IsDocAllowed BIT
	--,
	--@CreatedBy UNIQUEIDENTIFIER
AS
BEGIN
	
	BEGIN TRY
	IF NOT EXISTS(SELECT * FROM Client WHERE UserId = @UserId)
	BEGIN
		INSERT INTO [dbo].[Client]
           ([UserId],[ClientType],[ClientName],[Details],[Website]
           ,[DefaultTAT],[FilePreferencePDF],[FilePreferenceWord]
           ,[IsDeleted],[CreatedBy],[CreatedDateTime]
           )
		VALUES
           (@UserId,'client','Test','Details',@Website,
		   @DefaultTat,@IsPDFAllowed,@IsDocAllowed,
		   0,@UserId,GETUTCDATE())
	END
	ELSE
	BEGIN
		UPDATE Client SET 
		Website = @Website, DefaultTAT = @DefaultTat, FilePreferencePDF = @IsPDFAllowed, FilePreferenceWord = @IsDocAllowed
		WHERE UserId = @UserId
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
