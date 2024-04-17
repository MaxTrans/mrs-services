CREATE TABLE [dbo].[FileTypes] (
    [Id]               UNIQUEIDENTIFIER NOT NULL,
    [Description]      NVARCHAR (50)    NOT NULL,
    [FileExtenction]   VARCHAR (5)      NOT NULL,
    [IsDeleted]        BIT              NULL,
    [CreatedBy]        UNIQUEIDENTIFIER NOT NULL,
    [ModifyedBy]       UNIQUEIDENTIFIER NULL,
    [CreatedDateTime]  DATETIME         NOT NULL,
    [ModifiedDateTime] DATETIME         NOT NULL,
    CONSTRAINT [PK_FileTypes] PRIMARY KEY CLUSTERED ([Id] ASC)
);

