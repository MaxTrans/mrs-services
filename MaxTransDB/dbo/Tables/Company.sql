CREATE TABLE [dbo].[Company] (
    [Id]               UNIQUEIDENTIFIER NOT NULL,
    [Name]             NVARCHAR (50)    NOT NULL,
    [Url]              VARCHAR (100)    NOT NULL,
    [SmallLogo]        VARCHAR (50)     NOT NULL,
    [LoginLogo]        NCHAR (10)       NOT NULL,
    [HeaderTitle]      NVARCHAR (50)    NULL,
    [IsDeleted]        BIT              NULL,
    [CreatedBy]        UNIQUEIDENTIFIER NOT NULL,
    [ModifyedBy]       UNIQUEIDENTIFIER NULL,
    [CreatedDateTime]  DATETIME         NOT NULL,
    [ModifiedDateTime] DATETIME         NULL,
    CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED ([Id] ASC)
);

