CREATE PROCEDURE USP_InsertNotification
(
	@UserId uniqueidentifier,
	@JobId uniqueidentifier,
	@Comments nvarchar(2000)
)
AS
BEGIN
	INSERT INTO JobNotifications(JobId,Comments,CreatedBy,CreatedDateTime)
	VALUES(@JobId,@Comments,@UserId,GETDATE())
END