CREATE PROCEDURE [dbo].[USP_GetJobs]
(
	@JobStatus UNIQUEIDENTIFIER = NULL,
	@CreatedBy UNIQUEIDENTIFIER = NULL,
	@UserId UNIQUEIDENTIFIER
)
AS
BEGIN 
	SELECT J.*, JS.Description AS StatusName, U.FIrstName + ' ' + U.LastName AS UserName,
	(SELECT Id,FileName,FileExtension,SourceFilePath, IsUploadFile, [PageCount] FROM JobFiles WHERE JobId = J.Id FOR JSON PATH, ROOT ('JobFiles')) AS JobFiles,
	(
		SELECT COUNT(1) FROM JobNotifications N 
		WHERE N.JobId = J.Id
		AND N.CreatedBy != @UserId
		AND ISNULL(N.IsReadMessage,0) = 0 
	) AS UnReadMessages,
	(SELECT FilePreference FROM Client WHERE UserId = J.CreatedBy AND ISNULL(IsDeleted,0) = 0) AS FilePreference
	FROM Jobs J
	JOIN JobStatus JS ON JS.Id = J.Status
	JOIN Users U ON U.id = J.CreatedBy
	WHERE ISNULL(J.IsDeleted, 0) = 0
	AND (@JobStatus IS NULL OR J.Status = @JobStatus)
	AND (@CreatedBy IS NULL OR J.CreatedBy = @CreatedBy)
	ORDER BY J.JobId
END