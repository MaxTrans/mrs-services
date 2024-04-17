CREATE TABLE [dbo].[JobUploadFiles] (
    [Id]               UNIQUEIDENTIFIER NOT NULL,
    [FileName]         NVARCHAR (50)    NOT NULL,
    [FileTypeId]       UNIQUEIDENTIFIER NOT NULL,
    [SourceFilePath]   NVARCHAR (250)   NOT NULL,
    [CreatedBy]        UNIQUEIDENTIFIER NOT NULL,
    [ModifyedBy]       UNIQUEIDENTIFIER NULL,
    [CreatedDateTime]  DATETIME         NOT NULL,
    [ModifiedDateTime] DATETIME         NOT NULL,
    CONSTRAINT [PK_JobUploadFiles] PRIMARY KEY CLUSTERED ([Id] ASC)
);

