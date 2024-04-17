CREATE TABLE [dbo].[UserPreferences] (
    [Id]               UNIQUEIDENTIFIER NOT NULL,
    [UserId]           UNIQUEIDENTIFIER NOT NULL,
    [FileTypes]        VARCHAR (50)     NOT NULL,
    [CreatedBy]        UNIQUEIDENTIFIER NOT NULL,
    [ModifyedBy]       UNIQUEIDENTIFIER NULL,
    [CreatedDateTime]  DATETIME         NOT NULL,
    [ModifiedDateTime] DATETIME         NOT NULL,
    CONSTRAINT [PK_UserPreferences] PRIMARY KEY CLUSTERED ([Id] ASC)
);

