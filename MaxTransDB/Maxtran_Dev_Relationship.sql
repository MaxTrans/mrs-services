
/****** Object:  UserDefinedTableType [dbo].[JobFileType]    Script Date: 08-06-2024 19:57:19 ******/
CREATE TYPE [dbo].[JobFileType] AS TABLE(
	[FileName] [nvarchar](250) NULL,
	[FileExtension] [varchar](5) NULL,
	[SourceFilePath] [nvarchar](500) NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[FileId] [varchar](500) NULL
)
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetJobStatus]    Script Date: 08-06-2024 19:57:19 ******/

CREATE FUNCTION [dbo].[fn_GetJobStatus] 
(
	-- Add the parameters for the function here
	@Status varchar(100)
)
RETURNS UNIQUEIDENTIFIER
AS
BEGIN
	-- Declare the return variable here
	DECLARE @ReturnVal UNIQUEIDENTIFIER = NULL

	-- Add the T-SQL statements to compute the return value here
	SELECT @ReturnVal = Id FROM JobStatus WHERE Description = @Status

	-- Return the result of the function
	RETURN @ReturnVal
END
GO
/****** Object:  Table [dbo].[AppSettings]    Script Date: 08-06-2024 19:57:20 ******/

CREATE TABLE [dbo].[AppSettings](
	[Id] [uniqueidentifier] NOT NULL,
	[CompanyId] [uniqueidentifier] NOT NULL,
	[MaxFileSizeInMB] [int] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifyedBy] [uniqueidentifier] NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[ModifiedDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_AppSettings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 08-06-2024 19:57:20 ******/

CREATE TABLE [dbo].[Client](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[ClientType] [varchar](10) NOT NULL,
	[ClientName] [nvarchar](50) NOT NULL,
	[Details] [nvarchar](1000) NOT NULL,
	[Website] [varchar](100) NULL,
	[Address1] [nvarchar](50) NULL,
	[Address2] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[StateId] [int] NULL,
	[CountryId] [int] NULL,
	[DefaultTAT] [int] NULL,
	[FilePreferencePDF] [bit] NULL,
	[FilePreferenceWord] [bit] NULL,
	[FilePreferencePDFLink] [bit] NULL,
	[ClientLogo] [varchar](50) NULL,
	[IsDeleted] [bit] NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifyedBy] [uniqueidentifier] NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[ModifiedDateTime] [datetime] NULL,
	[FilePreference] [varchar](50) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 08-06-2024 19:57:20 ******/

CREATE TABLE [dbo].[Company](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Url] [varchar](100) NOT NULL,
	[SmallLogo] [varchar](50) NOT NULL,
	[LoginLogo] [nchar](10) NOT NULL,
	[HeaderTitle] [nvarchar](50) NULL,
	[IsDeleted] [bit] NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifyedBy] [uniqueidentifier] NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[ModifiedDateTime] [datetime] NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FileTypes]    Script Date: 08-06-2024 19:57:20 ******/

CREATE TABLE [dbo].[FileTypes](
	[Id] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[IsDeleted] [bit] NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifyedBy] [uniqueidentifier] NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[ModifiedDateTime] [datetime] NULL,
	[FileExtension] [varchar](8) NULL,
 CONSTRAINT [PK_FileTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobFiles]    Script Date: 08-06-2024 19:57:20 ******/

CREATE TABLE [dbo].[JobFiles](
	[Id] [uniqueidentifier] NOT NULL,
	[FileName] [nvarchar](250) NULL,
	[FileExtension] [varchar](8) NULL,
	[SourceFilePath] [nvarchar](500) NOT NULL,
	[JobId] [uniqueidentifier] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifyedBy] [uniqueidentifier] NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[ModifiedDateTime] [datetime] NULL,
	[IsUploadFile] [bit] NULL,
	[FileId] [varchar](500) NULL,
	[PageCount] [int] NULL,
 CONSTRAINT [PK_JobFiles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobHandleTime]    Script Date: 08-06-2024 19:57:20 ******/

CREATE TABLE [dbo].[JobHandleTime](
	[Id] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[IsDeleted] [bit] NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifyedBy] [uniqueidentifier] NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[ModifiedDateTime] [datetime] NULL,
	[SortOrder] [int] NULL,
 CONSTRAINT [PK_JobHandleTime] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobNotifications]    Script Date: 08-06-2024 19:57:20 ******/

