CREATE TABLE [dbo].[JobNotifications] (
    [Id]               UNIQUEIDENTIFIER CONSTRAINT [DF_JobNotifications_Id] DEFAULT (newid()) NOT NULL,
    [JobId]            UNIQUEIDENTIFIER NOT NULL,
    [Comments]         NVARCHAR (1000)  NOT NULL,
    [IsReadMessage]    BIT              NULL,
    [CreatedBy]        UNIQUEIDENTIFIER NOT NULL,
    [ModifyedBy]       UNIQUEIDENTIFIER NULL,
    [CreatedDateTime]  DATETIME         NOT NULL,
    [ModifiedDateTime] DATETIME         NULL
);

