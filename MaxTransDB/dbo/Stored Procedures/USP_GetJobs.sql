--EXEC [dbo].[USP_GetJobs] '12f5b379-a6e9-48a2-81e2-6e7249b4895e,fab98251-70c2-410b-bc09-9b66f9234e30', NULL, '6b535790-9dea-4c17-aa04-fe599c0fba62'
CREATE PROCEDURE [dbo].[USP_GetJobs]
(
	@JobStatus VARCHAR(250) = NULL,
	@CreatedBy UNIQUEIDENTIFIER = NULL,
	@UserId UNIQUEIDENTIFIER
)
AS
BEGIN 
	SELECT J.*, JS.Description AS StatusName, U.FIrstName + ' ' + U.LastName AS UserName,
	CASE WHEN CHARINDEX('Hours',JHT.[Description],0) = 0 THEN CAST(CAST(SUBSTRING(JHT.[Description],0,2) AS INT) * 24 AS VARCHAR) + ' Hours'
		 ELSE  JHT.[Description] END AS 'Tat',
	(SELECT Id,FileName,FileExtension,SourceFilePath, IsUploadFile FROM JobFiles WHERE JobId = J.Id FOR JSON PATH, ROOT ('JobFiles')) AS JobFiles,
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
	JOIN JobHandleTime JHT ON J.Priority = JHT.Id
	WHERE ISNULL(J.IsDeleted, 0) = 0
	AND (@JobStatus IS NULL OR J.Status IN( SELECT value
										FROM STRING_SPLIT(@JobStatus, ',')))
	AND (@CreatedBy IS NULL OR J.CreatedBy = @CreatedBy)
	ORDER BY J.JobId
END

