CREATE TABLE [dbo].[Vendor] (
    [Id]               UNIQUEIDENTIFIER NOT NULL,
    [UserId]           UNIQUEIDENTIFIER NOT NULL,
    [ClientName]       NVARCHAR (50)    NOT NULL,
    [Details]          NVARCHAR (1000)  NOT NULL,
    [Website]          VARCHAR (100)    NULL,
    [Address1]         NVARCHAR (50)    NULL,
    [Address2]         NVARCHAR (50)    NULL,
    [City]             NVARCHAR (50)    NULL,
    [StateId]          INT              NULL,
    [CountryId]        INT              NULL,
    [Website1]         VARCHAR (100)    NULL,
    [IsDeleted]        BIT              NULL,
    [CreatedBy]        UNIQUEIDENTIFIER NOT NULL,
    [ModifyedBy]       UNIQUEIDENTIFIER NULL,
    [CreatedDateTime]  DATETIME         NOT NULL,
    [ModifiedDateTime] DATETIME         NULL,
    CONSTRAINT [PK_Vendor_1] PRIMARY KEY CLUSTERED ([Id] ASC)
);

