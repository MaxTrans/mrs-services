CREATE TYPE [dbo].[JobFileType] AS TABLE (
    [FileName]       NVARCHAR (50)    NULL,
    [FileExtension]  VARCHAR (5)      NULL,
    [SourceFilePath] NVARCHAR (500)   NULL,
    [CreatedBy]      UNIQUEIDENTIFIER NULL,
    FileId           VARCHAR(500) NULL);