CREATE TABLE [dbo].[JobNotifications](
	[Id] [uniqueidentifier] NOT NULL,
	[JobId] [uniqueidentifier] NOT NULL,
	[Comments] [nvarchar](1000) NOT NULL,
	[IsReadMessage] [bit] NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifyedBy] [uniqueidentifier] NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[ModifiedDateTime] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jobs]    Script Date: 08-06-2024 19:57:20 ******/

CREATE TABLE [dbo].[Jobs](
	[Id] [uniqueidentifier] NOT NULL,
	[JobId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
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
/****** Object:  Table [dbo].[JobStatus]    Script Date: 08-06-2024 19:57:20 ******/

CREATE TABLE [dbo].[JobStatus](
	[Id] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[IsDeleted] [bit] NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifyedBy] [uniqueidentifier] NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[ModifiedDateTime] [datetime] NULL,
	[OrderSqe] [int] NULL,
 CONSTRAINT [PK_JobStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobUploadFiles]    Script Date: 08-06-2024 19:57:20 ******/

CREATE TABLE [dbo].[JobUploadFiles](
	[Id] [uniqueidentifier] NOT NULL,
	[FileName] [nvarchar](50) NOT NULL,
	[FileTypeId] [uniqueidentifier] NOT NULL,
	[SourceFilePath] [nvarchar](250) NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifyedBy] [uniqueidentifier] NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[ModifiedDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_JobUploadFiles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 08-06-2024 19:57:20 ******/

CREATE TABLE [dbo].[Roles](
	[Id] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[CompanyId] [uniqueidentifier] NOT NULL,
	[Type] [varchar](20) NOT NULL,
	[IsDeleted] [bit] NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifyedBy] [uniqueidentifier] NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[ModifiedDateTime] [datetime] NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAssignEmployee]    Script Date: 08-06-2024 19:57:20 ******/

CREATE TABLE [dbo].[UserAssignEmployee](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[AssingnUserid] [uniqueidentifier] NOT NULL,
	[UserLevelId] [uniqueidentifier] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifyedBy] [uniqueidentifier] NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[ModifiedDateTime] [datetime] NULL,
 CONSTRAINT [PK_UserAssignEmployee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 08-06-2024 19:57:20 ******/

CREATE TABLE [dbo].[UserInfo](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[UserType] [varchar](15) NOT NULL,
	[DesignationId] [uniqueidentifier] NOT NULL,
	[UserLevelTypeId] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifyedBy] [uniqueidentifier] NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[ModifiedDateTime] [datetime] NULL,
 CONSTRAINT [PK_UserInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLevelTypes]    Script Date: 08-06-2024 19:57:20 ******/

CREATE TABLE [dbo].[UserLevelTypes](
	[Id] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[IsDeleted] [bit] NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifyedBy] [uniqueidentifier] NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[ModifiedDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_UserLevelTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserNotifications]    Script Date: 08-06-2024 19:57:20 ******/

CREATE TABLE [dbo].[UserNotifications](
	[Id] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[IsReadMessage] [bit] NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifyedBy] [uniqueidentifier] NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[ModifiedDateTime] [datetime] NULL,
 CONSTRAINT [PK_UserNotifications] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserPreferences]    Script Date: 08-06-2024 19:57:20 ******/

CREATE TABLE [dbo].[UserPreferences](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[FileTypes] [varchar](50) NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifyedBy] [uniqueidentifier] NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[ModifiedDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_UserPreferences] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 08-06-2024 19:57:20 ******/

CREATE TABLE [dbo].[UserRoles](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifyedBy] [uniqueidentifier] NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[ModifiedDateTime] [datetime] NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 08-06-2024 19:57:20 ******/

CREATE TABLE [dbo].[Users](
	[Id] [uniqueidentifier] NOT NULL,
	[FIrstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[LoginName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[PhoneNo] [varchar](15) NULL,
	[CompanyId] [uniqueidentifier] NOT NULL,
	[IsDisabled] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifyedBy] [uniqueidentifier] NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[ModifiedDateTime] [datetime] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendor]    Script Date: 08-06-2024 19:57:20 ******/

CREATE TABLE [dbo].[Vendor](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[ClientName] [nvarchar](50) NOT NULL,
	[Details] [nvarchar](1000) NOT NULL,
	[Website] [varchar](100) NULL,
	[Address1] [nvarchar](50) NULL,
	[Address2] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[StateId] [int] NULL,
	[CountryId] [int] NULL,
	[Website1] [varchar](100) NULL,
	[IsDeleted] [bit] NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifyedBy] [uniqueidentifier] NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[ModifiedDateTime] [datetime] NULL,
 CONSTRAINT [PK_Vendor_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FileTypes] ADD  CONSTRAINT [DF_ID]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[JobFiles] ADD  CONSTRAINT [DF_JobFiles_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[JobHandleTime] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[JobNotifications] ADD  CONSTRAINT [DF_JobNotifications_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Jobs] ADD  CONSTRAINT [DF_Jobs_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[UserNotifications] ADD  CONSTRAINT [DF_UserNotifications_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[AppSettings]  WITH CHECK ADD  CONSTRAINT [FK_AppSettings_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO
ALTER TABLE [dbo].[AppSettings] CHECK CONSTRAINT [FK_AppSettings_Company]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_Users]
GO
ALTER TABLE [dbo].[JobFiles]  WITH CHECK ADD  CONSTRAINT [FK_JobFiles_Jobs] FOREIGN KEY([JobId])
REFERENCES [dbo].[Jobs] ([Id])
GO
ALTER TABLE [dbo].[JobFiles] CHECK CONSTRAINT [FK_JobFiles_Jobs]
GO
ALTER TABLE [dbo].[JobNotifications]  WITH CHECK ADD  CONSTRAINT [FK_JobNotifications_Jobs] FOREIGN KEY([JobId])
REFERENCES [dbo].[Jobs] ([Id])
GO
ALTER TABLE [dbo].[JobNotifications] CHECK CONSTRAINT [FK_JobNotifications_Jobs]
GO
ALTER TABLE [dbo].[Jobs]  WITH CHECK ADD  CONSTRAINT [FK_Jobs_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO
ALTER TABLE [dbo].[Jobs] CHECK CONSTRAINT [FK_Jobs_Company]
GO
ALTER TABLE [dbo].[Jobs]  WITH CHECK ADD  CONSTRAINT [FK_Jobs_JobStatus] FOREIGN KEY([Status])
REFERENCES [dbo].[JobStatus] ([Id])
GO
ALTER TABLE [dbo].[Jobs] CHECK CONSTRAINT [FK_Jobs_JobStatus]
GO
ALTER TABLE [dbo].[JobUploadFiles]  WITH CHECK ADD  CONSTRAINT [FK_JobUploadFiles_FileTypes] FOREIGN KEY([FileTypeId])
REFERENCES [dbo].[FileTypes] ([Id])
GO
ALTER TABLE [dbo].[JobUploadFiles] CHECK CONSTRAINT [FK_JobUploadFiles_FileTypes]
GO
ALTER TABLE [dbo].[UserAssignEmployee]  WITH CHECK ADD  CONSTRAINT [FK_UserAssignEmployee_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserAssignEmployee] CHECK CONSTRAINT [FK_UserAssignEmployee_Users]
GO
ALTER TABLE [dbo].[UserInfo]  WITH CHECK ADD  CONSTRAINT [FK_UserInfo_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserInfo] CHECK CONSTRAINT [FK_UserInfo_Users]
GO
ALTER TABLE [dbo].[UserNotifications]  WITH CHECK ADD  CONSTRAINT [FK_UserNotifications_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserNotifications] CHECK CONSTRAINT [FK_UserNotifications_Users]
GO
ALTER TABLE [dbo].[UserPreferences]  WITH CHECK ADD  CONSTRAINT [FK_UserPreferences_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserPreferences] CHECK CONSTRAINT [FK_UserPreferences_Users]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Roles]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Company]
GO
ALTER TABLE [dbo].[Vendor]  WITH CHECK ADD  CONSTRAINT [FK_Vendor_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Vendor] CHECK CONSTRAINT [FK_Vendor_Users]
GO
/****** Object:  StoredProcedure [dbo].[usp_AdminSaveUploadFile]    Script Date: 08-06-2024 19:57:20 ******/

CREATE PROCEDURE [dbo].[usp_AdminSaveUploadFile]    
 @JobFiles JobFiletype READONLY,    
 @JobId UNIQUEIDENTIFIER,    
 @CreatedBy UNIQUEIDENTIFIER    
AS    
BEGIN    
     
 BEGIN TRY    
 DECLARE @FileExtension VARCHAR(5)    
 SELECT @FileExtension = FileExtension FROM @JobFiles     
    
 IF NOT EXISTS(SELECT * FROM JobFiles WHERE JobId = @JobId AND FileExtension = @FileExtension AND IsUploadFile = 1)    
 BEGIN    
  INSERT INTO [dbo].[JobFiles]    
   (    
    [FileName], FileExtension, SourceFilePath, JobId, CreatedBy, FileId    
    ,CreatedDateTime,IsUploadFile    
   )    
  SELECT [FileName], FileExtension, SourceFilePath, @JobId, CreatedBy, FileId    
    ,GETUTCDATE(),1    
  FROM @JobFiles    
    
  DECLARE @UserId UNIQUEIDENTIFIER    
  DECLARE @Preference VARCHAR(200)     
  DECLARE @PreferenceCount INT    
  DECLARE @FileCount INT    
    
  SELECT @UserId = CreatedBy FROM Jobs WHERE Id = @JobId    
  SELECT @Preference = FilePreference FROM Client WHERE UserId = @UserId    
  SELECT @PreferenceCount = COUNT(1) FROM STRING_SPLIT( @Preference , ',')    
  SELECT @FileCount = COUNT(1) FROM JobFiles WHERE JobId = @JobId AND IsUploadFile = 1    
    
  IF @PreferenceCount <= @FileCount    
  BEGIN    
   DECLARE @JobStatus UNIQUEIDENTIFIER     
   SELECT @JobStatus = Id FROM JobStatus WHERE Description = 'Completed'    
    
   UPDATE Jobs SET Status = @JobStatus     
   WHERE Id = @JobId    
  END    
 END    
 ELSE    
 BEGIN     
  UPDATE JobFiles SET FileName = TJF.FileName, FileExtension = TJF.FileExtension, SourceFilePath = TJF.SourceFilePath,    
       ModifyedBy = @CreatedBy, ModifiedDateTime = GETUTCDATE(), IsUploadFile = 1, FileId = TJF.FileId    
  FROM JobFiles JF     
  JOIN @JobFiles TJF ON JF.JobId = @JobId AND JF.FileExtension = @FileExtension    
  WHERE JF.JobId = @JobId AND IsUploadFile = 1    
  
  INSERT INTO JobNotifications(JobId,Comments,CreatedBy,CreatedDateTime)  
  SELECT @JobId,'Reupload new file: ' + FileName,@CreatedBy,GETUTCDATE() FROM @JobFiles  
   
 END    
      
      
 END TRY    
 BEGIN CATCH    
  ROLLBACK TRAN    
  DECLARE @ErrorMessage NVARCHAR(4000);    
  DECLARE @ErrorSeverity INT;    
  DECLARE @ErrorState INT;    
    
  SELECT    
   @ErrorMessage = ERROR_MESSAGE(),    
   @ErrorSeverity = ERROR_SEVERITY(),    
   @ErrorState = ERROR_STATE();    
    
  -- Use RAISERROR inside the CATCH block to return error    
  -- information about the original error that caused    
  -- execution to jump to the CATCH block.    
  RAISERROR (@ErrorMessage, -- Message text.    
       @ErrorSeverity, -- Severity.    
       @ErrorState -- State.    
       );    
 END CATCH    
END

GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteJob]    Script Date: 08-06-2024 19:57:20 ******/

CREATE PROCEDURE [dbo].[usp_DeleteJob]
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
GO
/****** Object:  StoredProcedure [dbo].[usp_GetClients]    Script Date: 08-06-2024 19:57:20 ******/


CREATE PROCEDURE [dbo].[usp_GetClients]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT C.*, U.CompanyId, U.Email, U.FIrstName AS FirstName, U.LastName, U.Password, U.PhoneNo, U.Email, U.LoginName, R.[Description] AS [RoleName],
	CMP.[Name] AS CompanyName
	FROM Client C
	JOIN [Users] U ON C.UserId = U.Id
	JOIN [UserRoles] UR ON U.Id = UR.UserId 
	JOIN [Roles] R ON UR.RoleId = R.Id
	LEFT JOIN Company CMP ON R.CompanyId = CMP.Id

END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetJobs]    Script Date: 08-06-2024 19:57:20 ******/

CREATE PROCEDURE [dbo].[USP_GetJobs]
(
	@JobStatus VARCHAR(250) = NULL,
	@CreatedBy UNIQUEIDENTIFIER = NULL,
	@UserId UNIQUEIDENTIFIER,
	@Filename NVARCHAR(100) = NULL,
	@FromDate DATE = NULL,
	@ToDate DATE = NULL,
	@InitialLoad BIT = NULL
)
AS
BEGIN 
	
	IF ISNULL(@InitialLoad,0) = 1
	BEGIN
		SELECT * FROM (
	
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
		WHERE ISNULL(J.IsDeleted, 0) = 0  AND J.[Status] IN (
			SELECT ID FROM JobStatus where Description IN ('Pending','In Progress')
		)

		UNION 

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
		WHERE CAST(J.CreatedDateTime AS DATE) BETWEEN CAST(DATEADD(WK,-2,GETDATE()) AS DATE) AND CAST(GETDATE() AS DATE)
		AND ISNULL(J.IsDeleted, 0) = 0 AND J.[Status] = '12F5B379-A6E9-48A2-81E2-6E7249B4895E'
		) T

		WHERE (@JobStatus IS NULL OR T.Status IN( SELECT value
											FROM STRING_SPLIT(@JobStatus, ',')))
		AND (@CreatedBy IS NULL OR T.CreatedBy = @CreatedBy)
		AND (@Filename IS NULL OR T.Name LIKE @FileName + '%')
		AND (@FromDate IS NULL OR CAST(T.CreatedDateTime AS DATE) >= @FromDate)
		AND (@ToDate IS NULL OR CAST(T.CreatedDateTime AS DATE) <= @ToDate)

		ORDER BY 
		CASE WHEN T.StatusName != 'Completed' THEN T.JobId END DESC,
		CASE WHEN T.StatusName = 'Completed' THEN 999999 END
	END
	ELSE 
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
		ORDER BY J.JobId DESC
	END
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetLookupData]    Script Date: 08-06-2024 19:57:20 ******/

CREATE PROCEDURE [dbo].[USP_GetLookupData]
(
	@Type NVARCHAR(50)
)
AS
BEGIN
	IF @Type = 'status'
	BEGIN
		select Id, Description AS Value from JobStatus ORDER BY OrderSqe
	END
	ELSE IF @Type = 'tat'
	BEGIN
		select Id, Description AS Value from JobHandleTime order by SortOrder
	END
	ELSE IF @Type = 'filetype'
	BEGIN
		select Id, Description AS Value from FileTypes
	END
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetNotifications]    Script Date: 08-06-2024 19:57:20 ******/

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

GO
/****** Object:  StoredProcedure [dbo].[USP_GetUserLookup]    Script Date: 08-06-2024 19:57:20 ******/

CREATE PROCEDURE [dbo].[USP_GetUserLookup]
(
	@Role NVARCHAR(50)
)
AS
BEGIN
	SELECT U.Id, U.FIrstName + ' ' + U.LastName AS Value  from Users U
	JOIN UserRoles UR ON UR.UserId = U.Id
	JOIN Roles R ON R.Id = UR.RoleId
	WHERE R.Description = @Role
END
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertNotification]    Script Date: 08-06-2024 19:57:20 ******/

