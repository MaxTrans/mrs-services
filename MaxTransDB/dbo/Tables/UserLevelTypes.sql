CREATE TABLE [dbo].[UserLevelTypes] (
    [Id]               UNIQUEIDENTIFIER NOT NULL,
    [Description]      NVARCHAR (50)    NOT NULL,
    [IsDeleted]        BIT              NULL,
    [CreatedBy]        UNIQUEIDENTIFIER NOT NULL,
    [ModifyedBy]       UNIQUEIDENTIFIER NULL,
    [CreatedDateTime]  DATETIME         NOT NULL,
    [ModifiedDateTime] DATETIME         NOT NULL,
    CONSTRAINT [PK_UserLevelTypes] PRIMARY KEY CLUSTERED ([Id] ASC)
);

