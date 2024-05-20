CREATE PROCEDURE [dbo].[USP_GetJobs]
(
	@JobStatus VARCHAR(250) = NULL,
	@CreatedBy UNIQUEIDENTIFIER = NULL,
	@UserId UNIQUEIDENTIFIER,
	@Filename NVARCHAR(100) = NULL,
	@FromDate DATE = NULL,
	@ToDate DATE = NULL
)
AS
BEGIN 
	
	SELECT J.*, JS.Description AS StatusName, U.FIrstName + ' ' + U.LastName AS UserName,
	CASE WHEN CHARINDEX('Hours',JHT.[Description],0) = 0 THEN CAST(CAST(SUBSTRING(JHT.[Description],0,2) AS INT) * 24 AS VARCHAR) + ' Hours'
		 ELSE  JHT.[Description] END AS 'Tat',
	(SELECT Id,FileName,FileExtension,SourceFilePath, IsUploadFile,[PageCount] FROM JobFiles WHERE JobId = J.Id FOR JSON PATH, ROOT ('JobFiles')) AS JobFiles,
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
	AND (@Filename IS NULL OR J.Name LIKE @FileName + '%')
	AND (@FromDate IS NULL OR CAST(J.CreatedDateTime AS DATE) >= @FromDate)
	AND (@ToDate IS NULL OR CAST(J.CreatedDateTime AS DATE) <= @ToDate)
	ORDER BY J.JobId
END