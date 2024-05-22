CREATE PROCEDURE usp_UpdateJobStatus
(
	@JobId UNIQUEIDENTIFIER,
	@UserId UNIQUEIDENTIFIER,
	@Status VARCHAR(15)
)
AS
BEGIN
	
	DECLARE @StatusId UNIQUEIDENTIFIER 
	SELECT @StatusId = Id FROM JobStatus WHERE Description = @Status

	IF @StatusId IS NOT NULL
		UPDATE Jobs SET Status = @StatusId ,ModifyedBy = @UserId, ModifiedDateTime = GETUTCDATE()
		WHERE Id = @JobId
END