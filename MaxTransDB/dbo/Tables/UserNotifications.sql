CREATE TABLE [dbo].[UserNotifications] (
    [Id]               UNIQUEIDENTIFIER CONSTRAINT [DF_UserNotifications_Id] DEFAULT (newid()) NOT NULL,
    [Description]      NVARCHAR (1000)  NOT NULL,
    [UserId]           UNIQUEIDENTIFIER NOT NULL,
    [IsReadMessage]    BIT              NULL,
    [CreatedBy]        UNIQUEIDENTIFIER NOT NULL,
    [ModifyedBy]       UNIQUEIDENTIFIER NULL,
    [CreatedDateTime]  DATETIME         NOT NULL,
    [ModifiedDateTime] DATETIME         NULL,
    CONSTRAINT [PK_UserNotifications] PRIMARY KEY CLUSTERED ([Id] ASC)
);

