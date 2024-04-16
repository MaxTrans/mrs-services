CREATE TABLE [dbo].[Jobs] (
    [Id]               UNIQUEIDENTIFIER CONSTRAINT [DF_Jobs_Id] DEFAULT (newid()) NOT NULL,
    [JobId]            INT              IDENTITY (1, 1) NOT NULL,
    [Name]             NVARCHAR (50)    NOT NULL,
    [Priority]         UNIQUEIDENTIFIER NOT NULL,
    [Notes]            NVARCHAR (500)   NULL,
    [IsSingleJob]      BIT              NULL,
    [ParentJobId]      UNIQUEIDENTIFIER NULL,
    [AssignTo]         UNIQUEIDENTIFIER NULL,
    [L1User]           UNIQUEIDENTIFIER NULL,
    [L2User]           UNIQUEIDENTIFIER NULL,
    [L3User]           UNIQUEIDENTIFIER NULL,
    [Status]           UNIQUEIDENTIFIER NOT NULL,
    [IsDeleted]        BIT              NULL,
    [CompanyId]        UNIQUEIDENTIFIER NOT NULL,
    [CreatedBy]        UNIQUEIDENTIFIER NOT NULL,
    [ModifyedBy]       UNIQUEIDENTIFIER NULL,
    [CreatedDateTime]  DATETIME         NOT NULL,
    [ModifiedDateTime] DATETIME         NULL,
    CONSTRAINT [PK_Jobs] PRIMARY KEY CLUSTERED ([Id] ASC)
);

