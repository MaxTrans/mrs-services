-- =============================================
-- Author:		<Author,,Name>
-- Create date: 04/04/2024
-- Description:	Procedure to Save Job details into Job and JobFile tables
-- =============================================
CREATE PROCEDURE [dbo].[usp_SaveJob]
	@JobFiles JobFiletype READONLY,
	@JobName NVARCHAR(50),
	@Priority UNIQUEIDENTIFIER,
	@Notes NVARCHAR(50),
	@IsSingleJob BIT,
	@CompanyId UNIQUEIDENTIFIER,
	@CreatedBy UNIQUEIDENTIFIER
AS
BEGIN
	
	BEGIN TRY
		BEGIN TRAN 
			DECLARE @InsertOutput TABLE (JobId UNIQUEIDENTIFIER)
			DECLARE @JobID UNIQUEIDENTIFIER
			
			INSERT INTO [dbo].[Jobs]
			   ([Name],[Priority],[Notes],[IsSingleJob]
			   ,[Status],[CompanyId],[CreatedBy]
			   ,[CreatedDateTime])
			OUTPUT inserted.Id INTO @InsertOutput
			VALUES
			   (@JobName, @Priority, @Notes, @IsSingleJob,
			   'fab98251-70c2-410b-bc09-9b66f9234e30',@CompanyId, @CreatedBy,
		   GETUTCDATE())

		   SELECT @JobID = JobId FROM @InsertOutput


		   INSERT INTO [dbo].[JobFiles]
			  (
				[FileName], FileExtension, SourceFilePath, JobId, CreatedBy
				,CreatedDateTime
			  )
			SELECT [FileName], FileExtension, SourceFilePath, @JobID, CreatedBy, GETUTCDATE()
			FROM @JobFiles

			IF(ISNULL(@Notes,'') != '')
			BEGIN
				INSERT INTO JobNotifications(JobId,Comments,CreatedBy,CreatedDateTime)
				VALUES(@JobId,@Notes,@CreatedBy,GETDATE())
			END

		COMMIT TRAN
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN
	END CATCH
END