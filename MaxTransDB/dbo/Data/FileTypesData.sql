

ALTER TABLE FileTypes ADD CONSTRAINT DF_ID DEFAULT NEWID() FOR ID;

ALTER TABLE FileTypes
ALTER COLUMN ModifiedDateTime DATETIME NULL;

INSERT INTO [dbo].[FileTypes]
           ([Description]
           ,[FileExtenction]
           ,[IsDeleted]
           ,[CreatedBy]
           ,[ModifyedBy]
           ,[CreatedDateTime]
           ,[ModifiedDateTime])
     VALUES
           ('PDF'
           ,'.pdf'
           ,0
           ,'6B535790-9DEA-4C17-AA04-FE599C0FBA62'
           ,NULL
           ,GETUTCDATE()
           ,NULL)
GO
INSERT INTO [dbo].[FileTypes]
			([Description]
           ,[FileExtenction]
           ,[IsDeleted]
           ,[CreatedBy]
           ,[ModifyedBy]
           ,[CreatedDateTime]
           ,[ModifiedDateTime])
     VALUES
           ('DOC'
           ,'.doc'
           ,0
           ,'6B535790-9DEA-4C17-AA04-FE599C0FBA62'
           ,NULL
           ,GETUTCDATE()
           ,NULL)
GO
INSERT INTO [dbo].[FileTypes]
           ([Description]
           ,[FileExtenction]
           ,[IsDeleted]
           ,[CreatedBy]
           ,[ModifyedBy]
           ,[CreatedDateTime]
           ,[ModifiedDateTime])
     VALUES
           ('DOCX'
           ,'.docx'
           ,0
           ,'6B535790-9DEA-4C17-AA04-FE599C0FBA62'
           ,NULL
           ,GETUTCDATE()
           ,NULL)

