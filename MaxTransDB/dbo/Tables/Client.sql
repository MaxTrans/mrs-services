CREATE TABLE [dbo].[Client] (
    [Id]                    UNIQUEIDENTIFIER NOT NULL,
    [UserId]                UNIQUEIDENTIFIER NOT NULL,
    [ClientType]            VARCHAR (10)     NOT NULL,
    [ClientName]            NVARCHAR (50)    NOT NULL,
    [Details]               NVARCHAR (1000)  NOT NULL,
    [Website]               VARCHAR (100)    NULL,
    [Address1]              NVARCHAR (50)    NULL,
    [Address2]              NVARCHAR (50)    NULL,
    [City]                  NVARCHAR (50)    NULL,
    [StateId]               INT              NULL,
    [CountryId]             INT              NULL,
    [DefaultTAT]            INT              NULL,
    [FilePreferencePDF]     BIT              NULL,
    [FilePreferenceWord]    BIT              NULL,
    [FilePreferencePDFLink] BIT              NULL,
    [ClientLogo]            VARCHAR (50)     NULL,
    [IsDeleted]             BIT              NULL,
    [CreatedBy]             UNIQUEIDENTIFIER NOT NULL,
    [ModifyedBy]            UNIQUEIDENTIFIER NULL,
    [CreatedDateTime]       DATETIME         NOT NULL,
    [ModifiedDateTime]      DATETIME         NULL
    CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED ([Id] ASC)
);

