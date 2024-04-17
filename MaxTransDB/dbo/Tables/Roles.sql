CREATE TABLE [dbo].[Roles] (
    [Id]               UNIQUEIDENTIFIER NOT NULL,
    [Description]      NVARCHAR (50)    NOT NULL,
    [CompanyId]        UNIQUEIDENTIFIER NOT NULL,
    [Type]             VARCHAR (20)     NOT NULL,
    [IsDeleted]        BIT              NULL,
    [CreatedBy]        UNIQUEIDENTIFIER NOT NULL,
    [ModifyedBy]       UNIQUEIDENTIFIER NULL,
    [CreatedDateTime]  DATETIME         NOT NULL,
    [ModifiedDateTime] DATETIME         NULL,
    CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED ([Id] ASC)
);

