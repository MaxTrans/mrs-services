CREATE TABLE [dbo].[Users] (
    [Id]               UNIQUEIDENTIFIER NOT NULL,
    [FIrstName]        NVARCHAR (50)    NOT NULL,
    [LastName]         NVARCHAR (50)    NOT NULL,
    [LoginName]        NVARCHAR (50)    NOT NULL,
    [Password]         NVARCHAR (50)    NOT NULL,
    [Email]            VARCHAR (50)     NOT NULL,
    [PhoneNo]          VARCHAR (15)     NULL,
    [CompanyId]        UNIQUEIDENTIFIER NOT NULL,
    [IsDisabled]       BIT              NULL,
    [IsDeleted]        BIT              NULL,
    [CreatedBy]        UNIQUEIDENTIFIER NOT NULL,
    [ModifyedBy]       UNIQUEIDENTIFIER NULL,
    [CreatedDateTime]  DATETIME         NOT NULL,
    [ModifiedDateTime] DATETIME         NULL,
    CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED ([Id] ASC)
);

