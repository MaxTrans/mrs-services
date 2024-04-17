CREATE TABLE [dbo].[UserAssignEmployee] (
    [Id]               UNIQUEIDENTIFIER NOT NULL,
    [UserId]           UNIQUEIDENTIFIER NOT NULL,
    [AssingnUserid]    UNIQUEIDENTIFIER NOT NULL,
    [UserLevelId]      UNIQUEIDENTIFIER NOT NULL,
    [CreatedBy]        UNIQUEIDENTIFIER NOT NULL,
    [ModifyedBy]       UNIQUEIDENTIFIER NULL,
    [CreatedDateTime]  DATETIME         NOT NULL,
    [ModifiedDateTime] DATETIME         NULL,
    CONSTRAINT [PK_UserAssignEmployee] PRIMARY KEY CLUSTERED ([Id] ASC)
);

