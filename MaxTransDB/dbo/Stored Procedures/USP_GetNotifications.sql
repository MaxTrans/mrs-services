CREATE PROCEDURE [dbo].[USP_GetNotifications]
(
	@JobId UNIQUEIDENTIFIER,
	@UserId UNIQUEIDENTIFIER
)
AS
BEGIN
	SELECT N.Id,N.JobId,N.Comments,
	N.IsReadMessage,
	CASE WHEN @UserId = N.CreatedBy THEN 'You' 
	ELSE U.FIrstName + ' ' + LastName END AS CreatedByName,
	N.CreatedDateTime 
	FROM JobNotifications N
	JOIN Users U ON U.Id = N.CreatedBy
	WHERE N.JobId = @JobId
	--AND N.CreatedBy != @UserId
	ORDER BY N.CreatedDateTime DESC

	UPDATE JobNotifications SET IsReadMessage = 1
	WHERE JobId = @JobId 
	AND CreatedBy != @UserId 
END