USE [Maxtra_Dev]
GO

/****** Object:  UserDefinedTableType [dbo].[JobFileType]    Script Date: 06-04-2024 20:21:24 ******/
CREATE TYPE [dbo].[JobFileType] AS TABLE(
	[FileName] [nvarchar](50) NULL,
	[FileExtension] [varchar](5) NULL,
	[SourceFilePath] [nvarchar](500) NULL,
	[CreatedBy] [uniqueidentifier] NULL
)
GO




ALTER TABLE [dbo].[Jobs] DROP CONSTRAINT [DF_Jobs_Id]
GO

/****** Object:  Table [dbo].[Jobs]    Script Date: 06-04-2024 20:22:25 ******/
DROP TABLE [dbo].[Jobs]
GO

/****** Object:  Table [dbo].[Jobs]    Script Date: 06-04-2024 20:22:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Jobs](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Priority] [uniqueidentifier] NOT NULL,
	[Notes] [nvarchar](500) NULL,
	[IsSingleJob] [bit] NULL,
	[ParentJobId] [uniqueidentifier] NULL,
	[AssignTo] [uniqueidentifier] NULL,
	[L1User] [uniqueidentifier] NULL,
	[L2User] [uniqueidentifier] NULL,
	[L3User] [uniqueidentifier] NULL,
	[Status] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NULL,
	[CompanyId] [uniqueidentifier] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifyedBy] [uniqueidentifier] NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[ModifiedDateTime] [datetime] NULL,
 CONSTRAINT [PK_Jobs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Jobs] ADD  CONSTRAINT [DF_Jobs_Id]  DEFAULT (newid()) FOR [Id]
GO


ALTER TABLE [dbo].[JobFiles] DROP CONSTRAINT [DF_JobFiles_Id]
GO

/****** Object:  Table [dbo].[JobFiles]    Script Date: 06-04-2024 20:23:05 ******/
DROP TABLE [dbo].[JobFiles]
GO

/****** Object:  Table [dbo].[JobFiles]    Script Date: 06-04-2024 20:23:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[JobFiles](
	[Id] [uniqueidentifier] NOT NULL,
	[FileName] [nvarchar](50) NOT NULL,
	[FileExtension] [varchar](5) NOT NULL,
	[SourceFilePath] [nvarchar](500) NOT NULL,
	[JobId] [uniqueidentifier] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifyedBy] [uniqueidentifier] NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[ModifiedDateTime] [datetime] NULL,
 CONSTRAINT [PK_JobFiles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[JobFiles] ADD  CONSTRAINT [DF_JobFiles_Id]  DEFAULT (newid()) FOR [Id]
GO


/****** Object:  StoredProcedure [dbo].[usp_SaveJob]    Script Date: 06-04-2024 20:21:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

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
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN
	END CATCH
END
GO


