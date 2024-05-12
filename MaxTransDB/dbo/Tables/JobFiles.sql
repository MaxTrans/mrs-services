CREATE TABLE [dbo].[JobFiles] (
    [Id]               UNIQUEIDENTIFIER CONSTRAINT [DF_JobFiles_Id] DEFAULT (newid()) NOT NULL,
    [FileName]         NVARCHAR (50)    NOT NULL,
    [FileExtension]    VARCHAR (5)      NOT NULL,
    [FileId]           VARCHAR(500)     NULL,
    [SourceFilePath]   NVARCHAR (500)   NOT NULL,
    IsUploadFile       BIT              NULL,
    [JobId]            UNIQUEIDENTIFIER NOT NULL,
    [CreatedBy]        UNIQUEIDENTIFIER NOT NULL,
    [ModifyedBy]       UNIQUEIDENTIFIER NULL,
    [CreatedDateTime]  DATETIME         NOT NULL,
    [ModifiedDateTime] DATETIME         NULL,
    [PageCount]        INT              NULL, 
    CONSTRAINT [PK_JobFiles] PRIMARY KEY CLUSTERED ([Id] ASC)
);