CREATE PROCEDURE [dbo].[USP_InsertNotification]
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
GO
/****** Object:  StoredProcedure [dbo].[usp_MergeJobs]    Script Date: 08-06-2024 19:57:20 ******/

CREATE   PROCEDURE [dbo].[usp_MergeJobs] (
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
GO
/****** Object:  StoredProcedure [dbo].[usp_SaveJob]    Script Date: 08-06-2024 19:57:20 ******/

  
  
CREATE PROCEDURE [dbo].[usp_SaveJob]  
 @JobFiles JobFiletype READONLY,  
 @JobName NVARCHAR(250),  
 @Priority UNIQUEIDENTIFIER,  
 @Notes NVARCHAR(50),  
 @IsSingleJob BIT,  
 @CompanyId UNIQUEIDENTIFIER,  
 @CreatedBy UNIQUEIDENTIFIER  
AS  
BEGIN  
 DECLARE @JobStatus UNIQUEIDENTIFIER  
 SELECT @JobStatus = Id FROM JobStatus WHERE Description = 'Pending'  
 BEGIN TRY  
  BEGIN TRAN   
  
  IF(@IsSingleJob = 1)  
  BEGIN  
  
   DECLARE @InsertOutput TABLE (JobId UNIQUEIDENTIFIER)  
   DECLARE @JobID UNIQUEIDENTIFIER = NEWID()  
  
   INSERT INTO [dbo].[Jobs]  
      (Id,[Name],[Priority],[Notes],[IsSingleJob]  
      ,[Status],[CompanyId],[CreatedBy]  
      ,[CreatedDateTime])  
   OUTPUT inserted.Id INTO @InsertOutput  
   VALUES  
      (@JobID, @JobName, @Priority, @Notes, @IsSingleJob,  
      @JobStatus,@CompanyId, @CreatedBy,  
     GETUTCDATE())  
  
     INSERT INTO [dbo].[JobFiles]  
     (  
    [FileName], FileExtension, SourceFilePath, JobId, CreatedBy, FileId  
    ,CreatedDateTime  
     )  
   SELECT [FileName], FileExtension, SourceFilePath, @JobID, CreatedBy, FileId  
    ,GETUTCDATE()  
   FROM @JobFiles  
  
   IF(ISNULL(@Notes,'') != '')  
   BEGIN  
    INSERT INTO JobNotifications(JobId,Comments,CreatedBy,CreatedDateTime)  
    VALUES(@JobID,@Notes,@CreatedBy,GETUTCDATE())  
   END  
     
  END  
  ELSE  
  BEGIN  
     
   DECLARE @FileName varchar(100), @FileExtension varchar(50), @SourceFilePath varchar(1000), @FileId VARCHAR(500)  
  
   DECLARE files_cursor CURSOR FOR  
   SELECT FileName, FileExtension, SourceFilePath, FileId  
   FROM @JobFiles  
  
   OPEN files_cursor  
  
   FETCH NEXT FROM files_cursor  
   INTO @FileName, @FileExtension, @SourceFilePath, @FileId  
  
   WHILE @@FETCH_STATUS = 0  
   BEGIN  
  
    DECLARE @NewJobID UNIQUEIDENTIFIER = NEWID()  
  
    INSERT INTO [dbo].[Jobs]  
       (Id,[Name],[Priority],[Notes],[IsSingleJob]  
       ,[Status],[CompanyId],[CreatedBy]  
       ,[CreatedDateTime])  
    OUTPUT inserted.Id INTO @InsertOutput  
    VALUES  
       (@NewJobID, @FileName, @Priority, @Notes, @IsSingleJob,  
       @JobStatus,@CompanyId, @CreatedBy,  
      GETUTCDATE())  
  
      INSERT INTO [dbo].[JobFiles]  
      (  
     [FileName], FileExtension, SourceFilePath, JobId, CreatedBy, FileId  
     ,CreatedDateTime  
      )  
      VALUES(@FileName, @FileExtension, @SourceFilePath, @NewJobID, @CreatedBy, @FileId  
       ,GETUTCDATE())  
  
      IF(ISNULL(@Notes,'') != '')  
     BEGIN  
      INSERT INTO JobNotifications(JobId,Comments,CreatedBy,CreatedDateTime)  
      VALUES(@NewJobID,@Notes,@CreatedBy,GETUTCDATE())  
     END  
     
    FETCH NEXT FROM files_cursor  
    INTO @FileName, @FileExtension, @SourceFilePath, @FileId  
   END  
    
   CLOSE files_cursor;  
   DEALLOCATE files_cursor;  
  END  
  
    
  
  COMMIT TRAN  
 END TRY  
 BEGIN CATCH  
  ROLLBACK TRAN  
  DECLARE @ErrorMessage NVARCHAR(4000);  
  DECLARE @ErrorSeverity INT;  
  DECLARE @ErrorState INT;  
  
  SELECT  
   @ErrorMessage = ERROR_MESSAGE(),  
   @ErrorSeverity = ERROR_SEVERITY(),  
   @ErrorState = ERROR_STATE();  
  
  -- Use RAISERROR inside the CATCH block to return error  
  -- information about the original error that caused  
  -- execution to jump to the CATCH block.  
  RAISERROR (@ErrorMessage, -- Message text.  
       @ErrorSeverity, -- Severity.  
       @ErrorState -- State.  
       );  
 END CATCH  
END  
GO
/****** Object:  StoredProcedure [dbo].[usp_SavePreferences]    Script Date: 08-06-2024 19:57:20 ******/


CREATE PROCEDURE [dbo].[usp_SavePreferences]
	@UserId UNIQUEIDENTIFIER,
	@Website VARCHAR(100),
	@DefaultTat INT,
	@IsPDFAllowed BIT,
	@IsDocAllowed BIT
	--,
	--@CreatedBy UNIQUEIDENTIFIER
AS
BEGIN
	
	BEGIN TRY
	IF NOT EXISTS(SELECT * FROM Client WHERE UserId = @UserId)
	BEGIN
		INSERT INTO [dbo].[Client]
           ([UserId],[ClientType],[ClientName],[Details],[Website]
           ,[DefaultTAT],[FilePreferencePDF],[FilePreferenceWord]
           ,[IsDeleted],[CreatedBy],[CreatedDateTime]
           )
		VALUES
           (@UserId,'client','Test','Details',@Website,
		   @DefaultTat,@IsPDFAllowed,@IsDocAllowed,
		   0,@UserId,GETUTCDATE())
	END
	ELSE
	BEGIN
		UPDATE Client SET 
		Website = @Website, DefaultTAT = @DefaultTat, FilePreferencePDF = @IsPDFAllowed, FilePreferenceWord = @IsDocAllowed
		WHERE UserId = @UserId
	END
		
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN
		DECLARE @ErrorMessage NVARCHAR(4000);
		DECLARE @ErrorSeverity INT;
		DECLARE @ErrorState INT;

		SELECT
			@ErrorMessage = ERROR_MESSAGE(),
			@ErrorSeverity = ERROR_SEVERITY(),
			@ErrorState = ERROR_STATE();

		-- Use RAISERROR inside the CATCH block to return error
		-- information about the original error that caused
		-- execution to jump to the CATCH block.
		RAISERROR (@ErrorMessage, -- Message text.
				   @ErrorSeverity, -- Severity.
				   @ErrorState -- State.
				   );
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateJobStatus]    Script Date: 08-06-2024 19:57:20 ******/

