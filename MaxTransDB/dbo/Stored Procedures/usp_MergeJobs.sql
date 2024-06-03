CREATE PROCEDURE usp_MergeJobs (
	@JobIds VARCHAR(max)
	,@UserId VARCHAR(50)
	,@CompanyId VARCHAR(50)
	)
AS
BEGIN
	DECLARE @Tbl_JobIds TABLE (JobId UNIQUEIDENTIFIER)

	INSERT INTO @Tbl_JobIds (JobId)
	SELECT value
	FROM STRING_SPLIT(@JobIds, ',')

	DECLARE @JobID UNIQUEIDENTIFIER = NEWID()
	DECLARE @JobName VARCHAR(250) = 'Merged - ' + CONVERT(VARCHAR, GETUTCDATE(), 20)
	
	DECLARE @JobStatus UNIQUEIDENTIFIER = NULL
	SELECT @JobStatus = [dbo].[fn_GetJobStatus]('Pending')

	DECLARE @Priority UNIQUEIDENTIFIER

	SELECT @Priority = Id
	FROM [JobHandleTime]
	WHERE Description = '24 Hours'

	INSERT INTO [dbo].[Jobs] (
		Id
		,[Name]
		,[Priority]
		,[Notes]
		,[IsSingleJob]
		,[Status]
		,[CompanyId]
		,[CreatedBy]
		,[CreatedDateTime]
		)
	VALUES (
		@JobID
		,@JobName
		,@Priority
		,''
		,1
		,@JobStatus
		,@CompanyId
		,@UserId
		,GETUTCDATE()
		)

	INSERT INTO [dbo].[JobFiles] (
		[FileName]
		,FileExtension
		,SourceFilePath
		,JobId
		,CreatedBy
		,FileId
		,PageCount
		,CreatedDateTime
		)
	SELECT [FileName]
		,FileExtension
		,SourceFilePath
		,@JobID
		,@UserId
		,FileId
		,PageCount
		,GETUTCDATE()
	FROM @Tbl_JobIds T
	JOIN JobFiles JF ON JF.JobId = T.JobId

	UPDATE J
	SET J.[Status] = [dbo].[fn_GetJobStatus]('Void')
	FROM Jobs J
	JOIN @Tbl_JobIds T ON T.JobId = J.Id

	INSERT INTO JobNotifications (
		JobId
		,Comments
		,CreatedBy
		,CreatedDateTime
		)
	VALUES (
		@JobID
		,'Merged Job'
		,@UserId
		,GETUTCDATE()
		)
END