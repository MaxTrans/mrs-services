CREATE TABLE [dbo].[UserInfo] (
    [Id]               UNIQUEIDENTIFIER NOT NULL,
    [UserId]           UNIQUEIDENTIFIER NOT NULL,
    [UserType]         VARCHAR (15)     NOT NULL,
    [DesignationId]    UNIQUEIDENTIFIER NOT NULL,
    [UserLevelTypeId]  UNIQUEIDENTIFIER NULL,
    [IsDeleted]        BIT              NULL,
    [CreatedBy]        UNIQUEIDENTIFIER NOT NULL,
    [ModifyedBy]       UNIQUEIDENTIFIER NULL,
    [CreatedDateTime]  DATETIME         NOT NULL,
    [ModifiedDateTime] DATETIME         NULL,
    CONSTRAINT [PK_UserInfo] PRIMARY KEY CLUSTERED ([Id] ASC)
);

