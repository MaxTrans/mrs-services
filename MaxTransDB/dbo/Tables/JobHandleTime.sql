
CREATE TABLE [dbo].[JobHandleTime](
	[Id] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[IsDeleted] [bit] NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifyedBy] [uniqueidentifier] NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[ModifiedDateTime] [datetime] NULL,
	[SortOrder] [int] NULL,
 CONSTRAINT [PK_JobHandleTime] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[JobHandleTime] ADD  DEFAULT (newid()) FOR [Id]
GO