CREATE PROCEDURE [dbo].[usp_UpdateJobStatus]
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
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdatePageCount]    Script Date: 08-06-2024 19:57:20 ******/

CREATE PROCEDURE [dbo].[usp_UpdatePageCount]
	@FileXml XML
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	;WITH ParsedData AS (
		SELECT 
			Item.value('(@id)[1]', 'VARCHAR(500)') AS Id,
			Item.value('(@pageCount)[1]', 'INT') as [PageCount]
		FROM @FileXml.nodes('/Files/FileInfo') AS X(Item))

	UPDATE JF SET JF.[PageCount] = pd.[PageCount]
	FROM JobFiles JF
	JOIN ParsedData PD ON JF.FileId = PD.Id
	WHERE JF.FileId = PD.Id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdatePassword]    Script Date: 08-06-2024 19:57:20 ******/

CREATE PROCEDURE [dbo].[usp_UpdatePassword]
	@UserId UNIQUEIDENTIFIER,
	@Password VARCHAR(250)
AS
BEGIN
	
	BEGIN TRY
	
		UPDATE Users SET 
		Password = @Password, ModifiedDateTime = GETUTCDATE()
		WHERE Id = @UserId
	
		
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN
		DECLARE @ErrorMessage NVARCHAR(4000);
		DECLARE @ErrorSeverity INT;
		DECLARE @ErrorState INT;

		SELECT
			@ErrorMessage = ERROR_MESSAGE(),
			@ErrorSeverity = ERROR_SEVERITY(),
			@ErrorState = ERROR_STATE();

		-- Use RAISERROR inside the CATCH block to return error
		-- information about the original error that caused
		-- execution to jump to the CATCH block.
		RAISERROR (@ErrorMessage, -- Message text.
				   @ErrorSeverity, -- Severity.
				   @ErrorState -- State.
				   );
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[USP_VerifyLogin]    Script Date: 08-06-2024 19:57:20 ******/

CREATE PROCEDURE [dbo].[USP_VerifyLogin]
(
	@LoginName nvarchar(50),
	@Password nvarchar(50)
)
AS
BEGIN
	SELECT U.Id,U.FIrstName,U.LastName,U.LoginName,U.Email,U.PhoneNo
	,R.Description AS RoleName, C.Name AS CompanyName, C.Id As CompanyId
	,ISNULL(FilePreference,'.pdf') AS FilePreference
	FROM Users U
	JOIN UserRoles UR ON UR.UserId = U.Id
	JOIN Roles R ON R.Id = UR.RoleId
	JOIN Company C ON C.Id = U.CompanyId
	LEFT JOIN Client CL ON CL.UserId = U.Id
	WHERE LoginName = @LoginName AND [Password] = @Password
END
GO


