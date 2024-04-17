CREATE TABLE [dbo].[AppSettings] (
    [Id]               UNIQUEIDENTIFIER NOT NULL,
    [CompanyId]        UNIQUEIDENTIFIER NOT NULL,
    [MaxFileSizeInMB]  INT              NOT NULL,
    [CreatedBy]        UNIQUEIDENTIFIER NOT NULL,
    [ModifyedBy]       UNIQUEIDENTIFIER NULL,
    [CreatedDateTime]  DATETIME         NOT NULL,
    [ModifiedDateTime] DATETIME         NOT NULL,
    CONSTRAINT [PK_AppSettings] PRIMARY KEY CLUSTERED ([Id] ASC)
);

