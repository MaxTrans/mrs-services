CREATE PROCEDURE usp_DeleteJob
(
	@JobId UNIQUEIDENTIFIER,
	@UserId UNIQUEIDENTIFIER
)
AS
BEGIN
	UPDATE Jobs SET IsDeleted = 1,ModifyedBy = @UserId, ModifiedDateTime = GETUTCDATE()
	WHERE Id = @JobId
END